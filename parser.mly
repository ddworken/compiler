%{
open Exprs

let full_span() = (Parsing.symbol_start_pos (), Parsing.symbol_end_pos ())
let tok_span(start, endtok) = (Parsing.rhs_start_pos start, Parsing.rhs_end_pos endtok)

%}

%token <int64> NUM
%token <string> ID TYID STRING
%token DEF ANDDEF ADD1 SUB1 LPARENSPACE LPARENNOSPACE RPAREN LBRACK RBRACK LBRACE RBRACE LET IN OF EQUAL COMMA PLUS MINUS TIMES IF COLON ELSECOLON EOF PRINTSTACK TRUE FALSE ISBOOL ISNUM ISTUPLE EQEQ LESSSPACE LESSNOSPACE GREATER LESSEQ GREATEREQ AND OR NOT THINARROW COLONEQ SEMI NIL TYPE LAMBDA BEGIN END SHADOW REC UNDERSCORE

%right SEMI
%left COLON
%left PLUS MINUS TIMES GREATER LESSSPACE LESSNOSPACE GREATEREQ LESSEQ EQEQ AND OR
%left LPARENNOSPACE


%type <(Lexing.position * Lexing.position) Exprs.program> program

%start program

%%

const :
  | NUM { ENumber($1, full_span()) }
  | TRUE { EBool(true, full_span()) }
  | FALSE { EBool(false, full_span()) }
  | NIL %prec SEMI { ENil(TyBlank(full_span()), full_span()) }
  | NIL COLON typ %prec COLON { ENil($3, full_span()) }
  | STRING { EString($1, full_span())}

prim1 :
  | ADD1 { Add1 }
  | SUB1 { Sub1 }
  | NOT { Not }
  | ISBOOL { IsBool }
  | ISNUM { IsNum }
  | ISTUPLE { IsTuple }
  | PRINTSTACK { PrintStack }

bindings :
  | bind EQUAL expr { [($1, $3, full_span())] }
  | bind EQUAL expr COMMA bindings { ($1, $3, tok_span(1, 3))::$5 }

namebindings :
  | namebind EQUAL expr { [($1, $3, full_span())] }
  | namebind EQUAL expr COMMA namebindings { ($1, $3, tok_span(1, 3))::$5 }

expr :
  | LET bindings IN expr { ELet($2, $4, full_span()) }
  | LET REC namebindings IN expr { ELetRec($3, $5, full_span()) }
  | IF expr COLON expr ELSECOLON expr { EIf($2, $4, $6, full_span()) }
  | BEGIN expr END { $2 }
  | binop_expr SEMI expr { ESeq($1, $3, full_span()) }
  | binop_expr SEMI LESSNOSPACE typ GREATER expr { ESeq(EAnnot($1, $4, tok_span(1, 5)), $6, full_span()) }
  | binop_expr { $1 }

exprs :
  | expr { [$1] }
  | expr COMMA exprs { $1::$3 }

tuple_expr :
  | LPARENNOSPACE RPAREN { ETuple([], full_span()) }
  | LPARENSPACE RPAREN { ETuple([], full_span()) }
  | LPARENNOSPACE expr COMMA RPAREN { ETuple([$2], full_span()) }
  | LPARENSPACE expr COMMA RPAREN { ETuple([$2], full_span()) }
  | LPARENNOSPACE expr COMMA exprs RPAREN { ETuple($2::$4, full_span()) }
  | LPARENSPACE expr COMMA exprs RPAREN { ETuple($2::$4, full_span()) }

tuple_get :
  | id LBRACK NUM OF NUM RBRACK { EGetItem($1, Int64.to_int $3, Int64.to_int $5, full_span()) }
  | tuple_get LBRACK NUM OF NUM RBRACK { EGetItem($1, Int64.to_int $3, Int64.to_int $5, full_span()) }

tuple_set :
  | id LBRACK NUM OF NUM COLONEQ expr RBRACK { ESetItem($1, Int64.to_int $3, Int64.to_int $5, $7, full_span()) }
  | tuple_get LBRACK NUM OF NUM COLONEQ expr RBRACK { ESetItem($1, Int64.to_int $3, Int64.to_int $5, $7, full_span()) }
  | tuple_set LBRACK NUM OF NUM COLONEQ expr RBRACK { ESetItem($1, Int64.to_int $3, Int64.to_int $5, $7, full_span()) }

