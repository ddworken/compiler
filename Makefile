SNAKE_EXT= garter
UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
  NASM_FORMAT=elf64
  CLANG_FLAGS=-mstackrealign -m64 -g -fstack-protector-all -Wstack-protector -fno-omit-frame-pointer -Wall -Werror 
else
ifeq ($(UNAME), Darwin)
  NASM_FORMAT=macho64
  CLANG_FLAGS=-mstackrealign -m64 -g -fstack-protector-all -Wstack-protector -fno-omit-frame-pointer -Wall -Werror 
endif
endif

PKGS=oUnit,extlib,unix
BUILD=ocamlbuild -r -use-ocamlfind -cflag -annot -ocamlyacc 'ocamlyacc -v' 

main: *.ml parser.mly lexer.mll
	$(BUILD) -package $(PKGS) main.native
	mv main.native main

test: *.ml parser.mly lexer.mll main
	$(BUILD) -package $(PKGS) test.native
	mv test.native test

coverage: *.ml parser.mly lexer.mll 
	$(BUILD) -pkg bisect_ppx -package $(PKGS) main.native
	mv main.native main
	$(BUILD) -pkg bisect_ppx -package $(PKGS) test.native
	mv test.native test
	./test
	bisect-ppx-report -I _build -html coverage bisect000*
	google-chrome coverage/index.html

output/%.run: output/%.o *.c *.h 
	clang $(CLANG_FLAGS) -o $@ *.c $<

output/%.o: output/%.s
	nasm -f $(NASM_FORMAT) -Wall -Werror -o $@ $<

.PRECIOUS: output/%.s
output/%.s: input/%.$(SNAKE_EXT) main
	./main $< > $@

output/do_pass/%.run: output/do_pass/%.o *.c *.h 
	clang $(CLANG_FLAGS) -o $@ *.c $<

output/do_pass/%.o: output/do_pass/%.s
	nasm -f $(NASM_FORMAT) -Wall -Werror -o $@ $<

.PRECIOUS: output/do_pass/%.s
output/do_pass/%.s: input/do_pass/%.$(SNAKE_EXT) main
	./main $< > $@


output/dont_pass/%.run: output/dont_pass/%.o *.c *.h 
	clang -g $(CLANG_FLAGS) -o $@ *.c $<

output/dont_pass/%.o: output/dont_pass/%.s
	nasm -f $(NASM_FORMAT) -Wall -Werror -o $@ $<

.PRECIOUS: output/dont_pass/%.s
output/dont_pass/%.s: input/dont_pass/%.$(SNAKE_EXT) main
	./main $< > $@


output/do_err/%.run: output/do_err/%.o *.c *.h 
	clang $(CLANG_FLAGS) -o $@ *.c $<

output/do_err/%.o: output/do_err/%.s
	nasm -f $(NASM_FORMAT) -Wall -Werror -o $@ $<

.PRECIOUS: output/do_err/%.s
output/do_err/%.s: input/do_err/%.$(SNAKE_EXT) main
	./main $< > $@


output/dont_err/%.run: output/dont_err/%.o *.c *.h 
	clang -g $(CLANG_FLAGS) -o $@ *.c $<

output/dont_err/%.o: output/dont_err/%.s
	nasm -f $(NASM_FORMAT) -Wall -Werror -o $@ $<

.PRECIOUS: output/dont_err/%.s
output/dont_err/%.s: input/dont_err/%.$(SNAKE_EXT) main
	./main $< > $@

clean:
	rm -rf output/*.o output/*.s output/*.dSYM output/*.run *.log *.o
	rm -rf output/*/*.o output/*/*.s output/*/*.dSYM output/*/*.run
	rm -rf _build/
	rm -f main test
	rm -f input/do_pass/fuzz-* input/do_err/fuzz-* 
	rm -rf coverage/ 