id :
  | ID %prec COLON { EId($1, full_span()) }
  | LPARENNOSPACE ID COLON typ RPAREN { EAnnot(EId($2, tok_span(2, 2)), $4, full_span()) }
  | LPARENSPACE ID COLON typ RPAREN { EAnnot(EId($2, tok_span(2, 2)), $4, full_span()) }


prim2 :
  | PLUS { Plus }
  | MINUS { Minus }
  | TIMES { Times }
  | AND { And }
  | OR { Or }
  | GREATER { Greater }
  | GREATEREQ { GreaterEq }
  | LESSSPACE { Less }
  | LESSEQ { LessEq }
  | EQEQ { Eq }

binop_expr :
  | binop_expr prim2 binop_operand %prec PLUS { EPrim2($2, None, $1, $3, full_span()) }
  | binop_expr prim2 LESSNOSPACE typs GREATER binop_operand { EPrim2($2, Some $4, $1, $6, full_span()) }
  | binop_operand %prec PLUS { $1 }

binop_operand :
  // Primops
  | prim1 LPARENNOSPACE expr RPAREN { EPrim1($1, None, $3, full_span()) }
  | prim1 LESSNOSPACE typs GREATER LPARENNOSPACE expr RPAREN { EPrim1($1, Some $3, $6, full_span()) }
  // Tuples
  | tuple_expr { $1 }
  | tuple_get { $1 }
  | tuple_set { $1 }
  // Function calls
  | binop_operand LPARENNOSPACE exprs RPAREN %prec LPARENNOSPACE { EApp($1, $3, Unknown, full_span()) }
  | binop_operand LPARENNOSPACE RPAREN %prec LPARENNOSPACE { EApp($1, [], Unknown, full_span()) }
  | binop_operand LESSNOSPACE typs GREATER LPARENNOSPACE exprs RPAREN { EGenApp($1, $3, $6, Unknown, full_span()) }
  | binop_operand LESSNOSPACE typs GREATER LPARENNOSPACE RPAREN { EGenApp($1, $3, [], Unknown, full_span()) }
  // Parentheses
  | LPARENSPACE expr RPAREN { $2 }
  | LPARENNOSPACE expr RPAREN { $2 }
  | LPARENNOSPACE expr COLON typ RPAREN { EAnnot($2, $4, full_span()) }
  | LPARENSPACE expr COLON typ RPAREN { EAnnot($2, $4, full_span()) }
  // Lambdas
  | LPARENNOSPACE LAMBDA LPARENNOSPACE binds RPAREN COLON expr RPAREN { ELambda($4, $7, full_span()) }
  | LPARENNOSPACE LAMBDA LPARENSPACE binds RPAREN COLON expr RPAREN { ELambda($4, $7, full_span()) }
  | LPARENNOSPACE LAMBDA COLON expr RPAREN { ELambda([], $4, full_span()) }
  | LPARENSPACE LAMBDA LPARENNOSPACE binds RPAREN COLON expr RPAREN { ELambda($4, $7, full_span()) }
  | LPARENSPACE LAMBDA LPARENSPACE binds RPAREN COLON expr RPAREN { ELambda($4, $7, full_span()) }
  | LPARENSPACE LAMBDA COLON expr RPAREN { ELambda([], $4, full_span()) }
  // Simple cases
  | const { $1 }
  | id { $1 }

decl :
  | DEF ID LPARENNOSPACE RPAREN COLON expr
    { let arg_pos = tok_span(3, 4) in
      DFun($2, [], SForall([], TyArr([], TyBlank arg_pos, arg_pos), arg_pos), $6, full_span()) }
  | DEF ID LPARENNOSPACE RPAREN THINARROW typ COLON expr
    {
      let typ_pos = tok_span(6, 6) in
      DFun($2, [], SForall([], TyArr([], $6, typ_pos), typ_pos), $8, full_span()) }
  | DEF ID LESSNOSPACE tyids GREATER LPARENNOSPACE RPAREN THINARROW typ COLON expr
    {
      let arg_types = [] in
      let arrow_pos = tok_span(6, 9) in
      let typ_pos = tok_span(3, 9) in
      DFun($2, [], SForall($4, TyArr(arg_types, $9, arrow_pos), typ_pos), $11, full_span())
    }
  | DEF ID LESSNOSPACE tyids GREATER LPARENNOSPACE binds RPAREN THINARROW typ COLON expr
    {
      let arg_types = List.map bind_to_typ $7 in
      let arrow_pos = tok_span(6, 10) in
      let typ_pos = tok_span(3, 10) in
      DFun($2, $7, SForall($4, TyArr(arg_types, $10, arrow_pos), typ_pos), $12, full_span())
    }
  | DEF ID LPARENNOSPACE binds RPAREN COLON expr
    {
      let arg_types = List.map bind_to_typ $4 in
      let typ_pos = tok_span(3, 5) in
      let arr_typ = SForall([], TyArr(arg_types, TyBlank(typ_pos), typ_pos), typ_pos) in
      DFun($2, $4, arr_typ, $7, full_span())
    }
  | DEF ID LPARENNOSPACE binds RPAREN THINARROW typ COLON expr
    {
      let arg_types = List.map bind_to_typ $4 in
      let typ_pos = tok_span(3, 7) in
      DFun($2, $4, SForall([], TyArr(arg_types, $7, typ_pos), typ_pos), $9, full_span())
    }

tyids :
  | { [] }
  | TYID { [$1] }
  | TYID COMMA tyids { $1::$3 }

tyid : TYID { TyVar($1, full_span()) }

binds :
  | bind { [$1] }
  | bind COMMA binds { $1::$3 }

bind :
  | namebind { $1 }
  | blankbind { $1 }
  | LPARENNOSPACE binds RPAREN { BTuple($2, full_span()) }
  | LPARENSPACE binds RPAREN { BTuple($2, full_span()) }

blankbind :
  | UNDERSCORE %prec SEMI { BBlank(TyBlank(full_span()), full_span()) }
  | UNDERSCORE COLON typ { BBlank($3, full_span()) }

namebind :
  | ID %prec SEMI { BName($1, TyBlank(full_span()), full_span()) }
  | ID COLON typ { BName($1, $3, full_span()) }

typ :
  | ID %prec SEMI { TyCon($1, full_span()) }
  | tyid { $1 }
  | arrowtyp { $1 }
  | tupletyp { $1 }
  | ID LESSNOSPACE typs GREATER { TyApp($1, $3, full_span()) }

arrowtyp :
  | LPARENNOSPACE typs THINARROW typ RPAREN { TyArr($2, $4, full_span()) }
  | LPARENSPACE typs THINARROW typ RPAREN { TyArr($2, $4, full_span()) }
  | LPARENNOSPACE THINARROW typ RPAREN { TyArr([], $3, full_span()) }
  | LPARENSPACE THINARROW typ RPAREN { TyArr([], $3, full_span()) }


tupletyp :
  | LPARENNOSPACE startyps RPAREN { TyTup($2, full_span()) }
  | LPARENSPACE startyps RPAREN { TyTup($2, full_span()) }
  | LPARENNOSPACE RPAREN { TyTup([], full_span()) }
  | LPARENSPACE RPAREN { TyTup([], full_span()) }


typs :
  | typ { [$1] }
  | typ COMMA typs { $1::$3 }

startyps :
  | typ { [$1] }
  | typ TIMES startyps { $1::$3 }

declgroup :
  | decl { [$1] }
  | decl ANDDEF declgroup { $1::$3 }


decls :
  | { [] }
  | declgroup decls { $1::$2 }

tydecl :
  | TYPE ID EQUAL LPARENNOSPACE startyps RPAREN { TyDecl($2, None, $5, full_span()) }
  | TYPE ID EQUAL LPARENSPACE startyps RPAREN { TyDecl($2, None, $5, full_span()) }
  | TYPE ID LESSNOSPACE tyids GREATER EQUAL LPARENNOSPACE startyps RPAREN { TyDecl($2, Some $4, $8, full_span()) }
  | TYPE ID LESSNOSPACE tyids GREATER EQUAL LPARENSPACE startyps RPAREN { TyDecl($2, Some $4, $8, full_span()) }

tydecls :
  | { [] }
  | tydecl tydecls { $1 :: $2 }


program :
  | tydecls decls expr COLON typ EOF { Program($1, $2, EAnnot($3, $5, tok_span(3, 5)), full_span()) }
  | tydecls decls expr EOF { Program($1, $2, $3, full_span()) }

%%