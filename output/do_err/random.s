section .text
extern error
extern native#print
extern print_stack
extern try_gc
extern STACK_BOTTOM
extern STACK_SIZE
extern native#string_len
extern native#char_at
extern native#input
extern native#equal
extern HEAP_END
global our_code_starts_here

our_code_starts_here:
  enter 3232, 0
  mov QWORD [RBP-8], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-16], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-24], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-32], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-40], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-48], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-56], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-64], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-72], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-80], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-88], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-96], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-112], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-120], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-128], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-136], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-144], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-152], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-160], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-168], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-176], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-184], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-192], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-200], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-208], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-216], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-224], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-232], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-240], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-248], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-256], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-264], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-272], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-280], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-288], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-296], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-304], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-312], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-320], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-328], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-336], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-344], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-352], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-360], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-368], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-376], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-384], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-392], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-400], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-408], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-416], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-424], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-432], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-440], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-448], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-456], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-464], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-472], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-480], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-488], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-496], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-504], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-512], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-520], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-528], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-536], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-544], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-552], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-560], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-568], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-576], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-584], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-592], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-600], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-608], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-616], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-624], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-632], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-640], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-648], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-656], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-664], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-672], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-680], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-688], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-696], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-704], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-712], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-720], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-728], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-736], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-744], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-752], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-760], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-768], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-776], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-784], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-792], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-800], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-808], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-816], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-824], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-832], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-840], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-848], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-856], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-864], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-872], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-880], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-888], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-896], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-904], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-912], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-920], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-928], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-936], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-944], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-952], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-960], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-968], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-976], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-984], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-992], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1000], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1008], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1016], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1024], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1032], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1040], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1048], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1056], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1064], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1072], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1080], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1088], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1096], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1112], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1120], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1128], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1136], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1144], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1152], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1160], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1168], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1176], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1184], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1192], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1200], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1208], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1216], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1224], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1232], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1240], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1248], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1256], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1264], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1272], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1280], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1288], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1296], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1304], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1312], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1320], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1328], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1336], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1344], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1352], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1360], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1368], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1376], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1384], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1392], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1400], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1408], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1416], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1424], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1432], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1440], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1448], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1456], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1464], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1472], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1480], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1488], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1496], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1504], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1512], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1520], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1528], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1536], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1544], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1552], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1560], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1568], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1576], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1584], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1592], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1600], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1608], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1616], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1624], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1632], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1640], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1648], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1656], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1664], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1672], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1680], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1688], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1696], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1704], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1712], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1720], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1728], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1736], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1744], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1752], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1760], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1768], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1776], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1784], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1792], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1800], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1808], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1816], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1824], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1832], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1840], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1848], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1856], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1864], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1872], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1880], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1888], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1896], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1904], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1912], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1920], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1928], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1936], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1944], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1952], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1960], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1968], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1976], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1984], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-1992], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2000], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2008], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2016], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2024], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2032], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2040], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2048], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2056], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2064], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2072], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2080], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2088], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2096], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2112], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2120], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2128], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2136], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2144], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2152], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2160], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2168], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2176], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2184], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2192], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2200], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2208], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2216], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2224], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2232], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2240], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2248], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2256], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2264], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2272], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2280], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2288], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2296], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2304], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2312], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2320], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2328], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2336], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2344], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2352], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2360], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2368], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2376], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2384], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2392], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2400], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2408], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2416], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2424], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2432], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2440], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2448], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2456], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2464], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2472], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2480], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2488], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2496], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2504], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2512], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2520], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2528], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2536], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2544], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2552], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2560], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2568], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2576], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2584], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2592], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2600], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2608], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2616], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2624], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2632], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2640], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2648], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2656], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2664], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2672], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2680], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2688], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2696], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2704], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2712], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2720], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2728], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2736], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2744], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2752], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2760], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2768], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2776], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2784], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2792], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2800], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2808], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2816], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2824], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2832], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2840], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2848], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2856], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2864], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2872], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2880], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2888], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2896], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2904], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2912], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2920], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2928], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2936], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2944], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2952], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2960], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2968], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2976], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2984], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-2992], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3000], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3008], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3016], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3024], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3032], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3040], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3048], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3056], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3064], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3072], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3080], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3088], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3096], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3104], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3112], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3120], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3128], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3136], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3144], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3152], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3160], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3168], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3176], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3184], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3192], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3200], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3208], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3216], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3224], QWORD 0 ; Zero out the stack
  mov QWORD [RBP-3232], QWORD 0 ; Zero out the stack
  ;; heap setup {
  mov R15, RDI ; Load heap_reg with our argument, the heap pointer
  ;; } heap setup
  mov [STACK_BOTTOM], RBP ; Init STACK_BOTTOM
  ;; Define lambda-7716 {
  jmp near lambda_end_7716
lambda_7716:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 0
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 0, 0
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+24] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  mov RDI, [RBP+16]
  call native#print
  leave
  ret
  ;; } define lambda-7716
lambda_end_7716:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_7716
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_7716:
  ;; Store lambda-7716 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_7716 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-7716
  mov [RBP-8], RAX ; [RBP-8] holds the variable print_4
  ;; Define lambda-7713 {
  jmp near lambda_end_7713
lambda_7713:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 0
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 0, 0
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+16] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  call native#input
  leave
  ret
  ;; } define lambda-7713
lambda_end_7713:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_7713
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_7713:
  ;; Store lambda-7713 on the heap {
  mov QWORD [R15+0], 0 ; Store the arity
  mov QWORD [R15+8], lambda_7713 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-7713
  mov [RBP-16], RAX ; [RBP-16] holds the variable input_13
  ;; Define lambda-7708 {
  jmp near lambda_end_7708
lambda_7708:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 0
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 0, 0
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+32] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  mov RDI, [RBP+16]
  mov RSI, [RBP+24]
  call native#equal
  leave
  ret
  ;; } define lambda-7708
lambda_end_7708:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_7708
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_7708:
  ;; Store lambda-7708 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_7708 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-7708
  mov [RBP-24], RAX ; [RBP-24] holds the variable equal_19
  ;; Define lambda-7704 {
  jmp near lambda_end_7704
lambda_7704:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 0
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 0, 0
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+24] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  mov RDI, [RBP+16]
  call native#string_len
  leave
  ret
  ;; } define lambda-7704
lambda_end_7704:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_7704
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_7704:
  ;; Store lambda-7704 on the heap {
  mov QWORD [R15+0], 2 ; Store the arity
  mov QWORD [R15+8], lambda_7704 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-7704
  mov [RBP-32], RAX ; [RBP-32] holds the variable string_len_31
  ;; Define lambda-7699 {
  jmp near lambda_end_7699
lambda_7699:
  ;; Make sure we have space left on the stack:
  mov R11, RBP
  sub R11, 0
  mov R12, [STACK_BOTTOM]
  sub R12, [STACK_SIZE]
  cmp R11, R12
  cmovle RSI, R11
  jle near _global_assertion_failed_out_of_stack_memory
  enter 0, 0
  ;; Copy the free variables off the heap onto the stack where they can be used by the body of the lambda {
  mov RAX, [RBP+32] ; Move the last argument of the function which is the function itself into RAX so we can unpack closed over values
  sub RAX, 0x5 ; And detag it. Our compiler guarantees that it will be a lambda so no need to tag check
  ;; } Copy the free variables off the heap onto the stack
  mov RDI, [RBP+16]
  mov RSI, [RBP+24]
  call native#char_at
  leave
  ret
  ;; } define lambda-7699
lambda_end_7699:
  ;; Check if we have space on the heap to store our function of size 32: 
  mov RAX, [HEAP_END] ; Reserving 4 words
  sub RAX, 32
  cmp RAX, R15
  jge near memcheck_ok_7699
  mov RDI, QWORD R15
  mov RSI, QWORD 32
  mov RDX, QWORD RBP
  mov RCX, QWORD RSP
  call try_gc
  mov R15, RAX ; assume gc success if returning here, so RAX holds the new heap_reg value
memcheck_ok_7699:
  ;; Store lambda-7699 on the heap {
  mov QWORD [R15+0], 4 ; Store the arity
  mov QWORD [R15+8], lambda_7699 ; Store the function pointer
  mov QWORD [R15+16], 0 ; Store the number of closed variables
  ;; Store all the closed over variables {
  ;; } Store all the closed over variables
  mov RAX, R15 ; Move the address of the tuple into RAX
  add RAX, 0x5 ; Tag it as a closure
  add R15, 32 ; Bump the heap register
  ;; } store lambda-7699
  mov [RBP-40], RAX ; [RBP-40] holds the variable char_at_40
  ;; and_lhs {
  ;; and_lhs {
  mov RAX, 102
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 140
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-56], RAX ; [RBP-56] holds the variable binop_61
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7692
  mov RAX, -120
  jmp near done_7692
if_false_7692:
  mov RAX, 106
done_7692:
  mov [RBP-64], RAX ; [RBP-64] holds the variable if_64
  mov RAX, [RBP-56]
  mov R11, RAX
  mov RAX, [RBP-64]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_7689
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7689
_cmp_fail_7689:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7689:
  mov [RBP-72], RAX ; [RBP-72] holds the variable zxylhkmzuh_58
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7685
  mov RAX, [RBP-72]
  jmp near done_7685
if_false_7685:
  mov RAX, [RBP-72]
done_7685:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_7680
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7681
  mov RAX, 0x7fffffffffffffff
  jmp near done_7681
if_false_7681:
  mov RAX, [RBP-72]
done_7681:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_7680
  mov RAX, 0xffffffffffffffff
and_done_7680:
  mov [RBP-80], RAX ; [RBP-80] holds the variable uocweyjufm_69
  mov RAX, [RBP-72]
  mov [RBP-88], RAX ; [RBP-88] holds the variable vofzsiaxjn_89
  mov RAX, [RBP-72]
  mov [RBP-96], RAX ; [RBP-96] holds the variable xgeuviqdcg_93
  mov RAX, 140
  mov [RBP-104], RAX ; [RBP-104] holds the variable jzettcvbvl_97
  mov RAX, [RBP-72]
  mov [RBP-112], RAX ; [RBP-112] holds the variable ffthreuwgt_85
  mov RAX, [RBP-80]
  mov [RBP-120], RAX ; [RBP-120] holds the variable jsjrknazvr_106
  mov RAX, [RBP-112]
  mov [RBP-128], RAX ; [RBP-128] holds the variable rvdlepvwob_110
  mov RAX, 146
  mov [RBP-136], RAX ; [RBP-136] holds the variable duclvefxym_114
  mov RAX, [RBP-136]
  mov [RBP-144], RAX ; [RBP-144] holds the variable rwkmtrubuf_118
  mov RAX, [RBP-120]
  mov [RBP-152], RAX ; [RBP-152] holds the variable upkdbchfka_122
  mov RAX, [RBP-120]
  mov [RBP-160], RAX ; [RBP-160] holds the variable gsokxplwfj_126
  mov RAX, [RBP-136]
  mov [RBP-168], RAX ; [RBP-168] holds the variable mirhyjczao_130
  mov RAX, [RBP-112]
  mov [RBP-176], RAX ; [RBP-176] holds the variable ivkgimborr_134
  mov RAX, [RBP-160]
  mov [RBP-184], RAX ; [RBP-184] holds the variable gancqwrtbh_102
  mov RAX, 56
  mov [RBP-192], RAX ; [RBP-192] holds the variable irwbvoqtvb_140
  mov RAX, [RBP-80]
  mov [RBP-200], RAX ; [RBP-200] holds the variable usaobvyrmp_144
  mov RAX, [RBP-184]
  mov [RBP-208], RAX ; [RBP-208] holds the variable qeznxeeunk_148
  mov RAX, [RBP-208]
  mov [RBP-216], RAX ; [RBP-216] holds the variable dxkcaxmhmh_152
  mov RAX, [RBP-192]
  mov [RBP-224], RAX ; [RBP-224] holds the variable euknctzjrl_156
  mov RAX, [RBP-80]
  mov [RBP-232], RAX ; [RBP-232] holds the variable cptqzodrgg_81
  mov RAX, [RBP-232]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7657
  mov RAX, [RBP-232]
  jmp near done_7657
if_false_7657:
  mov RAX, [RBP-80]
done_7657:
  mov [RBP-240], RAX ; [RBP-240] holds the variable if_164
  mov RAX, [RBP-240]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7649
  mov RAX, -174
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -186
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  jmp near done_7649
if_false_7649:
  mov RAX, -30
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 118
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
done_7649:
  mov [RBP-248], RAX ; [RBP-248] holds the variable wclpleqzun_161
  mov RAX, [RBP-72]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7645
  mov RAX, -24
  jmp near done_7645
if_false_7645:
  mov RAX, 116
done_7645:
  mov [RBP-256], RAX ; [RBP-256] holds the variable eqpmmkobum_176
  mov RAX, [RBP-256]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-264], RAX ; [RBP-264] holds the variable haqgdfwary_183
  mov RAX, [RBP-80]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7639
  mov RAX, [RBP-80]
  jmp near done_7639
if_false_7639:
  mov RAX, [RBP-232]
done_7639:
  mov [RBP-272], RAX ; [RBP-272] holds the variable uimwyaqkit_188
  mov RAX, [RBP-248]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-280], RAX ; [RBP-280] holds the variable jkfoanpjer_195
  mov RAX, [RBP-272]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7633
  mov RAX, [RBP-256]
  jmp near done_7633
if_false_7633:
  mov RAX, [RBP-264]
done_7633:
  mov [RBP-288], RAX ; [RBP-288] holds the variable vsevkhpdbe_200
  mov RAX, [RBP-232]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7629
  mov RAX, [RBP-256]
  jmp near done_7629
if_false_7629:
  mov RAX, 124
done_7629:
  mov [RBP-296], RAX ; [RBP-296] holds the variable meojinfkwm_207
  mov RAX, [RBP-288]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-304], RAX ; [RBP-304] holds the variable bzfiqhmsek_214
  mov RAX, [RBP-72]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7623
  mov RAX, [RBP-248]
  jmp near done_7623
if_false_7623:
  mov RAX, [RBP-264]
done_7623:
  mov [RBP-312], RAX ; [RBP-312] holds the variable wynsettsmc_219
  mov RAX, -128
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-320], RAX ; [RBP-320] holds the variable bakmwjgwxv_226
  mov RAX, [RBP-72]
  mov [RBP-328], RAX ; [RBP-328] holds the variable qvfkoqemcs_232
  mov RAX, 0xffffffffffffffff
  mov [RBP-336], RAX ; [RBP-336] holds the variable vwbjpjqugm_236
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7480
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  mov [RBP-352], RAX ; [RBP-352] holds the variable cmqepulwxj_244
  mov RAX, 100
  mov [RBP-360], RAX ; [RBP-360] holds the variable ftvetpssgn_248
  mov RAX, -132
  mov [RBP-368], RAX ; [RBP-368] holds the variable tibosxichy_252
  mov RAX, -42
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-376], RAX ; [RBP-376] holds the variable unary_256
  mov RAX, [RBP-360]
  mov R11, RAX
  mov RAX, [RBP-376]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_7610
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7610
_cmp_fail_7610:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7610:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7594
  ;; or_rhs {
  mov RAX, 136
  mov [RBP-352], RAX ; [RBP-352] holds the variable wzhnbeauar_261
  mov RAX, 0x7fffffffffffffff
  mov [RBP-360], RAX ; [RBP-360] holds the variable obmsbnsprx_265
  mov RAX, -136
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 24
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-368], RAX ; [RBP-368] holds the variable binop_269
  mov RAX, 90
  mov R11, RAX
  mov RAX, [RBP-368]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_7598
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7598
_cmp_fail_7598:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7598:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7594
  mov RAX, 0x7fffffffffffffff
or_done_7594:
  jmp near done_7480
if_false_7480:
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7590
  mov RAX, 188
  jmp near done_7590
if_false_7590:
  mov RAX, -54
done_7590:
  mov [RBP-352], RAX ; [RBP-352] holds the variable if_277
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7586
  mov RAX, -72
  jmp near done_7586
if_false_7586:
  mov RAX, 46
done_7586:
  mov [RBP-360], RAX ; [RBP-360] holds the variable if_281
  mov RAX, [RBP-352]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-360]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-368], RAX ; [RBP-368] holds the variable wfrmckrtbu_274
  mov RAX, [RBP-368]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-368]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-376], RAX ; [RBP-376] holds the variable binop_289
  mov RAX, [RBP-376]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-384], RAX ; [RBP-384] holds the variable bjidvslbtl_286
  mov RAX, 182
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-368]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-392], RAX ; [RBP-392] holds the variable binop_296
  mov RAX, -112
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-368]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-400], RAX ; [RBP-400] holds the variable binop_299
  mov RAX, [RBP-392]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-408], RAX ; [RBP-408] holds the variable tonprspiwj_293
  mov RAX, [RBP-368]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-384]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-416], RAX ; [RBP-416] holds the variable binop_306
  mov RAX, [RBP-416]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-424], RAX ; [RBP-424] holds the variable fwfwwzdxiu_303
  mov RAX, [RBP-424]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-432], RAX ; [RBP-432] holds the variable unary_313
  mov RAX, [RBP-368]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-368]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-440], RAX ; [RBP-440] holds the variable binop_315
  mov RAX, [RBP-432]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-440]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-448], RAX ; [RBP-448] holds the variable bbnnneysby_310
  mov RAX, [RBP-368]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-424]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-456], RAX ; [RBP-456] holds the variable ujahrnwdud_323
  mov RAX, [RBP-424]
  mov [RBP-464], RAX ; [RBP-464] holds the variable iuupzvswxt_333
  mov RAX, -70
  mov [RBP-472], RAX ; [RBP-472] holds the variable bjeimmaasx_329
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7548
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7548
  mov RAX, 0x7fffffffffffffff
or_done_7548:
  mov [RBP-480], RAX ; [RBP-480] holds the variable yemodqlqaw_338
  mov RAX, [RBP-424]
  mov R11, RAX
  mov RAX, [RBP-424]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_7545
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7545
_cmp_fail_7545:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7545:
  mov [RBP-488], RAX ; [RBP-488] holds the variable exxjcoganr_344
  mov RAX, [RBP-424]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 8
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-496], RAX ; [RBP-496] holds the variable pkaieovafk_350
  mov RAX, 132
  mov R11, RAX
  mov RAX, 78
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_7539
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7539
_cmp_fail_7539:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7539:
  mov [RBP-504], RAX ; [RBP-504] holds the variable mhynvqayke_319
  mov RAX, [RBP-448]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-512], RAX ; [RBP-512] holds the variable unary_362
  mov RAX, [RBP-512]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-520], RAX ; [RBP-520] holds the variable ldopsilauy_359
  mov RAX, [RBP-504]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7531
  mov RAX, [RBP-408]
  jmp near done_7531
if_false_7531:
  mov RAX, -156
done_7531:
  mov [RBP-528], RAX ; [RBP-528] holds the variable if_368
  mov RAX, [RBP-528]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-536], RAX ; [RBP-536] holds the variable vlkunmphqj_365
  mov RAX, [RBP-424]
  mov R11, RAX
  mov RAX, [RBP-424]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_7526
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7526
_cmp_fail_7526:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7526:
  mov [RBP-544], RAX ; [RBP-544] holds the variable binop_376
  mov RAX, [RBP-544]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7518
  ;; and_lhs {
  mov RAX, [RBP-504]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_7522
  ;; and_rhs {
  mov RAX, [RBP-504]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_7522
  mov RAX, 0xffffffffffffffff
and_done_7522:
  jmp near done_7518
if_false_7518:
  ;; or_lhs {
  mov RAX, [RBP-504]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7519
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7519
  mov RAX, 0x7fffffffffffffff
or_done_7519:
done_7518:
  mov [RBP-552], RAX ; [RBP-552] holds the variable fjidvnwwll_373
  mov RAX, -110
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 16
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-560], RAX ; [RBP-560] holds the variable binop_386
  mov RAX, [RBP-424]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-536]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-568], RAX ; [RBP-568] holds the variable binop_389
  mov RAX, [RBP-560]
  mov R11, RAX
  mov RAX, [RBP-568]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_7509
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7509
_cmp_fail_7509:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7509:
done_7480:
  mov [RBP-344], RAX ; [RBP-344] holds the variable if_55
  mov RAX, [RBP-344]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7203
  mov RAX, 72
  mov [RBP-352], RAX ; [RBP-352] holds the variable spfgbrrugu_397
  mov RAX, [RBP-352]
  mov [RBP-360], RAX ; [RBP-360] holds the variable lorpcgkvsh_401
  mov RAX, [RBP-360]
  mov [RBP-368], RAX ; [RBP-368] holds the variable qvtvqluaxt_405
  mov RAX, 0xffffffffffffffff
  mov [RBP-376], RAX ; [RBP-376] holds the variable kfboiqdpan_409
  mov RAX, -166
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-384], RAX ; [RBP-384] holds the variable unary_394
  mov RAX, [RBP-384]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-392], RAX ; [RBP-392] holds the variable unary_393
  mov RAX, -170
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-400], RAX ; [RBP-400] holds the variable unary_415
  mov RAX, -182
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-408], RAX ; [RBP-408] holds the variable unary_417
  mov RAX, [RBP-400]
  mov R11, RAX
  mov RAX, [RBP-408]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_7464
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7464
_cmp_fail_7464:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7464:
  mov [RBP-416], RAX ; [RBP-416] holds the variable binop_414
  mov RAX, [RBP-416]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7446
  mov RAX, 70
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-432], RAX ; [RBP-432] holds the variable unary_420
  mov RAX, [RBP-432]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  jmp near done_7446
if_false_7446:
  mov RAX, 166
  mov R11, RAX
  mov RAX, -48
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_7455
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7455
_cmp_fail_7455:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7455:
  mov [RBP-432], RAX ; [RBP-432] holds the variable binop_423
  mov RAX, [RBP-432]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7448
  mov RAX, -60
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 188
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_7448
if_false_7448:
  mov RAX, 12
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
done_7448:
done_7446:
  mov [RBP-424], RAX ; [RBP-424] holds the variable if_413
  mov RAX, [RBP-392]
  mov R11, RAX
  mov RAX, [RBP-424]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_7443
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7443
_cmp_fail_7443:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7443:
  jmp near done_7203
if_false_7203:
  ;; or_lhs {
  mov RAX, -30
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 150
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-352], RAX ; [RBP-352] holds the variable binop_437
  mov RAX, -42
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-360], RAX ; [RBP-360] holds the variable unary_440
  mov RAX, [RBP-352]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-360]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-368], RAX ; [RBP-368] holds the variable vmrbdcqdao_434
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7421
  mov RAX, 0x7fffffffffffffff
  jmp near done_7421
if_false_7421:
  mov RAX, 0xffffffffffffffff
done_7421:
  mov [RBP-376], RAX ; [RBP-376] holds the variable if_446
  mov RAX, [RBP-376]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7412
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7416
  mov RAX, 0xffffffffffffffff
  jmp near done_7416
if_false_7416:
  mov RAX, 0xffffffffffffffff
done_7416:
  jmp near done_7412
if_false_7412:
  mov RAX, [RBP-368]
  mov R11, RAX
  mov RAX, [RBP-368]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_7413
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7413
_cmp_fail_7413:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7413:
done_7412:
  mov [RBP-384], RAX ; [RBP-384] holds the variable kucxhzqlfr_443
  ;; or_lhs {
  mov RAX, [RBP-368]
  mov R11, RAX
  mov RAX, [RBP-368]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_7409
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7409
_cmp_fail_7409:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7409:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7405
  ;; or_rhs {
  ;; or_lhs {
  mov RAX, [RBP-384]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7406
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7406
  mov RAX, 0x7fffffffffffffff
or_done_7406:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7405
  mov RAX, 0x7fffffffffffffff
or_done_7405:
  mov [RBP-392], RAX ; [RBP-392] holds the variable kiqitmzeek_458
  mov RAX, [RBP-392]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7401
  mov RAX, [RBP-368]
  jmp near done_7401
if_false_7401:
  mov RAX, [RBP-368]
done_7401:
  mov [RBP-400], RAX ; [RBP-400] holds the variable uqqvnynlxm_472
  mov RAX, [RBP-392]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7397
  mov RAX, [RBP-384]
  jmp near done_7397
if_false_7397:
  mov RAX, [RBP-392]
done_7397:
  mov [RBP-408], RAX ; [RBP-408] holds the variable xjgxtgdvvw_479
  mov RAX, [RBP-392]
  mov [RBP-416], RAX ; [RBP-416] holds the variable zlfbaxwglf_490
  mov RAX, [RBP-368]
  mov [RBP-424], RAX ; [RBP-424] holds the variable senoaggdkg_494
  mov RAX, 0x7fffffffffffffff
  mov [RBP-432], RAX ; [RBP-432] holds the variable uxbqphnudu_498
  mov RAX, [RBP-400]
  mov [RBP-440], RAX ; [RBP-440] holds the variable kjshwvwvov_502
  mov RAX, [RBP-432]
  mov [RBP-448], RAX ; [RBP-448] holds the variable xugjhnmefo_506
  mov RAX, [RBP-368]
  mov [RBP-456], RAX ; [RBP-456] holds the variable iykxbifast_510
  mov RAX, -156
  mov [RBP-464], RAX ; [RBP-464] holds the variable qxmxkfiikd_514
  mov RAX, [RBP-456]
  mov [RBP-472], RAX ; [RBP-472] holds the variable dzlityytyj_518
  mov RAX, [RBP-384]
  mov [RBP-480], RAX ; [RBP-480] holds the variable rriyitflfr_486
  mov RAX, 88
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-368]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-488], RAX ; [RBP-488] holds the variable paxauaaovq_523
  mov RAX, [RBP-488]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-496], RAX ; [RBP-496] holds the variable tmbbamxgsh_468
  mov RAX, [RBP-392]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7379
  mov RAX, [RBP-368]
  jmp near done_7379
if_false_7379:
  mov RAX, [RBP-368]
done_7379:
  mov [RBP-504], RAX ; [RBP-504] holds the variable kapilrpcwx_535
  ;; and_lhs {
  mov RAX, [RBP-384]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_7376
  ;; and_rhs {
  mov RAX, [RBP-392]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_7376
  mov RAX, 0xffffffffffffffff
and_done_7376:
  mov [RBP-512], RAX ; [RBP-512] holds the variable bkddfwwtut_531
  mov RAX, [RBP-368]
  mov R11, RAX
  mov RAX, 54
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_7373
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7373
_cmp_fail_7373:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7373:
  mov [RBP-520], RAX ; [RBP-520] holds the variable binop_548
  mov RAX, [RBP-520]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7355
  mov RAX, [RBP-384]
  mov [RBP-536], RAX ; [RBP-536] holds the variable qzviuihaku_553
  mov RAX, [RBP-392]
  mov [RBP-544], RAX ; [RBP-544] holds the variable qaabshamqs_557
  mov RAX, [RBP-368]
  mov [RBP-552], RAX ; [RBP-552] holds the variable hmfdqaodjz_561
  mov RAX, [RBP-536]
  mov [RBP-560], RAX ; [RBP-560] holds the variable vepmqdrwgx_565
  mov RAX, [RBP-384]
  mov [RBP-568], RAX ; [RBP-568] holds the variable hafcqhiqsh_569
  mov RAX, -86
  mov [RBP-576], RAX ; [RBP-576] holds the variable ofylksrfvz_573
  mov RAX, [RBP-512]
  jmp near done_7355
if_false_7355:
  ;; or_lhs {
  mov RAX, [RBP-392]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7356
  ;; or_rhs {
  mov RAX, [RBP-392]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7356
  mov RAX, 0x7fffffffffffffff
or_done_7356:
done_7355:
  mov [RBP-528], RAX ; [RBP-528] holds the variable lnffvakkmi_545
  mov RAX, [RBP-368]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-536], RAX ; [RBP-536] holds the variable unary_584
  mov RAX, [RBP-496]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-496]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-544], RAX ; [RBP-544] holds the variable binop_586
  mov RAX, [RBP-536]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-544]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-552], RAX ; [RBP-552] holds the variable cfiylbxsug_581
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7343
  mov RAX, [RBP-528]
  jmp near done_7343
if_false_7343:
  mov RAX, [RBP-512]
done_7343:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_7321
  ;; and_rhs {
  mov RAX, -114
  mov [RBP-568], RAX ; [RBP-568] holds the variable jhozfyrqed_599
  mov RAX, [RBP-392]
  mov [RBP-576], RAX ; [RBP-576] holds the variable gilatjstzk_603
  mov RAX, [RBP-496]
  mov [RBP-584], RAX ; [RBP-584] holds the variable muvmudeoep_607
  mov RAX, [RBP-368]
  mov [RBP-592], RAX ; [RBP-592] holds the variable syvsypugns_611
  mov RAX, 0x7fffffffffffffff
  mov [RBP-600], RAX ; [RBP-600] holds the variable ctmifsfxyo_615
  mov RAX, [RBP-568]
  mov [RBP-608], RAX ; [RBP-608] holds the variable fejkhhwnyw_619
  mov RAX, 146
  mov [RBP-616], RAX ; [RBP-616] holds the variable eriianeais_623
  mov RAX, [RBP-568]
  mov [RBP-624], RAX ; [RBP-624] holds the variable jkmwgulwai_627
  mov RAX, [RBP-584]
  mov [RBP-632], RAX ; [RBP-632] holds the variable impjhwhnkq_631
  mov RAX, -6
  mov [RBP-640], RAX ; [RBP-640] holds the variable zetzsbslzf_635
  mov RAX, [RBP-512]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_7321
  mov RAX, 0xffffffffffffffff
and_done_7321:
  mov [RBP-560], RAX ; [RBP-560] holds the variable lnwazpuwhk_590
  mov RAX, [RBP-368]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-568], RAX ; [RBP-568] holds the variable kmwhqtgelc_644
  mov RAX, [RBP-568]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-576], RAX ; [RBP-576] holds the variable ottwcwhnxc_649
  mov RAX, [RBP-368]
  mov R11, RAX
  mov RAX, [RBP-368]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_7314
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7314
_cmp_fail_7314:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7314:
  mov [RBP-584], RAX ; [RBP-584] holds the variable olkvsmphmb_654
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7310
  mov RAX, 140
  jmp near done_7310
if_false_7310:
  mov RAX, [RBP-568]
done_7310:
  mov [RBP-592], RAX ; [RBP-592] holds the variable oveocuuras_660
  mov RAX, [RBP-568]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-600], RAX ; [RBP-600] holds the variable mjvxrsyvtx_640
  mov RAX, 122
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-368]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-608], RAX ; [RBP-608] holds the variable rogsjmrngw_670
  mov RAX, [RBP-368]
  mov R11, RAX
  mov RAX, [RBP-608]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_7302
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7302
_cmp_fail_7302:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7302:
  mov [RBP-616], RAX ; [RBP-616] holds the variable nutqmimmgz_676
  mov RAX, [RBP-384]
  mov [RBP-624], RAX ; [RBP-624] holds the variable yowlvsqudc_686
  mov RAX, 0x7fffffffffffffff
  mov [RBP-632], RAX ; [RBP-632] holds the variable hhigvclpue_690
  mov RAX, 0x7fffffffffffffff
  mov [RBP-640], RAX ; [RBP-640] holds the variable lmqeiuguzf_682
  mov RAX, [RBP-392]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7295
  mov RAX, 0x7fffffffffffffff
  jmp near done_7295
if_false_7295:
  mov RAX, [RBP-512]
done_7295:
  mov [RBP-648], RAX ; [RBP-648] holds the variable icjfodnqpl_695
  ;; or_lhs {
  mov RAX, [RBP-560]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7292
  ;; or_rhs {
  mov RAX, [RBP-640]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7292
  mov RAX, 0x7fffffffffffffff
or_done_7292:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7204
  ;; or_rhs {
  mov RAX, -14
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 92
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-352], RAX ; [RBP-352] holds the variable bctmdoimkp_710
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7248
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7248
  mov RAX, 0x7fffffffffffffff
or_done_7248:
  mov [RBP-360], RAX ; [RBP-360] holds the variable gyiwjwhufa_716
  mov RAX, -94
  mov R11, RAX
  mov RAX, [RBP-352]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_7245
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7245
_cmp_fail_7245:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7245:
  mov [RBP-368], RAX ; [RBP-368] holds the variable ludbiyxrsf_722
  mov RAX, [RBP-352]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-376], RAX ; [RBP-376] holds the variable cikdtmpryr_706
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  mov [RBP-392], RAX ; [RBP-392] holds the variable wibjyhtnyv_735
  mov RAX, [RBP-376]
  mov [RBP-400], RAX ; [RBP-400] holds the variable ricteyxhvd_739
  mov RAX, [RBP-400]
  mov [RBP-408], RAX ; [RBP-408] holds the variable ydzvibaqzc_743
  mov RAX, [RBP-376]
  mov [RBP-416], RAX ; [RBP-416] holds the variable pwofnozfig_747
  mov RAX, [RBP-416]
  mov [RBP-424], RAX ; [RBP-424] holds the variable zlhgpldsbm_751
  mov RAX, 0x7fffffffffffffff
  mov [RBP-432], RAX ; [RBP-432] holds the variable bxjvmcrxqq_755
  mov RAX, -88
  mov [RBP-440], RAX ; [RBP-440] holds the variable fuiudujosp_759
  mov RAX, [RBP-392]
  mov [RBP-448], RAX ; [RBP-448] holds the variable lxfnmjxeik_763
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7222
  ;; or_rhs {
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7223
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7223
  mov RAX, 0x7fffffffffffffff
or_done_7223:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7222
  mov RAX, 0x7fffffffffffffff
or_done_7222:
  mov [RBP-384], RAX ; [RBP-384] holds the variable bebqrwwamx_730
  mov RAX, [RBP-376]
  mov R11, RAX
  mov RAX, [RBP-376]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_7219
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7219
_cmp_fail_7219:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7219:
  mov [RBP-392], RAX ; [RBP-392] holds the variable binop_771
  mov RAX, [RBP-392]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7211
  ;; or_lhs {
  mov RAX, [RBP-384]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7215
  ;; or_rhs {
  mov RAX, [RBP-384]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7215
  mov RAX, 0x7fffffffffffffff
or_done_7215:
  jmp near done_7211
if_false_7211:
  mov RAX, -154
  mov R11, RAX
  mov RAX, [RBP-376]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_7212
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7212
_cmp_fail_7212:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7212:
done_7211:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_7204
  mov RAX, 0x7fffffffffffffff
or_done_7204:
done_7203:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6082
  ;; and_rhs {
  mov RAX, 0xffffffffffffffff
  mov [RBP-56], RAX ; [RBP-56] holds the variable awphwdskgh_792
  mov RAX, [RBP-56]
  mov [RBP-64], RAX ; [RBP-64] holds the variable fgzxynvvxz_796
  mov RAX, 0xffffffffffffffff
  mov [RBP-72], RAX ; [RBP-72] holds the variable flfbhbwyjm_800
  mov RAX, 86
  mov [RBP-80], RAX ; [RBP-80] holds the variable thlftfsval_804
  mov RAX, [RBP-80]
  mov [RBP-88], RAX ; [RBP-88] holds the variable nuygjzrokt_808
  mov RAX, [RBP-72]
  mov [RBP-96], RAX ; [RBP-96] holds the variable gwcrpwykpw_812
  mov RAX, [RBP-80]
  mov [RBP-104], RAX ; [RBP-104] holds the variable jaxbxtbtao_816
  mov RAX, [RBP-80]
  mov [RBP-112], RAX ; [RBP-112] holds the variable mihrbvnbqi_788
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7154
  mov RAX, 0x7fffffffffffffff
  jmp near done_7154
if_false_7154:
  mov RAX, 0x7fffffffffffffff
done_7154:
  mov [RBP-120], RAX ; [RBP-120] holds the variable fihemzhebz_821
  mov RAX, [RBP-120]
  mov [RBP-128], RAX ; [RBP-128] holds the variable zfdekurrpa_832
  mov RAX, [RBP-112]
  mov [RBP-136], RAX ; [RBP-136] holds the variable xplcfdpcfx_836
  mov RAX, [RBP-112]
  mov [RBP-144], RAX ; [RBP-144] holds the variable ubsffgnibm_840
  mov RAX, [RBP-112]
  mov [RBP-152], RAX ; [RBP-152] holds the variable uxinvciwaq_844
  mov RAX, [RBP-120]
  mov [RBP-160], RAX ; [RBP-160] holds the variable ixtxwpxtxl_848
  mov RAX, 0xffffffffffffffff
  mov [RBP-168], RAX ; [RBP-168] holds the variable osrvndtuvt_852
  mov RAX, [RBP-136]
  mov [RBP-176], RAX ; [RBP-176] holds the variable amdxtmleca_856
  mov RAX, [RBP-160]
  mov [RBP-184], RAX ; [RBP-184] holds the variable ejmvwgmfce_828
  mov RAX, [RBP-120]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7142
  mov RAX, 0x7fffffffffffffff
  jmp near done_7142
if_false_7142:
  mov RAX, [RBP-120]
done_7142:
  mov [RBP-192], RAX ; [RBP-192] holds the variable qjvdxurzbm_861
  mov RAX, -66
  mov [RBP-200], RAX ; [RBP-200] holds the variable wpgvimbsyr_869
  mov RAX, [RBP-200]
  mov [RBP-208], RAX ; [RBP-208] holds the variable wmxjrtgtfj_873
  mov RAX, [RBP-120]
  mov [RBP-216], RAX ; [RBP-216] holds the variable henlzazkbu_877
  mov RAX, [RBP-184]
  mov [RBP-224], RAX ; [RBP-224] holds the variable jjmghnkimz_881
  mov RAX, [RBP-112]
  mov [RBP-232], RAX ; [RBP-232] holds the variable thzrgbjagh_885
  mov RAX, [RBP-184]
  mov [RBP-240], RAX ; [RBP-240] holds the variable dylxgkoyth_889
  mov RAX, [RBP-240]
  mov [RBP-248], RAX ; [RBP-248] holds the variable okwbzhdrrz_893
  mov RAX, [RBP-216]
  mov [RBP-256], RAX ; [RBP-256] holds the variable rnsbxtocix_897
  mov RAX, [RBP-184]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7088
  mov RAX, 10
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-272], RAX ; [RBP-272] holds the variable btlqrvhidq_903
  mov RAX, [RBP-272]
  mov [RBP-280], RAX ; [RBP-280] holds the variable emyhrowhcs_912
  mov RAX, [RBP-272]
  mov [RBP-288], RAX ; [RBP-288] holds the variable cfouxwmodl_916
  mov RAX, [RBP-272]
  mov [RBP-296], RAX ; [RBP-296] holds the variable kannngckfj_920
  mov RAX, 0xffffffffffffffff
  mov [RBP-304], RAX ; [RBP-304] holds the variable vmhwtltqwb_924
  mov RAX, [RBP-296]
  mov [RBP-312], RAX ; [RBP-312] holds the variable bxpjkjfvqr_928
  mov RAX, -34
  mov [RBP-320], RAX ; [RBP-320] holds the variable elwoajzbmy_932
  mov RAX, 92
  mov [RBP-328], RAX ; [RBP-328] holds the variable taiqobaaop_936
  mov RAX, -64
  mov [RBP-336], RAX ; [RBP-336] holds the variable wjeaicaltk_940
  mov RAX, [RBP-304]
  mov [RBP-344], RAX ; [RBP-344] holds the variable ywetgjuwym_944
  mov RAX, [RBP-344]
  mov [RBP-352], RAX ; [RBP-352] holds the variable easzzprbtg_948
  mov RAX, [RBP-344]
  mov [RBP-360], RAX ; [RBP-360] holds the variable hqfbmcheau_908
  mov RAX, [RBP-360]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7116
  mov RAX, [RBP-360]
  jmp near done_7116
if_false_7116:
  mov RAX, [RBP-360]
done_7116:
  mov [RBP-368], RAX ; [RBP-368] holds the variable hrqwdcsbgd_953
  mov RAX, [RBP-272]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-272]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  jmp near done_7088
if_false_7088:
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7096
  mov RAX, 142
  jmp near done_7096
if_false_7096:
  mov RAX, 174
done_7096:
  mov [RBP-272], RAX ; [RBP-272] holds the variable if_963
  mov RAX, -76
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-280], RAX ; [RBP-280] holds the variable unary_967
  mov RAX, [RBP-272]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-280]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
done_7088:
  mov [RBP-264], RAX ; [RBP-264] holds the variable mrozkxsxlc_783
  mov RAX, [RBP-264]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-264]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-272], RAX ; [RBP-272] holds the variable binop_974
  mov RAX, [RBP-264]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-264]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-280], RAX ; [RBP-280] holds the variable binop_977
  mov RAX, [RBP-272]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-280]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-288], RAX ; [RBP-288] holds the variable binop_973
  mov RAX, [RBP-288]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-296], RAX ; [RBP-296] holds the variable lxgyezrlqd_970
  ;; and_lhs {
  mov RAX, [RBP-264]
  mov R11, RAX
  mov RAX, [RBP-296]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_7074
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_7074
_cmp_fail_7074:
  mov RAX, 0x7fffffffffffffff
_cmp_done_7074:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_7069
  ;; and_rhs {
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7070
  mov RAX, 0xffffffffffffffff
  jmp near done_7070
if_false_7070:
  mov RAX, 0xffffffffffffffff
done_7070:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_7069
  mov RAX, 0xffffffffffffffff
and_done_7069:
  mov [RBP-304], RAX ; [RBP-304] holds the variable binop_and_or_984
  mov RAX, [RBP-304]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7036
  mov RAX, -106
  mov [RBP-320], RAX ; [RBP-320] holds the variable vatsfbxvpk_995
  mov RAX, [RBP-296]
  mov [RBP-328], RAX ; [RBP-328] holds the variable xbrmuajfpz_999
  mov RAX, 0x7fffffffffffffff
  mov [RBP-336], RAX ; [RBP-336] holds the variable ifsosqbqgz_1003
  mov RAX, [RBP-336]
  mov [RBP-344], RAX ; [RBP-344] holds the variable cccnxnokjd_1007
  mov RAX, 0xffffffffffffffff
  mov [RBP-352], RAX ; [RBP-352] holds the variable hynecbuztd_1011
  mov RAX, 0x7fffffffffffffff
  mov [RBP-360], RAX ; [RBP-360] holds the variable eddgjomchm_1015
  mov RAX, [RBP-328]
  mov [RBP-368], RAX ; [RBP-368] holds the variable eclvvqhecs_1019
  mov RAX, -180
  mov [RBP-376], RAX ; [RBP-376] holds the variable wjbglwhjqz_1023
  mov RAX, [RBP-344]
  mov [RBP-384], RAX ; [RBP-384] holds the variable hjnblrerhn_1027
  mov RAX, -36
  mov [RBP-392], RAX ; [RBP-392] holds the variable xrdrriyrwi_1031
  mov RAX, 106
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-400], RAX ; [RBP-400] holds the variable unary_1035
  mov RAX, [RBP-392]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  jmp near done_7036
if_false_7036:
  mov RAX, -114
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-320], RAX ; [RBP-320] holds the variable unary_1038
  mov RAX, [RBP-320]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
done_7036:
  mov [RBP-312], RAX ; [RBP-312] holds the variable xgfcrwnlxo_981
  mov RAX, 0x7fffffffffffffff
  mov [RBP-320], RAX ; [RBP-320] holds the variable ckbialuoae_1047
  mov RAX, -174
  mov [RBP-328], RAX ; [RBP-328] holds the variable dhcpvwyusw_1051
  mov RAX, [RBP-312]
  mov [RBP-336], RAX ; [RBP-336] holds the variable qopaxfylne_1055
  mov RAX, [RBP-264]
  mov [RBP-344], RAX ; [RBP-344] holds the variable faogyetqco_1059
  mov RAX, 12
  mov [RBP-352], RAX ; [RBP-352] holds the variable vyjowcbhuz_1063
  mov RAX, [RBP-320]
  mov [RBP-360], RAX ; [RBP-360] holds the variable nwvfbmgwsb_1067
  mov RAX, [RBP-360]
  mov [RBP-368], RAX ; [RBP-368] holds the variable zbddrrjtmy_1071
  mov RAX, [RBP-336]
  mov [RBP-376], RAX ; [RBP-376] holds the variable abmduiaups_1075
  mov RAX, [RBP-360]
  mov [RBP-384], RAX ; [RBP-384] holds the variable mieoptdfya_1079
  mov RAX, [RBP-336]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-392], RAX ; [RBP-392] holds the variable unary_1044
  mov RAX, [RBP-392]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-400], RAX ; [RBP-400] holds the variable orczgqqovb_1041
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7019
  mov RAX, 0x7fffffffffffffff
  jmp near done_7019
if_false_7019:
  mov RAX, 0xffffffffffffffff
done_7019:
  mov [RBP-408], RAX ; [RBP-408] holds the variable if_1088
  mov RAX, [RBP-408]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7012
  mov RAX, -36
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-264]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_7012
if_false_7012:
  mov RAX, [RBP-400]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
done_7012:
  mov [RBP-416], RAX ; [RBP-416] holds the variable scdbhbxhjt_1085
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7008
  mov RAX, 0x7fffffffffffffff
  jmp near done_7008
if_false_7008:
  mov RAX, 0x7fffffffffffffff
done_7008:
  mov [RBP-424], RAX ; [RBP-424] holds the variable cwhhwcmjvt_1102
  mov RAX, [RBP-424]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_7004
  mov RAX, [RBP-312]
  jmp near done_7004
if_false_7004:
  mov RAX, 150
done_7004:
  mov [RBP-432], RAX ; [RBP-432] holds the variable iyscypynkc_1109
  mov RAX, [RBP-424]
  mov [RBP-440], RAX ; [RBP-440] holds the variable ezmclyrnyx_1120
  mov RAX, 0xffffffffffffffff
  mov [RBP-448], RAX ; [RBP-448] holds the variable hpremrcfjz_1124
  mov RAX, [RBP-416]
  mov [RBP-456], RAX ; [RBP-456] holds the variable dzmqbipxyo_1128
  mov RAX, [RBP-424]
  mov [RBP-464], RAX ; [RBP-464] holds the variable nxfksifhsh_1132
  mov RAX, [RBP-264]
  mov [RBP-472], RAX ; [RBP-472] holds the variable qbjwuzlmbx_1136
  mov RAX, [RBP-424]
  mov [RBP-480], RAX ; [RBP-480] holds the variable yvtczjdgvl_1140
  mov RAX, [RBP-296]
  mov [RBP-488], RAX ; [RBP-488] holds the variable xducgtiibd_1144
  mov RAX, [RBP-440]
  mov [RBP-496], RAX ; [RBP-496] holds the variable chbijfajkp_1148
  mov RAX, [RBP-448]
  mov [RBP-504], RAX ; [RBP-504] holds the variable zjsetdnjvp_1152
  mov RAX, [RBP-504]
  mov [RBP-512], RAX ; [RBP-512] holds the variable bmariozxom_1156
  mov RAX, [RBP-488]
  mov [RBP-520], RAX ; [RBP-520] holds the variable hdutozllkr_1116
  mov RAX, 170
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-528], RAX ; [RBP-528] holds the variable bbqjmabuyt_1161
  mov RAX, [RBP-424]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6987
  mov RAX, [RBP-424]
  jmp near done_6987
if_false_6987:
  mov RAX, [RBP-424]
done_6987:
  mov [RBP-536], RAX ; [RBP-536] holds the variable gcvpxidhcz_1166
  ;; and_lhs {
  mov RAX, [RBP-424]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6984
  ;; and_rhs {
  mov RAX, [RBP-424]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6984
  mov RAX, 0xffffffffffffffff
and_done_6984:
  mov [RBP-544], RAX ; [RBP-544] holds the variable jwazouqwuo_1173
  mov RAX, [RBP-544]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6980
  mov RAX, [RBP-424]
  jmp near done_6980
if_false_6980:
  mov RAX, [RBP-424]
done_6980:
  mov [RBP-552], RAX ; [RBP-552] holds the variable rpwfkuhyce_1179
  mov RAX, -190
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -50
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-560], RAX ; [RBP-560] holds the variable ptgpshjsoo_1098
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6974
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6974
  mov RAX, 0x7fffffffffffffff
or_done_6974:
  mov [RBP-568], RAX ; [RBP-568] holds the variable binop_and_or_1192
  mov RAX, [RBP-568]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6954
  mov RAX, 0xffffffffffffffff
  mov [RBP-584], RAX ; [RBP-584] holds the variable czmpfzlgfy_1197
  mov RAX, [RBP-584]
  mov [RBP-592], RAX ; [RBP-592] holds the variable rqfizyuvif_1201
  mov RAX, -20
  mov [RBP-600], RAX ; [RBP-600] holds the variable djrffsdpeq_1205
  mov RAX, [RBP-584]
  jmp near done_6954
if_false_6954:
  mov RAX, 0x7fffffffffffffff
  mov [RBP-584], RAX ; [RBP-584] holds the variable zwmhjbnzpw_1211
  mov RAX, [RBP-416]
  mov [RBP-592], RAX ; [RBP-592] holds the variable cufnlkvtor_1215
  mov RAX, 0x7fffffffffffffff
  mov [RBP-600], RAX ; [RBP-600] holds the variable uabfxxpiul_1219
  mov RAX, 44
  mov [RBP-608], RAX ; [RBP-608] holds the variable cdyswqgrsg_1223
  mov RAX, 0xffffffffffffffff
  mov [RBP-616], RAX ; [RBP-616] holds the variable gmtbmnlyjz_1227
  mov RAX, [RBP-584]
done_6954:
  mov [RBP-576], RAX ; [RBP-576] holds the variable mfenifdyun_1189
  mov RAX, [RBP-264]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-584], RAX ; [RBP-584] holds the variable unary_1235
  mov RAX, [RBP-264]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-592], RAX ; [RBP-592] holds the variable unary_1237
  mov RAX, [RBP-584]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-592]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-600], RAX ; [RBP-600] holds the variable qchlytbink_1232
  ;; and_lhs {
  mov RAX, [RBP-576]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6944
  ;; and_rhs {
  mov RAX, [RBP-576]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6944
  mov RAX, 0xffffffffffffffff
and_done_6944:
  mov [RBP-608], RAX ; [RBP-608] holds the variable liafjayktg_1244
  mov RAX, [RBP-312]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-600]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-616], RAX ; [RBP-616] holds the variable wnzakhahbd_1250
  mov RAX, [RBP-608]
  mov [RBP-624], RAX ; [RBP-624] holds the variable upbgkkwiea_1260
  mov RAX, [RBP-576]
  mov [RBP-632], RAX ; [RBP-632] holds the variable ywysqtawhi_1264
  mov RAX, 0xffffffffffffffff
  mov [RBP-640], RAX ; [RBP-640] holds the variable vetgfpnvcg_1268
  mov RAX, [RBP-608]
  mov [RBP-648], RAX ; [RBP-648] holds the variable pmrgnkhpqm_1256
  mov RAX, [RBP-416]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-264]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-656], RAX ; [RBP-656] holds the variable fgtdocvjtn_1273
  mov RAX, [RBP-264]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-664], RAX ; [RBP-664] holds the variable baovrwbhip_1279
  mov RAX, 0x7fffffffffffffff
  mov [RBP-672], RAX ; [RBP-672] holds the variable prlurmuiyn_1288
  mov RAX, 0xffffffffffffffff
  mov [RBP-680], RAX ; [RBP-680] holds the variable ownucwpjfw_1284
  ;; and_lhs {
  mov RAX, [RBP-648]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6927
  ;; and_rhs {
  mov RAX, [RBP-680]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6927
  mov RAX, 0xffffffffffffffff
and_done_6927:
  mov [RBP-688], RAX ; [RBP-688] holds the variable vfatnznvhw_1293
  mov RAX, [RBP-680]
  mov [RBP-696], RAX ; [RBP-696] holds the variable pssfdbstlj_1303
  mov RAX, [RBP-400]
  mov [RBP-704], RAX ; [RBP-704] holds the variable msnrsigxzi_1307
  mov RAX, 0x7fffffffffffffff
  mov [RBP-712], RAX ; [RBP-712] holds the variable euiapiasad_1311
  mov RAX, 0xffffffffffffffff
  mov [RBP-720], RAX ; [RBP-720] holds the variable bshyavlfqh_1315
  mov RAX, [RBP-560]
  mov [RBP-728], RAX ; [RBP-728] holds the variable lpphxelvjl_1319
  mov RAX, [RBP-680]
  mov [RBP-736], RAX ; [RBP-736] holds the variable welvuumlnu_1323
  mov RAX, -192
  mov [RBP-744], RAX ; [RBP-744] holds the variable yxuxatccdh_1327
  mov RAX, [RBP-688]
  mov [RBP-752], RAX ; [RBP-752] holds the variable vgkizppaic_1331
  mov RAX, [RBP-400]
  mov [RBP-760], RAX ; [RBP-760] holds the variable zngawqzjaw_1335
  mov RAX, 0xffffffffffffffff
  mov [RBP-768], RAX ; [RBP-768] holds the variable zspsmmvfhz_1299
  mov RAX, [RBP-560]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-312]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-776], RAX ; [RBP-776] holds the variable xegfecrdnr_1340
  ;; and_lhs {
  mov RAX, [RBP-680]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6911
  ;; and_rhs {
  mov RAX, [RBP-688]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6911
  mov RAX, 0xffffffffffffffff
and_done_6911:
  mov [RBP-784], RAX ; [RBP-784] holds the variable xoobdtokgj_1346
  mov RAX, [RBP-688]
  mov [RBP-792], RAX ; [RBP-792] holds the variable kqrfsfuoqs_1353
  mov RAX, [RBP-680]
  mov [RBP-800], RAX ; [RBP-800] holds the variable rmdcqsiweh_1357
  mov RAX, -16
  mov [RBP-808], RAX ; [RBP-808] holds the variable wqnswabfay_1361
  mov RAX, [RBP-784]
  mov [RBP-816], RAX ; [RBP-816] holds the variable hnpxaghpfv_1365
  mov RAX, [RBP-312]
  mov [RBP-824], RAX ; [RBP-824] holds the variable ifaynqrqam_1369
  mov RAX, [RBP-416]
  mov [RBP-832], RAX ; [RBP-832] holds the variable iufowkcfxl_1373
  mov RAX, [RBP-560]
  mov [RBP-840], RAX ; [RBP-840] holds the variable gidbnkewly_1240
  mov RAX, [RBP-296]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-848], RAX ; [RBP-848] holds the variable zuhjkqxsjs_1382
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6898
  mov RAX, 0x7fffffffffffffff
  jmp near done_6898
if_false_6898:
  mov RAX, [RBP-576]
done_6898:
  mov [RBP-856], RAX ; [RBP-856] holds the variable zqytgjofya_1387
  mov RAX, [RBP-856]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6894
  mov RAX, [RBP-576]
  jmp near done_6894
if_false_6894:
  mov RAX, [RBP-576]
done_6894:
  mov [RBP-864], RAX ; [RBP-864] holds the variable eovsfkrtuh_1394
  mov RAX, [RBP-856]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6890
  mov RAX, 0x7fffffffffffffff
  jmp near done_6890
if_false_6890:
  mov RAX, 0xffffffffffffffff
done_6890:
  mov [RBP-872], RAX ; [RBP-872] holds the variable nxsifzldze_1401
  mov RAX, [RBP-864]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6886
  mov RAX, [RBP-600]
  jmp near done_6886
if_false_6886:
  mov RAX, 70
done_6886:
  mov [RBP-880], RAX ; [RBP-880] holds the variable qnirorkqfd_1408
  mov RAX, [RBP-576]
  mov [RBP-888], RAX ; [RBP-888] holds the variable jzhexpjrhv_1419
  mov RAX, [RBP-416]
  mov [RBP-896], RAX ; [RBP-896] holds the variable opjnlhystz_1423
  mov RAX, [RBP-848]
  mov [RBP-904], RAX ; [RBP-904] holds the variable zesjyumohf_1427
  mov RAX, [RBP-888]
  mov [RBP-912], RAX ; [RBP-912] holds the variable jmwszezipe_1431
  mov RAX, [RBP-840]
  mov [RBP-920], RAX ; [RBP-920] holds the variable pqrqujdeht_1435
  mov RAX, [RBP-864]
  mov [RBP-928], RAX ; [RBP-928] holds the variable cisypobcfl_1439
  mov RAX, [RBP-888]
  mov [RBP-936], RAX ; [RBP-936] holds the variable umncjgfbtw_1443
  mov RAX, 122
  mov [RBP-944], RAX ; [RBP-944] holds the variable qeltgtcycq_1447
  mov RAX, 0xffffffffffffffff
  mov [RBP-952], RAX ; [RBP-952] holds the variable iasgklgzfo_1451
  mov RAX, 0xffffffffffffffff
  mov [RBP-960], RAX ; [RBP-960] holds the variable vhhihwsrch_1415
  mov RAX, [RBP-856]
  mov [RBP-968], RAX ; [RBP-968] holds the variable cdhvthsoxh_1460
  mov RAX, [RBP-840]
  mov [RBP-976], RAX ; [RBP-976] holds the variable zhhrvvfczv_1464
  mov RAX, 90
  mov [RBP-984], RAX ; [RBP-984] holds the variable ksynalahtg_1468
  mov RAX, [RBP-960]
  mov [RBP-992], RAX ; [RBP-992] holds the variable bnvpzzrjjq_1472
  mov RAX, [RBP-968]
  mov [RBP-1000], RAX ; [RBP-1000] holds the variable aoxztpyprb_1476
  mov RAX, [RBP-880]
  mov [RBP-1008], RAX ; [RBP-1008] holds the variable jpmslfvtpx_1480
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1016], RAX ; [RBP-1016] holds the variable shqaravjxr_1456
  mov RAX, 0xffffffffffffffff
  mov [RBP-1024], RAX ; [RBP-1024] holds the variable qhnhuktudg_1489
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1032], RAX ; [RBP-1032] holds the variable kpkpqwbziv_1493
  mov RAX, [RBP-600]
  mov [RBP-1040], RAX ; [RBP-1040] holds the variable irwxunlmou_1497
  mov RAX, [RBP-880]
  mov [RBP-1048], RAX ; [RBP-1048] holds the variable mwjdqzvnkl_1501
  mov RAX, [RBP-600]
  mov [RBP-1056], RAX ; [RBP-1056] holds the variable jttjodtady_1505
  mov RAX, [RBP-1016]
  mov [RBP-1064], RAX ; [RBP-1064] holds the variable gqxjdcryxx_1485
  mov RAX, [RBP-264]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1072], RAX ; [RBP-1072] holds the variable bzfaqvxbds_1378
  mov RAX, [RBP-576]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6857
  mov RAX, [RBP-576]
  jmp near done_6857
if_false_6857:
  mov RAX, [RBP-576]
done_6857:
  mov [RBP-1080], RAX ; [RBP-1080] holds the variable if_1515
  mov RAX, [RBP-1080]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6835
  ;; and_lhs {
  mov RAX, [RBP-576]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6853
  ;; and_rhs {
  mov RAX, [RBP-576]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6853
  mov RAX, 0xffffffffffffffff
and_done_6853:
  jmp near done_6835
if_false_6835:
  mov RAX, [RBP-576]
  mov [RBP-1096], RAX ; [RBP-1096] holds the variable dilcjjyjts_1524
  mov RAX, [RBP-576]
  mov [RBP-1104], RAX ; [RBP-1104] holds the variable vvhxlembss_1528
  mov RAX, [RBP-296]
  mov [RBP-1112], RAX ; [RBP-1112] holds the variable jubsxkvkmi_1532
  mov RAX, [RBP-576]
  mov [RBP-1120], RAX ; [RBP-1120] holds the variable ihdlenkrpa_1536
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1128], RAX ; [RBP-1128] holds the variable fhqxpckacj_1540
  mov RAX, [RBP-296]
  mov [RBP-1136], RAX ; [RBP-1136] holds the variable qhvpicesmc_1544
  mov RAX, [RBP-1128]
  mov [RBP-1144], RAX ; [RBP-1144] holds the variable wgixwqnide_1548
  mov RAX, [RBP-576]
  mov [RBP-1152], RAX ; [RBP-1152] holds the variable kgfdnnofds_1552
  mov RAX, [RBP-1120]
done_6835:
  mov [RBP-1088], RAX ; [RBP-1088] holds the variable kxtdepiqaz_1512
  mov RAX, [RBP-416]
  mov R11, RAX
  mov RAX, [RBP-1072]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_6832
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6832
_cmp_fail_6832:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6832:
  mov [RBP-1096], RAX ; [RBP-1096] holds the variable binop_1560
  mov RAX, [RBP-1096]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6823
  mov RAX, [RBP-840]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-600]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_6823
if_false_6823:
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6824
  mov RAX, 116
  jmp near done_6824
if_false_6824:
  mov RAX, 74
done_6824:
done_6823:
  mov [RBP-1104], RAX ; [RBP-1104] holds the variable vdfiljnair_1557
  mov RAX, [RBP-1088]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6819
  mov RAX, [RBP-1088]
  jmp near done_6819
if_false_6819:
  mov RAX, 0xffffffffffffffff
done_6819:
  mov [RBP-1112], RAX ; [RBP-1112] holds the variable if_1574
  mov RAX, [RBP-1112]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6811
  mov RAX, [RBP-1072]
  mov R11, RAX
  mov RAX, [RBP-416]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_6815
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6815
_cmp_fail_6815:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6815:
  jmp near done_6811
if_false_6811:
  mov RAX, -84
  mov R11, RAX
  mov RAX, [RBP-296]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_6812
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6812
_cmp_fail_6812:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6812:
done_6811:
  mov [RBP-1120], RAX ; [RBP-1120] holds the variable nogamilsle_1571
  mov RAX, [RBP-1088]
  mov [RBP-1128], RAX ; [RBP-1128] holds the variable ufimxjthlc_1590
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1136], RAX ; [RBP-1136] holds the variable cawcfgzysj_1594
  mov RAX, -62
  mov [RBP-1144], RAX ; [RBP-1144] holds the variable yywlvmbkzx_1598
  mov RAX, [RBP-1144]
  mov [RBP-1152], RAX ; [RBP-1152] holds the variable slvlxyovcb_1602
  mov RAX, [RBP-560]
  mov [RBP-1160], RAX ; [RBP-1160] holds the variable gsqnrilife_1606
  mov RAX, [RBP-1104]
  mov [RBP-1168], RAX ; [RBP-1168] holds the variable dzfanjzivq_1610
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1176], RAX ; [RBP-1176] holds the variable wwjfeeedya_1586
  mov RAX, [RBP-400]
  mov R11, RAX
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_6801
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6801
_cmp_fail_6801:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6801:
  mov [RBP-1184], RAX ; [RBP-1184] holds the variable ucpdsdtsex_1615
  ;; or_lhs {
  mov RAX, [RBP-1120]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6798
  ;; or_rhs {
  mov RAX, [RBP-1184]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6798
  mov RAX, 0x7fffffffffffffff
or_done_6798:
  mov [RBP-1192], RAX ; [RBP-1192] holds the variable vvuomprzuv_1621
  mov RAX, -134
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1200], RAX ; [RBP-1200] holds the variable bjqsvsjjnh_1627
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6793
  ;; or_rhs {
  mov RAX, [RBP-1176]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6793
  mov RAX, 0x7fffffffffffffff
or_done_6793:
  mov [RBP-1208], RAX ; [RBP-1208] holds the variable fnoxmxzmph_1632
  mov RAX, [RBP-1176]
  mov [RBP-1216], RAX ; [RBP-1216] holds the variable atgwsdydcg_1642
  mov RAX, 70
  mov [RBP-1224], RAX ; [RBP-1224] holds the variable yabxlviiiv_1646
  mov RAX, [RBP-416]
  mov [RBP-1232], RAX ; [RBP-1232] holds the variable zaoargyyvz_1650
  mov RAX, [RBP-1192]
  mov [RBP-1240], RAX ; [RBP-1240] holds the variable aoatzdeptq_1654
  mov RAX, [RBP-1232]
  mov [RBP-1248], RAX ; [RBP-1248] holds the variable jzmnglldka_1658
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1256], RAX ; [RBP-1256] holds the variable mmofzxftke_1638
  mov RAX, [RBP-1088]
  mov [RBP-1264], RAX ; [RBP-1264] holds the variable hfddwgfqot_1667
  mov RAX, [RBP-400]
  mov [RBP-1272], RAX ; [RBP-1272] holds the variable aqrwiisaeg_1671
  mov RAX, [RBP-1256]
  mov [RBP-1280], RAX ; [RBP-1280] holds the variable obsiujslgo_1675
  mov RAX, [RBP-312]
  mov [RBP-1288], RAX ; [RBP-1288] holds the variable hizjwfnvyg_1679
  mov RAX, [RBP-1176]
  mov [RBP-1296], RAX ; [RBP-1296] holds the variable zbhpfmpkbh_1683
  mov RAX, [RBP-1120]
  mov [RBP-1304], RAX ; [RBP-1304] holds the variable xsswasdvit_1687
  mov RAX, [RBP-1184]
  mov [RBP-1312], RAX ; [RBP-1312] holds the variable qpocjkdgku_1691
  mov RAX, [RBP-1192]
  mov [RBP-1320], RAX ; [RBP-1320] holds the variable cofqenysyv_1695
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1328], RAX ; [RBP-1328] holds the variable pgvcpcuiqi_1699
  mov RAX, [RBP-1312]
  mov [RBP-1336], RAX ; [RBP-1336] holds the variable lrewklebdn_1663
  mov RAX, [RBP-840]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-312]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1344], RAX ; [RBP-1344] holds the variable wigpuecvhq_1704
  mov RAX, [RBP-400]
  mov R11, RAX
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_6771
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6771
_cmp_fail_6771:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6771:
  mov [RBP-1352], RAX ; [RBP-1352] holds the variable zkhlukvmeb_1710
  mov RAX, [RBP-400]
  mov R11, RAX
  mov RAX, [RBP-600]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_6768
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6768
_cmp_fail_6768:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6768:
  mov [RBP-1360], RAX ; [RBP-1360] holds the variable binop_1715
  mov RAX, [RBP-1360]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6247
  mov RAX, 158
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 94
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1368], RAX ; [RBP-1368] holds the variable ueomwkblrl_1722
  mov RAX, 188
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1376], RAX ; [RBP-1376] holds the variable gwgyncarbb_1728
  mov RAX, 178
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 192
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1384], RAX ; [RBP-1384] holds the variable zyfspxwnac_1733
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6755
  mov RAX, 0xffffffffffffffff
  jmp near done_6755
if_false_6755:
  mov RAX, 0xffffffffffffffff
done_6755:
  mov [RBP-1392], RAX ; [RBP-1392] holds the variable qducziducr_1739
  mov RAX, [RBP-1392]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6751
  mov RAX, 0xffffffffffffffff
  jmp near done_6751
if_false_6751:
  mov RAX, 0xffffffffffffffff
done_6751:
  mov [RBP-1400], RAX ; [RBP-1400] holds the variable hkayflpjtu_1746
  mov RAX, [RBP-1368]
  mov [RBP-1408], RAX ; [RBP-1408] holds the variable vpeflrropw_1757
  mov RAX, [RBP-1368]
  mov [RBP-1416], RAX ; [RBP-1416] holds the variable yzaghlgzbw_1761
  mov RAX, -188
  mov [RBP-1424], RAX ; [RBP-1424] holds the variable wcgwsxvzzu_1765
  mov RAX, [RBP-1400]
  mov [RBP-1432], RAX ; [RBP-1432] holds the variable jmnylvxgfq_1769
  mov RAX, [RBP-1424]
  mov [RBP-1440], RAX ; [RBP-1440] holds the variable treajoflpc_1773
  mov RAX, [RBP-1392]
  mov [RBP-1448], RAX ; [RBP-1448] holds the variable cgxaynezyp_1777
  mov RAX, [RBP-1440]
  mov [RBP-1456], RAX ; [RBP-1456] holds the variable syyibkvjcs_1781
  mov RAX, [RBP-1456]
  mov [RBP-1464], RAX ; [RBP-1464] holds the variable vnxvblcbjp_1785
  mov RAX, 172
  mov [RBP-1472], RAX ; [RBP-1472] holds the variable tohmfzaprh_1789
  mov RAX, 190
  mov [RBP-1480], RAX ; [RBP-1480] holds the variable bhstmkclwk_1793
  mov RAX, [RBP-1416]
  mov [RBP-1488], RAX ; [RBP-1488] holds the variable lfckixkdwj_1753
  ;; or_lhs {
  mov RAX, [RBP-1392]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6737
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6737
  mov RAX, 0x7fffffffffffffff
or_done_6737:
  mov [RBP-1496], RAX ; [RBP-1496] holds the variable binop_and_or_1797
  mov RAX, [RBP-1496]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6710
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1512], RAX ; [RBP-1512] holds the variable xdeehrhjvs_1803
  mov RAX, -118
  mov [RBP-1520], RAX ; [RBP-1520] holds the variable dpmvsydoyy_1807
  mov RAX, 14
  mov [RBP-1528], RAX ; [RBP-1528] holds the variable stvehwxtlb_1811
  mov RAX, [RBP-1512]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6724
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6728
  mov RAX, 0x7fffffffffffffff
  jmp near done_6728
if_false_6728:
  mov RAX, 0x7fffffffffffffff
done_6728:
  jmp near done_6724
if_false_6724:
  mov RAX, 114
  mov R11, RAX
  mov RAX, 94
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_6725
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6725
_cmp_fail_6725:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6725:
done_6724:
  jmp near done_6710
if_false_6710:
  mov RAX, 24
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 0
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1512], RAX ; [RBP-1512] holds the variable binop_1823
  mov RAX, 60
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1520], RAX ; [RBP-1520] holds the variable unary_1826
  mov RAX, [RBP-1512]
  mov R11, RAX
  mov RAX, [RBP-1520]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_6713
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6713
_cmp_fail_6713:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6713:
done_6710:
  mov [RBP-1504], RAX ; [RBP-1504] holds the variable if_1719
  mov RAX, [RBP-1504]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6641
  mov RAX, 36
  mov [RBP-1512], RAX ; [RBP-1512] holds the variable bynpaglpxm_1835
  mov RAX, [RBP-1512]
  mov [RBP-1520], RAX ; [RBP-1520] holds the variable urkymtdwov_1839
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1528], RAX ; [RBP-1528] holds the variable mzcrawhhwf_1843
  mov RAX, 146
  mov [RBP-1536], RAX ; [RBP-1536] holds the variable shqswuerqq_1847
  mov RAX, 0xffffffffffffffff
  mov [RBP-1544], RAX ; [RBP-1544] holds the variable qnfqdkouzg_1851
  mov RAX, -176
  mov [RBP-1552], RAX ; [RBP-1552] holds the variable iwsyamybkc_1855
  mov RAX, 22
  mov [RBP-1560], RAX ; [RBP-1560] holds the variable uxwgdhneqe_1859
  mov RAX, [RBP-1512]
  mov [RBP-1568], RAX ; [RBP-1568] holds the variable ndsfyauhva_1863
  mov RAX, [RBP-1560]
  mov [RBP-1576], RAX ; [RBP-1576] holds the variable xnvinnxksk_1867
  mov RAX, [RBP-1528]
  mov [RBP-1584], RAX ; [RBP-1584] holds the variable kupjpekaiu_1871
  mov RAX, -72
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -166
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1592], RAX ; [RBP-1592] holds the variable binop_1875
  mov RAX, [RBP-1512]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1592]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1600], RAX ; [RBP-1600] holds the variable sucpnrhpna_1830
  mov RAX, [RBP-1600]
  mov R11, RAX
  mov RAX, [RBP-1600]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_6690
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6690
_cmp_fail_6690:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6690:
  mov [RBP-1608], RAX ; [RBP-1608] holds the variable hikppbpjho_1880
  mov RAX, -34
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -26
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1616], RAX ; [RBP-1616] holds the variable mpoatvjtwi_1886
  mov RAX, [RBP-1608]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6683
  mov RAX, 0x7fffffffffffffff
  jmp near done_6683
if_false_6683:
  mov RAX, 0xffffffffffffffff
done_6683:
  jmp near done_6641
if_false_6641:
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6666
  ;; and_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6666
  mov RAX, 0xffffffffffffffff
and_done_6666:
  mov [RBP-1512], RAX ; [RBP-1512] holds the variable binop_and_or_1897
  mov RAX, [RBP-1512]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6658
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6661
  mov RAX, -108
  jmp near done_6661
if_false_6661:
  mov RAX, 50
done_6661:
  jmp near done_6658
if_false_6658:
  mov RAX, 102
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
done_6658:
  mov [RBP-1520], RAX ; [RBP-1520] holds the variable if_1896
  mov RAX, 188
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1528], RAX ; [RBP-1528] holds the variable unary_1907
  mov RAX, 188
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -156
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1536], RAX ; [RBP-1536] holds the variable binop_1909
  mov RAX, [RBP-1528]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1536]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1544], RAX ; [RBP-1544] holds the variable binop_1906
  mov RAX, [RBP-1520]
  mov R11, RAX
  mov RAX, [RBP-1544]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_6647
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6647
_cmp_fail_6647:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6647:
done_6641:
  jmp near done_6247
if_false_6247:
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6619
  mov RAX, 0xffffffffffffffff
  jmp near done_6619
if_false_6619:
  mov RAX, 0x7fffffffffffffff
done_6619:
  mov [RBP-1376], RAX ; [RBP-1376] holds the variable iwhaiivloj_1916
  mov RAX, 198
  mov [RBP-1384], RAX ; [RBP-1384] holds the variable dvynbkqsli_1924
  mov RAX, [RBP-1376]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6605
  ;; and_rhs {
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6611
  mov RAX, 0x7fffffffffffffff
  jmp near done_6611
if_false_6611:
  mov RAX, 0x7fffffffffffffff
done_6611:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6606
  ;; and_rhs {
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6607
  mov RAX, 0xffffffffffffffff
  jmp near done_6607
if_false_6607:
  mov RAX, 0x7fffffffffffffff
done_6607:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6606
  mov RAX, 0xffffffffffffffff
and_done_6606:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6605
  mov RAX, 0xffffffffffffffff
and_done_6605:
  mov [RBP-1368], RAX ; [RBP-1368] holds the variable binop_and_or_1913
  mov RAX, [RBP-1368]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6249
  mov RAX, 146
  mov R11, RAX
  mov RAX, 192
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_6601
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6601
_cmp_fail_6601:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6601:
  mov [RBP-1376], RAX ; [RBP-1376] holds the variable mdjfkshqoh_1943
  mov RAX, -164
  mov [RBP-1384], RAX ; [RBP-1384] holds the variable lqjdgwhvvx_1953
  mov RAX, -16
  mov [RBP-1392], RAX ; [RBP-1392] holds the variable muazhcurje_1957
  mov RAX, [RBP-1376]
  mov [RBP-1400], RAX ; [RBP-1400] holds the variable djgtnqdkph_1949
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6594
  mov RAX, -174
  jmp near done_6594
if_false_6594:
  mov RAX, -122
done_6594:
  mov [RBP-1408], RAX ; [RBP-1408] holds the variable rihycojpre_1962
  mov RAX, [RBP-1408]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1408]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1416], RAX ; [RBP-1416] holds the variable dmlrikkomn_1969
  mov RAX, [RBP-1416]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -80
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1424], RAX ; [RBP-1424] holds the variable qxjftbxrki_1975
  mov RAX, [RBP-1416]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1416]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1432], RAX ; [RBP-1432] holds the variable thmykxpvfe_1981
  mov RAX, [RBP-1416]
  mov R11, RAX
  mov RAX, [RBP-1424]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_6582
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6582
_cmp_fail_6582:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6582:
  mov [RBP-1440], RAX ; [RBP-1440] holds the variable lbahaytoid_1987
  mov RAX, [RBP-1440]
  mov [RBP-1448], RAX ; [RBP-1448] holds the variable eyvmimqnzn_1994
  mov RAX, [RBP-1416]
  mov [RBP-1456], RAX ; [RBP-1456] holds the variable ksjxwvuiqv_1998
  mov RAX, -172
  mov [RBP-1464], RAX ; [RBP-1464] holds the variable mplrgqnedk_2002
  mov RAX, [RBP-1400]
  mov [RBP-1472], RAX ; [RBP-1472] holds the variable ykfzwxesns_1939
  ;; and_lhs {
  mov RAX, 160
  mov [RBP-1488], RAX ; [RBP-1488] holds the variable vnstupmwza_2012
  mov RAX, [RBP-1472]
  mov [RBP-1496], RAX ; [RBP-1496] holds the variable hqhdcavblu_2016
  mov RAX, 172
  mov [RBP-1504], RAX ; [RBP-1504] holds the variable ovohomlbri_2020
  mov RAX, [RBP-1504]
  mov [RBP-1512], RAX ; [RBP-1512] holds the variable etgkouwbkj_2024
  mov RAX, [RBP-1496]
  mov [RBP-1520], RAX ; [RBP-1520] holds the variable mqlulqolht_2028
  mov RAX, -146
  mov [RBP-1528], RAX ; [RBP-1528] holds the variable renwupwxeq_2032
  mov RAX, [RBP-1512]
  mov [RBP-1536], RAX ; [RBP-1536] holds the variable stdcwvweja_2036
  mov RAX, [RBP-1528]
  mov [RBP-1544], RAX ; [RBP-1544] holds the variable qoqrxajfrr_2040
  mov RAX, [RBP-1544]
  mov [RBP-1552], RAX ; [RBP-1552] holds the variable rhwpngruzy_2044
  mov RAX, 0xffffffffffffffff
  mov [RBP-1560], RAX ; [RBP-1560] holds the variable wfhkpjwbfu_2048
  mov RAX, [RBP-1520]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6553
  ;; and_rhs {
  ;; or_lhs {
  mov RAX, [RBP-1472]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6554
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6554
  mov RAX, 0x7fffffffffffffff
or_done_6554:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6553
  mov RAX, 0xffffffffffffffff
and_done_6553:
  mov [RBP-1480], RAX ; [RBP-1480] holds the variable ubezxpyghz_2007
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6549
  mov RAX, [RBP-1480]
  jmp near done_6549
if_false_6549:
  mov RAX, [RBP-1472]
done_6549:
  mov [RBP-1488], RAX ; [RBP-1488] holds the variable dbfcnfuufh_2060
  mov RAX, 0
  mov R11, RAX
  mov RAX, 46
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_6546
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6546
_cmp_fail_6546:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6546:
  mov [RBP-1496], RAX ; [RBP-1496] holds the variable prlupcfppx_2056
  mov RAX, [RBP-1496]
  mov [RBP-1504], RAX ; [RBP-1504] holds the variable mycusggkwj_2075
  mov RAX, 0xffffffffffffffff
  mov [RBP-1512], RAX ; [RBP-1512] holds the variable mscbsfscda_2079
  mov RAX, -146
  mov [RBP-1520], RAX ; [RBP-1520] holds the variable pgdduegxwo_2083
  mov RAX, 0xffffffffffffffff
  mov [RBP-1528], RAX ; [RBP-1528] holds the variable xpsyganuqy_2087
  mov RAX, -108
  mov [RBP-1536], RAX ; [RBP-1536] holds the variable guvtqkahxl_2091
  mov RAX, [RBP-1480]
  mov [RBP-1544], RAX ; [RBP-1544] holds the variable qkcqydemyf_2095
  mov RAX, [RBP-1504]
  mov [RBP-1552], RAX ; [RBP-1552] holds the variable ckdkawkxjx_2099
  mov RAX, [RBP-1480]
  mov [RBP-1560], RAX ; [RBP-1560] holds the variable nfiascmwbb_2103
  mov RAX, [RBP-1472]
  mov [RBP-1568], RAX ; [RBP-1568] holds the variable yhdqibdzey_2107
  mov RAX, -22
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 98
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1576], RAX ; [RBP-1576] holds the variable binop_2111
  mov RAX, [RBP-1520]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1576]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1584], RAX ; [RBP-1584] holds the variable moxkfmyhrs_2070
  mov RAX, [RBP-1496]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6527
  mov RAX, [RBP-1584]
  jmp near done_6527
if_false_6527:
  mov RAX, [RBP-1584]
done_6527:
  mov [RBP-1592], RAX ; [RBP-1592] holds the variable if_2118
  mov RAX, [RBP-1496]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6523
  mov RAX, [RBP-1584]
  jmp near done_6523
if_false_6523:
  mov RAX, [RBP-1584]
done_6523:
  mov [RBP-1600], RAX ; [RBP-1600] holds the variable if_2122
  mov RAX, [RBP-1592]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1600]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1608], RAX ; [RBP-1608] holds the variable ajmflzhrgg_2115
  ;; or_lhs {
  mov RAX, [RBP-1480]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6517
  ;; or_rhs {
  mov RAX, [RBP-1496]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6517
  mov RAX, 0x7fffffffffffffff
or_done_6517:
  mov [RBP-1616], RAX ; [RBP-1616] holds the variable zbwmulibpd_2131
  mov RAX, -40
  mov R11, RAX
  mov RAX, [RBP-1584]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_6514
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6514
_cmp_fail_6514:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6514:
  mov [RBP-1624], RAX ; [RBP-1624] holds the variable ywgivggkvz_2137
  mov RAX, [RBP-1608]
  mov [RBP-1632], RAX ; [RBP-1632] holds the variable yjlzizrqiz_2147
  mov RAX, [RBP-1616]
  mov [RBP-1640], RAX ; [RBP-1640] holds the variable doabxqdrih_2151
  mov RAX, 0xffffffffffffffff
  mov [RBP-1648], RAX ; [RBP-1648] holds the variable csbkrclkrc_2155
  mov RAX, [RBP-1608]
  mov [RBP-1656], RAX ; [RBP-1656] holds the variable xtjgfzbjuw_2143
  mov RAX, [RBP-1608]
  mov R11, RAX
  mov RAX, [RBP-1584]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_6507
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6507
_cmp_fail_6507:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6507:
  mov [RBP-1664], RAX ; [RBP-1664] holds the variable qxkvxnxvym_2160
  mov RAX, 74
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1584]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1672], RAX ; [RBP-1672] holds the variable fazbsnnygf_2166
  mov RAX, [RBP-1584]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1672]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1680], RAX ; [RBP-1680] holds the variable kbalujaivq_2172
  ;; or_lhs {
  mov RAX, [RBP-1664]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6498
  ;; or_rhs {
  mov RAX, [RBP-1496]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6498
  mov RAX, 0x7fffffffffffffff
or_done_6498:
  mov [RBP-1688], RAX ; [RBP-1688] holds the variable wurkukusls_2178
  mov RAX, -4
  mov [RBP-1696], RAX ; [RBP-1696] holds the variable yurobplzrt_2188
  mov RAX, [RBP-1680]
  mov [RBP-1704], RAX ; [RBP-1704] holds the variable qcwafogtbf_2192
  mov RAX, [RBP-1480]
  mov [RBP-1712], RAX ; [RBP-1712] holds the variable mujlgbbcre_2196
  mov RAX, [RBP-1624]
  mov [RBP-1720], RAX ; [RBP-1720] holds the variable jrpnkxypzr_2200
  mov RAX, [RBP-1480]
  mov [RBP-1728], RAX ; [RBP-1728] holds the variable bhmtkovmtx_2204
  mov RAX, [RBP-1496]
  mov [RBP-1736], RAX ; [RBP-1736] holds the variable kmjqtoqczd_2208
  mov RAX, [RBP-1624]
  mov [RBP-1744], RAX ; [RBP-1744] holds the variable xdrsvghdda_2184
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6487
  mov RAX, [RBP-1672]
  jmp near done_6487
if_false_6487:
  mov RAX, 86
done_6487:
  mov [RBP-1752], RAX ; [RBP-1752] holds the variable ynmjtmoyqb_2127
  mov RAX, [RBP-1496]
  mov [RBP-1760], RAX ; [RBP-1760] holds the variable ngbpqscpqp_2222
  mov RAX, [RBP-1472]
  mov [RBP-1768], RAX ; [RBP-1768] holds the variable dgatauoghd_2226
  mov RAX, [RBP-1496]
  mov [RBP-1776], RAX ; [RBP-1776] holds the variable taqhkpvzke_2230
  mov RAX, [RBP-1584]
  mov [RBP-1784], RAX ; [RBP-1784] holds the variable ltejwopguu_2234
  mov RAX, [RBP-1776]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6474
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6478
  mov RAX, [RBP-1496]
  jmp near done_6478
if_false_6478:
  mov RAX, [RBP-1496]
done_6478:
  jmp near done_6474
if_false_6474:
  mov RAX, 40
  mov R11, RAX
  mov RAX, [RBP-1752]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_6475
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6475
_cmp_fail_6475:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6475:
done_6474:
  mov [RBP-1792], RAX ; [RBP-1792] holds the variable unjsyyvyco_2217
  ;; or_lhs {
  ;; and_lhs {
  mov RAX, [RBP-1792]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6471
  ;; and_rhs {
  mov RAX, [RBP-1792]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6471
  mov RAX, 0xffffffffffffffff
and_done_6471:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6466
  ;; or_rhs {
  mov RAX, [RBP-1496]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6467
  mov RAX, [RBP-1496]
  jmp near done_6467
if_false_6467:
  mov RAX, [RBP-1792]
done_6467:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6466
  mov RAX, 0x7fffffffffffffff
or_done_6466:
  mov [RBP-1800], RAX ; [RBP-1800] holds the variable lnrijpxjkk_2246
  mov RAX, [RBP-1752]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1752]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1808], RAX ; [RBP-1808] holds the variable binop_2260
  mov RAX, [RBP-1584]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1816], RAX ; [RBP-1816] holds the variable unary_2263
  mov RAX, [RBP-1808]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1816]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1824], RAX ; [RBP-1824] holds the variable fqpgginvpf_2257
  mov RAX, [RBP-1584]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 144
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1832], RAX ; [RBP-1832] holds the variable binop_2269
  mov RAX, [RBP-1824]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -166
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1840], RAX ; [RBP-1840] holds the variable binop_2272
  mov RAX, [RBP-1832]
  mov R11, RAX
  mov RAX, [RBP-1840]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_6449
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6449
_cmp_fail_6449:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6449:
  mov [RBP-1848], RAX ; [RBP-1848] holds the variable qzavpbqbab_2266
  mov RAX, [RBP-1472]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6445
  mov RAX, 0x7fffffffffffffff
  jmp near done_6445
if_false_6445:
  mov RAX, [RBP-1480]
done_6445:
  mov [RBP-1856], RAX ; [RBP-1856] holds the variable if_2276
  mov RAX, [RBP-1856]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6421
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6441
  ;; or_rhs {
  mov RAX, [RBP-1848]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6441
  mov RAX, 0x7fffffffffffffff
or_done_6441:
  jmp near done_6421
if_false_6421:
  mov RAX, [RBP-1752]
  mov [RBP-1864], RAX ; [RBP-1864] holds the variable djphyxdsrc_2285
  mov RAX, [RBP-1752]
  mov [RBP-1872], RAX ; [RBP-1872] holds the variable lqevfucvxc_2289
  mov RAX, [RBP-1792]
  mov [RBP-1880], RAX ; [RBP-1880] holds the variable valqzbivup_2293
  mov RAX, [RBP-1480]
  mov [RBP-1888], RAX ; [RBP-1888] holds the variable qchogreiuw_2297
  mov RAX, [RBP-1848]
  mov [RBP-1896], RAX ; [RBP-1896] holds the variable eorfdjiezh_2301
  mov RAX, 36
  mov [RBP-1904], RAX ; [RBP-1904] holds the variable xzlsdffdtz_2305
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1912], RAX ; [RBP-1912] holds the variable ojsjcxhicm_2309
  mov RAX, [RBP-1904]
  mov [RBP-1920], RAX ; [RBP-1920] holds the variable azoxkkmfoc_2313
  mov RAX, [RBP-1896]
  mov [RBP-1928], RAX ; [RBP-1928] holds the variable vloatlnuyj_2317
  mov RAX, [RBP-1848]
done_6421:
  jmp near done_6249
if_false_6249:
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6356
  mov RAX, 0x7fffffffffffffff
  jmp near done_6356
if_false_6356:
  mov RAX, 0xffffffffffffffff
done_6356:
  mov [RBP-1376], RAX ; [RBP-1376] holds the variable if_2323
  mov RAX, [RBP-1376]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6346
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6351
  mov RAX, 0x7fffffffffffffff
  jmp near done_6351
if_false_6351:
  mov RAX, 0x7fffffffffffffff
done_6351:
  jmp near done_6346
if_false_6346:
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6347
  mov RAX, 0x7fffffffffffffff
  jmp near done_6347
if_false_6347:
  mov RAX, 0xffffffffffffffff
done_6347:
done_6346:
  mov [RBP-1384], RAX ; [RBP-1384] holds the variable if_2322
  mov RAX, [RBP-1384]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6252
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1392], RAX ; [RBP-1392] holds the variable dnihhykmax_2341
  mov RAX, [RBP-1392]
  mov [RBP-1400], RAX ; [RBP-1400] holds the variable mcmavtqnjy_2345
  mov RAX, 88
  mov [RBP-1408], RAX ; [RBP-1408] holds the variable mnynbsrmaz_2349
  mov RAX, [RBP-1408]
  mov [RBP-1416], RAX ; [RBP-1416] holds the variable yeuyndtbum_2353
  mov RAX, [RBP-1400]
  mov [RBP-1424], RAX ; [RBP-1424] holds the variable gzsodemmma_2357
  mov RAX, [RBP-1392]
  mov [RBP-1432], RAX ; [RBP-1432] holds the variable wrtwytynky_2361
  mov RAX, [RBP-1408]
  mov [RBP-1440], RAX ; [RBP-1440] holds the variable ffrvuarlfu_2365
  mov RAX, [RBP-1440]
  mov [RBP-1448], RAX ; [RBP-1448] holds the variable ogiqljtlhz_2337
  mov RAX, [RBP-1448]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1448]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1456], RAX ; [RBP-1456] holds the variable vvdghuwzwv_2370
  mov RAX, 0xffffffffffffffff
  mov [RBP-1464], RAX ; [RBP-1464] holds the variable mqplwwpsif_2380
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1472], RAX ; [RBP-1472] holds the variable qzugosbthe_2384
  mov RAX, [RBP-1464]
  mov [RBP-1480], RAX ; [RBP-1480] holds the variable ldzeaclrzt_2388
  mov RAX, 44
  mov [RBP-1488], RAX ; [RBP-1488] holds the variable umojewsmzi_2392
  mov RAX, [RBP-1464]
  mov [RBP-1496], RAX ; [RBP-1496] holds the variable rqstzvbybi_2376
  ;; and_lhs {
  mov RAX, [RBP-1496]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6326
  ;; and_rhs {
  mov RAX, [RBP-1496]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6326
  mov RAX, 0xffffffffffffffff
and_done_6326:
  mov [RBP-1504], RAX ; [RBP-1504] holds the variable evnhzzpnmb_2397
  ;; and_lhs {
  mov RAX, [RBP-1504]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6323
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6323
  mov RAX, 0xffffffffffffffff
and_done_6323:
  mov [RBP-1512], RAX ; [RBP-1512] holds the variable eeuwtujcwm_2403
  mov RAX, [RBP-1448]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1520], RAX ; [RBP-1520] holds the variable pboypgwhlx_2409
  mov RAX, [RBP-1448]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1528], RAX ; [RBP-1528] holds the variable gobjahmvrz_2414
  mov RAX, 0xffffffffffffffff
  mov [RBP-1536], RAX ; [RBP-1536] holds the variable jgwqpflqhl_2420
  mov RAX, [RBP-1448]
  mov [RBP-1544], RAX ; [RBP-1544] holds the variable iygguyyebs_2424
  mov RAX, [RBP-1456]
  mov [RBP-1552], RAX ; [RBP-1552] holds the variable syxumjknmg_2428
  mov RAX, [RBP-1528]
  mov [RBP-1560], RAX ; [RBP-1560] holds the variable pbcnwcmdkb_2432
  mov RAX, [RBP-1528]
  mov [RBP-1568], RAX ; [RBP-1568] holds the variable oowfunxtgv_2436
  mov RAX, [RBP-1456]
  mov [RBP-1576], RAX ; [RBP-1576] holds the variable oqiqjeegzb_2440
  mov RAX, [RBP-1576]
  mov [RBP-1584], RAX ; [RBP-1584] holds the variable flhowxvhom_2444
  mov RAX, [RBP-1528]
  mov [RBP-1592], RAX ; [RBP-1592] holds the variable yevedzogmi_2448
  mov RAX, [RBP-1448]
  mov [RBP-1600], RAX ; [RBP-1600] holds the variable hkeniamvuk_2452
  mov RAX, 0xffffffffffffffff
  jmp near done_6252
if_false_6252:
  mov RAX, 34
  mov [RBP-1392], RAX ; [RBP-1392] holds the variable skqjxdeewn_2459
  mov RAX, 0xffffffffffffffff
  mov [RBP-1400], RAX ; [RBP-1400] holds the variable ssmndmngek_2463
  mov RAX, 180
  mov [RBP-1408], RAX ; [RBP-1408] holds the variable gotpaebrak_2467
  mov RAX, [RBP-1408]
  mov [RBP-1416], RAX ; [RBP-1416] holds the variable wibxhneroc_2471
  mov RAX, [RBP-1408]
  mov [RBP-1424], RAX ; [RBP-1424] holds the variable tyignniyjn_2475
  mov RAX, -182
  mov [RBP-1432], RAX ; [RBP-1432] holds the variable irzcxixqyn_2479
  mov RAX, [RBP-1424]
  mov [RBP-1440], RAX ; [RBP-1440] holds the variable vkacaaganw_2483
  mov RAX, [RBP-1400]
  mov [RBP-1448], RAX ; [RBP-1448] holds the variable smdybznyxm_2487
  mov RAX, 0xffffffffffffffff
  mov [RBP-1456], RAX ; [RBP-1456] holds the variable mxavybvqqn_2491
  mov RAX, [RBP-1400]
  mov [RBP-1464], RAX ; [RBP-1464] holds the variable isjzpxjliz_2495
  mov RAX, [RBP-1456]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6263
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6267
  mov RAX, 0xffffffffffffffff
  jmp near done_6267
if_false_6267:
  mov RAX, 0x7fffffffffffffff
done_6267:
  jmp near done_6263
if_false_6263:
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6264
  ;; and_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6264
  mov RAX, 0xffffffffffffffff
and_done_6264:
done_6263:
done_6252:
done_6249:
done_6247:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6082
  mov RAX, 0xffffffffffffffff
and_done_6082:
  mov [RBP-48], RAX ; [RBP-48] holds the variable binop_and_or_53
  mov RAX, [RBP-48]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4073
  mov RAX, -78
  mov [RBP-56], RAX ; [RBP-56] holds the variable pjnpzywudn_2519
  mov RAX, [RBP-56]
  mov [RBP-64], RAX ; [RBP-64] holds the variable yeualqlyem_2523
  mov RAX, 0x7fffffffffffffff
  mov [RBP-72], RAX ; [RBP-72] holds the variable ujizideuum_2527
  mov RAX, [RBP-72]
  mov [RBP-80], RAX ; [RBP-80] holds the variable wyqpbvhygs_2531
  mov RAX, [RBP-80]
  mov [RBP-88], RAX ; [RBP-88] holds the variable cpukoktyxu_2535
  mov RAX, 70
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -96
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-96], RAX ; [RBP-96] holds the variable binop_2539
  mov RAX, -60
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-96]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-104], RAX ; [RBP-104] holds the variable binop_2516
  mov RAX, [RBP-104]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-112], RAX ; [RBP-112] holds the variable ooptextcrx_2513
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6065
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6065
  mov RAX, 0x7fffffffffffffff
or_done_6065:
  mov [RBP-120], RAX ; [RBP-120] holds the variable binop_and_or_2547
  mov RAX, [RBP-120]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6057
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6061
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6061
  mov RAX, 0xffffffffffffffff
and_done_6061:
  jmp near done_6057
if_false_6057:
  mov RAX, [RBP-112]
  mov R11, RAX
  mov RAX, -90
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_6058
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_6058
_cmp_fail_6058:
  mov RAX, 0x7fffffffffffffff
_cmp_done_6058:
done_6057:
  mov [RBP-128], RAX ; [RBP-128] holds the variable if_2546
  mov RAX, [RBP-128]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5939
  mov RAX, [RBP-112]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-112]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-144], RAX ; [RBP-144] holds the variable gbpozilaoj_2558
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6049
  mov RAX, 0xffffffffffffffff
  jmp near done_6049
if_false_6049:
  mov RAX, 0x7fffffffffffffff
done_6049:
  mov [RBP-152], RAX ; [RBP-152] holds the variable iqrktrobpo_2564
  mov RAX, [RBP-112]
  mov [RBP-160], RAX ; [RBP-160] holds the variable wabvofqcxc_2575
  mov RAX, [RBP-152]
  mov [RBP-168], RAX ; [RBP-168] holds the variable pyysmzcmkc_2579
  mov RAX, 0xffffffffffffffff
  mov [RBP-176], RAX ; [RBP-176] holds the variable oucwcikdjo_2583
  mov RAX, [RBP-152]
  mov [RBP-184], RAX ; [RBP-184] holds the variable aivjkbtvfk_2587
  mov RAX, [RBP-168]
  mov [RBP-192], RAX ; [RBP-192] holds the variable kklytoaxzb_2591
  mov RAX, [RBP-176]
  mov [RBP-200], RAX ; [RBP-200] holds the variable veeubxughc_2595
  mov RAX, [RBP-160]
  mov [RBP-208], RAX ; [RBP-208] holds the variable rvmpmwxkld_2599
  mov RAX, 0xffffffffffffffff
  mov [RBP-216], RAX ; [RBP-216] holds the variable cgnlgsejre_2603
  mov RAX, [RBP-160]
  mov [RBP-224], RAX ; [RBP-224] holds the variable lzluiidtul_2571
  ;; or_lhs {
  mov RAX, [RBP-152]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6037
  ;; or_rhs {
  mov RAX, [RBP-152]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_6037
  mov RAX, 0x7fffffffffffffff
or_done_6037:
  mov [RBP-232], RAX ; [RBP-232] holds the variable pvhlbgvttt_2608
  mov RAX, 172
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-240], RAX ; [RBP-240] holds the variable svrjkjhqdo_2614
  mov RAX, [RBP-112]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-224]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-248], RAX ; [RBP-248] holds the variable venbeqiujz_2619
  mov RAX, -136
  mov [RBP-256], RAX ; [RBP-256] holds the variable lcjpjleaxj_2629
  mov RAX, [RBP-232]
  mov [RBP-264], RAX ; [RBP-264] holds the variable kbtgtoewsx_2633
  mov RAX, [RBP-152]
  mov [RBP-272], RAX ; [RBP-272] holds the variable hsiihrksmi_2625
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6025
  mov RAX, [RBP-224]
  jmp near done_6025
if_false_6025:
  mov RAX, [RBP-224]
done_6025:
  jmp near done_5939
if_false_5939:
  mov RAX, [RBP-112]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-144], RAX ; [RBP-144] holds the variable cohqnfeado_2643
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_6002
  mov RAX, 0x7fffffffffffffff
  jmp near done_6002
if_false_6002:
  mov RAX, 0x7fffffffffffffff
done_6002:
  mov [RBP-152], RAX ; [RBP-152] holds the variable nzpocfmepe_2648
  mov RAX, [RBP-112]
  mov [RBP-160], RAX ; [RBP-160] holds the variable fmkuaogtvh_2659
  mov RAX, [RBP-152]
  mov [RBP-168], RAX ; [RBP-168] holds the variable qkiflaflrn_2663
  mov RAX, [RBP-112]
  mov [RBP-176], RAX ; [RBP-176] holds the variable jsbudyycws_2667
  mov RAX, [RBP-160]
  mov [RBP-184], RAX ; [RBP-184] holds the variable oqtjqyhszh_2671
  mov RAX, [RBP-168]
  mov [RBP-192], RAX ; [RBP-192] holds the variable avzrdgreye_2675
  mov RAX, [RBP-168]
  mov [RBP-200], RAX ; [RBP-200] holds the variable bpadcxnlrh_2679
  mov RAX, 0xffffffffffffffff
  mov [RBP-208], RAX ; [RBP-208] holds the variable uylnmhedni_2683
  mov RAX, [RBP-176]
  mov [RBP-216], RAX ; [RBP-216] holds the variable jjqjrebptc_2687
  mov RAX, [RBP-192]
  mov [RBP-224], RAX ; [RBP-224] holds the variable vykmnlhyxv_2655
  mov RAX, [RBP-224]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5989
  mov RAX, 0x7fffffffffffffff
  jmp near done_5989
if_false_5989:
  mov RAX, [RBP-224]
done_5989:
  mov [RBP-232], RAX ; [RBP-232] holds the variable swjukiybwg_2692
  mov RAX, [RBP-152]
  mov [RBP-240], RAX ; [RBP-240] holds the variable iowjdkdcog_2703
  mov RAX, [RBP-112]
  mov [RBP-248], RAX ; [RBP-248] holds the variable bfnubwrbcc_2707
  mov RAX, -146
  mov [RBP-256], RAX ; [RBP-256] holds the variable ygrlhwymnx_2711
  mov RAX, 0x7fffffffffffffff
  mov [RBP-264], RAX ; [RBP-264] holds the variable kkemovswth_2699
  ;; or_lhs {
  mov RAX, [RBP-264]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5982
  ;; or_rhs {
  mov RAX, [RBP-232]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5982
  mov RAX, 0x7fffffffffffffff
or_done_5982:
  mov [RBP-272], RAX ; [RBP-272] holds the variable azycdqpdss_2716
  mov RAX, [RBP-112]
  mov R11, RAX
  mov RAX, [RBP-112]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_5979
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5979
_cmp_fail_5979:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5979:
  mov [RBP-280], RAX ; [RBP-280] holds the variable ukrewjbhsa_2722
  mov RAX, [RBP-112]
  mov R11, RAX
  mov RAX, [RBP-144]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_5976
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5976
_cmp_fail_5976:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5976:
  mov [RBP-288], RAX ; [RBP-288] holds the variable jttklewpmx_2728
  mov RAX, [RBP-144]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-296], RAX ; [RBP-296] holds the variable zefxbsthza_2734
  mov RAX, 164
  mov [RBP-304], RAX ; [RBP-304] holds the variable jdrssstlov_2743
  mov RAX, [RBP-288]
  mov [RBP-312], RAX ; [RBP-312] holds the variable zndbbsutly_2747
  mov RAX, [RBP-272]
  mov [RBP-320], RAX ; [RBP-320] holds the variable haxppmnkvl_2751
  mov RAX, 0x7fffffffffffffff
  mov [RBP-328], RAX ; [RBP-328] holds the variable ovqizgkzne_2755
  mov RAX, [RBP-152]
  mov [RBP-336], RAX ; [RBP-336] holds the variable uyvkwyogae_2759
  mov RAX, [RBP-312]
  mov [RBP-344], RAX ; [RBP-344] holds the variable akiikpydnr_2739
  mov RAX, [RBP-112]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
done_5939:
  mov [RBP-136], RAX ; [RBP-136] holds the variable vsobzoknfg_2543
  mov RAX, [RBP-136]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-144], RAX ; [RBP-144] holds the variable unary_2770
  mov RAX, [RBP-112]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-152], RAX ; [RBP-152] holds the variable unary_2772
  mov RAX, [RBP-144]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-152]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-160], RAX ; [RBP-160] holds the variable binop_2769
  mov RAX, [RBP-112]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 18
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-168], RAX ; [RBP-168] holds the variable binop_2775
  mov RAX, [RBP-168]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-176], RAX ; [RBP-176] holds the variable unary_2774
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-176]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-184], RAX ; [RBP-184] holds the variable gpkvuxsbte_2766
  mov RAX, [RBP-112]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-136]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-192], RAX ; [RBP-192] holds the variable binop_2783
  mov RAX, [RBP-192]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-200], RAX ; [RBP-200] holds the variable unary_2782
  mov RAX, [RBP-136]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-184]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-208], RAX ; [RBP-208] holds the variable binop_2787
  mov RAX, -196
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-112]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-216], RAX ; [RBP-216] holds the variable binop_2790
  mov RAX, [RBP-208]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-216]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-224], RAX ; [RBP-224] holds the variable binop_2786
  mov RAX, [RBP-200]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-224]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-232], RAX ; [RBP-232] holds the variable iephizrgpm_2779
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5903
  mov RAX, 0xffffffffffffffff
  jmp near done_5903
if_false_5903:
  mov RAX, 0xffffffffffffffff
done_5903:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5897
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  mov [RBP-248], RAX ; [RBP-248] holds the variable nognriljbx_2804
  mov RAX, [RBP-248]
  mov [RBP-256], RAX ; [RBP-256] holds the variable jrxmealesf_2808
  mov RAX, [RBP-256]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5897
  mov RAX, 0xffffffffffffffff
and_done_5897:
  mov [RBP-240], RAX ; [RBP-240] holds the variable binop_and_or_2797
  mov RAX, [RBP-240]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5821
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5893
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5893
  mov RAX, 0x7fffffffffffffff
or_done_5893:
  mov [RBP-256], RAX ; [RBP-256] holds the variable vjqfahbryz_2814
  mov RAX, 46
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-264], RAX ; [RBP-264] holds the variable zilitsozbl_2820
  mov RAX, [RBP-112]
  mov [RBP-272], RAX ; [RBP-272] holds the variable iejpihluvy_2829
  mov RAX, [RBP-112]
  mov [RBP-280], RAX ; [RBP-280] holds the variable tigcxkqgil_2833
  mov RAX, 0xffffffffffffffff
  mov [RBP-288], RAX ; [RBP-288] holds the variable dqneulgvul_2825
  ;; or_lhs {
  mov RAX, [RBP-256]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5885
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5885
  mov RAX, 0x7fffffffffffffff
or_done_5885:
  mov [RBP-296], RAX ; [RBP-296] holds the variable tgoitrcugw_2838
  mov RAX, [RBP-112]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-304], RAX ; [RBP-304] holds the variable wwktveqrbu_2844
  mov RAX, [RBP-232]
  mov [RBP-312], RAX ; [RBP-312] holds the variable mkiademvki_2853
  mov RAX, [RBP-184]
  mov [RBP-320], RAX ; [RBP-320] holds the variable wknxlainak_2857
  mov RAX, 0x7fffffffffffffff
  mov [RBP-328], RAX ; [RBP-328] holds the variable mskhhvpsjc_2861
  mov RAX, [RBP-320]
  mov [RBP-336], RAX ; [RBP-336] holds the variable jvwvskdmbs_2865
  mov RAX, [RBP-296]
  mov [RBP-344], RAX ; [RBP-344] holds the variable lwcduymroi_2869
  mov RAX, [RBP-344]
  mov [RBP-352], RAX ; [RBP-352] holds the variable itzgcohkwj_2873
  mov RAX, [RBP-296]
  mov [RBP-360], RAX ; [RBP-360] holds the variable ipivonmlyh_2877
  mov RAX, [RBP-264]
  mov [RBP-368], RAX ; [RBP-368] holds the variable qcyybajdqv_2881
  mov RAX, [RBP-320]
  mov [RBP-376], RAX ; [RBP-376] holds the variable iapzoxxhho_2849
  ;; and_lhs {
  mov RAX, [RBP-296]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5871
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5871
  mov RAX, 0xffffffffffffffff
and_done_5871:
  mov [RBP-384], RAX ; [RBP-384] holds the variable qhfpodsblm_2886
  mov RAX, -62
  mov R11, RAX
  mov RAX, [RBP-184]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_5868
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5868
_cmp_fail_5868:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5868:
  mov [RBP-392], RAX ; [RBP-392] holds the variable dfbbwwwuln_2892
  ;; or_lhs {
  mov RAX, [RBP-384]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5865
  ;; or_rhs {
  mov RAX, [RBP-256]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5865
  mov RAX, 0x7fffffffffffffff
or_done_5865:
  mov [RBP-400], RAX ; [RBP-400] holds the variable meobfibkua_2898
  mov RAX, [RBP-264]
  mov [RBP-408], RAX ; [RBP-408] holds the variable ethuzbagvu_2905
  mov RAX, [RBP-384]
  mov [RBP-416], RAX ; [RBP-416] holds the variable njncdautkt_2909
  mov RAX, -80
  mov [RBP-424], RAX ; [RBP-424] holds the variable sokpfmpona_2913
  mov RAX, [RBP-408]
  mov [RBP-432], RAX ; [RBP-432] holds the variable retcvcreea_2917
  mov RAX, [RBP-112]
  mov [RBP-440], RAX ; [RBP-440] holds the variable blnlbmnery_2921
  mov RAX, [RBP-288]
  jmp near done_5821
if_false_5821:
  mov RAX, [RBP-112]
  mov R11, RAX
  mov RAX, [RBP-232]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_5832
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5832
_cmp_fail_5832:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5832:
  mov [RBP-256], RAX ; [RBP-256] holds the variable binop_2926
  mov RAX, [RBP-256]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5823
  mov RAX, [RBP-112]
  mov R11, RAX
  mov RAX, [RBP-112]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_5828
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5828
_cmp_fail_5828:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5828:
  jmp near done_5823
if_false_5823:
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5824
  mov RAX, 0x7fffffffffffffff
  jmp near done_5824
if_false_5824:
  mov RAX, 0x7fffffffffffffff
done_5824:
done_5823:
done_5821:
  mov [RBP-248], RAX ; [RBP-248] holds the variable jgkkrdclpd_2794
  mov RAX, [RBP-248]
  mov [RBP-256], RAX ; [RBP-256] holds the variable qsvrrbdikq_2943
  mov RAX, [RBP-184]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-264], RAX ; [RBP-264] holds the variable unary_2947
  mov RAX, [RBP-136]
  mov R11, RAX
  mov RAX, [RBP-264]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_5815
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5815
_cmp_fail_5815:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5815:
  mov [RBP-272], RAX ; [RBP-272] holds the variable binop_2940
  mov RAX, [RBP-272]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5788
  mov RAX, 198
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-112]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-288], RAX ; [RBP-288] holds the variable binop_2950
  mov RAX, [RBP-248]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5807
  mov RAX, [RBP-232]
  jmp near done_5807
if_false_5807:
  mov RAX, [RBP-184]
done_5807:
  mov [RBP-296], RAX ; [RBP-296] holds the variable if_2953
  mov RAX, [RBP-288]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-296]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_5788
if_false_5788:
  mov RAX, [RBP-248]
  mov [RBP-288], RAX ; [RBP-288] holds the variable vyhabmipli_2960
  mov RAX, [RBP-248]
  mov [RBP-296], RAX ; [RBP-296] holds the variable iyyegxttzh_2964
  mov RAX, [RBP-248]
  mov [RBP-304], RAX ; [RBP-304] holds the variable ghuusgqubm_2968
  mov RAX, [RBP-248]
  mov [RBP-312], RAX ; [RBP-312] holds the variable zsdqwzxnpl_2972
  mov RAX, [RBP-248]
  mov [RBP-320], RAX ; [RBP-320] holds the variable rsacalzycf_2978
  mov RAX, 26
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 52
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
done_5788:
  mov [RBP-280], RAX ; [RBP-280] holds the variable wvdmxdpfba_2937
  ;; and_lhs {
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5785
  ;; or_rhs {
  mov RAX, [RBP-248]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5785
  mov RAX, 0x7fffffffffffffff
or_done_5785:
  mov [RBP-296], RAX ; [RBP-296] holds the variable binop_and_or_2987
  mov RAX, [RBP-296]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5775
  mov RAX, [RBP-248]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5780
  mov RAX, [RBP-248]
  jmp near done_5780
if_false_5780:
  mov RAX, 0x7fffffffffffffff
done_5780:
  jmp near done_5775
if_false_5775:
  mov RAX, [RBP-248]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5776
  mov RAX, [RBP-248]
  jmp near done_5776
if_false_5776:
  mov RAX, 0xffffffffffffffff
done_5776:
done_5775:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5756
  ;; and_rhs {
  mov RAX, -92
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-136]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-296], RAX ; [RBP-296] holds the variable binop_2999
  mov RAX, -150
  mov [RBP-304], RAX ; [RBP-304] holds the variable vynqeyokuq_3004
  mov RAX, [RBP-248]
  mov [RBP-312], RAX ; [RBP-312] holds the variable gysndkhqem_3008
  mov RAX, [RBP-136]
  mov [RBP-320], RAX ; [RBP-320] holds the variable nyueiuxvyc_3012
  mov RAX, [RBP-112]
  mov [RBP-328], RAX ; [RBP-328] holds the variable dxgdocsasz_3016
  mov RAX, [RBP-248]
  mov [RBP-336], RAX ; [RBP-336] holds the variable voqauwnsew_3020
  mov RAX, [RBP-296]
  mov R11, RAX
  mov RAX, [RBP-280]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_5763
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5763
_cmp_fail_5763:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5763:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5756
  mov RAX, 0xffffffffffffffff
and_done_5756:
  mov [RBP-288], RAX ; [RBP-288] holds the variable dkbuvutzkc_2983
  mov RAX, [RBP-280]
  mov R11, RAX
  mov RAX, [RBP-280]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_5753
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5753
_cmp_fail_5753:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5753:
  mov [RBP-296], RAX ; [RBP-296] holds the variable qowxqsnucc_3027
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5750
  ;; and_rhs {
  mov RAX, [RBP-248]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5750
  mov RAX, 0xffffffffffffffff
and_done_5750:
  mov [RBP-304], RAX ; [RBP-304] holds the variable slxfxnswuy_3033
  mov RAX, -118
  mov R11, RAX
  mov RAX, [RBP-280]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_5747
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5747
_cmp_fail_5747:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5747:
  mov [RBP-312], RAX ; [RBP-312] holds the variable gycwajltsz_3039
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5744
  ;; and_rhs {
  mov RAX, [RBP-296]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5744
  mov RAX, 0xffffffffffffffff
and_done_5744:
  mov [RBP-320], RAX ; [RBP-320] holds the variable binop_and_or_3044
  mov RAX, [RBP-320]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5705
  mov RAX, 198
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-280]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-336], RAX ; [RBP-336] holds the variable binop_3048
  mov RAX, [RBP-280]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-344], RAX ; [RBP-344] holds the variable unary_3051
  mov RAX, [RBP-336]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-344]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_5705
if_false_5705:
  mov RAX, [RBP-184]
  mov [RBP-336], RAX ; [RBP-336] holds the variable pmtutfphoy_3056
  mov RAX, [RBP-248]
  mov [RBP-344], RAX ; [RBP-344] holds the variable mxoueulsfw_3060
  mov RAX, [RBP-112]
  mov [RBP-352], RAX ; [RBP-352] holds the variable ouyfcarjcw_3064
  mov RAX, [RBP-344]
  mov [RBP-360], RAX ; [RBP-360] holds the variable dysqechbjk_3068
  mov RAX, [RBP-336]
  mov [RBP-368], RAX ; [RBP-368] holds the variable xhbnjrvvps_3072
  mov RAX, [RBP-352]
  mov [RBP-376], RAX ; [RBP-376] holds the variable anpxvcxwoh_3076
  mov RAX, [RBP-280]
  mov [RBP-384], RAX ; [RBP-384] holds the variable nbjxzrmxsc_3080
  mov RAX, [RBP-112]
  mov [RBP-392], RAX ; [RBP-392] holds the variable veewkqoler_3084
  mov RAX, [RBP-232]
  mov [RBP-400], RAX ; [RBP-400] holds the variable xibfsuijlj_3088
  mov RAX, -92
  mov [RBP-408], RAX ; [RBP-408] holds the variable mumywllsyc_3092
  mov RAX, [RBP-112]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-280]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-416], RAX ; [RBP-416] holds the variable binop_3096
  mov RAX, [RBP-368]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-416]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
done_5705:
  mov [RBP-328], RAX ; [RBP-328] holds the variable if_3024
  mov RAX, -118
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-336], RAX ; [RBP-336] holds the variable unary_3102
  mov RAX, [RBP-336]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-344], RAX ; [RBP-344] holds the variable unary_3101
  mov RAX, 122
  mov [RBP-352], RAX ; [RBP-352] holds the variable vctvftgrup_3110
  mov RAX, -144
  mov [RBP-360], RAX ; [RBP-360] holds the variable hpvokwqhil_3114
  mov RAX, 0x7fffffffffffffff
  mov [RBP-368], RAX ; [RBP-368] holds the variable ipawezyfkd_3106
  mov RAX, 86
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 34
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-376], RAX ; [RBP-376] holds the variable iwadxpnttn_3119
  mov RAX, [RBP-376]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -98
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-384], RAX ; [RBP-384] holds the variable nhfdxfhlhu_3125
  mov RAX, [RBP-376]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-376]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-392], RAX ; [RBP-392] holds the variable binop_3130
  mov RAX, [RBP-344]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-392]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-400], RAX ; [RBP-400] holds the variable binop_3100
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5682
  mov RAX, -64
  jmp near done_5682
if_false_5682:
  mov RAX, 114
done_5682:
  mov [RBP-408], RAX ; [RBP-408] holds the variable if_3135
  mov RAX, 58
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-416], RAX ; [RBP-416] holds the variable unary_3139
  mov RAX, [RBP-408]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-416]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-424], RAX ; [RBP-424] holds the variable binop_3134
  mov RAX, -80
  mov [RBP-432], RAX ; [RBP-432] holds the variable psvkwlqfbm_3144
  mov RAX, 0xffffffffffffffff
  mov [RBP-440], RAX ; [RBP-440] holds the variable ivakhpprdv_3148
  mov RAX, 0xffffffffffffffff
  mov [RBP-448], RAX ; [RBP-448] holds the variable pbgavisrmc_3152
  mov RAX, [RBP-432]
  mov [RBP-456], RAX ; [RBP-456] holds the variable fnnbxrfgcd_3156
  mov RAX, [RBP-456]
  mov [RBP-464], RAX ; [RBP-464] holds the variable jymdhtbzyr_3160
  mov RAX, [RBP-456]
  mov [RBP-472], RAX ; [RBP-472] holds the variable slefyvfobm_3164
  mov RAX, 72
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-480], RAX ; [RBP-480] holds the variable unary_3141
  mov RAX, [RBP-424]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-480]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-488], RAX ; [RBP-488] holds the variable binop_3133
  mov RAX, [RBP-400]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-488]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-496], RAX ; [RBP-496] holds the variable binop_3099
  mov RAX, [RBP-328]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-496]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-504], RAX ; [RBP-504] holds the variable liyqoljigf_2508
  ;; and_lhs {
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5657
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5657
  mov RAX, 0x7fffffffffffffff
or_done_5657:
  mov [RBP-520], RAX ; [RBP-520] holds the variable tjoycmkyyu_3173
  mov RAX, [RBP-520]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5653
  mov RAX, [RBP-520]
  jmp near done_5653
if_false_5653:
  mov RAX, [RBP-520]
done_5653:
  mov [RBP-528], RAX ; [RBP-528] holds the variable if_3178
  mov RAX, [RBP-528]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5609
  mov RAX, 0xffffffffffffffff
  mov [RBP-536], RAX ; [RBP-536] holds the variable qlualbsicy_3185
  mov RAX, [RBP-536]
  mov [RBP-544], RAX ; [RBP-544] holds the variable cqadiaifew_3189
  mov RAX, [RBP-544]
  mov [RBP-552], RAX ; [RBP-552] holds the variable easrqlnzwq_3193
  mov RAX, [RBP-552]
  mov [RBP-560], RAX ; [RBP-560] holds the variable uyajisnxyn_3197
  mov RAX, [RBP-536]
  mov [RBP-568], RAX ; [RBP-568] holds the variable njqhkbjtje_3201
  mov RAX, [RBP-504]
  mov [RBP-576], RAX ; [RBP-576] holds the variable lmgsggstxy_3205
  mov RAX, [RBP-552]
  mov [RBP-584], RAX ; [RBP-584] holds the variable bmubokqeeu_3209
  mov RAX, [RBP-584]
  mov [RBP-592], RAX ; [RBP-592] holds the variable lgwrlxljjz_3213
  mov RAX, [RBP-552]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5635
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5639
  mov RAX, 0x7fffffffffffffff
  jmp near done_5639
if_false_5639:
  mov RAX, 0x7fffffffffffffff
done_5639:
  jmp near done_5635
if_false_5635:
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5636
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5636
  mov RAX, 0xffffffffffffffff
and_done_5636:
done_5635:
  jmp near done_5609
if_false_5609:
  ;; or_lhs {
  mov RAX, [RBP-504]
  mov [RBP-536], RAX ; [RBP-536] holds the variable wshnuvbtbr_3227
  mov RAX, -148
  mov [RBP-544], RAX ; [RBP-544] holds the variable ijrvqninqi_3231
  mov RAX, [RBP-504]
  mov [RBP-552], RAX ; [RBP-552] holds the variable ijnhjcabat_3235
  mov RAX, [RBP-536]
  mov [RBP-560], RAX ; [RBP-560] holds the variable mffecvvatd_3239
  mov RAX, 0xffffffffffffffff
  mov [RBP-568], RAX ; [RBP-568] holds the variable qceczjwkof_3243
  mov RAX, 0x7fffffffffffffff
  mov [RBP-576], RAX ; [RBP-576] holds the variable qbdelzugah_3247
  mov RAX, [RBP-568]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5610
  ;; or_rhs {
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5611
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5611
  mov RAX, 0x7fffffffffffffff
or_done_5611:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5610
  mov RAX, 0x7fffffffffffffff
or_done_5610:
done_5609:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5577
  ;; and_rhs {
  ;; or_lhs {
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5603
  mov RAX, 0x7fffffffffffffff
  jmp near done_5603
if_false_5603:
  mov RAX, 0x7fffffffffffffff
done_5603:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5589
  ;; or_rhs {
  mov RAX, [RBP-504]
  mov [RBP-520], RAX ; [RBP-520] holds the variable jreadoochk_3262
  mov RAX, 0x7fffffffffffffff
  mov [RBP-528], RAX ; [RBP-528] holds the variable oshnfzhfvd_3266
  mov RAX, 0xffffffffffffffff
  mov [RBP-536], RAX ; [RBP-536] holds the variable ezevooedzp_3270
  mov RAX, [RBP-528]
  mov [RBP-544], RAX ; [RBP-544] holds the variable wbrdmstrno_3274
  mov RAX, 0x7fffffffffffffff
  mov [RBP-552], RAX ; [RBP-552] holds the variable iaqmqsduqh_3278
  mov RAX, [RBP-528]
  mov [RBP-560], RAX ; [RBP-560] holds the variable wldzdbujsx_3282
  mov RAX, [RBP-560]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5589
  mov RAX, 0x7fffffffffffffff
or_done_5589:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5578
  ;; or_rhs {
  mov RAX, [RBP-504]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-504]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-520], RAX ; [RBP-520] holds the variable binop_3287
  mov RAX, -96
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-528], RAX ; [RBP-528] holds the variable unary_3290
  mov RAX, [RBP-520]
  mov R11, RAX
  mov RAX, [RBP-528]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_5581
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5581
_cmp_fail_5581:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5581:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5578
  mov RAX, 0x7fffffffffffffff
or_done_5578:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5577
  mov RAX, 0xffffffffffffffff
and_done_5577:
  mov [RBP-512], RAX ; [RBP-512] holds the variable binop_and_or_3169
  mov RAX, [RBP-512]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5395
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5573
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5573
  mov RAX, 0x7fffffffffffffff
or_done_5573:
  mov [RBP-520], RAX ; [RBP-520] holds the variable binop_and_or_3295
  mov RAX, [RBP-520]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5566
  mov RAX, [RBP-504]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 190
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  jmp near done_5566
if_false_5566:
  mov RAX, [RBP-504]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
done_5566:
  mov [RBP-528], RAX ; [RBP-528] holds the variable if_3294
  mov RAX, [RBP-504]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-536], RAX ; [RBP-536] holds the variable unary_3304
  mov RAX, [RBP-536]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-544], RAX ; [RBP-544] holds the variable unary_3303
  mov RAX, [RBP-528]
  mov R11, RAX
  mov RAX, [RBP-544]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_5559
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5559
_cmp_fail_5559:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5559:
  mov [RBP-552], RAX ; [RBP-552] holds the variable binop_3293
  mov RAX, [RBP-552]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5466
  mov RAX, [RBP-504]
  mov R11, RAX
  mov RAX, [RBP-504]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_5555
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5555
_cmp_fail_5555:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5555:
  mov [RBP-560], RAX ; [RBP-560] holds the variable binop_3308
  mov RAX, [RBP-560]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5546
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5551
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5551
  mov RAX, 0xffffffffffffffff
and_done_5551:
  jmp near done_5546
if_false_5546:
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5547
  mov RAX, 0xffffffffffffffff
  jmp near done_5547
if_false_5547:
  mov RAX, 0x7fffffffffffffff
done_5547:
done_5546:
  mov [RBP-568], RAX ; [RBP-568] holds the variable if_3307
  mov RAX, [RBP-568]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5502
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  mov [RBP-576], RAX ; [RBP-576] holds the variable mznydhyzje_3321
  mov RAX, [RBP-576]
  mov [RBP-584], RAX ; [RBP-584] holds the variable suposqbkaa_3325
  mov RAX, [RBP-584]
  mov [RBP-592], RAX ; [RBP-592] holds the variable wkolalaafj_3329
  mov RAX, [RBP-504]
  mov [RBP-600], RAX ; [RBP-600] holds the variable uueijqbjsh_3333
  mov RAX, [RBP-504]
  mov [RBP-608], RAX ; [RBP-608] holds the variable cvpguguqnv_3337
  mov RAX, [RBP-576]
  mov [RBP-616], RAX ; [RBP-616] holds the variable sxdtvlhdel_3341
  mov RAX, [RBP-576]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5510
  ;; and_rhs {
  mov RAX, [RBP-504]
  mov [RBP-576], RAX ; [RBP-576] holds the variable acffbxthsh_3347
  mov RAX, 0xffffffffffffffff
  mov [RBP-584], RAX ; [RBP-584] holds the variable gxunqawrsd_3351
  mov RAX, 0xffffffffffffffff
  mov [RBP-592], RAX ; [RBP-592] holds the variable zgkyxdqdgc_3355
  mov RAX, [RBP-592]
  mov [RBP-600], RAX ; [RBP-600] holds the variable doyfuzegvi_3359
  mov RAX, [RBP-592]
  mov [RBP-608], RAX ; [RBP-608] holds the variable fdazcefxsp_3363
  mov RAX, [RBP-608]
  mov [RBP-616], RAX ; [RBP-616] holds the variable qqpdpmzihb_3367
  mov RAX, [RBP-592]
  mov [RBP-624], RAX ; [RBP-624] holds the variable fwnyvkkzlj_3371
  mov RAX, 108
  mov [RBP-632], RAX ; [RBP-632] holds the variable mzfteaojnn_3375
  mov RAX, [RBP-504]
  mov [RBP-640], RAX ; [RBP-640] holds the variable urjqizjeao_3379
  mov RAX, [RBP-576]
  mov [RBP-648], RAX ; [RBP-648] holds the variable zmlluarnir_3383
  mov RAX, 0xffffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5510
  mov RAX, 0xffffffffffffffff
and_done_5510:
  jmp near done_5502
if_false_5502:
  ;; or_lhs {
  mov RAX, [RBP-504]
  mov R11, RAX
  mov RAX, [RBP-504]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_5507
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5507
_cmp_fail_5507:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5507:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5503
  ;; or_rhs {
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5504
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5504
  mov RAX, 0x7fffffffffffffff
or_done_5504:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5503
  mov RAX, 0x7fffffffffffffff
or_done_5503:
done_5502:
  jmp near done_5466
if_false_5466:
  mov RAX, [RBP-504]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-504]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-560], RAX ; [RBP-560] holds the variable binop_3399
  mov RAX, -82
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-504]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-568], RAX ; [RBP-568] holds the variable binop_3402
  mov RAX, [RBP-560]
  mov R11, RAX
  mov RAX, [RBP-568]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_5491
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5491
_cmp_fail_5491:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5491:
  mov [RBP-576], RAX ; [RBP-576] holds the variable lxzddhoadd_3396
  mov RAX, [RBP-576]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5487
  mov RAX, -116
  jmp near done_5487
if_false_5487:
  mov RAX, [RBP-504]
done_5487:
  mov [RBP-584], RAX ; [RBP-584] holds the variable eqbaarspho_3407
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5484
  ;; or_rhs {
  mov RAX, [RBP-576]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5484
  mov RAX, 0x7fffffffffffffff
or_done_5484:
  mov [RBP-592], RAX ; [RBP-592] holds the variable fotflmhasa_3414
  mov RAX, [RBP-504]
  mov R11, RAX
  mov RAX, [RBP-584]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_5481
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5481
_cmp_fail_5481:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5481:
  mov [RBP-600], RAX ; [RBP-600] holds the variable lqglzqovxo_3420
  mov RAX, [RBP-504]
  mov [RBP-608], RAX ; [RBP-608] holds the variable degqtzsrwh_3430
  mov RAX, [RBP-576]
  mov [RBP-616], RAX ; [RBP-616] holds the variable ymwcytdvor_3426
  mov RAX, [RBP-600]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5475
  mov RAX, 0x7fffffffffffffff
  jmp near done_5475
if_false_5475:
  mov RAX, [RBP-600]
done_5475:
done_5466:
  jmp near done_5395
if_false_5395:
  ;; or_lhs {
  mov RAX, [RBP-504]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-520], RAX ; [RBP-520] holds the variable unary_3441
  mov RAX, [RBP-504]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-504]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-528], RAX ; [RBP-528] holds the variable binop_3443
  mov RAX, [RBP-520]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-528]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-536], RAX ; [RBP-536] holds the variable binop_3440
  mov RAX, -54
  mov [RBP-544], RAX ; [RBP-544] holds the variable quxaqubsoh_3449
  mov RAX, 0xffffffffffffffff
  mov [RBP-552], RAX ; [RBP-552] holds the variable zvoonucaoy_3453
  mov RAX, 14
  mov [RBP-560], RAX ; [RBP-560] holds the variable xvlxydcmyh_3457
  mov RAX, [RBP-504]
  mov [RBP-568], RAX ; [RBP-568] holds the variable bbpkjyeazb_3461
  mov RAX, 0xffffffffffffffff
  mov [RBP-576], RAX ; [RBP-576] holds the variable clfxcbwizc_3465
  mov RAX, -38
  mov [RBP-584], RAX ; [RBP-584] holds the variable eyvuyyiird_3469
  mov RAX, 168
  mov [RBP-592], RAX ; [RBP-592] holds the variable fpxybrwihm_3473
  mov RAX, [RBP-576]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5432
  mov RAX, 0xffffffffffffffff
  mov [RBP-608], RAX ; [RBP-608] holds the variable zxnxxjwhtp_3479
  mov RAX, [RBP-608]
  mov [RBP-616], RAX ; [RBP-616] holds the variable ocjqfsdkam_3483
  mov RAX, -130
  mov [RBP-624], RAX ; [RBP-624] holds the variable zltxmnpofo_3487
  mov RAX, [RBP-616]
  mov [RBP-632], RAX ; [RBP-632] holds the variable ahsbriwavc_3491
  mov RAX, [RBP-624]
  jmp near done_5432
if_false_5432:
  mov RAX, -54
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-504]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
done_5432:
  mov [RBP-600], RAX ; [RBP-600] holds the variable if_3446
  mov RAX, [RBP-536]
  mov R11, RAX
  mov RAX, [RBP-600]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_5429
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5429
_cmp_fail_5429:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5429:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5396
  ;; or_rhs {
  mov RAX, [RBP-504]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-520], RAX ; [RBP-520] holds the variable unary_3500
  mov RAX, [RBP-504]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-504]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-528], RAX ; [RBP-528] holds the variable binop_3502
  mov RAX, [RBP-520]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-528]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-536], RAX ; [RBP-536] holds the variable binop_3499
  mov RAX, [RBP-504]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-504]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-544], RAX ; [RBP-544] holds the variable binop_3506
  mov RAX, [RBP-544]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-552], RAX ; [RBP-552] holds the variable unary_3505
  mov RAX, [RBP-536]
  mov R11, RAX
  mov RAX, [RBP-552]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_5402
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5402
_cmp_fail_5402:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5402:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5396
  mov RAX, 0x7fffffffffffffff
or_done_5396:
done_5395:
  jmp near done_4073
if_false_4073:
  mov RAX, 88
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-56], RAX ; [RBP-56] holds the variable unary_3517
  mov RAX, [RBP-56]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-64], RAX ; [RBP-64] holds the variable unary_3516
  mov RAX, -62
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-72], RAX ; [RBP-72] holds the variable unary_3520
  mov RAX, [RBP-72]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-80], RAX ; [RBP-80] holds the variable unary_3519
  mov RAX, [RBP-64]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-80]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-88], RAX ; [RBP-88] holds the variable binop_3515
  mov RAX, [RBP-88]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-96], RAX ; [RBP-96] holds the variable unary_3514
  mov RAX, -98
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-104], RAX ; [RBP-104] holds the variable unary_3525
  mov RAX, [RBP-104]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-112], RAX ; [RBP-112] holds the variable unary_3524
  mov RAX, -190
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -122
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-120], RAX ; [RBP-120] holds the variable binop_3528
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5313
  mov RAX, -160
  jmp near done_5313
if_false_5313:
  mov RAX, 100
done_5313:
  mov [RBP-128], RAX ; [RBP-128] holds the variable if_3531
  mov RAX, [RBP-120]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-128]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-136], RAX ; [RBP-136] holds the variable binop_3527
  mov RAX, [RBP-112]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-136]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-144], RAX ; [RBP-144] holds the variable binop_3523
  mov RAX, [RBP-144]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-152], RAX ; [RBP-152] holds the variable unary_3522
  mov RAX, [RBP-96]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-152]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-160], RAX ; [RBP-160] holds the variable wgpnotxilt_3511
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5298
  mov RAX, 184
  jmp near done_5298
if_false_5298:
  mov RAX, [RBP-160]
done_5298:
  mov [RBP-168], RAX ; [RBP-168] holds the variable agwlvabdve_3543
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-168]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-176], RAX ; [RBP-176] holds the variable amrgwhxcmp_3550
  mov RAX, [RBP-160]
  mov R11, RAX
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_5292
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5292
_cmp_fail_5292:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5292:
  mov [RBP-184], RAX ; [RBP-184] holds the variable upabubqvnl_3556
  mov RAX, -64
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 80
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-192], RAX ; [RBP-192] holds the variable binop_3561
  mov RAX, [RBP-192]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-200], RAX ; [RBP-200] holds the variable unary_3540
  mov RAX, [RBP-160]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-208], RAX ; [RBP-208] holds the variable unary_3566
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 70
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-216], RAX ; [RBP-216] holds the variable binop_3568
  mov RAX, [RBP-208]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-216]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-224], RAX ; [RBP-224] holds the variable binop_3565
  mov RAX, [RBP-160]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-232], RAX ; [RBP-232] holds the variable unary_3572
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-240], RAX ; [RBP-240] holds the variable binop_3574
  mov RAX, [RBP-232]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-240]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-248], RAX ; [RBP-248] holds the variable binop_3571
  mov RAX, [RBP-224]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-248]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-256], RAX ; [RBP-256] holds the variable binop_3564
  mov RAX, [RBP-200]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-256]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-264], RAX ; [RBP-264] holds the variable binop_3539
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5262
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5262
  mov RAX, 0xffffffffffffffff
and_done_5262:
  mov [RBP-272], RAX ; [RBP-272] holds the variable binop_and_or_3580
  mov RAX, [RBP-272]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5240
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_5240
if_false_5240:
  mov RAX, [RBP-160]
  mov [RBP-288], RAX ; [RBP-288] holds the variable plmluuoaxr_3588
  mov RAX, 0xffffffffffffffff
  mov [RBP-296], RAX ; [RBP-296] holds the variable jcuujqsxgp_3592
  mov RAX, [RBP-296]
  mov [RBP-304], RAX ; [RBP-304] holds the variable nltfmimgkx_3596
  mov RAX, [RBP-160]
  mov [RBP-312], RAX ; [RBP-312] holds the variable xzozkwogbs_3600
  mov RAX, 36
  mov [RBP-320], RAX ; [RBP-320] holds the variable cxkszuqisg_3604
  mov RAX, [RBP-160]
  mov [RBP-328], RAX ; [RBP-328] holds the variable rrzuvlyuwn_3608
  mov RAX, [RBP-320]
  mov [RBP-336], RAX ; [RBP-336] holds the variable oqhgibbzvq_3612
  mov RAX, [RBP-312]
  mov [RBP-344], RAX ; [RBP-344] holds the variable pcuqnfsqcz_3616
  mov RAX, -34
done_5240:
  mov [RBP-280], RAX ; [RBP-280] holds the variable if_3579
  mov RAX, [RBP-280]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-288], RAX ; [RBP-288] holds the variable unary_3578
  mov RAX, [RBP-288]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-296], RAX ; [RBP-296] holds the variable unary_3577
  mov RAX, [RBP-264]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-296]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-304], RAX ; [RBP-304] holds the variable rdtgvylykx_3536
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5229
  mov RAX, [RBP-160]
  jmp near done_5229
if_false_5229:
  mov RAX, [RBP-304]
done_5229:
  mov [RBP-312], RAX ; [RBP-312] holds the variable gssfadkfke_3631
  mov RAX, [RBP-312]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-320], RAX ; [RBP-320] holds the variable thfeakrzld_3638
  mov RAX, 140
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-328], RAX ; [RBP-328] holds the variable fgcarpznko_3627
  mov RAX, [RBP-328]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 98
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-336], RAX ; [RBP-336] holds the variable binop_3649
  mov RAX, [RBP-328]
  mov [RBP-344], RAX ; [RBP-344] holds the variable tfiubtueiz_3654
  mov RAX, 0x7fffffffffffffff
  mov [RBP-352], RAX ; [RBP-352] holds the variable vwaiibtshq_3658
  mov RAX, [RBP-352]
  mov [RBP-360], RAX ; [RBP-360] holds the variable reyvqupqww_3662
  mov RAX, -186
  mov [RBP-368], RAX ; [RBP-368] holds the variable kvdwhmtrzs_3666
  mov RAX, 0xffffffffffffffff
  mov [RBP-376], RAX ; [RBP-376] holds the variable fbaiktbujb_3670
  mov RAX, [RBP-328]
  mov [RBP-384], RAX ; [RBP-384] holds the variable jebelddyvn_3674
  mov RAX, [RBP-160]
  mov [RBP-392], RAX ; [RBP-392] holds the variable kufqsooztl_3678
  mov RAX, [RBP-336]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -168
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-400], RAX ; [RBP-400] holds the variable zlmcgrrsna_3646
  mov RAX, [RBP-304]
  mov [RBP-408], RAX ; [RBP-408] holds the variable oayycjyfog_3691
  mov RAX, 0x7fffffffffffffff
  mov [RBP-416], RAX ; [RBP-416] holds the variable khmyrkktch_3695
  mov RAX, [RBP-416]
  mov [RBP-424], RAX ; [RBP-424] holds the variable hszhhuluiw_3699
  mov RAX, [RBP-416]
  mov [RBP-432], RAX ; [RBP-432] holds the variable gsmjtjmzqm_3703
  mov RAX, 0x7fffffffffffffff
  mov [RBP-440], RAX ; [RBP-440] holds the variable ubevuttoaj_3707
  mov RAX, [RBP-424]
  mov [RBP-448], RAX ; [RBP-448] holds the variable anjnthuugf_3687
  mov RAX, [RBP-160]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-456], RAX ; [RBP-456] holds the variable ymbdumfxst_3712
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -126
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-464], RAX ; [RBP-464] holds the variable xvhfechyar_3717
  mov RAX, [RBP-456]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-472], RAX ; [RBP-472] holds the variable wwdbgrqyud_3723
  mov RAX, [RBP-448]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5193
  mov RAX, 0x7fffffffffffffff
  jmp near done_5193
if_false_5193:
  mov RAX, [RBP-448]
done_5193:
  mov [RBP-480], RAX ; [RBP-480] holds the variable grfbnwkqqb_3729
  mov RAX, [RBP-160]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-488], RAX ; [RBP-488] holds the variable wdqpzhpspt_3736
  mov RAX, -14
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-488]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-496], RAX ; [RBP-496] holds the variable txhszoungh_3741
  mov RAX, [RBP-400]
  mov R11, RAX
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_5185
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5185
_cmp_fail_5185:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5185:
  mov [RBP-504], RAX ; [RBP-504] holds the variable huxmzrdgnc_3747
  mov RAX, -136
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 10
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-512], RAX ; [RBP-512] holds the variable bsziticwwe_3683
  mov RAX, [RBP-328]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-304]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-520], RAX ; [RBP-520] holds the variable binop_3759
  mov RAX, [RBP-520]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-528], RAX ; [RBP-528] holds the variable bmxihevehv_3756
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5174
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5174
  mov RAX, 0x7fffffffffffffff
or_done_5174:
  mov [RBP-536], RAX ; [RBP-536] holds the variable kedvbetgok_3767
  mov RAX, [RBP-536]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5170
  mov RAX, [RBP-304]
  jmp near done_5170
if_false_5170:
  mov RAX, [RBP-304]
done_5170:
  mov [RBP-544], RAX ; [RBP-544] holds the variable bjqansfxxj_3763
  mov RAX, [RBP-512]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-552], RAX ; [RBP-552] holds the variable unary_3780
  mov RAX, [RBP-400]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-560], RAX ; [RBP-560] holds the variable unary_3782
  mov RAX, [RBP-552]
  mov R11, RAX
  mov RAX, [RBP-560]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_5163
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5163
_cmp_fail_5163:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5163:
  mov [RBP-568], RAX ; [RBP-568] holds the variable xhhpugfulg_3777
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-576], RAX ; [RBP-576] holds the variable tlgednjesb_3789
  mov RAX, [RBP-160]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-584], RAX ; [RBP-584] holds the variable irkbtvumpb_3795
  mov RAX, [RBP-528]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-584]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-592], RAX ; [RBP-592] holds the variable upmozdytxc_3800
  mov RAX, 0x7fffffffffffffff
  mov [RBP-600], RAX ; [RBP-600] holds the variable vqwxkkrwis_3810
  mov RAX, [RBP-592]
  mov [RBP-608], RAX ; [RBP-608] holds the variable alobumular_3814
  mov RAX, [RBP-400]
  mov [RBP-616], RAX ; [RBP-616] holds the variable wqnufparif_3818
  mov RAX, [RBP-160]
  mov [RBP-624], RAX ; [RBP-624] holds the variable bbvajpwnex_3822
  mov RAX, [RBP-592]
  mov [RBP-632], RAX ; [RBP-632] holds the variable iksvbjnehf_3806
  mov RAX, [RBP-568]
  mov [RBP-640], RAX ; [RBP-640] holds the variable rlgefwouxl_3828
  mov RAX, [RBP-568]
  mov [RBP-648], RAX ; [RBP-648] holds the variable gqeadhqytc_3785
  mov RAX, [RBP-648]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5144
  mov RAX, [RBP-304]
  jmp near done_5144
if_false_5144:
  mov RAX, [RBP-160]
done_5144:
  mov [RBP-656], RAX ; [RBP-656] holds the variable if_3836
  mov RAX, [RBP-656]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-664], RAX ; [RBP-664] holds the variable qmsofqybig_3833
  mov RAX, [RBP-544]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-672], RAX ; [RBP-672] holds the variable ztcggxuvjp_3845
  mov RAX, [RBP-664]
  mov R11, RAX
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_5137
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5137
_cmp_fail_5137:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5137:
  mov [RBP-680], RAX ; [RBP-680] holds the variable vjcsqdksur_3850
  mov RAX, [RBP-680]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5133
  mov RAX, [RBP-680]
  jmp near done_5133
if_false_5133:
  mov RAX, [RBP-648]
done_5133:
  mov [RBP-688], RAX ; [RBP-688] holds the variable ocznxqbulx_3856
  ;; and_lhs {
  mov RAX, [RBP-568]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5130
  ;; and_rhs {
  mov RAX, [RBP-648]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5130
  mov RAX, 0xffffffffffffffff
and_done_5130:
  mov [RBP-696], RAX ; [RBP-696] holds the variable uazvoiopxo_3841
  ;; or_lhs {
  mov RAX, [RBP-512]
  mov R11, RAX
  mov RAX, -62
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_5127
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5127
_cmp_fail_5127:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5127:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5123
  ;; or_rhs {
  ;; or_lhs {
  mov RAX, [RBP-568]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5124
  ;; or_rhs {
  mov RAX, [RBP-568]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5124
  mov RAX, 0x7fffffffffffffff
or_done_5124:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5123
  mov RAX, 0x7fffffffffffffff
or_done_5123:
  mov [RBP-704], RAX ; [RBP-704] holds the variable oapdfsyktj_3866
  mov RAX, [RBP-696]
  mov [RBP-712], RAX ; [RBP-712] holds the variable yhvnoluhgx_3878
  mov RAX, [RBP-304]
  mov [RBP-720], RAX ; [RBP-720] holds the variable zfjjrneowy_3882
  mov RAX, [RBP-720]
  mov [RBP-728], RAX ; [RBP-728] holds the variable mwftwuzjkw_3886
  mov RAX, 172
  mov [RBP-736], RAX ; [RBP-736] holds the variable zsfjdaezcp_3890
  mov RAX, 62
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-744], RAX ; [RBP-744] holds the variable unary_3875
  mov RAX, [RBP-744]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-752], RAX ; [RBP-752] holds the variable unary_3624
  mov RAX, [RBP-160]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-760], RAX ; [RBP-760] holds the variable unary_3897
  mov RAX, -132
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-304]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-768], RAX ; [RBP-768] holds the variable binop_3899
  mov RAX, [RBP-760]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-768]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-776], RAX ; [RBP-776] holds the variable binop_3896
  mov RAX, [RBP-776]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-784], RAX ; [RBP-784] holds the variable unary_3895
  mov RAX, [RBP-784]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-792], RAX ; [RBP-792] holds the variable unary_3894
  mov RAX, [RBP-752]
  mov R11, RAX
  mov RAX, [RBP-792]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_5100
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5100
_cmp_fail_5100:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5100:
  mov [RBP-800], RAX ; [RBP-800] holds the variable tyythgntgo_3621
  mov RAX, [RBP-160]
  mov R11, RAX
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_5097
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5097
_cmp_fail_5097:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5097:
  mov [RBP-808], RAX ; [RBP-808] holds the variable binop_3915
  mov RAX, [RBP-808]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5073
  ;; or_lhs {
  mov RAX, [RBP-800]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5093
  ;; or_rhs {
  mov RAX, [RBP-800]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_5093
  mov RAX, 0x7fffffffffffffff
or_done_5093:
  jmp near done_5073
if_false_5073:
  mov RAX, -66
  mov [RBP-824], RAX ; [RBP-824] holds the variable xqzeasrkxs_3923
  mov RAX, [RBP-160]
  mov [RBP-832], RAX ; [RBP-832] holds the variable txiniayyqe_3927
  mov RAX, -44
  mov [RBP-840], RAX ; [RBP-840] holds the variable qwwgsncbpw_3931
  mov RAX, [RBP-160]
  mov [RBP-848], RAX ; [RBP-848] holds the variable rvykuaoibo_3935
  mov RAX, [RBP-800]
  mov [RBP-856], RAX ; [RBP-856] holds the variable dqwtztrvub_3939
  mov RAX, [RBP-848]
  mov [RBP-864], RAX ; [RBP-864] holds the variable zpafnybefq_3943
  mov RAX, 0x7fffffffffffffff
  mov [RBP-872], RAX ; [RBP-872] holds the variable oedyrumhpz_3947
  mov RAX, 0x7fffffffffffffff
  mov [RBP-880], RAX ; [RBP-880] holds the variable ehrdokgsxw_3951
  mov RAX, [RBP-840]
  mov [RBP-888], RAX ; [RBP-888] holds the variable qylimxfxlq_3955
  mov RAX, [RBP-872]
done_5073:
  mov [RBP-816], RAX ; [RBP-816] holds the variable sajzsbqbxh_3912
  mov RAX, [RBP-800]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5069
  mov RAX, [RBP-304]
  jmp near done_5069
if_false_5069:
  mov RAX, [RBP-304]
done_5069:
  mov [RBP-824], RAX ; [RBP-824] holds the variable if_3963
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 86
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-832], RAX ; [RBP-832] holds the variable binop_3967
  mov RAX, [RBP-824]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-832]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-840], RAX ; [RBP-840] holds the variable wmcmlhydqq_3960
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-304]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-848], RAX ; [RBP-848] holds the variable binop_3974
  mov RAX, [RBP-800]
  mov [RBP-856], RAX ; [RBP-856] holds the variable vzmhffgqqm_3979
  mov RAX, [RBP-304]
  mov [RBP-864], RAX ; [RBP-864] holds the variable fxfwxabluk_3983
  mov RAX, [RBP-856]
  mov [RBP-872], RAX ; [RBP-872] holds the variable fusidhbnmq_3987
  mov RAX, [RBP-872]
  mov [RBP-880], RAX ; [RBP-880] holds the variable rkyfxpqxfi_3991
  mov RAX, [RBP-160]
  mov [RBP-888], RAX ; [RBP-888] holds the variable gxftinbisl_3995
  mov RAX, [RBP-872]
  mov [RBP-896], RAX ; [RBP-896] holds the variable fjsrpvqrag_3999
  mov RAX, [RBP-848]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-864]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-904], RAX ; [RBP-904] holds the variable razioteapn_3971
  mov RAX, [RBP-800]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_5047
  mov RAX, [RBP-800]
  jmp near done_5047
if_false_5047:
  mov RAX, [RBP-800]
done_5047:
  mov [RBP-912], RAX ; [RBP-912] holds the variable rfwkdwvdqh_4008
  ;; and_lhs {
  mov RAX, [RBP-816]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5044
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_5044
  mov RAX, 0xffffffffffffffff
and_done_5044:
  mov [RBP-920], RAX ; [RBP-920] holds the variable honpcrbyqf_4004
  mov RAX, [RBP-904]
  mov [RBP-928], RAX ; [RBP-928] holds the variable ffhngfakpk_4023
  mov RAX, 8
  mov [RBP-936], RAX ; [RBP-936] holds the variable kxjdzoedzg_4027
  mov RAX, [RBP-816]
  mov [RBP-944], RAX ; [RBP-944] holds the variable myfithciya_4031
  mov RAX, [RBP-936]
  mov [RBP-952], RAX ; [RBP-952] holds the variable lklqsrokvn_4035
  mov RAX, [RBP-840]
  mov [RBP-960], RAX ; [RBP-960] holds the variable zpdykkkgyq_4039
  mov RAX, 0x7fffffffffffffff
  mov [RBP-968], RAX ; [RBP-968] holds the variable evsiwozubs_4043
  mov RAX, -40
  mov [RBP-976], RAX ; [RBP-976] holds the variable cidxctkggr_4047
  mov RAX, 0x7fffffffffffffff
  mov [RBP-984], RAX ; [RBP-984] holds the variable nkfksggfsa_4051
  mov RAX, 0xffffffffffffffff
  mov [RBP-992], RAX ; [RBP-992] holds the variable cuaxhmbkvo_4055
  mov RAX, 174
  mov [RBP-1000], RAX ; [RBP-1000] holds the variable dtjayosnyt_4061
  mov RAX, [RBP-904]
  mov [RBP-1008], RAX ; [RBP-1008] holds the variable gjhxjynbiu_4065
  mov RAX, [RBP-920]
  mov [RBP-1016], RAX ; [RBP-1016] holds the variable ihqopnfucu_4069
  mov RAX, [RBP-840]
  mov [RBP-1024], RAX ; [RBP-1024] holds the variable bexkwkzrme_4073
  mov RAX, [RBP-800]
  mov [RBP-1032], RAX ; [RBP-1032] holds the variable vxgfgoltwh_4077
  mov RAX, [RBP-1032]
  mov [RBP-1040], RAX ; [RBP-1040] holds the variable oimsqcrmms_4081
  mov RAX, 198
  mov [RBP-1048], RAX ; [RBP-1048] holds the variable fuvdwznucr_4085
  mov RAX, [RBP-1008]
  mov [RBP-1056], RAX ; [RBP-1056] holds the variable eocuhhhzxo_4089
  mov RAX, 120
  mov R11, RAX
  mov RAX, [RBP-1008]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_5024
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5024
_cmp_fail_5024:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5024:
  mov [RBP-1064], RAX ; [RBP-1064] holds the variable mgdtdlnmqn_4018
  mov RAX, [RBP-1064]
  mov [RBP-1072], RAX ; [RBP-1072] holds the variable sydejnlwso_4096
  mov RAX, [RBP-816]
  mov [RBP-1080], RAX ; [RBP-1080] holds the variable vdimghflek_4102
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1088], RAX ; [RBP-1088] holds the variable qeuofzqxhi_4106
  mov RAX, 0xffffffffffffffff
  mov [RBP-1096], RAX ; [RBP-1096] holds the variable wyospizpcq_4110
  mov RAX, 104
  mov [RBP-1104], RAX ; [RBP-1104] holds the variable zwasdcjraj_4114
  mov RAX, [RBP-840]
  mov [RBP-1112], RAX ; [RBP-1112] holds the variable nkwsedymgu_4118
  mov RAX, [RBP-1064]
  mov [RBP-1120], RAX ; [RBP-1120] holds the variable tbyegvfxok_4122
  mov RAX, [RBP-840]
  mov [RBP-1128], RAX ; [RBP-1128] holds the variable xwlsfojzwi_4126
  mov RAX, [RBP-1088]
  mov [RBP-1136], RAX ; [RBP-1136] holds the variable ybbzlyreeo_4130
  mov RAX, -50
  mov [RBP-1144], RAX ; [RBP-1144] holds the variable xyggackxhg_4134
  mov RAX, [RBP-1088]
  mov [RBP-1152], RAX ; [RBP-1152] holds the variable jnmgihxnge_4138
  mov RAX, [RBP-840]
  mov R11, RAX
  mov RAX, -172
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_5010
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_5010
_cmp_fail_5010:
  mov RAX, 0x7fffffffffffffff
_cmp_done_5010:
  mov [RBP-1160], RAX ; [RBP-1160] holds the variable ookugtvhkd_3908
  ;; and_lhs {
  mov RAX, 150
  mov [RBP-1176], RAX ; [RBP-1176] holds the variable tkfgfcyjwo_4149
  mov RAX, [RBP-304]
  mov [RBP-1184], RAX ; [RBP-1184] holds the variable wsjcdspiyb_4153
  mov RAX, [RBP-160]
  mov [RBP-1192], RAX ; [RBP-1192] holds the variable jlgxxhvbkc_4157
  mov RAX, [RBP-1184]
  mov [RBP-1200], RAX ; [RBP-1200] holds the variable zhyliuaqls_4161
  mov RAX, [RBP-800]
  mov [RBP-1208], RAX ; [RBP-1208] holds the variable dpnryqqiwe_4165
  mov RAX, -14
  mov [RBP-1216], RAX ; [RBP-1216] holds the variable geitbhdfmb_4169
  mov RAX, [RBP-800]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_4993
  ;; and_rhs {
  mov RAX, [RBP-160]
  mov R11, RAX
  mov RAX, [RBP-304]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_4994
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4994
_cmp_fail_4994:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4994:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_4993
  mov RAX, 0xffffffffffffffff
and_done_4993:
  mov [RBP-1168], RAX ; [RBP-1168] holds the variable binop_and_or_4146
  mov RAX, [RBP-1168]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4906
  ;; and_lhs {
  mov RAX, [RBP-800]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_4989
  ;; and_rhs {
  mov RAX, [RBP-1160]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_4989
  mov RAX, 0xffffffffffffffff
and_done_4989:
  mov [RBP-1184], RAX ; [RBP-1184] holds the variable voznykcojh_4178
  mov RAX, [RBP-800]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4985
  mov RAX, [RBP-1184]
  jmp near done_4985
if_false_4985:
  mov RAX, [RBP-800]
done_4985:
  mov [RBP-1192], RAX ; [RBP-1192] holds the variable aboblkzndi_4184
  mov RAX, 152
  mov R11, RAX
  mov RAX, -84
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_4982
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4982
_cmp_fail_4982:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4982:
  mov [RBP-1200], RAX ; [RBP-1200] holds the variable ajljtvlzze_4191
  mov RAX, [RBP-1192]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4978
  mov RAX, [RBP-1192]
  jmp near done_4978
if_false_4978:
  mov RAX, [RBP-800]
done_4978:
  mov [RBP-1208], RAX ; [RBP-1208] holds the variable llooudqphq_4197
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1216], RAX ; [RBP-1216] holds the variable bopqfphywd_4204
  mov RAX, [RBP-304]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1216]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1224], RAX ; [RBP-1224] holds the variable bkjgkbyhwn_4210
  mov RAX, [RBP-1216]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1232], RAX ; [RBP-1232] holds the variable snuozamzuj_4216
  mov RAX, [RBP-1184]
  mov [RBP-1240], RAX ; [RBP-1240] holds the variable owfjspobnp_4225
  mov RAX, [RBP-160]
  mov [RBP-1248], RAX ; [RBP-1248] holds the variable awrarpgyej_4229
  mov RAX, -12
  mov [RBP-1256], RAX ; [RBP-1256] holds the variable xtfabeqmvk_4233
  mov RAX, [RBP-1248]
  mov [RBP-1264], RAX ; [RBP-1264] holds the variable kkfrrxmquh_4237
  mov RAX, 0xffffffffffffffff
  mov [RBP-1272], RAX ; [RBP-1272] holds the variable htxbbacamg_4241
  mov RAX, [RBP-1208]
  mov [RBP-1280], RAX ; [RBP-1280] holds the variable mtftqgztjr_4245
  mov RAX, [RBP-800]
  mov [RBP-1288], RAX ; [RBP-1288] holds the variable lnhxlsnbvb_4249
  mov RAX, [RBP-1216]
  mov [RBP-1296], RAX ; [RBP-1296] holds the variable ytcdrtsvcl_4253
  mov RAX, [RBP-1200]
  mov [RBP-1304], RAX ; [RBP-1304] holds the variable zfglxakgbl_4257
  mov RAX, [RBP-1224]
  mov [RBP-1312], RAX ; [RBP-1312] holds the variable yezoqenlpr_4261
  mov RAX, 134
  mov [RBP-1320], RAX ; [RBP-1320] holds the variable lxqjansrhc_4221
  mov RAX, [RBP-160]
  mov R11, RAX
  mov RAX, [RBP-1232]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_4956
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4956
_cmp_fail_4956:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4956:
  mov [RBP-1328], RAX ; [RBP-1328] holds the variable rddhxscunb_4266
  mov RAX, [RBP-1320]
  mov [RBP-1336], RAX ; [RBP-1336] holds the variable agvxpeilgv_4276
  mov RAX, [RBP-304]
  mov [RBP-1344], RAX ; [RBP-1344] holds the variable xbsceeiaho_4280
  mov RAX, [RBP-1344]
  mov [RBP-1352], RAX ; [RBP-1352] holds the variable erzkmnaxff_4272
  mov RAX, 158
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  jmp near done_4906
if_false_4906:
  mov RAX, [RBP-160]
  mov [RBP-1184], RAX ; [RBP-1184] holds the variable kqvfngzyjl_4289
  mov RAX, [RBP-304]
  mov [RBP-1192], RAX ; [RBP-1192] holds the variable ulqbnjgmby_4293
  mov RAX, [RBP-1160]
  mov [RBP-1200], RAX ; [RBP-1200] holds the variable qapxskvnev_4297
  mov RAX, [RBP-800]
  mov [RBP-1208], RAX ; [RBP-1208] holds the variable ivtbswdmgj_4301
  mov RAX, [RBP-1200]
  mov [RBP-1216], RAX ; [RBP-1216] holds the variable jeqdbfcgpe_4305
  mov RAX, [RBP-1184]
  mov [RBP-1224], RAX ; [RBP-1224] holds the variable jjnyyybzir_4309
  mov RAX, [RBP-1224]
  mov [RBP-1232], RAX ; [RBP-1232] holds the variable uudabjukjh_4313
  mov RAX, [RBP-1208]
  mov [RBP-1240], RAX ; [RBP-1240] holds the variable eocbgsmzwi_4317
  mov RAX, [RBP-304]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1248], RAX ; [RBP-1248] holds the variable unary_4321
  mov RAX, [RBP-1232]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1248]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
done_4906:
  mov [RBP-1176], RAX ; [RBP-1176] holds the variable vicjcqgzel_4143
  ;; or_lhs {
  mov RAX, [RBP-1160]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4903
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4903
  mov RAX, 0x7fffffffffffffff
or_done_4903:
  mov [RBP-1184], RAX ; [RBP-1184] holds the variable binop_and_or_4328
  mov RAX, [RBP-1184]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4895
  mov RAX, 70
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-304]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  jmp near done_4895
if_false_4895:
  mov RAX, [RBP-1176]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
done_4895:
  mov [RBP-1192], RAX ; [RBP-1192] holds the variable if_4327
  mov RAX, [RBP-160]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1200], RAX ; [RBP-1200] holds the variable unary_4338
  mov RAX, [RBP-1200]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1208], RAX ; [RBP-1208] holds the variable unary_4337
  mov RAX, [RBP-1192]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1208]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1216], RAX ; [RBP-1216] holds the variable fvamlwnjzv_4324
  mov RAX, [RBP-1216]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-304]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1224], RAX ; [RBP-1224] holds the variable binop_4342
  mov RAX, [RBP-1216]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1232], RAX ; [RBP-1232] holds the variable unary_4345
  mov RAX, [RBP-1224]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1232]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1240], RAX ; [RBP-1240] holds the variable binop_4341
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4876
  mov RAX, [RBP-1160]
  jmp near done_4876
if_false_4876:
  mov RAX, 0x7fffffffffffffff
done_4876:
  mov [RBP-1248], RAX ; [RBP-1248] holds the variable hijeslifjf_4349
  mov RAX, [RBP-160]
  mov R11, RAX
  mov RAX, [RBP-304]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_4873
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4873
_cmp_fail_4873:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4873:
  mov [RBP-1256], RAX ; [RBP-1256] holds the variable shdvgtxsen_4356
  mov RAX, [RBP-1216]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1264], RAX ; [RBP-1264] holds the variable sgaqouvykm_4362
  ;; and_lhs {
  mov RAX, [RBP-1256]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_4867
  ;; and_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_4867
  mov RAX, 0xffffffffffffffff
and_done_4867:
  mov [RBP-1272], RAX ; [RBP-1272] holds the variable laldgriblh_4368
  mov RAX, [RBP-1160]
  mov [RBP-1280], RAX ; [RBP-1280] holds the variable gpowdakxbf_4378
  mov RAX, -22
  mov [RBP-1288], RAX ; [RBP-1288] holds the variable zdwcnqbgfq_4382
  mov RAX, [RBP-1256]
  mov [RBP-1296], RAX ; [RBP-1296] holds the variable hcwveyqwhi_4386
  mov RAX, [RBP-1160]
  mov [RBP-1304], RAX ; [RBP-1304] holds the variable djttumwqrn_4390
  mov RAX, 22
  mov [RBP-1312], RAX ; [RBP-1312] holds the variable mmlrkatugy_4394
  mov RAX, 0xffffffffffffffff
  mov [RBP-1320], RAX ; [RBP-1320] holds the variable bvdfzzwiuy_4374
  mov RAX, [RBP-304]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1264]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1328], RAX ; [RBP-1328] holds the variable uhfxirhdcy_4399
  mov RAX, [RBP-1272]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4854
  mov RAX, [RBP-800]
  jmp near done_4854
if_false_4854:
  mov RAX, [RBP-1248]
done_4854:
  mov [RBP-1336], RAX ; [RBP-1336] holds the variable zsqhyxtdmv_4405
  mov RAX, 20
  mov [RBP-1344], RAX ; [RBP-1344] holds the variable fqaspshtxe_4416
  mov RAX, [RBP-1328]
  mov [RBP-1352], RAX ; [RBP-1352] holds the variable nfsbjmuyvk_4412
  mov RAX, [RBP-1216]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1360], RAX ; [RBP-1360] holds the variable binop_4420
  mov RAX, [RBP-1240]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1360]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1368], RAX ; [RBP-1368] holds the variable binop_4340
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-304]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1376], RAX ; [RBP-1376] holds the variable binop_4426
  mov RAX, [RBP-1376]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1384], RAX ; [RBP-1384] holds the variable unary_4425
  mov RAX, [RBP-160]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1392], RAX ; [RBP-1392] holds the variable unary_4430
  mov RAX, [RBP-304]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1400], RAX ; [RBP-1400] holds the variable unary_4432
  mov RAX, [RBP-1392]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1400]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1408], RAX ; [RBP-1408] holds the variable binop_4429
  mov RAX, [RBP-1384]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1408]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1416], RAX ; [RBP-1416] holds the variable binop_4424
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 20
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1424], RAX ; [RBP-1424] holds the variable binop_4436
  mov RAX, -26
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1432], RAX ; [RBP-1432] holds the variable unary_4439
  mov RAX, [RBP-1424]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1432]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1440], RAX ; [RBP-1440] holds the variable binop_4435
  mov RAX, [RBP-1440]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1448], RAX ; [RBP-1448] holds the variable unary_4434
  mov RAX, [RBP-1416]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1448]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1456], RAX ; [RBP-1456] holds the variable binop_4423
  mov RAX, [RBP-1368]
  mov R11, RAX
  mov RAX, [RBP-1456]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_4815
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4815
_cmp_fail_4815:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4815:
  mov [RBP-1464], RAX ; [RBP-1464] holds the variable rddbezinpw_3903
  ;; or_lhs {
  mov RAX, [RBP-1464]
  mov [RBP-1480], RAX ; [RBP-1480] holds the variable oasdlcmupq_4450
  mov RAX, [RBP-800]
  mov [RBP-1488], RAX ; [RBP-1488] holds the variable srjrlwjxji_4454
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1496], RAX ; [RBP-1496] holds the variable bjybxgnstw_4458
  mov RAX, [RBP-1480]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4803
  ;; or_rhs {
  mov RAX, [RBP-800]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4804
  mov RAX, [RBP-800]
  jmp near done_4804
if_false_4804:
  mov RAX, 0x7fffffffffffffff
done_4804:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4803
  mov RAX, 0x7fffffffffffffff
or_done_4803:
  mov [RBP-1472], RAX ; [RBP-1472] holds the variable binop_and_or_4447
  mov RAX, [RBP-1472]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4778
  mov RAX, [RBP-160]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1488], RAX ; [RBP-1488] holds the variable unary_4467
  mov RAX, [RBP-304]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-304]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1496], RAX ; [RBP-1496] holds the variable binop_4469
  mov RAX, [RBP-1488]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1496]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  jmp near done_4778
if_false_4778:
  mov RAX, [RBP-1464]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4788
  mov RAX, [RBP-800]
  jmp near done_4788
if_false_4788:
  mov RAX, [RBP-1464]
done_4788:
  mov [RBP-1488], RAX ; [RBP-1488] holds the variable if_4473
  mov RAX, [RBP-1488]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4780
  mov RAX, 186
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  jmp near done_4780
if_false_4780:
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
done_4780:
done_4778:
  mov [RBP-1480], RAX ; [RBP-1480] holds the variable if_4446
  mov RAX, [RBP-1480]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1488], RAX ; [RBP-1488] holds the variable unary_4445
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4773
  ;; or_rhs {
  mov RAX, [RBP-1464]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4773
  mov RAX, 0x7fffffffffffffff
or_done_4773:
  mov [RBP-1496], RAX ; [RBP-1496] holds the variable binop_and_or_4489
  mov RAX, [RBP-1496]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4764
  mov RAX, [RBP-800]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4768
  mov RAX, [RBP-1464]
  jmp near done_4768
if_false_4768:
  mov RAX, [RBP-1464]
done_4768:
  jmp near done_4764
if_false_4764:
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4765
  ;; or_rhs {
  mov RAX, [RBP-1464]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4765
  mov RAX, 0x7fffffffffffffff
or_done_4765:
done_4764:
  mov [RBP-1504], RAX ; [RBP-1504] holds the variable azfzqdkldv_4486
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1512], RAX ; [RBP-1512] holds the variable binop_4503
  mov RAX, 50
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-304]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1520], RAX ; [RBP-1520] holds the variable binop_4506
  mov RAX, [RBP-1512]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1520]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1528], RAX ; [RBP-1528] holds the variable vgvantuvoz_4500
  mov RAX, 0xffffffffffffffff
  mov [RBP-1536], RAX ; [RBP-1536] holds the variable xqcoertoex_4515
  mov RAX, [RBP-160]
  mov [RBP-1544], RAX ; [RBP-1544] holds the variable agumtutkor_4519
  mov RAX, [RBP-1544]
  mov [RBP-1552], RAX ; [RBP-1552] holds the variable bqscuvezhn_4523
  mov RAX, [RBP-1544]
  mov [RBP-1560], RAX ; [RBP-1560] holds the variable lvjhqzimit_4527
  mov RAX, 54
  mov [RBP-1568], RAX ; [RBP-1568] holds the variable qraghaizlw_4531
  mov RAX, [RBP-1536]
  mov [RBP-1576], RAX ; [RBP-1576] holds the variable ckbifjllru_4535
  mov RAX, [RBP-1576]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4740
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4745
  ;; or_rhs {
  mov RAX, [RBP-800]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4745
  mov RAX, 0x7fffffffffffffff
or_done_4745:
  jmp near done_4740
if_false_4740:
  mov RAX, [RBP-1504]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4741
  mov RAX, [RBP-1464]
  jmp near done_4741
if_false_4741:
  mov RAX, 0x7fffffffffffffff
done_4741:
done_4740:
  mov [RBP-1584], RAX ; [RBP-1584] holds the variable nnfeqcxjsd_4510
  mov RAX, -174
  mov R11, RAX
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_4737
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4737
_cmp_fail_4737:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4737:
  mov [RBP-1592], RAX ; [RBP-1592] holds the variable binop_4547
  mov RAX, [RBP-1592]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4729
  mov RAX, [RBP-1528]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  jmp near done_4729
if_false_4729:
  mov RAX, [RBP-800]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4730
  mov RAX, [RBP-160]
  jmp near done_4730
if_false_4730:
  mov RAX, [RBP-160]
done_4730:
done_4729:
  mov [RBP-1600], RAX ; [RBP-1600] holds the variable if_4546
  mov RAX, [RBP-1600]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1608], RAX ; [RBP-1608] holds the variable unary_4483
  mov RAX, [RBP-1488]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1608]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1616], RAX ; [RBP-1616] holds the variable kuofeejjwg_4442
  mov RAX, [RBP-160]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1624], RAX ; [RBP-1624] holds the variable unary_4563
  mov RAX, [RBP-1616]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1632], RAX ; [RBP-1632] holds the variable unary_4565
  mov RAX, [RBP-1624]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1632]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1640], RAX ; [RBP-1640] holds the variable binop_4562
  mov RAX, [RBP-1616]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1648], RAX ; [RBP-1648] holds the variable binop_4568
  mov RAX, [RBP-304]
  mov [RBP-1656], RAX ; [RBP-1656] holds the variable pvtkkrotds_4573
  mov RAX, 0xffffffffffffffff
  mov [RBP-1664], RAX ; [RBP-1664] holds the variable rqzokicxyi_4577
  mov RAX, [RBP-1664]
  mov [RBP-1672], RAX ; [RBP-1672] holds the variable btyedamthi_4581
  mov RAX, [RBP-1672]
  mov [RBP-1680], RAX ; [RBP-1680] holds the variable snderiditi_4585
  mov RAX, [RBP-1664]
  mov [RBP-1688], RAX ; [RBP-1688] holds the variable iartbrkbjs_4589
  mov RAX, [RBP-304]
  mov [RBP-1696], RAX ; [RBP-1696] holds the variable fiqzxidotz_4593
  mov RAX, 66
  mov [RBP-1704], RAX ; [RBP-1704] holds the variable gdqjcmntwa_4597
  mov RAX, [RBP-1704]
  mov [RBP-1712], RAX ; [RBP-1712] holds the variable oqrpjsazrw_4601
  mov RAX, [RBP-304]
  mov [RBP-1720], RAX ; [RBP-1720] holds the variable jsfcgawnrm_4605
  mov RAX, 194
  mov [RBP-1728], RAX ; [RBP-1728] holds the variable pyemixtnyl_4609
  mov RAX, [RBP-1648]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1696]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1736], RAX ; [RBP-1736] holds the variable binop_4567
  mov RAX, [RBP-1640]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1736]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1744], RAX ; [RBP-1744] holds the variable binop_4561
  mov RAX, -24
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1616]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1752], RAX ; [RBP-1752] holds the variable binop_4615
  mov RAX, [RBP-304]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1760], RAX ; [RBP-1760] holds the variable unary_4618
  mov RAX, [RBP-1752]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1760]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1768], RAX ; [RBP-1768] holds the variable binop_4614
  mov RAX, [RBP-1768]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1776], RAX ; [RBP-1776] holds the variable unary_4613
  mov RAX, [RBP-1744]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1776]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1784], RAX ; [RBP-1784] holds the variable binop_4560
  mov RAX, [RBP-1784]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1792], RAX ; [RBP-1792] holds the variable vdprjbdlys_4557
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_4680
  ;; and_rhs {
  mov RAX, [RBP-800]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_4680
  mov RAX, 0xffffffffffffffff
and_done_4680:
  mov [RBP-1800], RAX ; [RBP-1800] holds the variable binop_and_or_4627
  mov RAX, [RBP-1800]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4673
  mov RAX, -160
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 120
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_4673
if_false_4673:
  mov RAX, -70
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
done_4673:
  mov [RBP-1808], RAX ; [RBP-1808] holds the variable if_4626
  mov RAX, [RBP-1808]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1816], RAX ; [RBP-1816] holds the variable unary_4625
  mov RAX, [RBP-1616]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-304]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1824], RAX ; [RBP-1824] holds the variable binop_4637
  mov RAX, [RBP-1792]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1832], RAX ; [RBP-1832] holds the variable unary_4640
  mov RAX, [RBP-1824]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1832]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1840], RAX ; [RBP-1840] holds the variable binop_4636
  mov RAX, [RBP-1840]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1848], RAX ; [RBP-1848] holds the variable unary_4635
  mov RAX, [RBP-1816]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1848]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1856], RAX ; [RBP-1856] holds the variable binop_4624
  mov RAX, [RBP-304]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1864], RAX ; [RBP-1864] holds the variable kpiyppoipx_4646
  mov RAX, -74
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -190
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1872], RAX ; [RBP-1872] holds the variable binop_4651
  mov RAX, 0
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1880], RAX ; [RBP-1880] holds the variable unary_4655
  mov RAX, [RBP-1616]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1888], RAX ; [RBP-1888] holds the variable unary_4657
  mov RAX, [RBP-1880]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1888]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1896], RAX ; [RBP-1896] holds the variable binop_4654
  mov RAX, [RBP-1872]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1896]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1904], RAX ; [RBP-1904] holds the variable binop_4643
  ;; or_lhs {
  mov RAX, [RBP-1464]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4638
  mov RAX, [RBP-1464]
  jmp near done_4638
if_false_4638:
  mov RAX, [RBP-1464]
done_4638:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4634
  ;; or_rhs {
  mov RAX, [RBP-1792]
  mov R11, RAX
  mov RAX, [RBP-1616]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_4635
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4635
_cmp_fail_4635:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4635:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4634
  mov RAX, 0x7fffffffffffffff
or_done_4634:
  mov [RBP-1912], RAX ; [RBP-1912] holds the variable binop_and_or_4660
  mov RAX, [RBP-1912]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4616
  mov RAX, -114
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1928], RAX ; [RBP-1928] holds the variable unary_4669
  mov RAX, [RBP-1928]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  jmp near done_4616
if_false_4616:
  mov RAX, [RBP-1616]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1616]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1928], RAX ; [RBP-1928] holds the variable binop_4672
  mov RAX, [RBP-1616]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1616]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1936], RAX ; [RBP-1936] holds the variable binop_4675
  mov RAX, [RBP-1928]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1936]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
done_4616:
  mov [RBP-1920], RAX ; [RBP-1920] holds the variable if_4659
  mov RAX, [RBP-1904]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1920]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1928], RAX ; [RBP-1928] holds the variable binop_4642
  mov RAX, [RBP-1856]
  mov R11, RAX
  mov RAX, [RBP-1928]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_4610
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4610
_cmp_fail_4610:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4610:
  mov [RBP-1936], RAX ; [RBP-1936] holds the variable svaaknfcpz_4621
  ;; or_lhs {
  mov RAX, [RBP-800]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4607
  ;; or_rhs {
  mov RAX, [RBP-800]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4607
  mov RAX, 0x7fffffffffffffff
or_done_4607:
  mov [RBP-1944], RAX ; [RBP-1944] holds the variable binop_and_or_4682
  mov RAX, [RBP-1944]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4600
  mov RAX, [RBP-304]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  jmp near done_4600
if_false_4600:
  mov RAX, [RBP-1616]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 152
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
done_4600:
  mov [RBP-1952], RAX ; [RBP-1952] holds the variable if_4681
  mov RAX, [RBP-1952]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1960], RAX ; [RBP-1960] holds the variable unary_4680
  mov RAX, [RBP-1936]
  mov [RBP-1968], RAX ; [RBP-1968] holds the variable wavwqejvmi_4697
  mov RAX, [RBP-1792]
  mov [RBP-1976], RAX ; [RBP-1976] holds the variable yqbwjlthob_4693
  mov RAX, [RBP-160]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1984], RAX ; [RBP-1984] holds the variable okggidtcgr_4702
  mov RAX, [RBP-1792]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1992], RAX ; [RBP-1992] holds the variable njhahmilil_4707
  mov RAX, 76
  mov R11, RAX
  mov RAX, -170
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_4589
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4589
_cmp_fail_4589:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4589:
  mov [RBP-2000], RAX ; [RBP-2000] holds the variable hmuyubdyfz_4712
  mov RAX, [RBP-1992]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2008], RAX ; [RBP-2008] holds the variable dkoerlwzif_4718
  mov RAX, [RBP-800]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4583
  mov RAX, [RBP-1936]
  jmp near done_4583
if_false_4583:
  mov RAX, [RBP-2000]
done_4583:
  mov [RBP-2016], RAX ; [RBP-2016] holds the variable jiiydgolau_4723
  mov RAX, 112
  mov R11, RAX
  mov RAX, [RBP-2008]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_4580
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4580
_cmp_fail_4580:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4580:
  mov [RBP-2024], RAX ; [RBP-2024] holds the variable zozrdkkddt_4730
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4576
  mov RAX, [RBP-2024]
  jmp near done_4576
if_false_4576:
  mov RAX, [RBP-2000]
done_4576:
  mov [RBP-2032], RAX ; [RBP-2032] holds the variable pmrjsbaqgr_4736
  mov RAX, [RBP-1616]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -168
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2040], RAX ; [RBP-2040] holds the variable jcgehjhzcg_4743
  mov RAX, [RBP-2000]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4569
  mov RAX, [RBP-1936]
  jmp near done_4569
if_false_4569:
  mov RAX, [RBP-800]
done_4569:
  mov [RBP-2048], RAX ; [RBP-2048] holds the variable sdllenxxqr_4749
  mov RAX, [RBP-1792]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 8
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2056], RAX ; [RBP-2056] holds the variable binop_4755
  mov RAX, 26
  mov [RBP-2064], RAX ; [RBP-2064] holds the variable jqzmnsocwz_4761
  mov RAX, -182
  mov [RBP-2072], RAX ; [RBP-2072] holds the variable uyltcztnnb_4765
  mov RAX, [RBP-1464]
  mov [RBP-2080], RAX ; [RBP-2080] holds the variable vbghxghjcd_4769
  mov RAX, [RBP-2064]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2088], RAX ; [RBP-2088] holds the variable unary_4758
  mov RAX, [RBP-2056]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2088]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2096], RAX ; [RBP-2096] holds the variable binop_4690
  mov RAX, [RBP-1960]
  mov R11, RAX
  mov RAX, [RBP-2096]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_4555
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4555
_cmp_fail_4555:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4555:
  mov [RBP-2104], RAX ; [RBP-2104] holds the variable binop_4679
  mov RAX, [RBP-2104]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4331
  mov RAX, [RBP-1936]
  mov [RBP-2112], RAX ; [RBP-2112] holds the variable ytqehqqepp_4781
  mov RAX, [RBP-304]
  mov [RBP-2120], RAX ; [RBP-2120] holds the variable gejgikqmks_4785
  mov RAX, -6
  mov [RBP-2128], RAX ; [RBP-2128] holds the variable fckdrfvuhw_4789
  mov RAX, [RBP-2120]
  mov [RBP-2136], RAX ; [RBP-2136] holds the variable rvubbmxxgd_4793
  mov RAX, -22
  mov [RBP-2144], RAX ; [RBP-2144] holds the variable lgjvzkrnwe_4777
  mov RAX, [RBP-304]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 76
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2152], RAX ; [RBP-2152] holds the variable qnoodjngyd_4798
  mov RAX, [RBP-1616]
  mov [RBP-2160], RAX ; [RBP-2160] holds the variable oksraqfdbp_4808
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2168], RAX ; [RBP-2168] holds the variable behudqsvuo_4812
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2176], RAX ; [RBP-2176] holds the variable azpuwpnwri_4816
  mov RAX, [RBP-2160]
  mov [RBP-2184], RAX ; [RBP-2184] holds the variable cxvvrwznih_4820
  mov RAX, [RBP-1792]
  mov [RBP-2192], RAX ; [RBP-2192] holds the variable ufpzklxrsf_4824
  mov RAX, [RBP-160]
  mov [RBP-2200], RAX ; [RBP-2200] holds the variable vrusvqegaj_4828
  mov RAX, [RBP-2176]
  mov [RBP-2208], RAX ; [RBP-2208] holds the variable vxjbgblxoq_4832
  mov RAX, [RBP-2184]
  mov [RBP-2216], RAX ; [RBP-2216] holds the variable fdsyenzvaq_4836
  mov RAX, [RBP-2160]
  mov [RBP-2224], RAX ; [RBP-2224] holds the variable xlrafnzxpz_4840
  mov RAX, [RBP-800]
  mov [RBP-2232], RAX ; [RBP-2232] holds the variable catxgnuqzm_4844
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2240], RAX ; [RBP-2240] holds the variable iwcmsfdfxz_4804
  mov RAX, [RBP-2240]
  mov [RBP-2248], RAX ; [RBP-2248] holds the variable ojanlerwab_4853
  mov RAX, [RBP-2240]
  mov [RBP-2256], RAX ; [RBP-2256] holds the variable blwhlddqno_4857
  mov RAX, [RBP-1464]
  mov [RBP-2264], RAX ; [RBP-2264] holds the variable uhzgczixrb_4861
  mov RAX, 158
  mov [RBP-2272], RAX ; [RBP-2272] holds the variable egkccgfdam_4865
  mov RAX, [RBP-160]
  mov [RBP-2280], RAX ; [RBP-2280] holds the variable wrxygdwuza_4849
  mov RAX, [RBP-800]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4526
  mov RAX, [RBP-2240]
  jmp near done_4526
if_false_4526:
  mov RAX, [RBP-1936]
done_4526:
  mov [RBP-2288], RAX ; [RBP-2288] holds the variable qkwqzsfyfx_4870
  mov RAX, [RBP-304]
  mov [RBP-2296], RAX ; [RBP-2296] holds the variable swodsyefeb_4881
  mov RAX, [RBP-2288]
  mov [RBP-2304], RAX ; [RBP-2304] holds the variable skwbboefsn_4885
  mov RAX, 0xffffffffffffffff
  mov [RBP-2312], RAX ; [RBP-2312] holds the variable meklavvbbt_4889
  mov RAX, [RBP-304]
  mov [RBP-2320], RAX ; [RBP-2320] holds the variable hitvisoetu_4893
  mov RAX, [RBP-2312]
  mov [RBP-2328], RAX ; [RBP-2328] holds the variable gokjimhghu_4897
  mov RAX, [RBP-2304]
  mov [RBP-2336], RAX ; [RBP-2336] holds the variable buyzjxiwiq_4901
  mov RAX, -82
  mov [RBP-2344], RAX ; [RBP-2344] holds the variable urgfkbwhsr_4905
  mov RAX, 0xffffffffffffffff
  mov [RBP-2352], RAX ; [RBP-2352] holds the variable itqcibiszk_4909
  mov RAX, -144
  mov [RBP-2360], RAX ; [RBP-2360] holds the variable wqkwcoqotx_4877
  ;; or_lhs {
  mov RAX, [RBP-1464]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4514
  ;; or_rhs {
  mov RAX, [RBP-1936]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4514
  mov RAX, 0x7fffffffffffffff
or_done_4514:
  mov [RBP-2368], RAX ; [RBP-2368] holds the variable tzsiwdufeh_4914
  mov RAX, -104
  mov [RBP-2376], RAX ; [RBP-2376] holds the variable agpspfmlcb_4924
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2384], RAX ; [RBP-2384] holds the variable ruswsmdheb_4928
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2392], RAX ; [RBP-2392] holds the variable kywxvwwwxy_4920
  mov RAX, [RBP-1616]
  mov R11, RAX
  mov RAX, [RBP-1792]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_4508
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4508
_cmp_fail_4508:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4508:
  mov [RBP-2400], RAX ; [RBP-2400] holds the variable binop_4932
  mov RAX, [RBP-2400]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4490
  mov RAX, [RBP-1792]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2416], RAX ; [RBP-2416] holds the variable unary_4936
  mov RAX, [RBP-2416]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  jmp near done_4490
if_false_4490:
  mov RAX, 162
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2416], RAX ; [RBP-2416] holds the variable unary_4939
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4496
  mov RAX, [RBP-1792]
  jmp near done_4496
if_false_4496:
  mov RAX, [RBP-304]
done_4496:
  mov [RBP-2424], RAX ; [RBP-2424] holds the variable if_4941
  mov RAX, [RBP-2416]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2424]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
done_4490:
  mov [RBP-2408], RAX ; [RBP-2408] holds the variable if_4774
  mov RAX, [RBP-800]
  mov [RBP-2416], RAX ; [RBP-2416] holds the variable iddnckrzqp_4952
  mov RAX, [RBP-160]
  mov [RBP-2424], RAX ; [RBP-2424] holds the variable fnbezhozgb_4956
  mov RAX, [RBP-1616]
  mov [RBP-2432], RAX ; [RBP-2432] holds the variable leomthiifc_4960
  mov RAX, [RBP-1936]
  mov [RBP-2440], RAX ; [RBP-2440] holds the variable dxwnqelpju_4964
  mov RAX, [RBP-1936]
  mov [RBP-2448], RAX ; [RBP-2448] holds the variable hcwrmrzkgy_4948
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2456], RAX ; [RBP-2456] holds the variable uozbfjpkfv_4969
  mov RAX, [RBP-1792]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1792]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2464], RAX ; [RBP-2464] holds the variable cdrtcezkfr_4975
  ;; and_lhs {
  mov RAX, [RBP-800]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_4476
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_4476
  mov RAX, 0xffffffffffffffff
and_done_4476:
  mov [RBP-2472], RAX ; [RBP-2472] holds the variable binop_and_or_4980
  mov RAX, [RBP-2472]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4450
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4471
  mov RAX, [RBP-800]
  jmp near done_4471
if_false_4471:
  mov RAX, [RBP-1936]
done_4471:
  mov [RBP-2488], RAX ; [RBP-2488] holds the variable ddjkjacocu_4985
  mov RAX, 56
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 34
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2496], RAX ; [RBP-2496] holds the variable myvfzycblt_4992
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1792]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  jmp near done_4450
if_false_4450:
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4459
  mov RAX, [RBP-1792]
  jmp near done_4459
if_false_4459:
  mov RAX, [RBP-1792]
done_4459:
  mov [RBP-2488], RAX ; [RBP-2488] holds the variable if_5001
  mov RAX, [RBP-1792]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1792]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2496], RAX ; [RBP-2496] holds the variable binop_5005
  mov RAX, [RBP-2488]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2496]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
done_4450:
  mov [RBP-2480], RAX ; [RBP-2480] holds the variable if_4945
  mov RAX, [RBP-2408]
  mov R11, RAX
  mov RAX, [RBP-2480]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_4447
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4447
_cmp_fail_4447:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4447:
  jmp near done_4331
if_false_4331:
  mov RAX, [RBP-1464]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4396
  mov RAX, [RBP-800]
  jmp near done_4396
if_false_4396:
  mov RAX, [RBP-1936]
done_4396:
  mov [RBP-2112], RAX ; [RBP-2112] holds the variable hrccqqkbnf_5012
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2120], RAX ; [RBP-2120] holds the variable tcjjstejym_5023
  mov RAX, [RBP-304]
  mov [RBP-2128], RAX ; [RBP-2128] holds the variable codrubmhpa_5027
  mov RAX, [RBP-304]
  mov [RBP-2136], RAX ; [RBP-2136] holds the variable amzrgpuqmq_5031
  mov RAX, [RBP-1792]
  mov [RBP-2144], RAX ; [RBP-2144] holds the variable ieijteayug_5035
  mov RAX, 0
  mov [RBP-2152], RAX ; [RBP-2152] holds the variable nfmhafhdwq_5039
  mov RAX, [RBP-304]
  mov [RBP-2160], RAX ; [RBP-2160] holds the variable ksxxrcciyi_5043
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2168], RAX ; [RBP-2168] holds the variable sdtijbvkcu_5047
  mov RAX, [RBP-2112]
  mov [RBP-2176], RAX ; [RBP-2176] holds the variable whraufynsf_5051
  mov RAX, [RBP-2160]
  mov [RBP-2184], RAX ; [RBP-2184] holds the variable vzxztghxcq_5019
  ;; or_lhs {
  mov RAX, [RBP-1464]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4384
  ;; or_rhs {
  mov RAX, [RBP-1936]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4384
  mov RAX, 0x7fffffffffffffff
or_done_4384:
  mov [RBP-2192], RAX ; [RBP-2192] holds the variable yyxpxmsiom_5056
  mov RAX, [RBP-2184]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 108
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2200], RAX ; [RBP-2200] holds the variable binop_5061
  mov RAX, [RBP-2200]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2208], RAX ; [RBP-2208] holds the variable unary_5009
  mov RAX, [RBP-1792]
  mov R11, RAX
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_4376
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4376
_cmp_fail_4376:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4376:
  mov [RBP-2216], RAX ; [RBP-2216] holds the variable binop_5066
  mov RAX, [RBP-2216]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4368
  mov RAX, [RBP-1792]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1616]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  jmp near done_4368
if_false_4368:
  mov RAX, [RBP-304]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1792]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
done_4368:
  mov [RBP-2224], RAX ; [RBP-2224] holds the variable if_5065
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4364
  mov RAX, [RBP-1936]
  jmp near done_4364
if_false_4364:
  mov RAX, [RBP-1464]
done_4364:
  mov [RBP-2232], RAX ; [RBP-2232] holds the variable if_5076
  mov RAX, [RBP-2232]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4356
  mov RAX, -94
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1792]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  jmp near done_4356
if_false_4356:
  mov RAX, [RBP-160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1616]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
done_4356:
  mov [RBP-2240], RAX ; [RBP-2240] holds the variable if_5075
  mov RAX, [RBP-2224]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2240]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2248], RAX ; [RBP-2248] holds the variable binop_5064
  mov RAX, [RBP-2208]
  mov R11, RAX
  mov RAX, [RBP-2248]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_4350
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4350
_cmp_fail_4350:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4350:
done_4331:
done_4073:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6
  ;; and_rhs {
  mov RAX, -66
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 154
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-48], RAX ; [RBP-48] holds the variable binop_5092
  mov RAX, 44
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-56], RAX ; [RBP-56] holds the variable unary_5095
  mov RAX, [RBP-48]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-56]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-64], RAX ; [RBP-64] holds the variable binop_5091
  mov RAX, [RBP-64]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-72], RAX ; [RBP-72] holds the variable unary_5090
  mov RAX, [RBP-72]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-80], RAX ; [RBP-80] holds the variable unary_5089
  mov RAX, 152
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 84
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-88], RAX ; [RBP-88] holds the variable binop_5100
  mov RAX, -162
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-96], RAX ; [RBP-96] holds the variable unary_5103
  mov RAX, [RBP-88]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-96]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-104], RAX ; [RBP-104] holds the variable binop_5099
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4048
  mov RAX, 20
  jmp near done_4048
if_false_4048:
  mov RAX, -12
done_4048:
  mov [RBP-112], RAX ; [RBP-112] holds the variable if_5106
  mov RAX, [RBP-112]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-120], RAX ; [RBP-120] holds the variable unary_5105
  mov RAX, [RBP-104]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-120]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-128], RAX ; [RBP-128] holds the variable binop_5098
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4040
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_4040
  mov RAX, 0x7fffffffffffffff
or_done_4040:
  mov [RBP-136], RAX ; [RBP-136] holds the variable binop_and_or_5112
  mov RAX, [RBP-136]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4033
  mov RAX, 72
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -50
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_4033
if_false_4033:
  mov RAX, -168
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
done_4033:
  mov [RBP-144], RAX ; [RBP-144] holds the variable if_5111
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4029
  mov RAX, 148
  jmp near done_4029
if_false_4029:
  mov RAX, 26
done_4029:
  mov [RBP-152], RAX ; [RBP-152] holds the variable if_5121
  mov RAX, [RBP-152]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-160], RAX ; [RBP-160] holds the variable unary_5120
  mov RAX, [RBP-144]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-168], RAX ; [RBP-168] holds the variable binop_5110
  mov RAX, [RBP-128]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-168]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-176], RAX ; [RBP-176] holds the variable binop_5097
  mov RAX, [RBP-80]
  mov R11, RAX
  mov RAX, [RBP-176]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_4018
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_4018
_cmp_fail_4018:
  mov RAX, 0x7fffffffffffffff
_cmp_done_4018:
  mov [RBP-184], RAX ; [RBP-184] holds the variable binop_5088
  mov RAX, [RBP-184]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1585
  mov RAX, 110
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -146
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-200], RAX ; [RBP-200] holds the variable binop_5135
  mov RAX, 110
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -84
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-208], RAX ; [RBP-208] holds the variable binop_5138
  mov RAX, [RBP-200]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-208]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-216], RAX ; [RBP-216] holds the variable zprejueizv_5132
  mov RAX, 168
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-224], RAX ; [RBP-224] holds the variable fzmmmrfuab_5143
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_4002
  mov RAX, [RBP-224]
  jmp near done_4002
if_false_4002:
  mov RAX, [RBP-216]
done_4002:
  mov [RBP-232], RAX ; [RBP-232] holds the variable sfzcxwhmwf_5148
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3998
  mov RAX, 0xffffffffffffffff
  jmp near done_3998
if_false_3998:
  mov RAX, 0xffffffffffffffff
done_3998:
  mov [RBP-240], RAX ; [RBP-240] holds the variable iywahxfhfh_5155
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3994
  mov RAX, [RBP-224]
  jmp near done_3994
if_false_3994:
  mov RAX, [RBP-232]
done_3994:
  mov [RBP-248], RAX ; [RBP-248] holds the variable tpoihetyeq_5162
  ;; and_lhs {
  mov RAX, [RBP-240]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3991
  ;; and_rhs {
  mov RAX, [RBP-240]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3991
  mov RAX, 0xffffffffffffffff
and_done_3991:
  mov [RBP-256], RAX ; [RBP-256] holds the variable qsmyqnwypi_5169
  mov RAX, [RBP-256]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3987
  mov RAX, 0x7fffffffffffffff
  jmp near done_3987
if_false_3987:
  mov RAX, [RBP-240]
done_3987:
  mov [RBP-264], RAX ; [RBP-264] holds the variable if_5174
  mov RAX, [RBP-264]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3873
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3983
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3983
  mov RAX, 0x7fffffffffffffff
or_done_3983:
  mov [RBP-280], RAX ; [RBP-280] holds the variable lkdeicckuv_5184
  mov RAX, 8
  mov [RBP-288], RAX ; [RBP-288] holds the variable llqspzykez_5194
  mov RAX, [RBP-288]
  mov [RBP-296], RAX ; [RBP-296] holds the variable dfqrtwklbc_5198
  mov RAX, [RBP-296]
  mov [RBP-304], RAX ; [RBP-304] holds the variable ymaobjsgrn_5202
  mov RAX, 186
  mov [RBP-312], RAX ; [RBP-312] holds the variable cisuynmrgg_5206
  mov RAX, [RBP-280]
  mov [RBP-320], RAX ; [RBP-320] holds the variable vttgwqdrrt_5210
  mov RAX, [RBP-280]
  mov [RBP-328], RAX ; [RBP-328] holds the variable eagqcfdtpw_5214
  mov RAX, -46
  mov [RBP-336], RAX ; [RBP-336] holds the variable llynkhnmyb_5218
  mov RAX, 0xffffffffffffffff
  mov [RBP-344], RAX ; [RBP-344] holds the variable qynmpbeyof_5222
  mov RAX, [RBP-328]
  mov [RBP-352], RAX ; [RBP-352] holds the variable tlbfitaevp_5226
  mov RAX, [RBP-328]
  mov [RBP-360], RAX ; [RBP-360] holds the variable offonafcuw_5190
  mov RAX, 12
  mov R11, RAX
  mov RAX, -66
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_3970
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3970
_cmp_fail_3970:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3970:
  mov [RBP-368], RAX ; [RBP-368] holds the variable dtlzdxplnu_5231
  mov RAX, -96
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -48
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-376], RAX ; [RBP-376] holds the variable nyrznatqvy_5237
  mov RAX, [RBP-368]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3963
  mov RAX, [RBP-368]
  jmp near done_3963
if_false_3963:
  mov RAX, 0xffffffffffffffff
done_3963:
  mov [RBP-384], RAX ; [RBP-384] holds the variable wvdgphsmoj_5243
  mov RAX, 108
  mov R11, RAX
  mov RAX, 46
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_3960
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3960
_cmp_fail_3960:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3960:
  mov [RBP-392], RAX ; [RBP-392] holds the variable pslhytvqbl_5250
  mov RAX, -24
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-376]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-400], RAX ; [RBP-400] holds the variable qxljqwembk_5256
  mov RAX, 34
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-408], RAX ; [RBP-408] holds the variable ggmosmekkb_5262
  mov RAX, [RBP-376]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-416], RAX ; [RBP-416] holds the variable ouhrgdfgub_5267
  mov RAX, [RBP-376]
  mov [RBP-424], RAX ; [RBP-424] holds the variable tespfiyuwp_5277
  mov RAX, [RBP-368]
  mov [RBP-432], RAX ; [RBP-432] holds the variable bzcfytrfvc_5273
  mov RAX, [RBP-416]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-416]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-440], RAX ; [RBP-440] holds the variable csirgagyfj_5180
  mov RAX, -128
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-440]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-448], RAX ; [RBP-448] holds the variable binop_5285
  mov RAX, [RBP-440]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-456], RAX ; [RBP-456] holds the variable unary_5288
  mov RAX, [RBP-448]
  mov R11, RAX
  mov RAX, [RBP-456]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_3939
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3939
_cmp_fail_3939:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3939:
  jmp near done_3873
if_false_3873:
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3912
  mov RAX, 0x7fffffffffffffff
  jmp near done_3912
if_false_3912:
  mov RAX, 0x7fffffffffffffff
done_3912:
  mov [RBP-280], RAX ; [RBP-280] holds the variable if_5295
  mov RAX, [RBP-280]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3900
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3908
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3908
  mov RAX, 0xffffffffffffffff
and_done_3908:
  jmp near done_3900
if_false_3900:
  mov RAX, 0x7fffffffffffffff
  mov [RBP-296], RAX ; [RBP-296] holds the variable dxwofmgzhi_5304
  mov RAX, 162
  mov [RBP-304], RAX ; [RBP-304] holds the variable yqieyaonhg_5308
  mov RAX, 0x7fffffffffffffff
  mov [RBP-312], RAX ; [RBP-312] holds the variable tedmjpyohj_5312
  mov RAX, [RBP-312]
done_3900:
  mov [RBP-288], RAX ; [RBP-288] holds the variable cyjczdtumk_5292
  mov RAX, [RBP-288]
  mov [RBP-296], RAX ; [RBP-296] holds the variable ovevzcflez_5322
  mov RAX, [RBP-288]
  mov [RBP-304], RAX ; [RBP-304] holds the variable lyhxedwzus_5326
  mov RAX, -94
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 26
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-312], RAX ; [RBP-312] holds the variable binop_5330
  mov RAX, 138
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-312]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-320], RAX ; [RBP-320] holds the variable bhehyeahkz_5317
  ;; and_lhs {
  mov RAX, [RBP-288]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3889
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3889
  mov RAX, 0xffffffffffffffff
and_done_3889:
  mov [RBP-328], RAX ; [RBP-328] holds the variable binop_and_or_5334
  mov RAX, [RBP-328]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3881
  mov RAX, [RBP-320]
  mov R11, RAX
  mov RAX, -100
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_3885
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3885
_cmp_fail_3885:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3885:
  jmp near done_3881
if_false_3881:
  ;; and_lhs {
  mov RAX, [RBP-288]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3882
  ;; and_rhs {
  mov RAX, [RBP-288]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3882
  mov RAX, 0xffffffffffffffff
and_done_3882:
done_3881:
done_3873:
  mov [RBP-272], RAX ; [RBP-272] holds the variable ujypzhxukp_5127
  mov RAX, 80
  mov [RBP-280], RAX ; [RBP-280] holds the variable vpogwfkgsv_5357
  mov RAX, [RBP-280]
  mov [RBP-288], RAX ; [RBP-288] holds the variable pqmnznglcm_5361
  mov RAX, [RBP-288]
  mov [RBP-296], RAX ; [RBP-296] holds the variable xhovqeljef_5365
  mov RAX, [RBP-288]
  mov [RBP-304], RAX ; [RBP-304] holds the variable rgcztatksg_5369
  mov RAX, [RBP-272]
  mov [RBP-312], RAX ; [RBP-312] holds the variable pjnoasniya_5373
  mov RAX, [RBP-312]
  mov [RBP-320], RAX ; [RBP-320] holds the variable rjwkvzhgqa_5377
  mov RAX, -152
  mov [RBP-328], RAX ; [RBP-328] holds the variable kpdxcroxgy_5381
  mov RAX, 0xffffffffffffffff
  mov [RBP-336], RAX ; [RBP-336] holds the variable tckywrakam_5385
  mov RAX, [RBP-272]
  mov [RBP-344], RAX ; [RBP-344] holds the variable fekyogtzyx_5389
  mov RAX, [RBP-272]
  mov [RBP-352], RAX ; [RBP-352] holds the variable witxjlomzt_5393
  mov RAX, [RBP-320]
  mov [RBP-360], RAX ; [RBP-360] holds the variable xhnhgdnfjq_5353
  mov RAX, [RBP-360]
  mov [RBP-368], RAX ; [RBP-368] holds the variable sdejfplgks_5402
  mov RAX, 96
  mov [RBP-376], RAX ; [RBP-376] holds the variable bhyyhymiia_5406
  mov RAX, [RBP-360]
  mov [RBP-384], RAX ; [RBP-384] holds the variable xwqabajqzr_5398
  ;; or_lhs {
  mov RAX, [RBP-360]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3856
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3856
  mov RAX, 0x7fffffffffffffff
or_done_3856:
  mov [RBP-392], RAX ; [RBP-392] holds the variable trratrrdgv_5411
  mov RAX, 52
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 158
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-400], RAX ; [RBP-400] holds the variable qzdrysrnqt_5417
  mov RAX, 72
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-408], RAX ; [RBP-408] holds the variable hwklvuetan_5423
  mov RAX, [RBP-384]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3846
  mov RAX, [RBP-384]
  jmp near done_3846
if_false_3846:
  mov RAX, [RBP-360]
done_3846:
  mov [RBP-416], RAX ; [RBP-416] holds the variable rwonnqdiol_5429
  mov RAX, [RBP-360]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3842
  mov RAX, -42
  jmp near done_3842
if_false_3842:
  mov RAX, [RBP-400]
done_3842:
  mov [RBP-424], RAX ; [RBP-424] holds the variable wplmahhlqo_5436
  mov RAX, [RBP-424]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-424]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-432], RAX ; [RBP-432] holds the variable binop_5442
  mov RAX, 178
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -62
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-440], RAX ; [RBP-440] holds the variable binop_5446
  mov RAX, [RBP-440]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-448], RAX ; [RBP-448] holds the variable unary_5445
  mov RAX, [RBP-432]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-448]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-456], RAX ; [RBP-456] holds the variable apvvacwthv_5348
  mov RAX, [RBP-456]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-456]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-464], RAX ; [RBP-464] holds the variable binop_5451
  mov RAX, [RBP-464]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-472], RAX ; [RBP-472] holds the variable unary_5450
  mov RAX, [RBP-456]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -14
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-480], RAX ; [RBP-480] holds the variable arhfvurqfu_5456
  mov RAX, -144
  mov [RBP-488], RAX ; [RBP-488] holds the variable hodgyhzmde_5466
  mov RAX, [RBP-480]
  mov [RBP-496], RAX ; [RBP-496] holds the variable xupctoddvk_5470
  mov RAX, [RBP-456]
  mov [RBP-504], RAX ; [RBP-504] holds the variable ruyeddqlfh_5462
  mov RAX, [RBP-480]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-480]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-512], RAX ; [RBP-512] holds the variable pqcssepatl_5475
  mov RAX, [RBP-512]
  mov R11, RAX
  mov RAX, [RBP-480]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_3814
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3814
_cmp_fail_3814:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3814:
  mov [RBP-520], RAX ; [RBP-520] holds the variable mwnnwkufwp_5481
  ;; and_lhs {
  mov RAX, [RBP-520]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3811
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3811
  mov RAX, 0xffffffffffffffff
and_done_3811:
  mov [RBP-528], RAX ; [RBP-528] holds the variable ziameszxkp_5487
  mov RAX, [RBP-504]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-536], RAX ; [RBP-536] holds the variable unary_5492
  mov RAX, [RBP-472]
  mov R11, RAX
  mov RAX, [RBP-536]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_3806
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3806
_cmp_fail_3806:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3806:
  mov [RBP-544], RAX ; [RBP-544] holds the variable vgsdwmwplq_5344
  ;; or_lhs {
  mov RAX, -184
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 18
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-560], RAX ; [RBP-560] holds the variable binop_5500
  mov RAX, -42
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-568], RAX ; [RBP-568] holds the variable unary_5503
  mov RAX, [RBP-560]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-568]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-576], RAX ; [RBP-576] holds the variable binop_5499
  mov RAX, -24
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-584], RAX ; [RBP-584] holds the variable unary_5506
  mov RAX, [RBP-584]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-592], RAX ; [RBP-592] holds the variable unary_5505
  mov RAX, [RBP-576]
  mov R11, RAX
  mov RAX, [RBP-592]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_3791
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3791
_cmp_fail_3791:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3791:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3601
  ;; or_rhs {
  ;; and_lhs {
  mov RAX, [RBP-544]
  mov [RBP-568], RAX ; [RBP-568] holds the variable mhbgivscyd_5515
  mov RAX, 0x7fffffffffffffff
  mov [RBP-576], RAX ; [RBP-576] holds the variable aogortuadw_5519
  mov RAX, [RBP-576]
  mov [RBP-584], RAX ; [RBP-584] holds the variable jirzowfnpa_5523
  mov RAX, [RBP-584]
  mov [RBP-592], RAX ; [RBP-592] holds the variable izahbwlobk_5527
  mov RAX, [RBP-272]
  mov [RBP-600], RAX ; [RBP-600] holds the variable auhcencylc_5531
  mov RAX, [RBP-568]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3761
  ;; and_rhs {
  mov RAX, -168
  mov [RBP-568], RAX ; [RBP-568] holds the variable iqbzhpmmvf_5537
  mov RAX, 0xffffffffffffffff
  mov [RBP-576], RAX ; [RBP-576] holds the variable vgfjskgrnl_5541
  mov RAX, [RBP-272]
  mov [RBP-584], RAX ; [RBP-584] holds the variable gydtijbtcq_5545
  mov RAX, [RBP-584]
  mov [RBP-592], RAX ; [RBP-592] holds the variable dgqambyhoh_5549
  mov RAX, [RBP-568]
  mov [RBP-600], RAX ; [RBP-600] holds the variable srwazghyao_5553
  mov RAX, [RBP-584]
  mov [RBP-608], RAX ; [RBP-608] holds the variable qmljwutnch_5557
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3761
  mov RAX, 0xffffffffffffffff
and_done_3761:
  mov [RBP-560], RAX ; [RBP-560] holds the variable qcogphwnqc_5510
  mov RAX, 54
  mov [RBP-568], RAX ; [RBP-568] holds the variable buuvsuxvlb_5567
  mov RAX, [RBP-272]
  mov [RBP-576], RAX ; [RBP-576] holds the variable dhxixcjjzd_5571
  mov RAX, [RBP-568]
  mov [RBP-584], RAX ; [RBP-584] holds the variable jbqzcqwnnh_5575
  mov RAX, [RBP-568]
  mov [RBP-592], RAX ; [RBP-592] holds the variable wtcmutmzac_5579
  mov RAX, 0x7fffffffffffffff
  mov [RBP-600], RAX ; [RBP-600] holds the variable oeafepcocq_5583
  mov RAX, [RBP-592]
  mov [RBP-608], RAX ; [RBP-608] holds the variable qvycypzwfy_5587
  mov RAX, [RBP-592]
  mov [RBP-616], RAX ; [RBP-616] holds the variable pvetflmnue_5591
  mov RAX, [RBP-576]
  mov [RBP-624], RAX ; [RBP-624] holds the variable pfsgzsfrrv_5595
  mov RAX, 0x7fffffffffffffff
  mov [RBP-632], RAX ; [RBP-632] holds the variable qxcdbqptyd_5599
  mov RAX, [RBP-272]
  mov [RBP-640], RAX ; [RBP-640] holds the variable zcqgkllpyy_5603
  mov RAX, [RBP-640]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3742
  mov RAX, [RBP-544]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3746
  mov RAX, 0x7fffffffffffffff
  jmp near done_3746
if_false_3746:
  mov RAX, [RBP-272]
done_3746:
  jmp near done_3742
if_false_3742:
  ;; and_lhs {
  mov RAX, [RBP-560]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3743
  ;; and_rhs {
  mov RAX, [RBP-544]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3743
  mov RAX, 0xffffffffffffffff
and_done_3743:
done_3742:
  mov [RBP-648], RAX ; [RBP-648] holds the variable luziqqtedg_5562
  mov RAX, 96
  mov R11, RAX
  mov RAX, 70
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_3739
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3739
_cmp_fail_3739:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3739:
  mov [RBP-656], RAX ; [RBP-656] holds the variable binop_5618
  mov RAX, [RBP-656]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3732
  mov RAX, 0
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  jmp near done_3732
if_false_3732:
  mov RAX, -48
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -128
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
done_3732:
  mov [RBP-664], RAX ; [RBP-664] holds the variable lnubiokzpt_5615
  mov RAX, [RBP-664]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-664]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-672], RAX ; [RBP-672] holds the variable binop_5630
  mov RAX, [RBP-664]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-680], RAX ; [RBP-680] holds the variable unary_5633
  mov RAX, [RBP-672]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-680]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-688], RAX ; [RBP-688] holds the variable jmqcrmkuwp_5627
  mov RAX, [RBP-688]
  mov [RBP-696], RAX ; [RBP-696] holds the variable vjdexbcudv_5644
  mov RAX, [RBP-664]
  mov [RBP-704], RAX ; [RBP-704] holds the variable hcivrunmyn_5648
  mov RAX, [RBP-544]
  mov [RBP-712], RAX ; [RBP-712] holds the variable phjzljtyla_5652
  mov RAX, [RBP-272]
  mov [RBP-720], RAX ; [RBP-720] holds the variable joxdvxgjzp_5656
  mov RAX, [RBP-720]
  mov [RBP-728], RAX ; [RBP-728] holds the variable vthadwchoo_5660
  mov RAX, 0x7fffffffffffffff
  mov [RBP-736], RAX ; [RBP-736] holds the variable lmxbkttawi_5640
  mov RAX, [RBP-272]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3714
  mov RAX, [RBP-560]
  jmp near done_3714
if_false_3714:
  mov RAX, 0xffffffffffffffff
done_3714:
  mov [RBP-744], RAX ; [RBP-744] holds the variable jdnkbcqyjd_5665
  ;; and_lhs {
  mov RAX, [RBP-648]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3711
  ;; and_rhs {
  mov RAX, [RBP-736]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3711
  mov RAX, 0xffffffffffffffff
and_done_3711:
  mov [RBP-752], RAX ; [RBP-752] holds the variable doeiwwdnpf_5672
  mov RAX, [RBP-664]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-760], RAX ; [RBP-760] holds the variable jalrvseysm_5678
  mov RAX, [RBP-688]
  mov R11, RAX
  mov RAX, [RBP-760]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_3706
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3706
_cmp_fail_3706:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3706:
  mov [RBP-768], RAX ; [RBP-768] holds the variable aohckskdch_5683
  mov RAX, -124
  mov R11, RAX
  mov RAX, -64
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_3703
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3703
_cmp_fail_3703:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3703:
  mov [RBP-776], RAX ; [RBP-776] holds the variable idwetdpubo_5689
  mov RAX, [RBP-664]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-664]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-784], RAX ; [RBP-784] holds the variable gonrqwidzn_5695
  mov RAX, 80
  mov R11, RAX
  mov RAX, [RBP-664]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_3697
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3697
_cmp_fail_3697:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3697:
  mov [RBP-792], RAX ; [RBP-792] holds the variable hxzhfiyobx_5636
  mov RAX, [RBP-688]
  mov [RBP-800], RAX ; [RBP-800] holds the variable brjjikmtst_5709
  mov RAX, [RBP-800]
  mov [RBP-808], RAX ; [RBP-808] holds the variable iwjdnctwtl_5713
  mov RAX, -198
  mov [RBP-816], RAX ; [RBP-816] holds the variable occpeljuos_5717
  mov RAX, 160
  mov [RBP-824], RAX ; [RBP-824] holds the variable enfvzjlxun_5721
  mov RAX, [RBP-544]
  mov [RBP-832], RAX ; [RBP-832] holds the variable xrmqcfgjst_5725
  mov RAX, [RBP-664]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-688]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-840], RAX ; [RBP-840] holds the variable binop_5729
  mov RAX, [RBP-800]
  mov R11, RAX
  mov RAX, [RBP-840]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_3686
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3686
_cmp_fail_3686:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3686:
  mov [RBP-848], RAX ; [RBP-848] holds the variable ejenmgbhws_5704
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3682
  mov RAX, [RBP-848]
  jmp near done_3682
if_false_3682:
  mov RAX, [RBP-544]
done_3682:
  mov [RBP-856], RAX ; [RBP-856] holds the variable ctifbclkov_5737
  mov RAX, [RBP-272]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3678
  mov RAX, 160
  jmp near done_3678
if_false_3678:
  mov RAX, [RBP-688]
done_3678:
  mov [RBP-864], RAX ; [RBP-864] holds the variable lnjmixolat_5744
  mov RAX, [RBP-688]
  mov R11, RAX
  mov RAX, [RBP-864]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_3675
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3675
_cmp_fail_3675:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3675:
  mov [RBP-872], RAX ; [RBP-872] holds the variable abifccktrn_5751
  mov RAX, [RBP-864]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 110
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-880], RAX ; [RBP-880] holds the variable foazxjfgxz_5733
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3668
  mov RAX, [RBP-688]
  jmp near done_3668
if_false_3668:
  mov RAX, [RBP-664]
done_3668:
  mov [RBP-888], RAX ; [RBP-888] holds the variable if_5763
  mov RAX, [RBP-664]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-688]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-896], RAX ; [RBP-896] holds the variable binop_5767
  mov RAX, [RBP-888]
  mov R11, RAX
  mov RAX, [RBP-896]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_3662
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3662
_cmp_fail_3662:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3662:
  mov [RBP-904], RAX ; [RBP-904] holds the variable gnudafgzgm_5760
  ;; or_lhs {
  mov RAX, [RBP-648]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3659
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3659
  mov RAX, 0x7fffffffffffffff
or_done_3659:
  mov [RBP-912], RAX ; [RBP-912] holds the variable binop_and_or_5771
  mov RAX, [RBP-912]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3647
  mov RAX, [RBP-880]
  mov [RBP-920], RAX ; [RBP-920] holds the variable fdxxxevnnk_5776
  mov RAX, [RBP-664]
  mov [RBP-928], RAX ; [RBP-928] holds the variable locjsuagpm_5780
  mov RAX, [RBP-688]
  mov [RBP-936], RAX ; [RBP-936] holds the variable bshbtrknnh_5784
  mov RAX, 0xffffffffffffffff
  jmp near done_3647
if_false_3647:
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3648
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3648
  mov RAX, 0xffffffffffffffff
and_done_3648:
done_3647:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3601
  mov RAX, 0x7fffffffffffffff
or_done_3601:
  mov [RBP-552], RAX ; [RBP-552] holds the variable svguogdilp_5495
  mov RAX, -68
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -184
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-560], RAX ; [RBP-560] holds the variable binop_5797
  mov RAX, [RBP-552]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3594
  mov RAX, 94
  jmp near done_3594
if_false_3594:
  mov RAX, -80
done_3594:
  mov [RBP-568], RAX ; [RBP-568] holds the variable if_5800
  mov RAX, [RBP-560]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-568]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-576], RAX ; [RBP-576] holds the variable binop_5796
  mov RAX, [RBP-576]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-584], RAX ; [RBP-584] holds the variable unary_5795
  mov RAX, -56
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 192
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-592], RAX ; [RBP-592] holds the variable binop_5806
  mov RAX, [RBP-592]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-600], RAX ; [RBP-600] holds the variable unary_5805
  mov RAX, [RBP-600]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-608], RAX ; [RBP-608] holds the variable unary_5804
  mov RAX, [RBP-584]
  mov R11, RAX
  mov RAX, [RBP-608]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_3579
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3579
_cmp_fail_3579:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3579:
  mov [RBP-616], RAX ; [RBP-616] holds the variable lwhvimibjb_5792
  ;; and_lhs {
  mov RAX, [RBP-552]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3575
  mov RAX, [RBP-616]
  jmp near done_3575
if_false_3575:
  mov RAX, [RBP-544]
done_3575:
  mov [RBP-632], RAX ; [RBP-632] holds the variable if_5815
  mov RAX, [RBP-632]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3566
  mov RAX, [RBP-272]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3570
  mov RAX, [RBP-544]
  jmp near done_3570
if_false_3570:
  mov RAX, [RBP-544]
done_3570:
  jmp near done_3566
if_false_3566:
  mov RAX, -106
  mov R11, RAX
  mov RAX, 104
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_3567
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3567
_cmp_fail_3567:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3567:
done_3566:
  mov [RBP-640], RAX ; [RBP-640] holds the variable if_5814
  mov RAX, [RBP-640]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3542
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3561
  mov RAX, 124
  jmp near done_3561
if_false_3561:
  mov RAX, 192
done_3561:
  mov [RBP-648], RAX ; [RBP-648] holds the variable if_5827
  mov RAX, 60
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-656], RAX ; [RBP-656] holds the variable unary_5831
  mov RAX, [RBP-648]
  mov R11, RAX
  mov RAX, [RBP-656]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_3556
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3556
_cmp_fail_3556:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3556:
  jmp near done_3542
if_false_3542:
  mov RAX, -98
  mov [RBP-648], RAX ; [RBP-648] holds the variable beyfzxgsfz_5836
  mov RAX, [RBP-272]
  mov [RBP-656], RAX ; [RBP-656] holds the variable zpmrvezmwr_5840
  mov RAX, -104
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 94
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-664], RAX ; [RBP-664] holds the variable binop_5844
  mov RAX, [RBP-648]
  mov R11, RAX
  mov RAX, [RBP-664]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_3546
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3546
_cmp_fail_3546:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3546:
done_3542:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3490
  ;; and_rhs {
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3536
  mov RAX, [RBP-544]
  jmp near done_3536
if_false_3536:
  mov RAX, [RBP-552]
done_3536:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3531
  ;; or_rhs {
  mov RAX, [RBP-544]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3532
  mov RAX, [RBP-552]
  jmp near done_3532
if_false_3532:
  mov RAX, [RBP-272]
done_3532:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3531
  mov RAX, 0x7fffffffffffffff
or_done_3531:
  mov [RBP-632], RAX ; [RBP-632] holds the variable binop_and_or_5848
  mov RAX, [RBP-632]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3492
  mov RAX, 136
  mov R11, RAX
  mov RAX, 100
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_3527
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3527
_cmp_fail_3527:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3527:
  mov [RBP-640], RAX ; [RBP-640] holds the variable binop_5858
  mov RAX, [RBP-640]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3502
  mov RAX, [RBP-552]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3522
  mov RAX, [RBP-544]
  jmp near done_3522
if_false_3522:
  mov RAX, 0x7fffffffffffffff
done_3522:
  jmp near done_3502
if_false_3502:
  mov RAX, [RBP-272]
  mov [RBP-648], RAX ; [RBP-648] holds the variable tthdmzistn_5867
  mov RAX, [RBP-648]
  mov [RBP-656], RAX ; [RBP-656] holds the variable uwvlwgdske_5871
  mov RAX, [RBP-552]
  mov [RBP-664], RAX ; [RBP-664] holds the variable detxojvxnk_5875
  mov RAX, [RBP-664]
  mov [RBP-672], RAX ; [RBP-672] holds the variable mnafmkytlf_5879
  mov RAX, -156
  mov [RBP-680], RAX ; [RBP-680] holds the variable xqtgehrgmd_5883
  mov RAX, [RBP-616]
  mov [RBP-688], RAX ; [RBP-688] holds the variable oifdkgfmpz_5887
  mov RAX, 0xffffffffffffffff
  mov [RBP-696], RAX ; [RBP-696] holds the variable skpxzuvnvu_5891
  mov RAX, 0x7fffffffffffffff
  mov [RBP-704], RAX ; [RBP-704] holds the variable ospvpswcpy_5895
  mov RAX, [RBP-648]
  mov [RBP-712], RAX ; [RBP-712] holds the variable ioeccvkbfp_5899
  mov RAX, [RBP-616]
done_3502:
  jmp near done_3492
if_false_3492:
  ;; and_lhs {
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3498
  ;; or_rhs {
  mov RAX, [RBP-544]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3498
  mov RAX, 0x7fffffffffffffff
or_done_3498:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3493
  ;; and_rhs {
  mov RAX, [RBP-272]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3494
  mov RAX, [RBP-552]
  jmp near done_3494
if_false_3494:
  mov RAX, [RBP-272]
done_3494:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3493
  mov RAX, 0xffffffffffffffff
and_done_3493:
done_3492:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3490
  mov RAX, 0xffffffffffffffff
and_done_3490:
  mov [RBP-624], RAX ; [RBP-624] holds the variable kfitfrqwxm_5810
  ;; and_lhs {
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3487
  ;; or_rhs {
  mov RAX, [RBP-272]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3487
  mov RAX, 0x7fffffffffffffff
or_done_3487:
  mov [RBP-640], RAX ; [RBP-640] holds the variable qizsqpbhxi_5918
  mov RAX, -36
  mov R11, RAX
  mov RAX, 150
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_3484
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3484
_cmp_fail_3484:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3484:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3457
  ;; and_rhs {
  ;; or_lhs {
  mov RAX, 90
  mov R11, RAX
  mov RAX, -112
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_3480
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3480
_cmp_fail_3480:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3480:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3458
  ;; or_rhs {
  mov RAX, -110
  mov [RBP-640], RAX ; [RBP-640] holds the variable uqsljrcocq_5932
  mov RAX, [RBP-544]
  mov [RBP-648], RAX ; [RBP-648] holds the variable qgvcggbslk_5936
  mov RAX, 0xffffffffffffffff
  mov [RBP-656], RAX ; [RBP-656] holds the variable rfcivbntna_5940
  mov RAX, 0x7fffffffffffffff
  mov [RBP-664], RAX ; [RBP-664] holds the variable lukozzdrbm_5944
  mov RAX, [RBP-640]
  mov [RBP-672], RAX ; [RBP-672] holds the variable drkitpmfqq_5948
  mov RAX, [RBP-624]
  mov [RBP-680], RAX ; [RBP-680] holds the variable ujefcwwsvv_5952
  mov RAX, [RBP-272]
  mov [RBP-688], RAX ; [RBP-688] holds the variable cinjqkcjhz_5956
  mov RAX, [RBP-672]
  mov [RBP-696], RAX ; [RBP-696] holds the variable odorkcoimt_5960
  mov RAX, [RBP-656]
  mov [RBP-704], RAX ; [RBP-704] holds the variable mogvxisxob_5964
  mov RAX, [RBP-640]
  mov [RBP-712], RAX ; [RBP-712] holds the variable ojlbobtkex_5968
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3458
  mov RAX, 0x7fffffffffffffff
or_done_3458:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3457
  mov RAX, 0xffffffffffffffff
and_done_3457:
  mov [RBP-632], RAX ; [RBP-632] holds the variable binop_and_or_5915
  mov RAX, [RBP-632]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3365
  ;; and_lhs {
  mov RAX, 134
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-648], RAX ; [RBP-648] holds the variable unary_5974
  mov RAX, -88
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 100
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-656], RAX ; [RBP-656] holds the variable binop_5976
  mov RAX, [RBP-648]
  mov R11, RAX
  mov RAX, [RBP-656]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_3448
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3448
_cmp_fail_3448:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3448:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3423
  ;; and_rhs {
  mov RAX, 142
  mov [RBP-648], RAX ; [RBP-648] holds the variable thfsxhthuf_5982
  mov RAX, 182
  mov [RBP-656], RAX ; [RBP-656] holds the variable eryxpzkeoj_5986
  mov RAX, [RBP-616]
  mov [RBP-664], RAX ; [RBP-664] holds the variable xgddlmfdgt_5990
  mov RAX, [RBP-648]
  mov [RBP-672], RAX ; [RBP-672] holds the variable dwvixehoty_5994
  mov RAX, 148
  mov [RBP-680], RAX ; [RBP-680] holds the variable ylrlyioomd_5998
  mov RAX, [RBP-664]
  mov [RBP-688], RAX ; [RBP-688] holds the variable qmaaifdggx_6002
  mov RAX, [RBP-672]
  mov [RBP-696], RAX ; [RBP-696] holds the variable kpckwwgerq_6006
  mov RAX, [RBP-624]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3431
  mov RAX, 36
  mov R11, RAX
  mov RAX, 142
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_3435
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3435
_cmp_fail_3435:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3435:
  jmp near done_3431
if_false_3431:
  mov RAX, 196
  mov R11, RAX
  mov RAX, 36
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_3432
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3432
_cmp_fail_3432:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3432:
done_3431:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3423
  mov RAX, 0xffffffffffffffff
and_done_3423:
  jmp near done_3365
if_false_3365:
  ;; and_lhs {
  mov RAX, [RBP-624]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3419
  mov RAX, 100
  jmp near done_3419
if_false_3419:
  mov RAX, 22
done_3419:
  mov [RBP-648], RAX ; [RBP-648] holds the variable npebxjncsn_6019
  mov RAX, [RBP-552]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3415
  mov RAX, [RBP-616]
  jmp near done_3415
if_false_3415:
  mov RAX, [RBP-272]
done_3415:
  mov [RBP-656], RAX ; [RBP-656] holds the variable nuutjgmszy_6026
  mov RAX, 44
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 56
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-664], RAX ; [RBP-664] holds the variable nyfrpsqkmt_6033
  mov RAX, [RBP-272]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3408
  mov RAX, [RBP-544]
  jmp near done_3408
if_false_3408:
  mov RAX, [RBP-656]
done_3408:
  mov [RBP-672], RAX ; [RBP-672] holds the variable zwbbypquqb_6039
  mov RAX, [RBP-648]
  mov R11, RAX
  mov RAX, [RBP-648]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_3405
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3405
_cmp_fail_3405:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3405:
  mov [RBP-680], RAX ; [RBP-680] holds the variable wstftpcroz_6046
  mov RAX, [RBP-664]
  mov R11, RAX
  mov RAX, [RBP-648]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_3402
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3402
_cmp_fail_3402:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3402:
  mov [RBP-688], RAX ; [RBP-688] holds the variable pirkvntejj_6052
  mov RAX, [RBP-688]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3398
  mov RAX, -66
  jmp near done_3398
if_false_3398:
  mov RAX, -90
done_3398:
  mov [RBP-696], RAX ; [RBP-696] holds the variable lmbekhbsfj_6058
  mov RAX, [RBP-664]
  mov R11, RAX
  mov RAX, [RBP-696]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_3395
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3395
_cmp_fail_3395:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3395:
  mov [RBP-704], RAX ; [RBP-704] holds the variable zfhufzuzql_6065
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3392
  ;; or_rhs {
  mov RAX, [RBP-552]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3392
  mov RAX, 0x7fffffffffffffff
or_done_3392:
  mov [RBP-712], RAX ; [RBP-712] holds the variable wpmecndxzx_6071
  mov RAX, [RBP-616]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3388
  mov RAX, [RBP-704]
  jmp near done_3388
if_false_3388:
  mov RAX, [RBP-704]
done_3388:
  mov [RBP-720], RAX ; [RBP-720] holds the variable fbdxmiehcm_6077
  mov RAX, [RBP-648]
  mov R11, RAX
  mov RAX, [RBP-696]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_3385
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3385
_cmp_fail_3385:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3385:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3366
  ;; and_rhs {
  ;; or_lhs {
  mov RAX, 10
  mov R11, RAX
  mov RAX, -6
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_3372
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3372
_cmp_fail_3372:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3372:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3367
  ;; or_rhs {
  mov RAX, [RBP-544]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3368
  mov RAX, 0x7fffffffffffffff
  jmp near done_3368
if_false_3368:
  mov RAX, [RBP-552]
done_3368:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3367
  mov RAX, 0x7fffffffffffffff
or_done_3367:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3366
  mov RAX, 0xffffffffffffffff
and_done_3366:
done_3365:
  mov [RBP-640], RAX ; [RBP-640] holds the variable palwioqour_5912
  mov RAX, 106
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -140
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-648], RAX ; [RBP-648] holds the variable binop_6097
  mov RAX, [RBP-648]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-656], RAX ; [RBP-656] holds the variable unary_6096
  mov RAX, 60
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -116
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-664], RAX ; [RBP-664] holds the variable binop_6101
  mov RAX, 126
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 40
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-672], RAX ; [RBP-672] holds the variable binop_6104
  mov RAX, [RBP-664]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-672]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-680], RAX ; [RBP-680] holds the variable binop_6100
  mov RAX, [RBP-656]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-680]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-688], RAX ; [RBP-688] holds the variable binop_6095
  mov RAX, [RBP-688]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  jmp near done_1585
if_false_1585:
  ;; and_lhs {
  mov RAX, 10
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -74
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-208], RAX ; [RBP-208] holds the variable binop_6117
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3277
  mov RAX, -168
  jmp near done_3277
if_false_3277:
  mov RAX, 158
done_3277:
  mov [RBP-216], RAX ; [RBP-216] holds the variable if_6120
  mov RAX, [RBP-208]
  mov R11, RAX
  mov RAX, [RBP-216]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_3274
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3274
_cmp_fail_3274:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3274:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3261
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  mov [RBP-208], RAX ; [RBP-208] holds the variable hvmgohpilg_6127
  mov RAX, -124
  mov [RBP-216], RAX ; [RBP-216] holds the variable zhcymdsnre_6131
  mov RAX, -80
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-224], RAX ; [RBP-224] holds the variable unary_6135
  mov RAX, [RBP-216]
  mov R11, RAX
  mov RAX, [RBP-224]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_3265
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3265
_cmp_fail_3265:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3265:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3261
  mov RAX, 0xffffffffffffffff
and_done_3261:
  mov [RBP-200], RAX ; [RBP-200] holds the variable olqhjuggzt_6113
  mov RAX, -90
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -112
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-208], RAX ; [RBP-208] holds the variable binop_6142
  mov RAX, [RBP-208]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-216], RAX ; [RBP-216] holds the variable unary_6141
  mov RAX, -80
  mov R11, RAX
  mov RAX, 70
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_3253
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3253
_cmp_fail_3253:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3253:
  mov [RBP-224], RAX ; [RBP-224] holds the variable binop_6146
  mov RAX, [RBP-224]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3244
  mov RAX, 62
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -114
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  jmp near done_3244
if_false_3244:
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3245
  mov RAX, -16
  jmp near done_3245
if_false_3245:
  mov RAX, -188
done_3245:
done_3244:
  mov [RBP-232], RAX ; [RBP-232] holds the variable if_6145
  mov RAX, [RBP-216]
  mov R11, RAX
  mov RAX, [RBP-232]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_3241
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3241
_cmp_fail_3241:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3241:
  mov [RBP-240], RAX ; [RBP-240] holds the variable kgbspczoxy_6138
  mov RAX, -132
  mov [RBP-248], RAX ; [RBP-248] holds the variable duqfoasmgj_6166
  mov RAX, [RBP-248]
  mov [RBP-256], RAX ; [RBP-256] holds the variable abkedznuuh_6170
  mov RAX, [RBP-248]
  mov [RBP-264], RAX ; [RBP-264] holds the variable zfwyjzlirp_6174
  mov RAX, [RBP-248]
  mov [RBP-272], RAX ; [RBP-272] holds the variable untvtgwjtn_6162
  mov RAX, 0x7fffffffffffffff
  mov [RBP-280], RAX ; [RBP-280] holds the variable hysxyhxyea_6183
  mov RAX, [RBP-272]
  mov [RBP-288], RAX ; [RBP-288] holds the variable lzalmuzyyr_6187
  mov RAX, 0x7fffffffffffffff
  mov [RBP-296], RAX ; [RBP-296] holds the variable eenfpyplki_6191
  mov RAX, [RBP-200]
  mov [RBP-304], RAX ; [RBP-304] holds the variable nodwaiviqt_6179
  mov RAX, 126
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-312], RAX ; [RBP-312] holds the variable gbqixbssxy_6196
  mov RAX, [RBP-272]
  mov R11, RAX
  mov RAX, [RBP-272]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_3228
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3228
_cmp_fail_3228:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3228:
  mov [RBP-320], RAX ; [RBP-320] holds the variable binop_6200
  mov RAX, [RBP-320]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3214
  mov RAX, 124
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -70
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-336], RAX ; [RBP-336] holds the variable binop_6204
  mov RAX, [RBP-336]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  jmp near done_3214
if_false_3214:
  mov RAX, 102
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 150
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-336], RAX ; [RBP-336] holds the variable binop_6208
  mov RAX, [RBP-336]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
done_3214:
  mov [RBP-328], RAX ; [RBP-328] holds the variable bgkgbrppty_6157
  mov RAX, 0xffffffffffffffff
  mov [RBP-336], RAX ; [RBP-336] holds the variable tnxupfibwv_6221
  mov RAX, 200
  mov [RBP-344], RAX ; [RBP-344] holds the variable duyybsppwd_6225
  mov RAX, [RBP-240]
  mov [RBP-352], RAX ; [RBP-352] holds the variable azhmfbtmda_6229
  mov RAX, -198
  mov [RBP-360], RAX ; [RBP-360] holds the variable mfjosdmlvx_6233
  mov RAX, [RBP-200]
  mov [RBP-368], RAX ; [RBP-368] holds the variable udrcgqwxyc_6237
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3202
  mov RAX, [RBP-328]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  jmp near done_3202
if_false_3202:
  mov RAX, [RBP-328]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
done_3202:
  mov [RBP-376], RAX ; [RBP-376] holds the variable sfzdvxxzjr_6216
  mov RAX, [RBP-328]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-384], RAX ; [RBP-384] holds the variable unary_6250
  mov RAX, -82
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-392], RAX ; [RBP-392] holds the variable binop_6252
  mov RAX, [RBP-384]
  mov R11, RAX
  mov RAX, [RBP-392]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_3194
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3194
_cmp_fail_3194:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3194:
  mov [RBP-400], RAX ; [RBP-400] holds the variable qbjgbmnxoe_6247
  mov RAX, 4
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-408], RAX ; [RBP-408] holds the variable izwsyllauf_6260
  mov RAX, -28
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 14
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-416], RAX ; [RBP-416] holds the variable qqcvrgxivm_6265
  mov RAX, [RBP-408]
  mov [RBP-424], RAX ; [RBP-424] holds the variable mhltnemlea_6275
  mov RAX, [RBP-240]
  mov [RBP-432], RAX ; [RBP-432] holds the variable hmkegkwulf_6271
  ;; or_lhs {
  mov RAX, [RBP-400]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3184
  ;; or_rhs {
  mov RAX, [RBP-400]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3184
  mov RAX, 0x7fffffffffffffff
or_done_3184:
  mov [RBP-440], RAX ; [RBP-440] holds the variable ekbgrcmbfv_6280
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3181
  ;; or_rhs {
  mov RAX, [RBP-240]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3181
  mov RAX, 0x7fffffffffffffff
or_done_3181:
  mov [RBP-448], RAX ; [RBP-448] holds the variable cosjyhjiea_6286
  mov RAX, [RBP-240]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3177
  mov RAX, 0xffffffffffffffff
  jmp near done_3177
if_false_3177:
  mov RAX, [RBP-200]
done_3177:
  mov [RBP-456], RAX ; [RBP-456] holds the variable cnzitjbyse_6292
  mov RAX, [RBP-376]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-464], RAX ; [RBP-464] holds the variable fksikpwyag_6299
  mov RAX, 0xffffffffffffffff
  mov [RBP-472], RAX ; [RBP-472] holds the variable tuswqpbela_6305
  mov RAX, [RBP-408]
  mov [RBP-480], RAX ; [RBP-480] holds the variable tknucdurcc_6309
  mov RAX, [RBP-456]
  mov [RBP-488], RAX ; [RBP-488] holds the variable wkeaanmmbz_6313
  mov RAX, [RBP-472]
  mov [RBP-496], RAX ; [RBP-496] holds the variable njbegtbxjw_6256
  ;; or_lhs {
  mov RAX, -32
  mov R11, RAX
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_3168
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3168
_cmp_fail_3168:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3168:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3160
  ;; or_rhs {
  mov RAX, [RBP-376]
  mov [RBP-512], RAX ; [RBP-512] holds the variable odjxmxwpex_6326
  mov RAX, [RBP-400]
  mov [RBP-520], RAX ; [RBP-520] holds the variable kpcwdlfxfp_6330
  mov RAX, [RBP-376]
  mov [RBP-528], RAX ; [RBP-528] holds the variable cjyuuzqwos_6334
  mov RAX, [RBP-200]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3160
  mov RAX, 0x7fffffffffffffff
or_done_3160:
  mov [RBP-504], RAX ; [RBP-504] holds the variable skqinuuqqz_6318
  mov RAX, [RBP-376]
  mov R11, RAX
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_3157
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3157
_cmp_fail_3157:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3157:
  mov [RBP-512], RAX ; [RBP-512] holds the variable binop_6342
  mov RAX, [RBP-512]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3147
  mov RAX, [RBP-240]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3152
  mov RAX, [RBP-200]
  jmp near done_3152
if_false_3152:
  mov RAX, 0xffffffffffffffff
done_3152:
  jmp near done_3147
if_false_3147:
  mov RAX, [RBP-240]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3148
  mov RAX, [RBP-200]
  jmp near done_3148
if_false_3148:
  mov RAX, [RBP-496]
done_3148:
done_3147:
  mov [RBP-520], RAX ; [RBP-520] holds the variable cpudwxkjwf_6339
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3143
  mov RAX, [RBP-496]
  jmp near done_3143
if_false_3143:
  mov RAX, [RBP-504]
done_3143:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3139
  ;; or_rhs {
  ;; and_lhs {
  mov RAX, [RBP-504]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3140
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3140
  mov RAX, 0xffffffffffffffff
and_done_3140:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3139
  mov RAX, 0x7fffffffffffffff
or_done_3139:
  mov [RBP-528], RAX ; [RBP-528] holds the variable viyjdxqwxo_6212
  mov RAX, [RBP-328]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-536], RAX ; [RBP-536] holds the variable unary_6366
  mov RAX, [RBP-536]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-544], RAX ; [RBP-544] holds the variable unary_6365
  mov RAX, [RBP-544]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-552], RAX ; [RBP-552] holds the variable sqebqyfoxx_6362
  mov RAX, [RBP-328]
  mov R11, RAX
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_3130
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3130
_cmp_fail_3130:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3130:
  mov [RBP-560], RAX ; [RBP-560] holds the variable oesdmbqgbz_6374
  mov RAX, [RBP-328]
  mov R11, RAX
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_3127
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3127
_cmp_fail_3127:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3127:
  mov [RBP-568], RAX ; [RBP-568] holds the variable uamwvovcsg_6380
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3123
  mov RAX, [RBP-528]
  jmp near done_3123
if_false_3123:
  mov RAX, [RBP-240]
done_3123:
  mov [RBP-576], RAX ; [RBP-576] holds the variable rmrwyhsjbk_6386
  mov RAX, -24
  mov [RBP-584], RAX ; [RBP-584] holds the variable fgkybagvih_6394
  mov RAX, [RBP-576]
  mov [RBP-592], RAX ; [RBP-592] holds the variable kybrfazzys_6398
  mov RAX, [RBP-552]
  mov [RBP-600], RAX ; [RBP-600] holds the variable qgyjzmedhd_6402
  mov RAX, 0xffffffffffffffff
  mov [RBP-608], RAX ; [RBP-608] holds the variable ubasyloehk_6406
  mov RAX, [RBP-568]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3061
  mov RAX, [RBP-552]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-624], RAX ; [RBP-624] holds the variable binop_6411
  mov RAX, [RBP-624]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  jmp near done_3061
if_false_3061:
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3109
  ;; or_rhs {
  mov RAX, [RBP-528]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3109
  mov RAX, 0x7fffffffffffffff
or_done_3109:
  mov [RBP-624], RAX ; [RBP-624] holds the variable ibcepqthsa_6416
  mov RAX, [RBP-552]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-632], RAX ; [RBP-632] holds the variable redxaufzay_6422
  mov RAX, 0xffffffffffffffff
  mov [RBP-640], RAX ; [RBP-640] holds the variable gmomrdnqba_6431
  mov RAX, [RBP-328]
  mov [RBP-648], RAX ; [RBP-648] holds the variable gqtvxyzkbj_6435
  mov RAX, [RBP-552]
  mov [RBP-656], RAX ; [RBP-656] holds the variable ulgjehjkcm_6439
  mov RAX, [RBP-240]
  mov [RBP-664], RAX ; [RBP-664] holds the variable bjlliuilhy_6443
  mov RAX, [RBP-632]
  mov [RBP-672], RAX ; [RBP-672] holds the variable fnbnyloopy_6447
  mov RAX, [RBP-240]
  mov [RBP-680], RAX ; [RBP-680] holds the variable eijyqijxdq_6451
  mov RAX, [RBP-680]
  mov [RBP-688], RAX ; [RBP-688] holds the variable waviaqtdev_6455
  mov RAX, -104
  mov [RBP-696], RAX ; [RBP-696] holds the variable mnqaooefdq_6459
  mov RAX, [RBP-648]
  mov [RBP-704], RAX ; [RBP-704] holds the variable rxvkxytehv_6463
  mov RAX, [RBP-696]
  mov [RBP-712], RAX ; [RBP-712] holds the variable ozfnazyvah_6427
  mov RAX, [RBP-552]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-632]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-720], RAX ; [RBP-720] holds the variable pejtflutno_6468
  mov RAX, [RBP-328]
  mov [RBP-728], RAX ; [RBP-728] holds the variable gfjxuoyqsp_6478
  mov RAX, [RBP-240]
  mov [RBP-736], RAX ; [RBP-736] holds the variable hgoczkdjbi_6482
  mov RAX, [RBP-632]
  mov [RBP-744], RAX ; [RBP-744] holds the variable ratlwnsyfs_6474
  mov RAX, [RBP-240]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3087
  mov RAX, [RBP-528]
  jmp near done_3087
if_false_3087:
  mov RAX, [RBP-240]
done_3087:
  mov [RBP-752], RAX ; [RBP-752] holds the variable lgjtgniiij_6487
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3083
  mov RAX, [RBP-200]
  jmp near done_3083
if_false_3083:
  mov RAX, [RBP-624]
done_3083:
  mov [RBP-760], RAX ; [RBP-760] holds the variable tcohsicbfo_6494
  mov RAX, [RBP-720]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
done_3061:
  mov [RBP-616], RAX ; [RBP-616] holds the variable nmsvgfgrid_6369
  ;; and_lhs {
  mov RAX, [RBP-328]
  mov [RBP-632], RAX ; [RBP-632] holds the variable ejdksfgzui_6513
  mov RAX, [RBP-528]
  mov [RBP-640], RAX ; [RBP-640] holds the variable ouoemudnwb_6517
  mov RAX, [RBP-552]
  mov [RBP-648], RAX ; [RBP-648] holds the variable xlmzvaukua_6521
  mov RAX, [RBP-640]
  mov [RBP-656], RAX ; [RBP-656] holds the variable ubptdnrwde_6525
  mov RAX, 0xffffffffffffffff
  mov [RBP-664], RAX ; [RBP-664] holds the variable psazgmsrnb_6529
  mov RAX, [RBP-664]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3046
  ;; and_rhs {
  mov RAX, [RBP-552]
  mov R11, RAX
  mov RAX, -94
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_3047
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3047
_cmp_fail_3047:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3047:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_3046
  mov RAX, 0xffffffffffffffff
and_done_3046:
  mov [RBP-624], RAX ; [RBP-624] holds the variable mpmyxxewrv_6508
  mov RAX, [RBP-616]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-632], RAX ; [RBP-632] holds the variable binop_6540
  mov RAX, [RBP-632]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-640], RAX ; [RBP-640] holds the variable pqtcxwqked_6537
  ;; or_lhs {
  mov RAX, [RBP-624]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3037
  mov RAX, [RBP-528]
  jmp near done_3037
if_false_3037:
  mov RAX, 0x7fffffffffffffff
done_3037:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3032
  ;; or_rhs {
  mov RAX, [RBP-528]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3033
  mov RAX, [RBP-624]
  jmp near done_3033
if_false_3033:
  mov RAX, [RBP-200]
done_3033:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_3032
  mov RAX, 0x7fffffffffffffff
or_done_3032:
  mov [RBP-648], RAX ; [RBP-648] holds the variable oclykhwhvn_6504
  mov RAX, [RBP-200]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3028
  mov RAX, [RBP-328]
  jmp near done_3028
if_false_3028:
  mov RAX, [RBP-552]
done_3028:
  mov [RBP-656], RAX ; [RBP-656] holds the variable if_6560
  mov RAX, [RBP-552]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-664], RAX ; [RBP-664] holds the variable binop_6564
  mov RAX, [RBP-656]
  mov R11, RAX
  mov RAX, [RBP-664]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_3022
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_3022
_cmp_fail_3022:
  mov RAX, 0x7fffffffffffffff
_cmp_done_3022:
  mov [RBP-672], RAX ; [RBP-672] holds the variable vlyqbjsdlx_6557
  mov RAX, [RBP-528]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_3018
  mov RAX, [RBP-328]
  jmp near done_3018
if_false_3018:
  mov RAX, [RBP-552]
done_3018:
  mov [RBP-680], RAX ; [RBP-680] holds the variable if_6571
  mov RAX, [RBP-680]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-688], RAX ; [RBP-688] holds the variable fikyycvfxw_6568
  mov RAX, [RBP-688]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -4
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-696], RAX ; [RBP-696] holds the variable binop_6579
  mov RAX, [RBP-328]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-616]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-704], RAX ; [RBP-704] holds the variable binop_6582
  mov RAX, [RBP-696]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-704]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-712], RAX ; [RBP-712] holds the variable xhffmuttfg_6576
  mov RAX, [RBP-688]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-720], RAX ; [RBP-720] holds the variable ynjddqngsj_6590
  mov RAX, [RBP-616]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-728], RAX ; [RBP-728] holds the variable slxvaddcie_6595
  mov RAX, [RBP-200]
  mov [RBP-736], RAX ; [RBP-736] holds the variable urqomyarsh_6604
  mov RAX, 0
  mov [RBP-744], RAX ; [RBP-744] holds the variable rsqdpdtpuc_6608
  mov RAX, [RBP-240]
  mov [RBP-752], RAX ; [RBP-752] holds the variable hkushxgofz_6600
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2996
  mov RAX, [RBP-672]
  jmp near done_2996
if_false_2996:
  mov RAX, 0xffffffffffffffff
done_2996:
  mov [RBP-760], RAX ; [RBP-760] holds the variable narsbakevm_6613
  mov RAX, [RBP-712]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-728]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-768], RAX ; [RBP-768] holds the variable mowldpxrlk_6620
  mov RAX, [RBP-616]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-776], RAX ; [RBP-776] holds the variable nzvgdvrybc_6626
  mov RAX, [RBP-688]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-768]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-784], RAX ; [RBP-784] holds the variable lnuxeubbsk_6632
  mov RAX, [RBP-200]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2983
  mov RAX, [RBP-768]
  jmp near done_2983
if_false_2983:
  mov RAX, [RBP-688]
done_2983:
  mov [RBP-792], RAX ; [RBP-792] holds the variable xrztlipyvu_6638
  mov RAX, 146
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-616]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-800], RAX ; [RBP-800] holds the variable ysqwqiubww_6645
  mov RAX, 138
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 194
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-808], RAX ; [RBP-808] holds the variable eieterxdby_6651
  mov RAX, [RBP-784]
  mov R11, RAX
  mov RAX, [RBP-720]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_2974
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2974
_cmp_fail_2974:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2974:
  mov [RBP-816], RAX ; [RBP-816] holds the variable tlismirxwm_6586
  ;; or_lhs {
  ;; or_lhs {
  mov RAX, [RBP-200]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2971
  ;; or_rhs {
  mov RAX, [RBP-672]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2971
  mov RAX, 0x7fffffffffffffff
or_done_2971:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2967
  ;; or_rhs {
  ;; or_lhs {
  mov RAX, [RBP-200]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2968
  ;; or_rhs {
  mov RAX, [RBP-200]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2968
  mov RAX, 0x7fffffffffffffff
or_done_2968:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2967
  mov RAX, 0x7fffffffffffffff
or_done_2967:
  mov [RBP-824], RAX ; [RBP-824] holds the variable yhuksrvfgc_6660
  mov RAX, [RBP-648]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2963
  mov RAX, 174
  jmp near done_2963
if_false_2963:
  mov RAX, [RBP-552]
done_2963:
  mov [RBP-832], RAX ; [RBP-832] holds the variable pcazroundm_6674
  mov RAX, [RBP-616]
  mov R11, RAX
  mov RAX, -20
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_2960
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2960
_cmp_fail_2960:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2960:
  mov [RBP-840], RAX ; [RBP-840] holds the variable oxpgflddoc_6681
  mov RAX, [RBP-816]
  mov [RBP-848], RAX ; [RBP-848] holds the variable zrcwahzpgr_6691
  mov RAX, [RBP-616]
  mov [RBP-856], RAX ; [RBP-856] holds the variable zqlathtdik_6695
  mov RAX, [RBP-552]
  mov [RBP-864], RAX ; [RBP-864] holds the variable iywhkhwhan_6699
  mov RAX, [RBP-672]
  mov [RBP-872], RAX ; [RBP-872] holds the variable ywphcnarae_6703
  mov RAX, [RBP-848]
  mov [RBP-880], RAX ; [RBP-880] holds the variable aotmiusxwt_6707
  mov RAX, [RBP-712]
  mov [RBP-888], RAX ; [RBP-888] holds the variable xfuhwtpsqm_6711
  mov RAX, 0xffffffffffffffff
  mov [RBP-896], RAX ; [RBP-896] holds the variable cztwazpqox_6715
  mov RAX, [RBP-616]
  mov [RBP-904], RAX ; [RBP-904] holds the variable kwcbmyszdg_6719
  mov RAX, 54
  mov [RBP-912], RAX ; [RBP-912] holds the variable lttplykejv_6687
  mov RAX, [RBP-712]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 68
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-920], RAX ; [RBP-920] holds the variable udaguueylp_6724
  mov RAX, [RBP-552]
  mov R11, RAX
  mov RAX, [RBP-552]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_2945
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2945
_cmp_fail_2945:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2945:
  mov [RBP-928], RAX ; [RBP-928] holds the variable jrlfebveub_6730
  mov RAX, [RBP-240]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2941
  mov RAX, 0x7fffffffffffffff
  jmp near done_2941
if_false_2941:
  mov RAX, 0x7fffffffffffffff
done_2941:
  mov [RBP-936], RAX ; [RBP-936] holds the variable ewqzzppmwg_6736
  ;; or_lhs {
  mov RAX, [RBP-672]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2938
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2938
  mov RAX, 0x7fffffffffffffff
or_done_2938:
  mov [RBP-944], RAX ; [RBP-944] holds the variable pbehnzbece_6743
  mov RAX, [RBP-688]
  mov [RBP-952], RAX ; [RBP-952] holds the variable cvfrjxojbw_6753
  mov RAX, [RBP-672]
  mov [RBP-960], RAX ; [RBP-960] holds the variable qspzimmifq_6757
  mov RAX, [RBP-816]
  mov [RBP-968], RAX ; [RBP-968] holds the variable sanguwkkif_6761
  mov RAX, [RBP-832]
  mov [RBP-976], RAX ; [RBP-976] holds the variable pfeojngzwz_6765
  mov RAX, [RBP-240]
  mov [RBP-984], RAX ; [RBP-984] holds the variable rjoifnnzeq_6769
  mov RAX, [RBP-832]
  mov [RBP-992], RAX ; [RBP-992] holds the variable hqimmqgmew_6773
  mov RAX, [RBP-992]
  mov [RBP-1000], RAX ; [RBP-1000] holds the variable cdojefhlau_6777
  mov RAX, [RBP-968]
  mov [RBP-1008], RAX ; [RBP-1008] holds the variable jotpzivtct_6781
  mov RAX, [RBP-328]
  mov [RBP-1016], RAX ; [RBP-1016] holds the variable irzzjubjkl_6785
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1024], RAX ; [RBP-1024] holds the variable bglzywcsck_6749
  mov RAX, [RBP-240]
  mov [RBP-1032], RAX ; [RBP-1032] holds the variable yhaxunxfny_6794
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1040], RAX ; [RBP-1040] holds the variable yaplwraiot_6798
  mov RAX, [RBP-912]
  mov [RBP-1048], RAX ; [RBP-1048] holds the variable eehgjmhbyi_6802
  mov RAX, [RBP-1040]
  mov [RBP-1056], RAX ; [RBP-1056] holds the variable hwlqvavkir_6806
  mov RAX, [RBP-824]
  mov [RBP-1064], RAX ; [RBP-1064] holds the variable edpcgvtsit_6810
  mov RAX, [RBP-552]
  mov [RBP-1072], RAX ; [RBP-1072] holds the variable uqluzvdjfz_6814
  mov RAX, [RBP-328]
  mov [RBP-1080], RAX ; [RBP-1080] holds the variable kspfmztqat_6818
  mov RAX, [RBP-912]
  mov [RBP-1088], RAX ; [RBP-1088] holds the variable gigyaatiej_6790
  mov RAX, [RBP-672]
  mov [RBP-1096], RAX ; [RBP-1096] holds the variable luipihiubi_6827
  mov RAX, [RBP-912]
  mov [RBP-1104], RAX ; [RBP-1104] holds the variable ckdvznsmez_6831
  mov RAX, [RBP-928]
  mov [RBP-1112], RAX ; [RBP-1112] holds the variable ngddmwhiqg_6835
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1120], RAX ; [RBP-1120] holds the variable jxvsjnires_6839
  mov RAX, [RBP-688]
  mov [RBP-1128], RAX ; [RBP-1128] holds the variable fqqfqnlfwk_6843
  mov RAX, [RBP-936]
  mov [RBP-1136], RAX ; [RBP-1136] holds the variable enztdhvwem_6847
  mov RAX, [RBP-552]
  mov [RBP-1144], RAX ; [RBP-1144] holds the variable epfoprgrec_6851
  mov RAX, [RBP-688]
  mov [RBP-1152], RAX ; [RBP-1152] holds the variable tjhqmkthmn_6855
  mov RAX, [RBP-552]
  mov [RBP-1160], RAX ; [RBP-1160] holds the variable qisebsqddj_6823
  mov RAX, [RBP-688]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1160]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1168], RAX ; [RBP-1168] holds the variable qjkqqbcqrf_6670
  mov RAX, [RBP-688]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-688]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1176], RAX ; [RBP-1176] holds the variable binop_6866
  mov RAX, [RBP-1176]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1184], RAX ; [RBP-1184] holds the variable didqtjkzkx_6863
  mov RAX, [RBP-1168]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1192], RAX ; [RBP-1192] holds the variable binop_6873
  mov RAX, [RBP-328]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1200], RAX ; [RBP-1200] holds the variable unary_6876
  mov RAX, [RBP-1192]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1200]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1208], RAX ; [RBP-1208] holds the variable knzuhhavyg_6870
  mov RAX, [RBP-200]
  mov [RBP-1216], RAX ; [RBP-1216] holds the variable ytywgrskei_6881
  mov RAX, -174
  mov [RBP-1224], RAX ; [RBP-1224] holds the variable guzkabracb_6885
  mov RAX, [RBP-1224]
  mov [RBP-1232], RAX ; [RBP-1232] holds the variable xjstcljbgy_6889
  mov RAX, [RBP-688]
  mov [RBP-1240], RAX ; [RBP-1240] holds the variable qfpsxqvbrq_6893
  mov RAX, [RBP-1240]
  mov [RBP-1248], RAX ; [RBP-1248] holds the variable fegqeksagr_6897
  mov RAX, [RBP-328]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -152
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1256], RAX ; [RBP-1256] holds the variable binop_6901
  mov RAX, 134
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1256]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1264], RAX ; [RBP-1264] holds the variable hcrfgmytnk_6553
  mov RAX, [RBP-1264]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-552]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1272], RAX ; [RBP-1272] holds the variable binop_6909
  mov RAX, [RBP-648]
  mov [RBP-1280], RAX ; [RBP-1280] holds the variable kmwngadacp_6914
  mov RAX, [RBP-616]
  mov [RBP-1288], RAX ; [RBP-1288] holds the variable dvrxmlefoy_6918
  mov RAX, [RBP-648]
  mov [RBP-1296], RAX ; [RBP-1296] holds the variable qambplwavv_6922
  mov RAX, [RBP-328]
  mov [RBP-1304], RAX ; [RBP-1304] holds the variable jwjmhjnbww_6926
  mov RAX, [RBP-528]
  mov [RBP-1312], RAX ; [RBP-1312] holds the variable yvxrymuwgz_6930
  mov RAX, 160
  mov [RBP-1320], RAX ; [RBP-1320] holds the variable zzsmcjwymu_6934
  mov RAX, [RBP-200]
  mov [RBP-1328], RAX ; [RBP-1328] holds the variable hjkcwcpcyz_6938
  mov RAX, [RBP-648]
  mov [RBP-1336], RAX ; [RBP-1336] holds the variable bxyranhurs_6942
  mov RAX, [RBP-200]
  mov [RBP-1344], RAX ; [RBP-1344] holds the variable maxcpjkajz_6946
  mov RAX, [RBP-1272]
  mov R11, RAX
  mov RAX, [RBP-1304]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_2869
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2869
_cmp_fail_2869:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2869:
  mov [RBP-1352], RAX ; [RBP-1352] holds the variable binop_6908
  mov RAX, [RBP-1352]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2789
  mov RAX, [RBP-328]
  mov [RBP-1368], RAX ; [RBP-1368] holds the variable soseymitab_6956
  mov RAX, [RBP-616]
  mov [RBP-1376], RAX ; [RBP-1376] holds the variable ypjxqkddbt_6952
  mov RAX, [RBP-1264]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1384], RAX ; [RBP-1384] holds the variable drsxvudogo_6961
  ;; or_lhs {
  mov RAX, [RBP-648]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2860
  ;; or_rhs {
  mov RAX, [RBP-528]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2860
  mov RAX, 0x7fffffffffffffff
or_done_2860:
  mov [RBP-1392], RAX ; [RBP-1392] holds the variable vjqyuxrmfn_6967
  mov RAX, [RBP-616]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1400], RAX ; [RBP-1400] holds the variable sbrzrqtrpr_6973
  ;; and_lhs {
  mov RAX, [RBP-240]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2855
  ;; and_rhs {
  mov RAX, [RBP-648]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2855
  mov RAX, 0xffffffffffffffff
and_done_2855:
  mov [RBP-1408], RAX ; [RBP-1408] holds the variable ybdwhwispd_6978
  mov RAX, [RBP-200]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2851
  mov RAX, [RBP-528]
  jmp near done_2851
if_false_2851:
  mov RAX, 0x7fffffffffffffff
done_2851:
  mov [RBP-1416], RAX ; [RBP-1416] holds the variable njhymgxjes_6984
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2848
  ;; or_rhs {
  mov RAX, [RBP-1392]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2848
  mov RAX, 0x7fffffffffffffff
or_done_2848:
  mov [RBP-1424], RAX ; [RBP-1424] holds the variable htearudkqh_6991
  mov RAX, [RBP-552]
  mov R11, RAX
  mov RAX, [RBP-1384]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_2845
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2845
_cmp_fail_2845:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2845:
  mov [RBP-1432], RAX ; [RBP-1432] holds the variable lgeaobymnm_6997
  mov RAX, [RBP-1376]
  mov R11, RAX
  mov RAX, [RBP-1384]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_2842
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2842
_cmp_fail_2842:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2842:
  jmp near done_2789
if_false_2789:
  ;; and_lhs {
  mov RAX, [RBP-1264]
  mov [RBP-1368], RAX ; [RBP-1368] holds the variable fwguhbgtcm_7008
  mov RAX, [RBP-528]
  mov [RBP-1376], RAX ; [RBP-1376] holds the variable bwygtzhsof_7012
  mov RAX, [RBP-1376]
  mov [RBP-1384], RAX ; [RBP-1384] holds the variable dedcmlwfls_7016
  mov RAX, [RBP-200]
  mov [RBP-1392], RAX ; [RBP-1392] holds the variable msxlgksleg_7020
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1400], RAX ; [RBP-1400] holds the variable irgfgmqyed_7024
  mov RAX, [RBP-328]
  mov [RBP-1408], RAX ; [RBP-1408] holds the variable kqgzaxruca_7028
  mov RAX, [RBP-528]
  mov [RBP-1416], RAX ; [RBP-1416] holds the variable sibdwykuqd_7032
  mov RAX, [RBP-616]
  mov [RBP-1424], RAX ; [RBP-1424] holds the variable heryfisfkv_7036
  mov RAX, [RBP-1392]
  mov [RBP-1432], RAX ; [RBP-1432] holds the variable brmsogygxv_7040
  mov RAX, [RBP-528]
  mov [RBP-1440], RAX ; [RBP-1440] holds the variable uudxbblbay_7044
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2790
  ;; and_rhs {
  mov RAX, [RBP-648]
  mov [RBP-1368], RAX ; [RBP-1368] holds the variable ohsdpfealn_7050
  mov RAX, 16
  mov [RBP-1376], RAX ; [RBP-1376] holds the variable wpbwnurfkk_7054
  mov RAX, [RBP-528]
  mov [RBP-1384], RAX ; [RBP-1384] holds the variable guzzertssz_7058
  mov RAX, [RBP-616]
  mov [RBP-1392], RAX ; [RBP-1392] holds the variable jpsccrgxee_7062
  mov RAX, [RBP-1264]
  mov [RBP-1400], RAX ; [RBP-1400] holds the variable zulnjepwfc_7066
  mov RAX, -42
  mov [RBP-1408], RAX ; [RBP-1408] holds the variable twlpgafbun_7070
  mov RAX, [RBP-528]
  mov [RBP-1416], RAX ; [RBP-1416] holds the variable ohxaqvxjfj_7074
  mov RAX, 0xffffffffffffffff
  mov [RBP-1424], RAX ; [RBP-1424] holds the variable qaimjfiqby_7078
  mov RAX, [RBP-1384]
  mov [RBP-1432], RAX ; [RBP-1432] holds the variable xpmtnfvpaa_7082
  mov RAX, [RBP-1400]
  mov [RBP-1440], RAX ; [RBP-1440] holds the variable cfmhlvdsrz_7086
  mov RAX, [RBP-528]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2790
  mov RAX, 0xffffffffffffffff
and_done_2790:
done_2789:
  mov [RBP-1360], RAX ; [RBP-1360] holds the variable ilkcfqfnbt_6905
  mov RAX, 78
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1264]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1368], RAX ; [RBP-1368] holds the variable binop_7098
  mov RAX, [RBP-1368]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1376], RAX ; [RBP-1376] holds the variable cggppibopy_7095
  mov RAX, [RBP-328]
  mov [RBP-1384], RAX ; [RBP-1384] holds the variable qlqkvgxcvy_7110
  mov RAX, [RBP-240]
  mov [RBP-1392], RAX ; [RBP-1392] holds the variable ezxyicwses_7114
  mov RAX, [RBP-648]
  mov [RBP-1400], RAX ; [RBP-1400] holds the variable aaypreafpq_7118
  mov RAX, [RBP-1392]
  mov [RBP-1408], RAX ; [RBP-1408] holds the variable xdgjozoqzp_7122
  mov RAX, [RBP-552]
  mov [RBP-1416], RAX ; [RBP-1416] holds the variable dgznghcavq_7126
  mov RAX, 78
  mov [RBP-1424], RAX ; [RBP-1424] holds the variable qkyvqfunvx_7130
  mov RAX, [RBP-328]
  mov [RBP-1432], RAX ; [RBP-1432] holds the variable nfwaklhqtk_7134
  mov RAX, [RBP-328]
  mov [RBP-1440], RAX ; [RBP-1440] holds the variable qdhtenhzxp_7138
  mov RAX, [RBP-1408]
  mov [RBP-1448], RAX ; [RBP-1448] holds the variable fwlmomuocn_7142
  mov RAX, 112
  mov [RBP-1456], RAX ; [RBP-1456] holds the variable frhmnwawpn_7146
  mov RAX, 0xffffffffffffffff
  mov [RBP-1464], RAX ; [RBP-1464] holds the variable wjwvgmfdmj_7106
  mov RAX, [RBP-528]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2769
  mov RAX, [RBP-648]
  jmp near done_2769
if_false_2769:
  mov RAX, [RBP-240]
done_2769:
  mov [RBP-1472], RAX ; [RBP-1472] holds the variable cueouzlgcs_7151
  mov RAX, [RBP-552]
  mov R11, RAX
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_2766
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2766
_cmp_fail_2766:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2766:
  mov [RBP-1480], RAX ; [RBP-1480] holds the variable ccdaclxdbb_7158
  mov RAX, [RBP-1472]
  mov [RBP-1488], RAX ; [RBP-1488] holds the variable nathavkthk_7165
  mov RAX, [RBP-1264]
  mov [RBP-1496], RAX ; [RBP-1496] holds the variable gvyjwfvhap_7169
  mov RAX, [RBP-1360]
  mov [RBP-1504], RAX ; [RBP-1504] holds the variable ulszsbvbvj_7173
  mov RAX, 0xffffffffffffffff
  mov [RBP-1512], RAX ; [RBP-1512] holds the variable fjkcvnrxdl_7102
  mov RAX, [RBP-1360]
  mov [RBP-1520], RAX ; [RBP-1520] holds the variable ngoszujuzc_7183
  mov RAX, [RBP-328]
  mov [RBP-1528], RAX ; [RBP-1528] holds the variable zinsqotpab_7187
  mov RAX, [RBP-200]
  mov [RBP-1536], RAX ; [RBP-1536] holds the variable gqzztilzpp_7191
  mov RAX, 0xffffffffffffffff
  mov [RBP-1544], RAX ; [RBP-1544] holds the variable hdxvlotqhd_7195
  mov RAX, [RBP-616]
  mov [RBP-1552], RAX ; [RBP-1552] holds the variable dgohlebhyh_7199
  mov RAX, [RBP-200]
  mov [RBP-1560], RAX ; [RBP-1560] holds the variable fzowrswtiz_7203
  mov RAX, [RBP-1264]
  mov [RBP-1568], RAX ; [RBP-1568] holds the variable vvgkxryiqe_7207
  mov RAX, [RBP-328]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1576], RAX ; [RBP-1576] holds the variable unary_7211
  mov RAX, [RBP-1376]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1576]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1584], RAX ; [RBP-1584] holds the variable qpblcbgfbw_7178
  mov RAX, [RBP-200]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2746
  mov RAX, [RBP-616]
  jmp near done_2746
if_false_2746:
  mov RAX, [RBP-616]
done_2746:
  mov [RBP-1592], RAX ; [RBP-1592] holds the variable if_7217
  mov RAX, [RBP-1592]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1600], RAX ; [RBP-1600] holds the variable xjnojawdtl_7214
  mov RAX, -88
  mov R11, RAX
  mov RAX, [RBP-1600]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_2741
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2741
_cmp_fail_2741:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2741:
  mov [RBP-1608], RAX ; [RBP-1608] holds the variable binop_7225
  mov RAX, [RBP-1608]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2732
  mov RAX, -4
  mov R11, RAX
  mov RAX, [RBP-616]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_2737
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2737
_cmp_fail_2737:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2737:
  jmp near done_2732
if_false_2732:
  mov RAX, [RBP-648]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2733
  mov RAX, [RBP-1512]
  jmp near done_2733
if_false_2733:
  mov RAX, 0x7fffffffffffffff
done_2733:
done_2732:
  mov [RBP-1616], RAX ; [RBP-1616] holds the variable qmawwzgffl_7222
  mov RAX, 0xffffffffffffffff
  mov [RBP-1624], RAX ; [RBP-1624] holds the variable tvwfoytsxp_7244
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1632], RAX ; [RBP-1632] holds the variable jkqjsoadoz_7240
  mov RAX, [RBP-528]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2726
  mov RAX, 0x7fffffffffffffff
  jmp near done_2726
if_false_2726:
  mov RAX, [RBP-648]
done_2726:
  mov [RBP-1640], RAX ; [RBP-1640] holds the variable iwfaoxleso_7249
  ;; and_lhs {
  mov RAX, [RBP-528]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2723
  ;; and_rhs {
  mov RAX, [RBP-528]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2723
  mov RAX, 0xffffffffffffffff
and_done_2723:
  mov [RBP-1648], RAX ; [RBP-1648] holds the variable trpcyglmai_7256
  mov RAX, 40
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1656], RAX ; [RBP-1656] holds the variable tltiuqjpxt_7262
  mov RAX, [RBP-1584]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1264]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1664], RAX ; [RBP-1664] holds the variable jbopftxwuo_7267
  mov RAX, [RBP-1264]
  mov [RBP-1672], RAX ; [RBP-1672] holds the variable xwzpywjsjq_7274
  mov RAX, [RBP-648]
  mov [RBP-1680], RAX ; [RBP-1680] holds the variable bymugvbjbw_7278
  mov RAX, [RBP-1360]
  mov [RBP-1688], RAX ; [RBP-1688] holds the variable eukoordwoq_7282
  mov RAX, [RBP-616]
  mov [RBP-1696], RAX ; [RBP-1696] holds the variable ztqmfjnmcy_7286
  mov RAX, [RBP-1264]
  mov [RBP-1704], RAX ; [RBP-1704] holds the variable paljqsklxz_7290
  mov RAX, [RBP-1376]
  mov [RBP-1712], RAX ; [RBP-1712] holds the variable entooselrh_7236
  mov RAX, -102
  mov [RBP-1720], RAX ; [RBP-1720] holds the variable phfnzrbbsp_7300
  mov RAX, [RBP-1360]
  mov [RBP-1728], RAX ; [RBP-1728] holds the variable kugcftowak_7304
  mov RAX, [RBP-528]
  mov [RBP-1736], RAX ; [RBP-1736] holds the variable cihmypklmr_7308
  mov RAX, [RBP-552]
  mov [RBP-1744], RAX ; [RBP-1744] holds the variable hjxfamjalj_7312
  mov RAX, [RBP-1712]
  mov [RBP-1752], RAX ; [RBP-1752] holds the variable ghpwshewmm_7316
  mov RAX, [RBP-1600]
  mov [RBP-1760], RAX ; [RBP-1760] holds the variable sqbwwxvafs_7322
  mov RAX, 198
  mov R11, RAX
  mov RAX, 152
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_2703
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2703
_cmp_fail_2703:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2703:
  mov [RBP-1768], RAX ; [RBP-1768] holds the variable eecjmdpdos_7295
  mov RAX, [RBP-1264]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1376]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1776], RAX ; [RBP-1776] holds the variable vezejiqvcq_7331
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2697
  ;; or_rhs {
  mov RAX, [RBP-528]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2697
  mov RAX, 0x7fffffffffffffff
or_done_2697:
  mov [RBP-1784], RAX ; [RBP-1784] holds the variable pggealmalt_7337
  mov RAX, [RBP-1776]
  mov R11, RAX
  mov RAX, -106
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_2694
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2694
_cmp_fail_2694:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2694:
  mov [RBP-1792], RAX ; [RBP-1792] holds the variable fwacysqnpc_7343
  mov RAX, [RBP-552]
  mov R11, RAX
  mov RAX, [RBP-552]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_2691
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2691
_cmp_fail_2691:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2691:
  mov [RBP-1800], RAX ; [RBP-1800] holds the variable buwskbpnej_7349
  mov RAX, [RBP-1712]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1712]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1808], RAX ; [RBP-1808] holds the variable hiljbsncgg_7355
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2685
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2685
  mov RAX, 0x7fffffffffffffff
or_done_2685:
  mov [RBP-1816], RAX ; [RBP-1816] holds the variable mffnjqwegv_7361
  mov RAX, [RBP-1776]
  mov [RBP-1824], RAX ; [RBP-1824] holds the variable olglmwmxwu_7371
  mov RAX, [RBP-1792]
  mov [RBP-1832], RAX ; [RBP-1832] holds the variable jxpvbooygk_7375
  mov RAX, [RBP-1784]
  mov [RBP-1840], RAX ; [RBP-1840] holds the variable baveouzfgf_7379
  mov RAX, [RBP-1792]
  mov [RBP-1848], RAX ; [RBP-1848] holds the variable krkfocchnk_7367
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2677
  mov RAX, [RBP-1768]
  jmp near done_2677
if_false_2677:
  mov RAX, [RBP-1816]
done_2677:
  mov [RBP-1856], RAX ; [RBP-1856] holds the variable lbgkzmwwym_7384
  mov RAX, [RBP-552]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1864], RAX ; [RBP-1864] holds the variable tkcikjtqxb_7391
  mov RAX, 88
  mov R11, RAX
  mov RAX, 86
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_2672
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2672
_cmp_fail_2672:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2672:
  mov [RBP-1872], RAX ; [RBP-1872] holds the variable xayhorhakz_7327
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2668
  mov RAX, -198
  jmp near done_2668
if_false_2668:
  mov RAX, [RBP-1264]
done_2668:
  mov [RBP-1880], RAX ; [RBP-1880] holds the variable if_7402
  mov RAX, [RBP-1712]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1584]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1888], RAX ; [RBP-1888] holds the variable binop_7406
  mov RAX, [RBP-1880]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1888]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1896], RAX ; [RBP-1896] holds the variable hsgwnpdzpg_7399
  mov RAX, [RBP-1896]
  mov R11, RAX
  mov RAX, -54
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_2659
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2659
_cmp_fail_2659:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2659:
  mov [RBP-1904], RAX ; [RBP-1904] holds the variable binop_7410
  mov RAX, [RBP-1904]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2641
  mov RAX, [RBP-1872]
  mov [RBP-1920], RAX ; [RBP-1920] holds the variable zcftlhjzdc_7415
  mov RAX, [RBP-616]
  mov [RBP-1928], RAX ; [RBP-1928] holds the variable qyqbkwbkkw_7419
  mov RAX, [RBP-1600]
  mov [RBP-1936], RAX ; [RBP-1936] holds the variable bqklmgoxiu_7423
  mov RAX, [RBP-528]
  mov [RBP-1944], RAX ; [RBP-1944] holds the variable mgemjobdmx_7427
  mov RAX, 0xffffffffffffffff
  mov [RBP-1952], RAX ; [RBP-1952] holds the variable trbuehsguu_7431
  mov RAX, [RBP-1896]
  mov [RBP-1960], RAX ; [RBP-1960] holds the variable guvkrjkgso_7435
  mov RAX, 0xffffffffffffffff
  jmp near done_2641
if_false_2641:
  ;; or_lhs {
  mov RAX, [RBP-1360]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2642
  ;; or_rhs {
  mov RAX, [RBP-200]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2642
  mov RAX, 0x7fffffffffffffff
or_done_2642:
done_2641:
  mov [RBP-1912], RAX ; [RBP-1912] holds the variable jxwpappkye_7091
  mov RAX, [RBP-616]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1920], RAX ; [RBP-1920] holds the variable unary_7447
  mov RAX, -52
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1928], RAX ; [RBP-1928] holds the variable binop_7449
  mov RAX, [RBP-1920]
  mov R11, RAX
  mov RAX, [RBP-1928]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_2633
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2633
_cmp_fail_2633:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2633:
  mov [RBP-1936], RAX ; [RBP-1936] holds the variable sucfrpprdp_7444
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2630
  ;; or_rhs {
  mov RAX, [RBP-528]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2630
  mov RAX, 0x7fffffffffffffff
or_done_2630:
  mov [RBP-1944], RAX ; [RBP-1944] holds the variable lbntirxuqh_7457
  mov RAX, [RBP-616]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 70
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1952], RAX ; [RBP-1952] holds the variable spchygzove_7463
  mov RAX, [RBP-648]
  mov [RBP-1960], RAX ; [RBP-1960] holds the variable ouyerpujcd_7473
  mov RAX, [RBP-1936]
  mov [RBP-1968], RAX ; [RBP-1968] holds the variable wpecaazuni_7477
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1976], RAX ; [RBP-1976] holds the variable dvbvsqshru_7469
  mov RAX, -136
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1264]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1984], RAX ; [RBP-1984] holds the variable iwgdsvalcg_7482
  mov RAX, [RBP-528]
  mov [RBP-1992], RAX ; [RBP-1992] holds the variable vlyzeqazgc_7492
  mov RAX, [RBP-616]
  mov [RBP-2000], RAX ; [RBP-2000] holds the variable xyjqdbvsav_7496
  mov RAX, 98
  mov [RBP-2008], RAX ; [RBP-2008] holds the variable hgfbytrneq_7500
  mov RAX, [RBP-1360]
  mov [RBP-2016], RAX ; [RBP-2016] holds the variable iymztgzqjm_7504
  mov RAX, -56
  mov [RBP-2024], RAX ; [RBP-2024] holds the variable xnckzhygxp_7508
  mov RAX, [RBP-2008]
  mov [RBP-2032], RAX ; [RBP-2032] holds the variable ijptreeown_7512
  mov RAX, [RBP-1936]
  mov [RBP-2040], RAX ; [RBP-2040] holds the variable vhsbkpjvno_7488
  mov RAX, [RBP-328]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2048], RAX ; [RBP-2048] holds the variable rifpxekeym_7517
  mov RAX, [RBP-1264]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2056], RAX ; [RBP-2056] holds the variable nmqcgaxuii_7522
  mov RAX, -156
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2064], RAX ; [RBP-2064] holds the variable jraragooqc_7527
  mov RAX, [RBP-616]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2072], RAX ; [RBP-2072] holds the variable tdtyfepzhv_7453
  mov RAX, [RBP-1936]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2602
  mov RAX, [RBP-240]
  jmp near done_2602
if_false_2602:
  mov RAX, [RBP-240]
done_2602:
  mov [RBP-2080], RAX ; [RBP-2080] holds the variable if_7534
  mov RAX, [RBP-2080]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2575
  mov RAX, [RBP-328]
  mov [RBP-2096], RAX ; [RBP-2096] holds the variable xcsothordh_7540
  mov RAX, [RBP-240]
  mov [RBP-2104], RAX ; [RBP-2104] holds the variable gkydxspszf_7544
  mov RAX, [RBP-328]
  mov [RBP-2112], RAX ; [RBP-2112] holds the variable xlcxltljzc_7548
  mov RAX, [RBP-528]
  mov [RBP-2120], RAX ; [RBP-2120] holds the variable ixurxmbhnc_7552
  mov RAX, -156
  mov [RBP-2128], RAX ; [RBP-2128] holds the variable oxlpkeczvq_7556
  mov RAX, [RBP-1936]
  mov [RBP-2136], RAX ; [RBP-2136] holds the variable hcbsjpgxpq_7560
  mov RAX, 0xffffffffffffffff
  mov [RBP-2144], RAX ; [RBP-2144] holds the variable bnkjwmrzrt_7564
  mov RAX, -24
  mov [RBP-2152], RAX ; [RBP-2152] holds the variable wugwlkahbm_7568
  mov RAX, [RBP-2144]
  mov [RBP-2160], RAX ; [RBP-2160] holds the variable gfsrfakzwe_7572
  mov RAX, [RBP-1264]
  mov [RBP-2168], RAX ; [RBP-2168] holds the variable mhkmsebnsj_7576
  mov RAX, [RBP-2160]
  jmp near done_2575
if_false_2575:
  mov RAX, [RBP-1360]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2576
  mov RAX, [RBP-200]
  jmp near done_2576
if_false_2576:
  mov RAX, 0xffffffffffffffff
done_2576:
done_2575:
  mov [RBP-2088], RAX ; [RBP-2088] holds the variable eiozpjvijq_6109
  ;; or_lhs {
  mov RAX, [RBP-2088]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2571
  mov RAX, 62
  jmp near done_2571
if_false_2571:
  mov RAX, -110
done_2571:
  mov [RBP-2104], RAX ; [RBP-2104] holds the variable if_7590
  mov RAX, [RBP-2104]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2112], RAX ; [RBP-2112] holds the variable unary_7589
  mov RAX, 112
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2120], RAX ; [RBP-2120] holds the variable unary_7595
  mov RAX, [RBP-2088]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2563
  mov RAX, -168
  jmp near done_2563
if_false_2563:
  mov RAX, 68
done_2563:
  mov [RBP-2128], RAX ; [RBP-2128] holds the variable if_7597
  mov RAX, [RBP-2120]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2128]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2136], RAX ; [RBP-2136] holds the variable binop_7594
  mov RAX, [RBP-2112]
  mov R11, RAX
  mov RAX, [RBP-2136]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_2557
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2557
_cmp_fail_2557:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2557:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2496
  ;; or_rhs {
  ;; or_lhs {
  mov RAX, -198
  mov [RBP-2112], RAX ; [RBP-2112] holds the variable xfqtbvresv_7605
  mov RAX, -158
  mov [RBP-2120], RAX ; [RBP-2120] holds the variable rgelxiyziw_7609
  mov RAX, [RBP-2120]
  mov [RBP-2128], RAX ; [RBP-2128] holds the variable rrjiszsdqw_7613
  mov RAX, [RBP-2112]
  mov [RBP-2136], RAX ; [RBP-2136] holds the variable byljgqvbms_7617
  mov RAX, [RBP-2120]
  mov [RBP-2144], RAX ; [RBP-2144] holds the variable kqdrxowhtr_7621
  mov RAX, [RBP-2088]
  mov [RBP-2152], RAX ; [RBP-2152] holds the variable ocyjqmupwr_7625
  mov RAX, [RBP-2128]
  mov [RBP-2160], RAX ; [RBP-2160] holds the variable occuhnprmu_7629
  mov RAX, [RBP-2152]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2533
  ;; or_rhs {
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2534
  ;; and_rhs {
  mov RAX, [RBP-2088]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2534
  mov RAX, 0xffffffffffffffff
and_done_2534:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2533
  mov RAX, 0x7fffffffffffffff
or_done_2533:
  mov [RBP-2104], RAX ; [RBP-2104] holds the variable binop_and_or_7602
  mov RAX, [RBP-2104]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2498
  mov RAX, -122
  mov [RBP-2112], RAX ; [RBP-2112] holds the variable tnuspjxysw_7639
  mov RAX, [RBP-2088]
  mov [RBP-2120], RAX ; [RBP-2120] holds the variable nxijcnihma_7643
  mov RAX, [RBP-2088]
  mov [RBP-2128], RAX ; [RBP-2128] holds the variable ogifmnykrh_7647
  mov RAX, 112
  mov [RBP-2136], RAX ; [RBP-2136] holds the variable tvsmygqdpy_7651
  mov RAX, [RBP-2112]
  mov [RBP-2144], RAX ; [RBP-2144] holds the variable rtknprgnvp_7655
  mov RAX, [RBP-2088]
  mov [RBP-2152], RAX ; [RBP-2152] holds the variable fhzmnajhth_7659
  mov RAX, [RBP-2144]
  mov [RBP-2160], RAX ; [RBP-2160] holds the variable kzeeggrqpf_7663
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2168], RAX ; [RBP-2168] holds the variable xztjqgyuqm_7667
  mov RAX, -52
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 14
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2176], RAX ; [RBP-2176] holds the variable binop_7671
  mov RAX, [RBP-2160]
  mov R11, RAX
  mov RAX, [RBP-2176]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_2518
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2518
_cmp_fail_2518:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2518:
  jmp near done_2498
if_false_2498:
  mov RAX, -8
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2112], RAX ; [RBP-2112] holds the variable unary_7675
  mov RAX, 72
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -172
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2120], RAX ; [RBP-2120] holds the variable binop_7677
  mov RAX, [RBP-2112]
  mov R11, RAX
  mov RAX, [RBP-2120]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_2501
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2501
_cmp_fail_2501:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2501:
done_2498:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2496
  mov RAX, 0x7fffffffffffffff
or_done_2496:
  mov [RBP-2096], RAX ; [RBP-2096] holds the variable raxtzyvouc_7585
  mov RAX, -10
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2104], RAX ; [RBP-2104] holds the variable jburwpsyfb_7690
  mov RAX, [RBP-2088]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2490
  mov RAX, [RBP-2088]
  jmp near done_2490
if_false_2490:
  mov RAX, 0x7fffffffffffffff
done_2490:
  mov [RBP-2112], RAX ; [RBP-2112] holds the variable oryekyalgi_7695
  ;; and_lhs {
  mov RAX, [RBP-2112]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2487
  ;; and_rhs {
  mov RAX, [RBP-2112]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2487
  mov RAX, 0xffffffffffffffff
and_done_2487:
  mov [RBP-2120], RAX ; [RBP-2120] holds the variable plwjwooxcw_7702
  mov RAX, [RBP-2104]
  mov R11, RAX
  mov RAX, -84
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_2484
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2484
_cmp_fail_2484:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2484:
  mov [RBP-2128], RAX ; [RBP-2128] holds the variable oecwdraekf_7708
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2481
  ;; and_rhs {
  mov RAX, [RBP-2120]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2481
  mov RAX, 0xffffffffffffffff
and_done_2481:
  mov [RBP-2136], RAX ; [RBP-2136] holds the variable foqdntzces_7714
  mov RAX, [RBP-2136]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2477
  mov RAX, 0x7fffffffffffffff
  jmp near done_2477
if_false_2477:
  mov RAX, [RBP-2096]
done_2477:
  mov [RBP-2144], RAX ; [RBP-2144] holds the variable xlugpfirzj_7720
  mov RAX, -154
  mov [RBP-2152], RAX ; [RBP-2152] holds the variable khwawaykno_7731
  mov RAX, [RBP-2096]
  mov [RBP-2160], RAX ; [RBP-2160] holds the variable yrdkzkztzl_7735
  mov RAX, 0xffffffffffffffff
  mov [RBP-2168], RAX ; [RBP-2168] holds the variable ybriyfcvwm_7739
  mov RAX, 0xffffffffffffffff
  mov [RBP-2176], RAX ; [RBP-2176] holds the variable dubrqdqwfb_7727
  mov RAX, [RBP-2104]
  mov [RBP-2184], RAX ; [RBP-2184] holds the variable jgpxrgtlor_7745
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2192], RAX ; [RBP-2192] holds the variable nraakhhjfk_7749
  mov RAX, [RBP-2184]
  mov [RBP-2200], RAX ; [RBP-2200] holds the variable txgohzlcza_7753
  mov RAX, [RBP-2096]
  mov [RBP-2208], RAX ; [RBP-2208] holds the variable oynisabhsb_7686
  mov RAX, -58
  mov [RBP-2216], RAX ; [RBP-2216] holds the variable wqelwjztxw_7766
  mov RAX, [RBP-2096]
  mov [RBP-2224], RAX ; [RBP-2224] holds the variable rqhekjbcdd_7770
  mov RAX, [RBP-2096]
  mov [RBP-2232], RAX ; [RBP-2232] holds the variable vvufpgoltk_7774
  mov RAX, [RBP-2088]
  mov [RBP-2240], RAX ; [RBP-2240] holds the variable kcxuqkszsh_7778
  mov RAX, [RBP-2216]
  mov [RBP-2248], RAX ; [RBP-2248] holds the variable vbqfeqewje_7782
  mov RAX, [RBP-2224]
  mov [RBP-2256], RAX ; [RBP-2256] holds the variable mzvegxlbtc_7786
  mov RAX, 0xffffffffffffffff
  mov [RBP-2264], RAX ; [RBP-2264] holds the variable ljpoixjkyx_7790
  mov RAX, [RBP-2216]
  mov [RBP-2272], RAX ; [RBP-2272] holds the variable opvqsqpwaf_7762
  mov RAX, [RBP-2208]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2457
  mov RAX, [RBP-2272]
  jmp near done_2457
if_false_2457:
  mov RAX, [RBP-2272]
done_2457:
  mov [RBP-2280], RAX ; [RBP-2280] holds the variable txzqhuaafr_7795
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2453
  mov RAX, [RBP-2088]
  jmp near done_2453
if_false_2453:
  mov RAX, [RBP-2088]
done_2453:
  mov [RBP-2288], RAX ; [RBP-2288] holds the variable uopngepylh_7802
  mov RAX, [RBP-2280]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 146
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2296], RAX ; [RBP-2296] holds the variable okjrnscuhi_7758
  mov RAX, [RBP-2096]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2446
  mov RAX, [RBP-2296]
  jmp near done_2446
if_false_2446:
  mov RAX, [RBP-2296]
done_2446:
  mov [RBP-2304], RAX ; [RBP-2304] holds the variable if_7812
  mov RAX, [RBP-2304]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2312], RAX ; [RBP-2312] holds the variable unary_7811
  mov RAX, [RBP-2312]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2320], RAX ; [RBP-2320] holds the variable kdxsvmlqml_7681
  mov RAX, [RBP-2320]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2328], RAX ; [RBP-2328] holds the variable unary_7822
  mov RAX, [RBP-2320]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2320]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2336], RAX ; [RBP-2336] holds the variable binop_7824
  mov RAX, [RBP-2328]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2336]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2344], RAX ; [RBP-2344] holds the variable binop_7821
  mov RAX, [RBP-2088]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2430
  mov RAX, -180
  jmp near done_2430
if_false_2430:
  mov RAX, [RBP-2320]
done_2430:
  mov [RBP-2352], RAX ; [RBP-2352] holds the variable if_7828
  mov RAX, [RBP-2320]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2320]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2360], RAX ; [RBP-2360] holds the variable binop_7832
  mov RAX, [RBP-2352]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2360]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2368], RAX ; [RBP-2368] holds the variable binop_7827
  mov RAX, [RBP-2344]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2368]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2376], RAX ; [RBP-2376] holds the variable binop_7820
  mov RAX, [RBP-2320]
  mov R11, RAX
  mov RAX, -190
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_2418
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2418
_cmp_fail_2418:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2418:
  mov [RBP-2384], RAX ; [RBP-2384] holds the variable lfbkbmwlys_7838
  mov RAX, [RBP-2320]
  mov [RBP-2392], RAX ; [RBP-2392] holds the variable kuepsavnfu_7848
  mov RAX, [RBP-2088]
  mov [RBP-2400], RAX ; [RBP-2400] holds the variable pjdazkwdee_7852
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2408], RAX ; [RBP-2408] holds the variable ylvbclmrup_7856
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2416], RAX ; [RBP-2416] holds the variable ahrqmidrsc_7860
  mov RAX, [RBP-2392]
  mov [RBP-2424], RAX ; [RBP-2424] holds the variable ypjkqamfqp_7864
  mov RAX, [RBP-2408]
  mov [RBP-2432], RAX ; [RBP-2432] holds the variable esrysclcgl_7844
  mov RAX, 164
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2440], RAX ; [RBP-2440] holds the variable ubgrswinpt_7869
  mov RAX, [RBP-2096]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2406
  mov RAX, [RBP-2384]
  jmp near done_2406
if_false_2406:
  mov RAX, 0xffffffffffffffff
done_2406:
  mov [RBP-2448], RAX ; [RBP-2448] holds the variable uvwapiwjwe_7874
  mov RAX, -74
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2456], RAX ; [RBP-2456] holds the variable pkdysnxgvm_7881
  mov RAX, [RBP-2320]
  mov R11, RAX
  mov RAX, -76
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_2401
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2401
_cmp_fail_2401:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2401:
  mov [RBP-2464], RAX ; [RBP-2464] holds the variable ytwcrnrdie_7886
  mov RAX, [RBP-2320]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2456]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2472], RAX ; [RBP-2472] holds the variable iepnhcyryd_7892
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2395
  ;; and_rhs {
  mov RAX, [RBP-2088]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2395
  mov RAX, 0xffffffffffffffff
and_done_2395:
  mov [RBP-2480], RAX ; [RBP-2480] holds the variable binop_and_or_7897
  mov RAX, [RBP-2480]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2363
  mov RAX, [RBP-2320]
  mov R11, RAX
  mov RAX, [RBP-2320]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_2391
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2391
_cmp_fail_2391:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2391:
  mov [RBP-2496], RAX ; [RBP-2496] holds the variable binop_7901
  mov RAX, [RBP-2496]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2382
  mov RAX, [RBP-2088]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2386
  mov RAX, [RBP-2320]
  jmp near done_2386
if_false_2386:
  mov RAX, -140
done_2386:
  jmp near done_2382
if_false_2382:
  mov RAX, -142
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2320]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
done_2382:
  jmp near done_2363
if_false_2363:
  mov RAX, [RBP-2320]
  mov [RBP-2496], RAX ; [RBP-2496] holds the variable vkcvvrario_7914
  mov RAX, -120
  mov [RBP-2504], RAX ; [RBP-2504] holds the variable cmwpzuarwg_7918
  mov RAX, [RBP-2096]
  mov [RBP-2512], RAX ; [RBP-2512] holds the variable zmnlgyligd_7922
  mov RAX, [RBP-2504]
  mov [RBP-2520], RAX ; [RBP-2520] holds the variable qhgpmufnwc_7926
  mov RAX, [RBP-2320]
  mov [RBP-2528], RAX ; [RBP-2528] holds the variable dsxmvrwurd_7930
  mov RAX, -188
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2320]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2536], RAX ; [RBP-2536] holds the variable binop_7934
  mov RAX, [RBP-2496]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2536]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
done_2363:
  mov [RBP-2488], RAX ; [RBP-2488] holds the variable if_7835
  mov RAX, [RBP-2376]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2488]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2496], RAX ; [RBP-2496] holds the variable xmkahnavtd_7817
  mov RAX, [RBP-2096]
  mov [RBP-2504], RAX ; [RBP-2504] holds the variable voziwbkguv_7948
  mov RAX, [RBP-2320]
  mov [RBP-2512], RAX ; [RBP-2512] holds the variable lklqqxdbko_7952
  mov RAX, -82
  mov [RBP-2520], RAX ; [RBP-2520] holds the variable xzyubmrsrz_7944
  mov RAX, [RBP-2496]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 2
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2528], RAX ; [RBP-2528] holds the variable hwfswdkukv_7957
  mov RAX, [RBP-2088]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2350
  mov RAX, [RBP-2528]
  jmp near done_2350
if_false_2350:
  mov RAX, 76
done_2350:
  mov [RBP-2536], RAX ; [RBP-2536] holds the variable mdhrnsjsee_7963
  ;; or_lhs {
  mov RAX, [RBP-2088]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2347
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2347
  mov RAX, 0x7fffffffffffffff
or_done_2347:
  mov [RBP-2544], RAX ; [RBP-2544] holds the variable eyvdmaylpq_7970
  mov RAX, [RBP-2096]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2343
  mov RAX, [RBP-2544]
  jmp near done_2343
if_false_2343:
  mov RAX, [RBP-2088]
done_2343:
  mov [RBP-2552], RAX ; [RBP-2552] holds the variable zjliimcjku_7976
  mov RAX, [RBP-2544]
  mov [RBP-2560], RAX ; [RBP-2560] holds the variable rgpyjtwynu_7987
  mov RAX, 40
  mov [RBP-2568], RAX ; [RBP-2568] holds the variable dzyhzqhtmn_7991
  mov RAX, [RBP-2568]
  mov [RBP-2576], RAX ; [RBP-2576] holds the variable hfdofwljdh_7995
  mov RAX, [RBP-2088]
  mov [RBP-2584], RAX ; [RBP-2584] holds the variable pbyqyxvsbt_7999
  mov RAX, [RBP-2096]
  mov [RBP-2592], RAX ; [RBP-2592] holds the variable yhnbhloyib_8003
  mov RAX, [RBP-2568]
  mov [RBP-2600], RAX ; [RBP-2600] holds the variable dhfxhcpdew_8007
  mov RAX, [RBP-2536]
  mov [RBP-2608], RAX ; [RBP-2608] holds the variable quewjncrnv_8011
  mov RAX, [RBP-2576]
  mov [RBP-2616], RAX ; [RBP-2616] holds the variable klmekollgb_8015
  mov RAX, 34
  mov [RBP-2624], RAX ; [RBP-2624] holds the variable bzaqrmtjfl_7983
  mov RAX, [RBP-2496]
  mov [RBP-2632], RAX ; [RBP-2632] holds the variable aqpfxvrxum_8024
  mov RAX, 180
  mov [RBP-2640], RAX ; [RBP-2640] holds the variable ivlcsmyaev_8028
  mov RAX, [RBP-2496]
  mov [RBP-2648], RAX ; [RBP-2648] holds the variable yuengqjrwm_8032
  mov RAX, [RBP-2088]
  mov [RBP-2656], RAX ; [RBP-2656] holds the variable ndhfaqlaea_8020
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2327
  ;; and_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2327
  mov RAX, 0xffffffffffffffff
and_done_2327:
  mov [RBP-2664], RAX ; [RBP-2664] holds the variable binop_and_or_8036
  mov RAX, [RBP-2664]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2273
  mov RAX, [RBP-2088]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2322
  mov RAX, [RBP-2496]
  jmp near done_2322
if_false_2322:
  mov RAX, [RBP-2320]
done_2322:
  mov [RBP-2680], RAX ; [RBP-2680] holds the variable zhesasafad_8041
  mov RAX, [RBP-2320]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2688], RAX ; [RBP-2688] holds the variable npmycxxond_8048
  mov RAX, [RBP-2088]
  mov [RBP-2696], RAX ; [RBP-2696] holds the variable styiehsaop_8057
  mov RAX, [RBP-2320]
  mov [RBP-2704], RAX ; [RBP-2704] holds the variable hdprnhzwiz_8061
  mov RAX, [RBP-2696]
  mov [RBP-2712], RAX ; [RBP-2712] holds the variable dhwpmdbwrc_8065
  mov RAX, [RBP-2712]
  mov [RBP-2720], RAX ; [RBP-2720] holds the variable hhbwdctixy_8069
  mov RAX, [RBP-2704]
  mov [RBP-2728], RAX ; [RBP-2728] holds the variable ictrhhljsr_8073
  mov RAX, [RBP-2696]
  mov [RBP-2736], RAX ; [RBP-2736] holds the variable jdywisfyal_8077
  mov RAX, [RBP-2712]
  mov [RBP-2744], RAX ; [RBP-2744] holds the variable yrdpikcbby_8081
  mov RAX, [RBP-2744]
  mov [RBP-2752], RAX ; [RBP-2752] holds the variable lpbxpdfskl_8085
  mov RAX, [RBP-2720]
  mov [RBP-2760], RAX ; [RBP-2760] holds the variable zhfctooudr_8089
  mov RAX, [RBP-2744]
  mov [RBP-2768], RAX ; [RBP-2768] holds the variable mnsmzqllwd_8053
  mov RAX, [RBP-2768]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2306
  mov RAX, 0xffffffffffffffff
  jmp near done_2306
if_false_2306:
  mov RAX, [RBP-2096]
done_2306:
  mov [RBP-2776], RAX ; [RBP-2776] holds the variable prtmhrlemz_8094
  mov RAX, [RBP-2096]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2302
  mov RAX, [RBP-2688]
  jmp near done_2302
if_false_2302:
  mov RAX, [RBP-2496]
done_2302:
  mov [RBP-2784], RAX ; [RBP-2784] holds the variable twwakfssrs_8101
  mov RAX, [RBP-2320]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2688]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  jmp near done_2273
if_false_2273:
  mov RAX, [RBP-2320]
  mov R11, RAX
  mov RAX, [RBP-2496]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_2282
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2282
_cmp_fail_2282:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2282:
  mov [RBP-2680], RAX ; [RBP-2680] holds the variable binop_8111
  mov RAX, [RBP-2680]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2275
  mov RAX, 154
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2496]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_2275
if_false_2275:
  mov RAX, [RBP-2496]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
done_2275:
done_2273:
  mov [RBP-2672], RAX ; [RBP-2672] holds the variable if_7941
  mov RAX, [RBP-2672]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2680], RAX ; [RBP-2680] holds the variable rcfitmpuyf_7938
  ;; or_lhs {
  ;; and_lhs {
  mov RAX, [RBP-2320]
  mov R11, RAX
  mov RAX, [RBP-2320]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_2268
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2268
_cmp_fail_2268:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2268:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2263
  ;; and_rhs {
  mov RAX, [RBP-2088]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2264
  mov RAX, 0x7fffffffffffffff
  jmp near done_2264
if_false_2264:
  mov RAX, [RBP-2088]
done_2264:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2263
  mov RAX, 0xffffffffffffffff
and_done_2263:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2252
  ;; or_rhs {
  mov RAX, [RBP-2320]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2680]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2696], RAX ; [RBP-2696] holds the variable binop_8133
  mov RAX, [RBP-2496]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2704], RAX ; [RBP-2704] holds the variable unary_8136
  mov RAX, [RBP-2696]
  mov R11, RAX
  mov RAX, [RBP-2704]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_2255
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2255
_cmp_fail_2255:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2255:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2252
  mov RAX, 0x7fffffffffffffff
or_done_2252:
  mov [RBP-2688], RAX ; [RBP-2688] holds the variable binop_and_or_8123
  mov RAX, [RBP-2688]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2000
  mov RAX, [RBP-2320]
  mov R11, RAX
  mov RAX, [RBP-2320]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_2248
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2248
_cmp_fail_2248:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2248:
  mov [RBP-2704], RAX ; [RBP-2704] holds the variable xurwcxudah_8144
  mov RAX, [RBP-2320]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2680]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2712], RAX ; [RBP-2712] holds the variable wpltrzzceb_8150
  mov RAX, [RBP-2680]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -24
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2720], RAX ; [RBP-2720] holds the variable pspvidneck_8156
  ;; or_lhs {
  mov RAX, [RBP-2096]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2239
  ;; or_rhs {
  mov RAX, [RBP-2088]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2239
  mov RAX, 0x7fffffffffffffff
or_done_2239:
  mov [RBP-2728], RAX ; [RBP-2728] holds the variable txqsvfihbz_8162
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2236
  ;; and_rhs {
  mov RAX, [RBP-2728]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2236
  mov RAX, 0xffffffffffffffff
and_done_2236:
  mov [RBP-2736], RAX ; [RBP-2736] holds the variable fccrialjdx_8168
  mov RAX, [RBP-2736]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2232
  mov RAX, [RBP-2712]
  jmp near done_2232
if_false_2232:
  mov RAX, [RBP-2720]
done_2232:
  mov [RBP-2744], RAX ; [RBP-2744] holds the variable cetwivibam_8174
  ;; and_lhs {
  mov RAX, [RBP-2096]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2229
  ;; and_rhs {
  mov RAX, [RBP-2704]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2229
  mov RAX, 0xffffffffffffffff
and_done_2229:
  mov [RBP-2752], RAX ; [RBP-2752] holds the variable seeaweyswf_8181
  mov RAX, [RBP-2088]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2225
  mov RAX, [RBP-2496]
  jmp near done_2225
if_false_2225:
  mov RAX, [RBP-2712]
done_2225:
  mov [RBP-2760], RAX ; [RBP-2760] holds the variable dlsnwgpuuu_8187
  mov RAX, [RBP-2096]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2221
  mov RAX, -24
  jmp near done_2221
if_false_2221:
  mov RAX, [RBP-2680]
done_2221:
  mov [RBP-2768], RAX ; [RBP-2768] holds the variable ilqvljzvvs_8140
  mov RAX, [RBP-2680]
  mov R11, RAX
  mov RAX, 56
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_2218
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2218
_cmp_fail_2218:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2218:
  mov [RBP-2776], RAX ; [RBP-2776] holds the variable tpptasgmik_8202
  mov RAX, 0xffffffffffffffff
  mov [RBP-2784], RAX ; [RBP-2784] holds the variable kmwemysogk_8212
  mov RAX, [RBP-2680]
  mov [RBP-2792], RAX ; [RBP-2792] holds the variable lchxrtxney_8216
  mov RAX, [RBP-2768]
  mov [RBP-2800], RAX ; [RBP-2800] holds the variable vmmdtfyhjn_8208
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2211
  mov RAX, [RBP-2096]
  jmp near done_2211
if_false_2211:
  mov RAX, 0x7fffffffffffffff
done_2211:
  mov [RBP-2808], RAX ; [RBP-2808] holds the variable ntpmarhdro_8221
  mov RAX, -18
  mov [RBP-2816], RAX ; [RBP-2816] holds the variable janjdsmuvu_8232
  mov RAX, [RBP-2808]
  mov [RBP-2824], RAX ; [RBP-2824] holds the variable xwhnntxmsh_8236
  mov RAX, -128
  mov [RBP-2832], RAX ; [RBP-2832] holds the variable tqralwohun_8240
  mov RAX, [RBP-2832]
  mov [RBP-2840], RAX ; [RBP-2840] holds the variable mimsqvolco_8244
  mov RAX, [RBP-2088]
  mov [RBP-2848], RAX ; [RBP-2848] holds the variable astfpvhvat_8248
  mov RAX, [RBP-2848]
  mov [RBP-2856], RAX ; [RBP-2856] holds the variable uynopwvfxw_8252
  mov RAX, [RBP-2856]
  mov [RBP-2864], RAX ; [RBP-2864] holds the variable sbjzzvhcql_8256
  mov RAX, [RBP-2680]
  mov [RBP-2872], RAX ; [RBP-2872] holds the variable toxqybacmk_8260
  mov RAX, [RBP-2496]
  mov [RBP-2880], RAX ; [RBP-2880] holds the variable xxgpqsiuja_8264
  mov RAX, [RBP-2680]
  mov [RBP-2888], RAX ; [RBP-2888] holds the variable ztxfeffilw_8268
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2896], RAX ; [RBP-2896] holds the variable mhqlfwewlr_8228
  mov RAX, [RBP-2800]
  mov R11, RAX
  mov RAX, [RBP-2320]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_2197
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2197
_cmp_fail_2197:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2197:
  mov [RBP-2904], RAX ; [RBP-2904] holds the variable jawnfgiwlk_8273
  ;; or_lhs {
  mov RAX, [RBP-2096]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2194
  ;; or_rhs {
  mov RAX, [RBP-2896]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2194
  mov RAX, 0x7fffffffffffffff
or_done_2194:
  mov [RBP-2912], RAX ; [RBP-2912] holds the variable ljrinrajgo_8279
  mov RAX, [RBP-2680]
  mov [RBP-2920], RAX ; [RBP-2920] holds the variable fobavmawer_8289
  mov RAX, [RBP-2496]
  mov [RBP-2928], RAX ; [RBP-2928] holds the variable ckdiwlxctm_8293
  mov RAX, [RBP-2088]
  mov [RBP-2936], RAX ; [RBP-2936] holds the variable rdiclarvpo_8297
  mov RAX, 14
  mov [RBP-2944], RAX ; [RBP-2944] holds the variable npqxzrktjw_8301
  mov RAX, 0xffffffffffffffff
  mov [RBP-2952], RAX ; [RBP-2952] holds the variable lckbvvjsch_8305
  mov RAX, [RBP-2944]
  mov [RBP-2960], RAX ; [RBP-2960] holds the variable owofkpnqcy_8309
  mov RAX, [RBP-2960]
  mov [RBP-2968], RAX ; [RBP-2968] holds the variable uijwpjeqjc_8313
  mov RAX, [RBP-2912]
  mov [RBP-2976], RAX ; [RBP-2976] holds the variable rondexjoci_8317
  mov RAX, [RBP-2320]
  mov [RBP-2984], RAX ; [RBP-2984] holds the variable snjwwwmmkc_8285
  mov RAX, [RBP-2496]
  mov [RBP-2992], RAX ; [RBP-2992] holds the variable ipfcczefxa_8326
  mov RAX, [RBP-2776]
  mov [RBP-3000], RAX ; [RBP-3000] holds the variable yigiaxrhux_8322
  mov RAX, [RBP-2496]
  mov [RBP-3008], RAX ; [RBP-3008] holds the variable sufoibkbfy_8335
  mov RAX, [RBP-2768]
  mov [RBP-3016], RAX ; [RBP-3016] holds the variable hawbzgxwkl_8339
  mov RAX, [RBP-2904]
  mov [RBP-3024], RAX ; [RBP-3024] holds the variable suhslydirc_8343
  mov RAX, [RBP-2776]
  mov [RBP-3032], RAX ; [RBP-3032] holds the variable nzxnxdskwo_8347
  mov RAX, [RBP-2912]
  mov [RBP-3040], RAX ; [RBP-3040] holds the variable uoydgwcdfm_8331
  ;; and_lhs {
  mov RAX, [RBP-2776]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2175
  ;; and_rhs {
  mov RAX, [RBP-2096]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2175
  mov RAX, 0xffffffffffffffff
and_done_2175:
  mov [RBP-3048], RAX ; [RBP-3048] holds the variable easrkppxta_8352
  mov RAX, [RBP-2800]
  mov R11, RAX
  mov RAX, -18
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_2172
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2172
_cmp_fail_2172:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2172:
  mov [RBP-3056], RAX ; [RBP-3056] holds the variable hfpmeiqyjy_8198
  mov RAX, [RBP-2768]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-3064], RAX ; [RBP-3064] holds the variable unary_8364
  mov RAX, [RBP-2496]
  mov [RBP-3072], RAX ; [RBP-3072] holds the variable qphtobjtkt_8368
  mov RAX, -26
  mov [RBP-3080], RAX ; [RBP-3080] holds the variable cefyaddlma_8372
  mov RAX, [RBP-3080]
  mov [RBP-3088], RAX ; [RBP-3088] holds the variable zjnepuodzk_8376
  mov RAX, [RBP-3064]
  mov R11, RAX
  mov RAX, [RBP-2768]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_2164
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2164
_cmp_fail_2164:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2164:
  mov [RBP-3096], RAX ; [RBP-3096] holds the variable dhidgsozdv_8361
  mov RAX, [RBP-2680]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-3104], RAX ; [RBP-3104] holds the variable dkbkiwwilv_8382
  mov RAX, [RBP-2096]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2158
  mov RAX, -74
  jmp near done_2158
if_false_2158:
  mov RAX, 132
done_2158:
  mov [RBP-3112], RAX ; [RBP-3112] holds the variable kslfpupsan_8387
  mov RAX, [RBP-3104]
  mov [RBP-3120], RAX ; [RBP-3120] holds the variable bihphczyus_8398
  mov RAX, [RBP-2096]
  mov [RBP-3128], RAX ; [RBP-3128] holds the variable beflesglun_8402
  mov RAX, [RBP-3128]
  mov [RBP-3136], RAX ; [RBP-3136] holds the variable dfbwauwfml_8406
  mov RAX, [RBP-2768]
  mov [RBP-3144], RAX ; [RBP-3144] holds the variable jocxkcqxib_8410
  mov RAX, [RBP-2680]
  mov [RBP-3152], RAX ; [RBP-3152] holds the variable grungogtub_8414
  mov RAX, [RBP-3096]
  mov [RBP-3160], RAX ; [RBP-3160] holds the variable jmcnubuigl_8418
  mov RAX, [RBP-3160]
  mov [RBP-3168], RAX ; [RBP-3168] holds the variable wunlpjgiot_8422
  mov RAX, [RBP-2496]
  mov [RBP-3176], RAX ; [RBP-3176] holds the variable uibvqxsdmb_8426
  mov RAX, [RBP-2768]
  mov [RBP-3184], RAX ; [RBP-3184] holds the variable lnzokkojov_8430
  mov RAX, [RBP-3104]
  mov [RBP-3192], RAX ; [RBP-3192] holds the variable ccmmuzsvuy_8434
  mov RAX, [RBP-3152]
  mov [RBP-3200], RAX ; [RBP-3200] holds the variable lipwtbfkvo_8394
  mov RAX, -26
  mov R11, RAX
  mov RAX, [RBP-3200]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_2144
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2144
_cmp_fail_2144:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2144:
  mov [RBP-3208], RAX ; [RBP-3208] holds the variable fspflwmttz_8439
  mov RAX, 86
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2680]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-3216], RAX ; [RBP-3216] holds the variable pwsjrsmrnz_8445
  ;; and_lhs {
  mov RAX, [RBP-2088]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2138
  ;; and_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2138
  mov RAX, 0xffffffffffffffff
and_done_2138:
  mov [RBP-3224], RAX ; [RBP-3224] holds the variable zosejfmagt_8451
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2135
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2135
  mov RAX, 0xffffffffffffffff
and_done_2135:
  jmp near done_2000
if_false_2000:
  mov RAX, [RBP-2496]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2680]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2704], RAX ; [RBP-2704] holds the variable binop_8461
  mov RAX, [RBP-2496]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2712], RAX ; [RBP-2712] holds the variable unary_8464
  mov RAX, [RBP-2704]
  mov R11, RAX
  mov RAX, [RBP-2712]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_2061
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2061
_cmp_fail_2061:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2061:
  mov [RBP-2720], RAX ; [RBP-2720] holds the variable binop_8460
  mov RAX, [RBP-2720]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2004
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_2056
  mov RAX, [RBP-2096]
  jmp near done_2056
if_false_2056:
  mov RAX, [RBP-2096]
done_2056:
  mov [RBP-2728], RAX ; [RBP-2728] holds the variable dsdkxdtiuv_8468
  mov RAX, [RBP-2496]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2680]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2736], RAX ; [RBP-2736] holds the variable npucykbenj_8475
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2050
  ;; and_rhs {
  mov RAX, [RBP-2088]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_2050
  mov RAX, 0xffffffffffffffff
and_done_2050:
  mov [RBP-2744], RAX ; [RBP-2744] holds the variable bluiqjgqbm_8481
  mov RAX, [RBP-2680]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2680]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2752], RAX ; [RBP-2752] holds the variable aemoffywus_8487
  mov RAX, -144
  mov [RBP-2760], RAX ; [RBP-2760] holds the variable fidoxsyyph_8497
  mov RAX, [RBP-2728]
  mov [RBP-2768], RAX ; [RBP-2768] holds the variable lhvxgejaae_8501
  mov RAX, [RBP-2768]
  mov [RBP-2776], RAX ; [RBP-2776] holds the variable bsmcyubjdj_8505
  mov RAX, [RBP-2496]
  mov [RBP-2784], RAX ; [RBP-2784] holds the variable emirstalcz_8509
  mov RAX, [RBP-2728]
  mov [RBP-2792], RAX ; [RBP-2792] holds the variable hapyyzvipd_8493
  mov RAX, [RBP-2088]
  mov [RBP-2800], RAX ; [RBP-2800] holds the variable iomjxqrafo_8515
  mov RAX, [RBP-2752]
  mov [RBP-2808], RAX ; [RBP-2808] holds the variable pjtzdykmtu_8519
  mov RAX, [RBP-2800]
  mov [RBP-2816], RAX ; [RBP-2816] holds the variable nomyqjzkcj_8523
  mov RAX, [RBP-2808]
  mov [RBP-2824], RAX ; [RBP-2824] holds the variable tvdykprxuu_8527
  mov RAX, 0xffffffffffffffff
  mov [RBP-2832], RAX ; [RBP-2832] holds the variable flakfcejvs_8531
  mov RAX, [RBP-2752]
  mov [RBP-2840], RAX ; [RBP-2840] holds the variable zflkwpkdxf_8535
  mov RAX, [RBP-2744]
  mov [RBP-2848], RAX ; [RBP-2848] holds the variable ybbjmuknvt_8539
  mov RAX, [RBP-2800]
  mov [RBP-2856], RAX ; [RBP-2856] holds the variable bsftfptpya_8543
  mov RAX, 0xffffffffffffffff
  mov [RBP-2864], RAX ; [RBP-2864] holds the variable gacdbvmvhk_8547
  mov RAX, [RBP-2752]
  mov [RBP-2872], RAX ; [RBP-2872] holds the variable nienvytvjz_8551
  mov RAX, [RBP-2728]
  jmp near done_2004
if_false_2004:
  ;; or_lhs {
  mov RAX, -30
  mov R11, RAX
  mov RAX, [RBP-2496]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_2009
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2009
_cmp_fail_2009:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2009:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2005
  ;; or_rhs {
  mov RAX, [RBP-2496]
  mov R11, RAX
  mov RAX, [RBP-2320]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_2006
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_2006
_cmp_fail_2006:
  mov RAX, 0x7fffffffffffffff
_cmp_done_2006:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_2005
  mov RAX, 0x7fffffffffffffff
or_done_2005:
done_2004:
done_2000:
  mov [RBP-2696], RAX ; [RBP-2696] holds the variable kthslovsdj_8120
  ;; and_lhs {
  mov RAX, [RBP-2088]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1996
  mov RAX, 0x7fffffffffffffff
  jmp near done_1996
if_false_1996:
  mov RAX, [RBP-2096]
done_1996:
  mov [RBP-2712], RAX ; [RBP-2712] holds the variable if_8565
  mov RAX, [RBP-2712]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1978
  mov RAX, [RBP-2496]
  mov R11, RAX
  mov RAX, [RBP-2496]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_1992
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1992
_cmp_fail_1992:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1992:
  jmp near done_1978
if_false_1978:
  mov RAX, [RBP-2096]
  mov [RBP-2720], RAX ; [RBP-2720] holds the variable mqedknrhqm_8574
  mov RAX, [RBP-2696]
  mov [RBP-2728], RAX ; [RBP-2728] holds the variable qmcgpkugfo_8578
  mov RAX, [RBP-2680]
  mov [RBP-2736], RAX ; [RBP-2736] holds the variable tryjvykzmv_8582
  mov RAX, [RBP-2680]
  mov [RBP-2744], RAX ; [RBP-2744] holds the variable kbbzubtiuj_8586
  mov RAX, [RBP-2496]
  mov [RBP-2752], RAX ; [RBP-2752] holds the variable alxemvqowb_8590
  mov RAX, [RBP-2720]
  mov [RBP-2760], RAX ; [RBP-2760] holds the variable ppqhtcwmrs_8594
  mov RAX, 0xffffffffffffffff
done_1978:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1967
  ;; and_rhs {
  ;; or_lhs {
  mov RAX, [RBP-2096]
  mov [RBP-2712], RAX ; [RBP-2712] holds the variable pwzizwrxlo_8601
  mov RAX, [RBP-2680]
  mov [RBP-2720], RAX ; [RBP-2720] holds the variable lbmdmaszdy_8605
  mov RAX, [RBP-2088]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1968
  ;; or_rhs {
  mov RAX, [RBP-2320]
  mov R11, RAX
  mov RAX, [RBP-2680]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_1969
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1969
_cmp_fail_1969:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1969:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1968
  mov RAX, 0x7fffffffffffffff
or_done_1968:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1967
  mov RAX, 0xffffffffffffffff
and_done_1967:
  mov [RBP-2704], RAX ; [RBP-2704] holds the variable binop_and_or_8563
  mov RAX, [RBP-2704]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1900
  mov RAX, 0xffffffffffffffff
  mov [RBP-2712], RAX ; [RBP-2712] holds the variable atmcnedgqt_8616
  mov RAX, [RBP-2696]
  mov [RBP-2720], RAX ; [RBP-2720] holds the variable aewbheqexv_8620
  mov RAX, [RBP-2712]
  mov [RBP-2728], RAX ; [RBP-2728] holds the variable hqfeemwzkg_8624
  mov RAX, [RBP-2720]
  mov [RBP-2736], RAX ; [RBP-2736] holds the variable isqmoigmtt_8628
  mov RAX, [RBP-2096]
  mov [RBP-2744], RAX ; [RBP-2744] holds the variable yvcwxjanis_8632
  mov RAX, [RBP-2744]
  mov [RBP-2752], RAX ; [RBP-2752] holds the variable hortdqghnl_8636
  mov RAX, [RBP-2096]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1956
  mov RAX, 116
  jmp near done_1956
if_false_1956:
  mov RAX, [RBP-2680]
done_1956:
  mov [RBP-2760], RAX ; [RBP-2760] holds the variable if_8640
  mov RAX, [RBP-2680]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2760]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2768], RAX ; [RBP-2768] holds the variable binop_8613
  mov RAX, [RBP-2768]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  jmp near done_1900
if_false_1900:
  mov RAX, [RBP-2496]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2712], RAX ; [RBP-2712] holds the variable lknagihxvw_8647
  mov RAX, [RBP-2320]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2680]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2720], RAX ; [RBP-2720] holds the variable zhgqtarhhj_8652
  mov RAX, [RBP-2720]
  mov [RBP-2728], RAX ; [RBP-2728] holds the variable vnipmkunpd_8662
  mov RAX, 144
  mov [RBP-2736], RAX ; [RBP-2736] holds the variable xjhxesfvri_8666
  mov RAX, [RBP-2320]
  mov [RBP-2744], RAX ; [RBP-2744] holds the variable onrkqddozl_8670
  mov RAX, [RBP-2696]
  mov [RBP-2752], RAX ; [RBP-2752] holds the variable iqhmteipkt_8674
  mov RAX, 84
  mov [RBP-2760], RAX ; [RBP-2760] holds the variable omihfqjzif_8678
  mov RAX, [RBP-2088]
  mov [RBP-2768], RAX ; [RBP-2768] holds the variable mzioakxemd_8682
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2776], RAX ; [RBP-2776] holds the variable rqnsoenfhs_8686
  mov RAX, [RBP-2736]
  mov [RBP-2784], RAX ; [RBP-2784] holds the variable bucfgivdfl_8690
  mov RAX, [RBP-2088]
  mov [RBP-2792], RAX ; [RBP-2792] holds the variable tiytvwohwi_8694
  mov RAX, 186
  mov [RBP-2800], RAX ; [RBP-2800] holds the variable bltmybjxkx_8698
  mov RAX, [RBP-2800]
  mov [RBP-2808], RAX ; [RBP-2808] holds the variable hganbivuha_8658
  mov RAX, [RBP-2320]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2816], RAX ; [RBP-2816] holds the variable unary_8702
  mov RAX, [RBP-2320]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -156
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2824], RAX ; [RBP-2824] holds the variable binop_8705
  mov RAX, [RBP-2824]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2832], RAX ; [RBP-2832] holds the variable unary_8704
  mov RAX, [RBP-2816]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2832]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
done_1900:
done_1585:
  mov [RBP-192], RAX ; [RBP-192] holds the variable if_5087
  ;; or_lhs {
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1581
  mov RAX, 0x7fffffffffffffff
  jmp near done_1581
if_false_1581:
  mov RAX, 0x7fffffffffffffff
done_1581:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1577
  ;; and_rhs {
  mov RAX, 16
  mov R11, RAX
  mov RAX, 100
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_1578
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1578
_cmp_fail_1578:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1578:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1577
  mov RAX, 0xffffffffffffffff
and_done_1577:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1563
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1573
  mov RAX, 0xffffffffffffffff
  jmp near done_1573
if_false_1573:
  mov RAX, 0x7fffffffffffffff
done_1573:
  mov [RBP-208], RAX ; [RBP-208] holds the variable if_8721
  mov RAX, [RBP-208]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1565
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1569
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1569
  mov RAX, 0x7fffffffffffffff
or_done_1569:
  jmp near done_1565
if_false_1565:
  mov RAX, -76
  mov R11, RAX
  mov RAX, -74
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_1566
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1566
_cmp_fail_1566:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1566:
done_1565:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1563
  mov RAX, 0x7fffffffffffffff
or_done_1563:
  mov [RBP-200], RAX ; [RBP-200] holds the variable binop_and_or_8711
  mov RAX, [RBP-200]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1419
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1558
  mov RAX, 0xffffffffffffffff
  jmp near done_1558
if_false_1558:
  mov RAX, 0xffffffffffffffff
done_1558:
  mov [RBP-216], RAX ; [RBP-216] holds the variable if_8733
  mov RAX, [RBP-216]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1544
  ;; or_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1554
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1554
  mov RAX, 0x7fffffffffffffff
or_done_1554:
  jmp near done_1544
if_false_1544:
  mov RAX, -184
  mov [RBP-232], RAX ; [RBP-232] holds the variable royxpuvfru_8742
  mov RAX, 0x7fffffffffffffff
  mov [RBP-240], RAX ; [RBP-240] holds the variable ylnxlcsikw_8746
  mov RAX, [RBP-240]
  mov [RBP-248], RAX ; [RBP-248] holds the variable lkfnhcmzgk_8750
  mov RAX, 70
  mov [RBP-256], RAX ; [RBP-256] holds the variable cagyqmcwzy_8754
  mov RAX, [RBP-248]
done_1544:
  mov [RBP-224], RAX ; [RBP-224] holds the variable if_8732
  mov RAX, [RBP-224]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1461
  mov RAX, 0xffffffffffffffff
  mov [RBP-232], RAX ; [RBP-232] holds the variable psrjgrbttz_8764
  mov RAX, -12
  mov [RBP-240], RAX ; [RBP-240] holds the variable ndnetjiwpt_8768
  mov RAX, -116
  mov [RBP-248], RAX ; [RBP-248] holds the variable deulgkvcdo_8772
  mov RAX, -176
  mov [RBP-256], RAX ; [RBP-256] holds the variable agxeshewiv_8776
  mov RAX, 0x7fffffffffffffff
  mov [RBP-264], RAX ; [RBP-264] holds the variable grxplbvltp_8780
  mov RAX, [RBP-240]
  mov [RBP-272], RAX ; [RBP-272] holds the variable ricffoewvy_8784
  mov RAX, [RBP-240]
  mov [RBP-280], RAX ; [RBP-280] holds the variable jdyelelccv_8788
  mov RAX, 32
  mov [RBP-288], RAX ; [RBP-288] holds the variable oefswwyvrt_8792
  mov RAX, [RBP-288]
  mov [RBP-296], RAX ; [RBP-296] holds the variable kqpcshvrxj_8796
  mov RAX, 0xffffffffffffffff
  mov [RBP-304], RAX ; [RBP-304] holds the variable ivczsimgva_8760
  mov RAX, -166
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-312], RAX ; [RBP-312] holds the variable ucaejtwqwi_8801
  mov RAX, 180
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-312]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-320], RAX ; [RBP-320] holds the variable tyewqctqfv_8806
  mov RAX, 34
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-328], RAX ; [RBP-328] holds the variable xdmcibrsxe_8812
  mov RAX, [RBP-304]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1522
  mov RAX, [RBP-304]
  jmp near done_1522
if_false_1522:
  mov RAX, [RBP-304]
done_1522:
  mov [RBP-336], RAX ; [RBP-336] holds the variable kuekxhaplt_8817
  mov RAX, [RBP-312]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-344], RAX ; [RBP-344] holds the variable yufllztugr_8824
  mov RAX, [RBP-312]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-320]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-352], RAX ; [RBP-352] holds the variable mhnltdsuly_8830
  mov RAX, [RBP-328]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-344]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-360], RAX ; [RBP-360] holds the variable flfaqkzvyq_8836
  mov RAX, [RBP-344]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-368], RAX ; [RBP-368] holds the variable fgjonzkqnd_8842
  mov RAX, [RBP-360]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-312]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_1461
if_false_1461:
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1487
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1487
  mov RAX, 0x7fffffffffffffff
or_done_1487:
  mov [RBP-232], RAX ; [RBP-232] holds the variable binop_and_or_8850
  mov RAX, [RBP-232]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1463
  mov RAX, -122
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 38
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_1463
if_false_1463:
  mov RAX, 170
  mov [RBP-240], RAX ; [RBP-240] holds the variable yfnmlcpdkz_8858
  mov RAX, 0x7fffffffffffffff
  mov [RBP-248], RAX ; [RBP-248] holds the variable ikossfjtlj_8862
  mov RAX, [RBP-248]
  mov [RBP-256], RAX ; [RBP-256] holds the variable idcgadmfog_8866
  mov RAX, [RBP-240]
  mov [RBP-264], RAX ; [RBP-264] holds the variable bkxfenanrt_8870
  mov RAX, [RBP-248]
  mov [RBP-272], RAX ; [RBP-272] holds the variable zgbmbxupjt_8874
  mov RAX, [RBP-256]
  mov [RBP-280], RAX ; [RBP-280] holds the variable rxmxygcjmo_8878
  mov RAX, [RBP-280]
  mov [RBP-288], RAX ; [RBP-288] holds the variable phyxyhwuds_8882
  mov RAX, [RBP-248]
  mov [RBP-296], RAX ; [RBP-296] holds the variable mrtusrwxti_8886
  mov RAX, [RBP-296]
  mov [RBP-304], RAX ; [RBP-304] holds the variable cwjrelqgqj_8890
  mov RAX, -4
done_1463:
done_1461:
  jmp near done_1419
if_false_1419:
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1455
  mov RAX, 0x7fffffffffffffff
  jmp near done_1455
if_false_1455:
  mov RAX, 0x7fffffffffffffff
done_1455:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1450
  ;; and_rhs {
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1451
  mov RAX, 0x7fffffffffffffff
  jmp near done_1451
if_false_1451:
  mov RAX, 0xffffffffffffffff
done_1451:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1450
  mov RAX, 0xffffffffffffffff
and_done_1450:
  mov [RBP-216], RAX ; [RBP-216] holds the variable binop_and_or_8895
  mov RAX, [RBP-216]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1421
  mov RAX, 148
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-224], RAX ; [RBP-224] holds the variable unary_8905
  mov RAX, [RBP-224]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  jmp near done_1421
if_false_1421:
  mov RAX, -120
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-224], RAX ; [RBP-224] holds the variable unary_8908
  mov RAX, 88
  mov [RBP-232], RAX ; [RBP-232] holds the variable pnkizkcoue_8912
  mov RAX, 0x7fffffffffffffff
  mov [RBP-240], RAX ; [RBP-240] holds the variable rjjtxyctef_8916
  mov RAX, [RBP-240]
  mov [RBP-248], RAX ; [RBP-248] holds the variable ribdasbjne_8920
  mov RAX, [RBP-240]
  mov [RBP-256], RAX ; [RBP-256] holds the variable mztfrodxat_8924
  mov RAX, [RBP-248]
  mov [RBP-264], RAX ; [RBP-264] holds the variable txqphugrge_8928
  mov RAX, -78
  mov [RBP-272], RAX ; [RBP-272] holds the variable cjbugrrlfu_8932
  mov RAX, [RBP-248]
  mov [RBP-280], RAX ; [RBP-280] holds the variable ybbcgdbquf_8936
  mov RAX, [RBP-232]
  mov [RBP-288], RAX ; [RBP-288] holds the variable ybimttiwth_8940
  mov RAX, [RBP-224]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-288]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
done_1421:
done_1419:
  mov [RBP-208], RAX ; [RBP-208] holds the variable if_8710
  mov RAX, -108
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-216], RAX ; [RBP-216] holds the variable qwjsofsolc_8948
  mov RAX, [RBP-216]
  mov [RBP-224], RAX ; [RBP-224] holds the variable vgvlbdsebp_8957
  mov RAX, -62
  mov [RBP-232], RAX ; [RBP-232] holds the variable wpmczhcqts_8961
  mov RAX, [RBP-224]
  mov [RBP-240], RAX ; [RBP-240] holds the variable yylvmdwoio_8965
  mov RAX, [RBP-216]
  mov [RBP-248], RAX ; [RBP-248] holds the variable zuzofwjxde_8969
  mov RAX, 44
  mov [RBP-256], RAX ; [RBP-256] holds the variable mbhgxpujgn_8953
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1409
  ;; and_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1409
  mov RAX, 0xffffffffffffffff
and_done_1409:
  mov [RBP-264], RAX ; [RBP-264] holds the variable vftyueuwts_8974
  mov RAX, [RBP-216]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-256]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-272], RAX ; [RBP-272] holds the variable bpmtivtdza_8980
  mov RAX, [RBP-216]
  mov R11, RAX
  mov RAX, [RBP-256]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_1403
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1403
_cmp_fail_1403:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1403:
  mov [RBP-280], RAX ; [RBP-280] holds the variable gehwwopmbb_8986
  mov RAX, [RBP-264]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1399
  mov RAX, -78
  jmp near done_1399
if_false_1399:
  mov RAX, [RBP-272]
done_1399:
  mov [RBP-288], RAX ; [RBP-288] holds the variable if_8991
  mov RAX, [RBP-288]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-296], RAX ; [RBP-296] holds the variable unary_8945
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1393
  mov RAX, -24
  jmp near done_1393
if_false_1393:
  mov RAX, 24
done_1393:
  mov [RBP-304], RAX ; [RBP-304] holds the variable if_8997
  mov RAX, [RBP-304]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-312], RAX ; [RBP-312] holds the variable unary_8996
  mov RAX, -144
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-320], RAX ; [RBP-320] holds the variable unary_9002
  mov RAX, [RBP-320]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-328], RAX ; [RBP-328] holds the variable unary_9001
  mov RAX, [RBP-312]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-328]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-336], RAX ; [RBP-336] holds the variable binop_8995
  mov RAX, [RBP-296]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-336]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-344], RAX ; [RBP-344] holds the variable binop_8944
  mov RAX, [RBP-208]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-344]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-352], RAX ; [RBP-352] holds the variable binop_8709
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1375
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1375
  mov RAX, 0x7fffffffffffffff
or_done_1375:
  mov [RBP-360], RAX ; [RBP-360] holds the variable cloujwnqik_9012
  mov RAX, 130
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -158
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-368], RAX ; [RBP-368] holds the variable cnxoabeawp_9018
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1368
  mov RAX, 0xffffffffffffffff
  jmp near done_1368
if_false_1368:
  mov RAX, 0x7fffffffffffffff
done_1368:
  mov [RBP-376], RAX ; [RBP-376] holds the variable yuytwcemol_9024
  mov RAX, [RBP-360]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1364
  mov RAX, [RBP-360]
  jmp near done_1364
if_false_1364:
  mov RAX, [RBP-376]
done_1364:
  mov [RBP-384], RAX ; [RBP-384] holds the variable if_9030
  mov RAX, [RBP-384]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1350
  mov RAX, -58
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 14
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-400], RAX ; [RBP-400] holds the variable binop_9035
  mov RAX, [RBP-400]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  jmp near done_1350
if_false_1350:
  mov RAX, 132
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -86
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-400], RAX ; [RBP-400] holds the variable binop_9039
  mov RAX, [RBP-400]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
done_1350:
  mov [RBP-392], RAX ; [RBP-392] holds the variable if_9009
  mov RAX, [RBP-392]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-400], RAX ; [RBP-400] holds the variable pfngkcokva_9006
  mov RAX, -114
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-408], RAX ; [RBP-408] holds the variable unary_9051
  mov RAX, 0xffffffffffffffff
  mov [RBP-416], RAX ; [RBP-416] holds the variable zulfsksugw_9055
  mov RAX, [RBP-400]
  mov [RBP-424], RAX ; [RBP-424] holds the variable ysfgzkhucz_9059
  mov RAX, [RBP-400]
  mov [RBP-432], RAX ; [RBP-432] holds the variable obalqlfubq_9063
  mov RAX, [RBP-408]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-440], RAX ; [RBP-440] holds the variable binop_9050
  mov RAX, [RBP-440]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-448], RAX ; [RBP-448] holds the variable ocadfsocdg_9047
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  mov [RBP-464], RAX ; [RBP-464] holds the variable dvuhrazylf_9074
  mov RAX, [RBP-464]
  mov [RBP-472], RAX ; [RBP-472] holds the variable sgwinakncd_9078
  mov RAX, 0xffffffffffffffff
  mov [RBP-480], RAX ; [RBP-480] holds the variable cmlnijutjl_9082
  mov RAX, [RBP-472]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1317
  ;; or_rhs {
  mov RAX, [RBP-400]
  mov [RBP-464], RAX ; [RBP-464] holds the variable mmpqkvkbfz_9088
  mov RAX, 0xffffffffffffffff
  mov [RBP-472], RAX ; [RBP-472] holds the variable ytrksptsdu_9092
  mov RAX, [RBP-400]
  mov [RBP-480], RAX ; [RBP-480] holds the variable cinsvbsuhe_9096
  mov RAX, [RBP-480]
  mov [RBP-488], RAX ; [RBP-488] holds the variable qzwelohilj_9100
  mov RAX, [RBP-472]
  mov [RBP-496], RAX ; [RBP-496] holds the variable xvqwhlyvbs_9104
  mov RAX, 36
  mov [RBP-504], RAX ; [RBP-504] holds the variable gyyxowqvob_9108
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1317
  mov RAX, 0x7fffffffffffffff
or_done_1317:
  mov [RBP-456], RAX ; [RBP-456] holds the variable binop_and_or_9071
  mov RAX, [RBP-456]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1258
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1312
  mov RAX, 0x7fffffffffffffff
  jmp near done_1312
if_false_1312:
  mov RAX, 0x7fffffffffffffff
done_1312:
  mov [RBP-472], RAX ; [RBP-472] holds the variable if_9113
  mov RAX, [RBP-472]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1303
  mov RAX, [RBP-400]
  mov R11, RAX
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_1308
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1308
_cmp_fail_1308:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1308:
  jmp near done_1303
if_false_1303:
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1304
  mov RAX, 0xffffffffffffffff
  jmp near done_1304
if_false_1304:
  mov RAX, 0x7fffffffffffffff
done_1304:
done_1303:
  jmp near done_1258
if_false_1258:
  mov RAX, [RBP-448]
  mov R11, RAX
  mov RAX, [RBP-448]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_1299
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1299
_cmp_fail_1299:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1299:
  mov [RBP-472], RAX ; [RBP-472] holds the variable ixncbkvrnd_9126
  mov RAX, [RBP-472]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1295
  mov RAX, [RBP-472]
  jmp near done_1295
if_false_1295:
  mov RAX, [RBP-472]
done_1295:
  mov [RBP-480], RAX ; [RBP-480] holds the variable duyjtocsah_9132
  mov RAX, [RBP-480]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1291
  mov RAX, [RBP-472]
  jmp near done_1291
if_false_1291:
  mov RAX, [RBP-472]
done_1291:
  mov [RBP-488], RAX ; [RBP-488] holds the variable ttpuourwqi_9139
  mov RAX, [RBP-448]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-496], RAX ; [RBP-496] holds the variable cxknrwpwyl_9146
  mov RAX, [RBP-448]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-504], RAX ; [RBP-504] holds the variable mkupnuyuoo_9151
  mov RAX, [RBP-496]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-448]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-512], RAX ; [RBP-512] holds the variable mfplvreyah_9157
  ;; and_lhs {
  mov RAX, [RBP-480]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1280
  ;; and_rhs {
  mov RAX, [RBP-480]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1280
  mov RAX, 0xffffffffffffffff
and_done_1280:
  mov [RBP-520], RAX ; [RBP-520] holds the variable sytjncuspk_9163
  mov RAX, [RBP-504]
  mov R11, RAX
  mov RAX, [RBP-496]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_1277
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1277
_cmp_fail_1277:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1277:
  mov [RBP-528], RAX ; [RBP-528] holds the variable uqdxreomej_9169
  mov RAX, -184
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 34
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-536], RAX ; [RBP-536] holds the variable ublfeqntul_9175
  mov RAX, [RBP-496]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-544], RAX ; [RBP-544] holds the variable oinodavypo_9181
  mov RAX, [RBP-400]
  mov R11, RAX
  mov RAX, [RBP-512]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_1269
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1269
_cmp_fail_1269:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1269:
done_1258:
  mov [RBP-464], RAX ; [RBP-464] holds the variable kclydekbeb_9068
  mov RAX, [RBP-464]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1254
  mov RAX, [RBP-448]
  jmp near done_1254
if_false_1254:
  mov RAX, [RBP-400]
done_1254:
  mov [RBP-472], RAX ; [RBP-472] holds the variable if_9193
  mov RAX, [RBP-448]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-480], RAX ; [RBP-480] holds the variable binop_9197
  mov RAX, [RBP-472]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-480]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-488], RAX ; [RBP-488] holds the variable binop_9192
  mov RAX, [RBP-448]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -10
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-496], RAX ; [RBP-496] holds the variable binop_9201
  mov RAX, [RBP-496]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-504], RAX ; [RBP-504] holds the variable unary_9200
  mov RAX, [RBP-488]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-504]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-512], RAX ; [RBP-512] holds the variable ksnrhxclnp_9189
  mov RAX, 84
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-520], RAX ; [RBP-520] holds the variable unary_9212
  mov RAX, [RBP-520]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-528], RAX ; [RBP-528] holds the variable mgkcsheywn_9209
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1232
  mov RAX, [RBP-512]
  jmp near done_1232
if_false_1232:
  mov RAX, -112
done_1232:
  mov [RBP-536], RAX ; [RBP-536] holds the variable if_9218
  mov RAX, [RBP-536]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-544], RAX ; [RBP-544] holds the variable pmviigmpam_9215
  mov RAX, [RBP-464]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1226
  mov RAX, 0xffffffffffffffff
  jmp near done_1226
if_false_1226:
  mov RAX, [RBP-464]
done_1226:
  mov [RBP-552], RAX ; [RBP-552] holds the variable if_9226
  mov RAX, [RBP-552]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1204
  mov RAX, 0xffffffffffffffff
  mov [RBP-568], RAX ; [RBP-568] holds the variable eoxotqahxt_9232
  mov RAX, [RBP-528]
  mov [RBP-576], RAX ; [RBP-576] holds the variable ffafmxdeea_9236
  mov RAX, [RBP-448]
  mov [RBP-584], RAX ; [RBP-584] holds the variable arvmbpgwni_9240
  mov RAX, [RBP-464]
  mov [RBP-592], RAX ; [RBP-592] holds the variable lytroivhvd_9244
  mov RAX, -40
  mov [RBP-600], RAX ; [RBP-600] holds the variable xggmmvglxy_9248
  mov RAX, 0x7fffffffffffffff
  mov [RBP-608], RAX ; [RBP-608] holds the variable rsxmjzikfr_9252
  mov RAX, 0xffffffffffffffff
  mov [RBP-616], RAX ; [RBP-616] holds the variable ydinlpjrim_9256
  mov RAX, [RBP-584]
  mov [RBP-624], RAX ; [RBP-624] holds the variable iaawrerywm_9260
  mov RAX, [RBP-568]
  jmp near done_1204
if_false_1204:
  mov RAX, [RBP-544]
  mov R11, RAX
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_1205
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1205
_cmp_fail_1205:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1205:
done_1204:
  mov [RBP-560], RAX ; [RBP-560] holds the variable ieugrxqqbd_9223
  mov RAX, [RBP-528]
  mov [RBP-568], RAX ; [RBP-568] holds the variable zijgpipptb_9273
  mov RAX, [RBP-568]
  mov [RBP-576], RAX ; [RBP-576] holds the variable ajsemtiqiu_9277
  mov RAX, [RBP-560]
  mov [RBP-584], RAX ; [RBP-584] holds the variable mwsyxdjavk_9281
  mov RAX, [RBP-448]
  mov [RBP-592], RAX ; [RBP-592] holds the variable ucapnxckev_9285
  mov RAX, 124
  mov [RBP-600], RAX ; [RBP-600] holds the variable xnfsxfxyma_9289
  mov RAX, [RBP-544]
  mov [RBP-608], RAX ; [RBP-608] holds the variable snkbgzauae_9293
  mov RAX, [RBP-560]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1194
  mov RAX, [RBP-400]
  jmp near done_1194
if_false_1194:
  mov RAX, [RBP-448]
done_1194:
  mov [RBP-616], RAX ; [RBP-616] holds the variable if_9297
  mov RAX, 126
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-616]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-624], RAX ; [RBP-624] holds the variable lxqkrsvnvd_9268
  ;; and_lhs {
  ;; and_lhs {
  mov RAX, [RBP-464]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1188
  ;; and_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1188
  mov RAX, 0xffffffffffffffff
and_done_1188:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1184
  ;; and_rhs {
  mov RAX, [RBP-512]
  mov R11, RAX
  mov RAX, [RBP-528]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_1185
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1185
_cmp_fail_1185:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1185:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1184
  mov RAX, 0xffffffffffffffff
and_done_1184:
  mov [RBP-632], RAX ; [RBP-632] holds the variable vjgkuwwqio_9302
  mov RAX, [RBP-464]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1180
  mov RAX, -166
  jmp near done_1180
if_false_1180:
  mov RAX, [RBP-400]
done_1180:
  mov [RBP-640], RAX ; [RBP-640] holds the variable rwgdfqhloe_9316
  mov RAX, [RBP-560]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1176
  mov RAX, [RBP-632]
  jmp near done_1176
if_false_1176:
  mov RAX, [RBP-464]
done_1176:
  mov [RBP-648], RAX ; [RBP-648] holds the variable nnlwcuubph_9312
  mov RAX, [RBP-528]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-656], RAX ; [RBP-656] holds the variable unary_9327
  mov RAX, 0
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-664], RAX ; [RBP-664] holds the variable unary_9329
  mov RAX, [RBP-656]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-664]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-672], RAX ; [RBP-672] holds the variable kjcctwrbbi_9205
  mov RAX, [RBP-512]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-680], RAX ; [RBP-680] holds the variable binop_9336
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1162
  mov RAX, -152
  jmp near done_1162
if_false_1162:
  mov RAX, -104
done_1162:
  mov [RBP-688], RAX ; [RBP-688] holds the variable if_9339
  mov RAX, [RBP-680]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-688]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-696], RAX ; [RBP-696] holds the variable binop_9335
  mov RAX, -174
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-704], RAX ; [RBP-704] holds the variable unary_9344
  mov RAX, [RBP-704]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-712], RAX ; [RBP-712] holds the variable unary_9343
  mov RAX, [RBP-696]
  mov R11, RAX
  mov RAX, [RBP-712]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_1152
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1152
_cmp_fail_1152:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1152:
  mov [RBP-720], RAX ; [RBP-720] holds the variable rvgrjxdsby_9332
  mov RAX, 102
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-512]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-728], RAX ; [RBP-728] holds the variable binop_9351
  mov RAX, [RBP-728]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-736], RAX ; [RBP-736] holds the variable unary_9350
  mov RAX, [RBP-400]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-744], RAX ; [RBP-744] holds the variable unary_9355
  mov RAX, [RBP-448]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 200
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-752], RAX ; [RBP-752] holds the variable binop_9357
  mov RAX, [RBP-744]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-752]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-760], RAX ; [RBP-760] holds the variable binop_9354
  mov RAX, [RBP-736]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-760]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-768], RAX ; [RBP-768] holds the variable zpnlbhsska_9347
  ;; or_lhs {
  ;; and_lhs {
  mov RAX, 158
  mov R11, RAX
  mov RAX, [RBP-448]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_1133
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1133
_cmp_fail_1133:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1133:
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1129
  ;; and_rhs {
  ;; or_lhs {
  mov RAX, [RBP-720]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1130
  ;; or_rhs {
  mov RAX, [RBP-464]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1130
  mov RAX, 0x7fffffffffffffff
or_done_1130:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1129
  mov RAX, 0xffffffffffffffff
and_done_1129:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1081
  ;; or_rhs {
  mov RAX, [RBP-464]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1125
  mov RAX, [RBP-512]
  jmp near done_1125
if_false_1125:
  mov RAX, [RBP-448]
done_1125:
  mov [RBP-784], RAX ; [RBP-784] holds the variable ksgcfvycnz_9373
  mov RAX, [RBP-464]
  mov [RBP-792], RAX ; [RBP-792] holds the variable powiuwullz_9384
  mov RAX, [RBP-464]
  mov [RBP-800], RAX ; [RBP-800] holds the variable kbpxglxynz_9388
  mov RAX, [RBP-800]
  mov [RBP-808], RAX ; [RBP-808] holds the variable uunzqxxfgr_9392
  mov RAX, [RBP-800]
  mov [RBP-816], RAX ; [RBP-816] holds the variable pmtqxgprse_9380
  mov RAX, [RBP-784]
  mov R11, RAX
  mov RAX, -182
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_1118
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1118
_cmp_fail_1118:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1118:
  mov [RBP-824], RAX ; [RBP-824] holds the variable coszkiwqcv_9397
  ;; and_lhs {
  mov RAX, [RBP-720]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1115
  ;; and_rhs {
  mov RAX, [RBP-720]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1115
  mov RAX, 0xffffffffffffffff
and_done_1115:
  mov [RBP-832], RAX ; [RBP-832] holds the variable aclxcdnabo_9403
  mov RAX, [RBP-824]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1111
  mov RAX, [RBP-464]
  jmp near done_1111
if_false_1111:
  mov RAX, 0xffffffffffffffff
done_1111:
  mov [RBP-840], RAX ; [RBP-840] holds the variable lqublykgsa_9409
  ;; and_lhs {
  mov RAX, [RBP-464]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1108
  ;; and_rhs {
  mov RAX, [RBP-824]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_1108
  mov RAX, 0xffffffffffffffff
and_done_1108:
  mov [RBP-848], RAX ; [RBP-848] holds the variable pskqyvodhl_9416
  mov RAX, [RBP-464]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1104
  mov RAX, [RBP-824]
  jmp near done_1104
if_false_1104:
  mov RAX, [RBP-720]
done_1104:
  mov [RBP-856], RAX ; [RBP-856] holds the variable zmdnvtnqpd_9422
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1100
  mov RAX, 96
  jmp near done_1100
if_false_1100:
  mov RAX, -162
done_1100:
  mov [RBP-864], RAX ; [RBP-864] holds the variable uyyzmzqskm_9429
  mov RAX, [RBP-816]
  mov [RBP-872], RAX ; [RBP-872] holds the variable gegyokvzgk_9437
  mov RAX, [RBP-512]
  mov [RBP-880], RAX ; [RBP-880] holds the variable dqqubepbye_9441
  mov RAX, [RBP-400]
  mov [RBP-888], RAX ; [RBP-888] holds the variable xibgbaxiwu_9445
  mov RAX, [RBP-464]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1081
  mov RAX, 0x7fffffffffffffff
or_done_1081:
  mov [RBP-776], RAX ; [RBP-776] holds the variable bxnqbtkhhd_9361
  mov RAX, [RBP-672]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-784], RAX ; [RBP-784] holds the variable binop_9457
  mov RAX, [RBP-784]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-792], RAX ; [RBP-792] holds the variable uckyewtkqx_9454
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1072
  mov RAX, [RBP-672]
  jmp near done_1072
if_false_1072:
  mov RAX, [RBP-448]
done_1072:
  mov [RBP-800], RAX ; [RBP-800] holds the variable if_9464
  mov RAX, [RBP-448]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -178
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-808], RAX ; [RBP-808] holds the variable binop_9468
  mov RAX, [RBP-800]
  mov R11, RAX
  mov RAX, [RBP-808]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_1066
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1066
_cmp_fail_1066:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1066:
  mov [RBP-816], RAX ; [RBP-816] holds the variable aghocqvein_9461
  mov RAX, [RBP-672]
  mov [RBP-824], RAX ; [RBP-824] holds the variable wluufrjcwf_9477
  mov RAX, [RBP-792]
  mov [RBP-832], RAX ; [RBP-832] holds the variable wwrdepikql_9481
  mov RAX, [RBP-672]
  mov [RBP-840], RAX ; [RBP-840] holds the variable sbcvbifjlu_9485
  mov RAX, [RBP-720]
  mov [RBP-848], RAX ; [RBP-848] holds the variable zpqhqfdnyy_9489
  mov RAX, [RBP-400]
  mov [RBP-856], RAX ; [RBP-856] holds the variable ifevtyqltr_9493
  mov RAX, [RBP-720]
  mov [RBP-864], RAX ; [RBP-864] holds the variable jrteemjnba_9497
  mov RAX, 0x7fffffffffffffff
  mov [RBP-872], RAX ; [RBP-872] holds the variable fqlhyyxduo_9501
  mov RAX, [RBP-864]
  mov [RBP-880], RAX ; [RBP-880] holds the variable ukviwbwccs_9505
  mov RAX, [RBP-448]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-888], RAX ; [RBP-888] holds the variable unary_9509
  mov RAX, [RBP-448]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-888]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-896], RAX ; [RBP-896] holds the variable dhgomzzuvj_9472
  mov RAX, [RBP-768]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-904], RAX ; [RBP-904] holds the variable qtldwrkdyt_9516
  mov RAX, [RBP-720]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1047
  mov RAX, [RBP-816]
  jmp near done_1047
if_false_1047:
  mov RAX, [RBP-816]
done_1047:
  mov [RBP-912], RAX ; [RBP-912] holds the variable vaiyqihsca_9521
  mov RAX, [RBP-816]
  mov [RBP-920], RAX ; [RBP-920] holds the variable szrftknveq_9532
  mov RAX, 0x7fffffffffffffff
  mov [RBP-928], RAX ; [RBP-928] holds the variable xyhvuzjzfx_9528
  mov RAX, [RBP-720]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1041
  mov RAX, [RBP-448]
  jmp near done_1041
if_false_1041:
  mov RAX, [RBP-904]
done_1041:
  mov [RBP-936], RAX ; [RBP-936] holds the variable ggichoyhyq_9537
  mov RAX, [RBP-896]
  mov R11, RAX
  mov RAX, [RBP-792]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_1038
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1038
_cmp_fail_1038:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1038:
  mov [RBP-944], RAX ; [RBP-944] holds the variable eskbftbgdx_9512
  mov RAX, [RBP-512]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-952], RAX ; [RBP-952] holds the variable unary_9550
  mov RAX, [RBP-952]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-960], RAX ; [RBP-960] holds the variable szdqlwgaut_9547
  mov RAX, [RBP-768]
  mov R11, RAX
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... >= ...
  mov RAX, R11
  cmp RAX, R12
  jl near _cmp_fail_1031
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1031
_cmp_fail_1031:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1031:
  mov [RBP-968], RAX ; [RBP-968] holds the variable binop_9556
  mov RAX, [RBP-968]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1011
  mov RAX, [RBP-672]
  mov R11, RAX
  mov RAX, [RBP-768]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_1027
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1027
_cmp_fail_1027:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1027:
  jmp near done_1011
if_false_1011:
  mov RAX, 0xffffffffffffffff
  mov [RBP-984], RAX ; [RBP-984] holds the variable xmqtgyifhz_9564
  mov RAX, -6
  mov [RBP-992], RAX ; [RBP-992] holds the variable kbivpxzwtr_9568
  mov RAX, [RBP-448]
  mov [RBP-1000], RAX ; [RBP-1000] holds the variable nfmcuflwpc_9572
  mov RAX, [RBP-776]
  mov [RBP-1008], RAX ; [RBP-1008] holds the variable gqhjtydzgt_9576
  mov RAX, [RBP-776]
  mov [RBP-1016], RAX ; [RBP-1016] holds the variable mildvhjopx_9580
  mov RAX, [RBP-1016]
  mov [RBP-1024], RAX ; [RBP-1024] holds the variable nqdyhaefsn_9584
  mov RAX, [RBP-720]
  mov [RBP-1032], RAX ; [RBP-1032] holds the variable jzuckfoxlr_9588
  mov RAX, [RBP-944]
done_1011:
  mov [RBP-976], RAX ; [RBP-976] holds the variable yulwjfjssy_9553
  ;; or_lhs {
  mov RAX, [RBP-944]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1008
  ;; or_rhs {
  mov RAX, [RBP-976]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_1008
  mov RAX, 0x7fffffffffffffff
or_done_1008:
  mov [RBP-984], RAX ; [RBP-984] holds the variable binop_and_or_9596
  mov RAX, [RBP-984]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_999
  mov RAX, [RBP-816]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_1003
  mov RAX, [RBP-944]
  jmp near done_1003
if_false_1003:
  mov RAX, [RBP-464]
done_1003:
  jmp near done_999
if_false_999:
  mov RAX, [RBP-672]
  mov R11, RAX
  mov RAX, [RBP-672]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_1000
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_1000
_cmp_fail_1000:
  mov RAX, 0x7fffffffffffffff
_cmp_done_1000:
done_999:
  mov [RBP-992], RAX ; [RBP-992] holds the variable vmeqfalbzx_9593
  ;; and_lhs {
  mov RAX, [RBP-816]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_996
  ;; and_rhs {
  mov RAX, [RBP-992]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_996
  mov RAX, 0xffffffffffffffff
and_done_996:
  mov [RBP-1000], RAX ; [RBP-1000] holds the variable binop_and_or_9610
  mov RAX, [RBP-1000]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_989
  mov RAX, -146
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-960]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_989
if_false_989:
  mov RAX, -62
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
done_989:
  mov [RBP-1008], RAX ; [RBP-1008] holds the variable umzwrnoais_9607
  ;; or_lhs {
  mov RAX, [RBP-1008]
  mov R11, RAX
  mov RAX, [RBP-896]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_986
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_986
_cmp_fail_986:
  mov RAX, 0x7fffffffffffffff
_cmp_done_986:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_964
  ;; or_rhs {
  mov RAX, [RBP-896]
  mov [RBP-1024], RAX ; [RBP-1024] holds the variable botvvbjsbw_9624
  mov RAX, [RBP-720]
  mov [RBP-1032], RAX ; [RBP-1032] holds the variable qvyrgsfhof_9628
  mov RAX, 0xffffffffffffffff
  mov [RBP-1040], RAX ; [RBP-1040] holds the variable cgsljhgvei_9632
  mov RAX, [RBP-464]
  mov [RBP-1048], RAX ; [RBP-1048] holds the variable fkmzimiplw_9636
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1056], RAX ; [RBP-1056] holds the variable ybjxkwxfvv_9640
  mov RAX, [RBP-992]
  mov [RBP-1064], RAX ; [RBP-1064] holds the variable vzuswkdgfn_9644
  mov RAX, [RBP-976]
  mov [RBP-1072], RAX ; [RBP-1072] holds the variable zfnegkvvbf_9648
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1080], RAX ; [RBP-1080] holds the variable ovmpuvhyez_9652
  mov RAX, [RBP-464]
  mov [RBP-1088], RAX ; [RBP-1088] holds the variable noslvhzecb_9656
  mov RAX, [RBP-1080]
  mov [RBP-1096], RAX ; [RBP-1096] holds the variable zufshyzaat_9660
  mov RAX, [RBP-944]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_964
  mov RAX, 0x7fffffffffffffff
or_done_964:
  mov [RBP-1016], RAX ; [RBP-1016] holds the variable dwgaqkutiv_9450
  mov RAX, [RBP-768]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-512]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1024], RAX ; [RBP-1024] holds the variable binop_9672
  mov RAX, -42
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1032], RAX ; [RBP-1032] holds the variable unary_9675
  mov RAX, [RBP-1024]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1032]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1040], RAX ; [RBP-1040] holds the variable ksifcfuvsm_9669
  mov RAX, [RBP-1040]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1048], RAX ; [RBP-1048] holds the variable unary_9681
  mov RAX, [RBP-1048]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1056], RAX ; [RBP-1056] holds the variable mfwvbrolek_9678
  mov RAX, [RBP-448]
  mov [RBP-1064], RAX ; [RBP-1064] holds the variable jrsuzfvclh_9692
  mov RAX, [RBP-1064]
  mov [RBP-1072], RAX ; [RBP-1072] holds the variable ryirhidxzg_9696
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1080], RAX ; [RBP-1080] holds the variable qxrpnhgaks_9700
  mov RAX, [RBP-672]
  mov [RBP-1088], RAX ; [RBP-1088] holds the variable zpvmfturpq_9704
  mov RAX, 166
  mov [RBP-1096], RAX ; [RBP-1096] holds the variable zkqjezgcvj_9708
  mov RAX, [RBP-1080]
  mov [RBP-1104], RAX ; [RBP-1104] holds the variable mglvymnkmf_9712
  mov RAX, [RBP-1080]
  mov [RBP-1112], RAX ; [RBP-1112] holds the variable sbpgbdjash_9716
  mov RAX, [RBP-448]
  mov [RBP-1120], RAX ; [RBP-1120] holds the variable tyopeinkya_9720
  mov RAX, [RBP-1104]
  mov [RBP-1128], RAX ; [RBP-1128] holds the variable vqhchpbsrx_9688
  mov RAX, [RBP-1128]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_939
  mov RAX, [RBP-1016]
  jmp near done_939
if_false_939:
  mov RAX, [RBP-1128]
done_939:
  mov [RBP-1136], RAX ; [RBP-1136] holds the variable vrumxyojnj_9725
  mov RAX, [RBP-672]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1144], RAX ; [RBP-1144] holds the variable fegtwzntok_9732
  mov RAX, [RBP-1016]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_933
  mov RAX, [RBP-776]
  jmp near done_933
if_false_933:
  mov RAX, 0x7fffffffffffffff
done_933:
  mov [RBP-1152], RAX ; [RBP-1152] holds the variable bxibnhhvlb_9684
  mov RAX, [RBP-1056]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -160
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1160], RAX ; [RBP-1160] holds the variable binop_9744
  mov RAX, [RBP-400]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1168], RAX ; [RBP-1168] holds the variable unary_9747
  mov RAX, [RBP-1160]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1168]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1176], RAX ; [RBP-1176] holds the variable tcbyrndmjc_9741
  mov RAX, [RBP-1152]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_921
  mov RAX, 134
  jmp near done_921
if_false_921:
  mov RAX, [RBP-400]
done_921:
  mov [RBP-1184], RAX ; [RBP-1184] holds the variable if_9753
  mov RAX, [RBP-1184]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1192], RAX ; [RBP-1192] holds the variable daxthjcbsl_9750
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_915
  mov RAX, -160
  jmp near done_915
if_false_915:
  mov RAX, -134
done_915:
  mov [RBP-1200], RAX ; [RBP-1200] holds the variable if_9758
  mov RAX, [RBP-1200]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1208], RAX ; [RBP-1208] holds the variable bygdvhatpc_9665
  mov RAX, [RBP-1208]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-448]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1216], RAX ; [RBP-1216] holds the variable binop_9767
  mov RAX, [RBP-672]
  mov [RBP-1224], RAX ; [RBP-1224] holds the variable jgzintifia_9772
  mov RAX, 0xffffffffffffffff
  mov [RBP-1232], RAX ; [RBP-1232] holds the variable sputsjwute_9776
  mov RAX, [RBP-1016]
  mov [RBP-1240], RAX ; [RBP-1240] holds the variable gqgtxrrtuc_9780
  mov RAX, [RBP-1216]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-448]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1248], RAX ; [RBP-1248] holds the variable binop_9766
  mov RAX, [RBP-1248]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1256], RAX ; [RBP-1256] holds the variable mmnbqzfslg_9763
  mov RAX, 134
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1208]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1264], RAX ; [RBP-1264] holds the variable binop_9786
  mov RAX, [RBP-1208]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-512]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1272], RAX ; [RBP-1272] holds the variable binop_9789
  mov RAX, [RBP-1264]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1272]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1280], RAX ; [RBP-1280] holds the variable binop_9785
  mov RAX, -64
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-672]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1288], RAX ; [RBP-1288] holds the variable binop_9793
  mov RAX, [RBP-400]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1296], RAX ; [RBP-1296] holds the variable binop_9796
  mov RAX, [RBP-1288]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1296]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1304], RAX ; [RBP-1304] holds the variable binop_9792
  mov RAX, [RBP-1280]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1304]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1312], RAX ; [RBP-1312] holds the variable ytnnbqfhoc_9043
  mov RAX, [RBP-1312]
  mov R11, RAX
  mov RAX, [RBP-1312]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_878
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_878
_cmp_fail_878:
  mov RAX, 0x7fffffffffffffff
_cmp_done_878:
  mov [RBP-1320], RAX ; [RBP-1320] holds the variable binop_9805
  mov RAX, [RBP-1320]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_870
  mov RAX, 114
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1312]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  jmp near done_870
if_false_870:
  mov RAX, -52
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 48
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
done_870:
  mov [RBP-1328], RAX ; [RBP-1328] holds the variable if_9804
  mov RAX, [RBP-1312]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1336], RAX ; [RBP-1336] holds the variable unary_9815
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_864
  mov RAX, [RBP-1312]
  jmp near done_864
if_false_864:
  mov RAX, [RBP-400]
done_864:
  mov [RBP-1344], RAX ; [RBP-1344] holds the variable if_9817
  mov RAX, [RBP-1336]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1344]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1352], RAX ; [RBP-1352] holds the variable binop_9814
  mov RAX, [RBP-1328]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1352]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1360], RAX ; [RBP-1360] holds the variable binop_9803
  mov RAX, [RBP-1360]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1368], RAX ; [RBP-1368] holds the variable pglrmqfskb_9800
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1376], RAX ; [RBP-1376] holds the variable cstwsmqalw_9829
  mov RAX, [RBP-1376]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_846
  mov RAX, [RBP-400]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1312]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_846
if_false_846:
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_847
  mov RAX, [RBP-400]
  jmp near done_847
if_false_847:
  mov RAX, [RBP-400]
done_847:
done_846:
  mov [RBP-1384], RAX ; [RBP-1384] holds the variable if_9826
  mov RAX, [RBP-1312]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1392], RAX ; [RBP-1392] holds the variable fcdxdorpgv_9842
  mov RAX, [RBP-1368]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1400], RAX ; [RBP-1400] holds the variable nvbeejyevf_9847
  ;; and_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_839
  ;; and_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_839
  mov RAX, 0xffffffffffffffff
and_done_839:
  mov [RBP-1408], RAX ; [RBP-1408] holds the variable mkwltmrpww_9852
  ;; and_lhs {
  mov RAX, [RBP-1408]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_836
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_836
  mov RAX, 0xffffffffffffffff
and_done_836:
  mov [RBP-1416], RAX ; [RBP-1416] holds the variable wfaxvdiuor_9858
  mov RAX, 80
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1424], RAX ; [RBP-1424] holds the variable npljebpmnd_9864
  mov RAX, [RBP-1408]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_830
  mov RAX, [RBP-1408]
  jmp near done_830
if_false_830:
  mov RAX, [RBP-1416]
done_830:
  mov [RBP-1432], RAX ; [RBP-1432] holds the variable qaynovhzbr_9869
  mov RAX, [RBP-400]
  mov [RBP-1440], RAX ; [RBP-1440] holds the variable fzovhwlncv_9880
  mov RAX, [RBP-1432]
  mov [RBP-1448], RAX ; [RBP-1448] holds the variable hwmuaczcdj_9884
  mov RAX, [RBP-1448]
  mov [RBP-1456], RAX ; [RBP-1456] holds the variable nhkeskcvku_9888
  mov RAX, [RBP-1392]
  mov [RBP-1464], RAX ; [RBP-1464] holds the variable dasiexxntd_9892
  mov RAX, 76
  mov [RBP-1472], RAX ; [RBP-1472] holds the variable xkblhrripa_9896
  mov RAX, [RBP-1472]
  mov [RBP-1480], RAX ; [RBP-1480] holds the variable skqibmlolc_9900
  mov RAX, -144
  mov [RBP-1488], RAX ; [RBP-1488] holds the variable espvaiwtnk_9904
  mov RAX, -176
  mov [RBP-1496], RAX ; [RBP-1496] holds the variable pefqwsiayb_9908
  mov RAX, [RBP-1480]
  mov [RBP-1504], RAX ; [RBP-1504] holds the variable lwbujxkjll_9912
  mov RAX, [RBP-1416]
  mov [RBP-1512], RAX ; [RBP-1512] holds the variable senkbnvuoz_9916
  mov RAX, [RBP-1472]
  mov [RBP-1520], RAX ; [RBP-1520] holds the variable icklkstumi_9876
  mov RAX, [RBP-1424]
  mov [RBP-1528], RAX ; [RBP-1528] holds the variable iaislxyeau_9925
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1536], RAX ; [RBP-1536] holds the variable iapnqqjxgh_9929
  mov RAX, [RBP-1432]
  mov [RBP-1544], RAX ; [RBP-1544] holds the variable hixgrcjvuc_9933
  mov RAX, [RBP-1544]
  mov [RBP-1552], RAX ; [RBP-1552] holds the variable qwwfvhucpf_9937
  mov RAX, [RBP-1312]
  mov [RBP-1560], RAX ; [RBP-1560] holds the variable lvaweizfuc_9941
  mov RAX, [RBP-1560]
  mov [RBP-1568], RAX ; [RBP-1568] holds the variable qaskmtixzx_9945
  mov RAX, [RBP-1416]
  mov [RBP-1576], RAX ; [RBP-1576] holds the variable wzkdrwdphp_9921
  mov RAX, [RBP-1520]
  mov [RBP-1584], RAX ; [RBP-1584] holds the variable lnnijnezwy_9951
  mov RAX, [RBP-400]
  mov [RBP-1592], RAX ; [RBP-1592] holds the variable xoqnjepuie_9955
  mov RAX, [RBP-1520]
  mov [RBP-1600], RAX ; [RBP-1600] holds the variable oqqahvdefg_9959
  mov RAX, [RBP-1312]
  mov [RBP-1608], RAX ; [RBP-1608] holds the variable uqcphwznuv_9963
  mov RAX, 0xffffffffffffffff
  mov [RBP-1616], RAX ; [RBP-1616] holds the variable dkjrwdxjfo_9967
  mov RAX, [RBP-1416]
  mov [RBP-1624], RAX ; [RBP-1624] holds the variable wfxsakuqqg_9971
  mov RAX, [RBP-1584]
  mov [RBP-1632], RAX ; [RBP-1632] holds the variable laxjbgoqrv_9975
  mov RAX, [RBP-1432]
  mov [RBP-1640], RAX ; [RBP-1640] holds the variable fusktjdhow_9979
  mov RAX, [RBP-1600]
  mov [RBP-1648], RAX ; [RBP-1648] holds the variable micpudmkmz_9983
  mov RAX, [RBP-1384]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1592]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1656], RAX ; [RBP-1656] holds the variable binop_9825
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_796
  mov RAX, [RBP-1368]
  jmp near done_796
if_false_796:
  mov RAX, [RBP-1312]
done_796:
  mov [RBP-1664], RAX ; [RBP-1664] holds the variable if_9989
  mov RAX, [RBP-1664]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1672], RAX ; [RBP-1672] holds the variable unary_9988
  mov RAX, [RBP-1368]
  mov R11, RAX
  mov RAX, [RBP-1368]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_791
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_791
_cmp_fail_791:
  mov RAX, 0x7fffffffffffffff
_cmp_done_791:
  mov [RBP-1680], RAX ; [RBP-1680] holds the variable owcvcxgfzi_9995
  mov RAX, [RBP-1312]
  mov R11, RAX
  mov RAX, -126
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_788
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_788
_cmp_fail_788:
  mov RAX, 0x7fffffffffffffff
_cmp_done_788:
  mov [RBP-1688], RAX ; [RBP-1688] holds the variable pcvsnnzsds_10001
  mov RAX, [RBP-400]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-400]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1696], RAX ; [RBP-1696] holds the variable diobypwyxa_10007
  mov RAX, [RBP-1312]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1704], RAX ; [RBP-1704] holds the variable unary_10012
  mov RAX, [RBP-1672]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1704]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1712], RAX ; [RBP-1712] holds the variable binop_9987
  mov RAX, [RBP-1656]
  mov R11, RAX
  mov RAX, [RBP-1712]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_777
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_777
_cmp_fail_777:
  mov RAX, 0x7fffffffffffffff
_cmp_done_777:
  mov [RBP-1720], RAX ; [RBP-1720] holds the variable euiwzetgzo_9822
  mov RAX, [RBP-400]
  mov [RBP-1728], RAX ; [RBP-1728] holds the variable jrclbuxhbx_10022
  mov RAX, [RBP-1312]
  mov [RBP-1736], RAX ; [RBP-1736] holds the variable gglwyuxlpi_10026
  mov RAX, 46
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1744], RAX ; [RBP-1744] holds the variable unary_10019
  mov RAX, [RBP-1744]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1752], RAX ; [RBP-1752] holds the variable unary_10018
  mov RAX, [RBP-1752]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1760], RAX ; [RBP-1760] holds the variable qvsxxqguqh_10015
  mov RAX, [RBP-1760]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -146
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1768], RAX ; [RBP-1768] holds the variable clqhyrihsr_10037
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_762
  mov RAX, 142
  jmp near done_762
if_false_762:
  mov RAX, [RBP-1312]
done_762:
  mov [RBP-1776], RAX ; [RBP-1776] holds the variable bentuccjuj_10043
  mov RAX, [RBP-1312]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1368]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1784], RAX ; [RBP-1784] holds the variable seoqamboqx_10050
  mov RAX, [RBP-1784]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1792], RAX ; [RBP-1792] holds the variable pxguazejyz_10056
  mov RAX, [RBP-1720]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_753
  mov RAX, -84
  jmp near done_753
if_false_753:
  mov RAX, 56
done_753:
  mov [RBP-1800], RAX ; [RBP-1800] holds the variable ytrxczybgv_10061
  mov RAX, [RBP-1368]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1808], RAX ; [RBP-1808] holds the variable unary_10067
  mov RAX, [RBP-1312]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1816], RAX ; [RBP-1816] holds the variable unary_10070
  mov RAX, [RBP-1312]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1760]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1824], RAX ; [RBP-1824] holds the variable binop_10072
  mov RAX, [RBP-1816]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1824]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1832], RAX ; [RBP-1832] holds the variable binop_10069
  mov RAX, [RBP-1808]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1832]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1840], RAX ; [RBP-1840] holds the variable qxxcwnhhhy_10032
  mov RAX, [RBP-1720]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_736
  mov RAX, 0x7fffffffffffffff
  jmp near done_736
if_false_736:
  mov RAX, [RBP-1720]
done_736:
  mov [RBP-1848], RAX ; [RBP-1848] holds the variable if_10080
  mov RAX, [RBP-1848]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_727
  mov RAX, [RBP-1840]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1312]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  jmp near done_727
if_false_727:
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_728
  mov RAX, [RBP-1840]
  jmp near done_728
if_false_728:
  mov RAX, [RBP-400]
done_728:
done_727:
  mov [RBP-1856], RAX ; [RBP-1856] holds the variable if_10079
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1864], RAX ; [RBP-1864] holds the variable gcuaegtgqn_10094
  mov RAX, 42
  mov [RBP-1872], RAX ; [RBP-1872] holds the variable wwvqbrgtxz_10098
  mov RAX, -122
  mov [RBP-1880], RAX ; [RBP-1880] holds the variable rrvvomhjhv_10102
  mov RAX, -184
  mov [RBP-1888], RAX ; [RBP-1888] holds the variable wxwxncblaw_10106
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_705
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1904], RAX ; [RBP-1904] holds the variable tcyjxmkeru_10112
  mov RAX, -110
  mov [RBP-1912], RAX ; [RBP-1912] holds the variable vaycixsjsv_10116
  mov RAX, [RBP-1912]
  jmp near done_705
if_false_705:
  mov RAX, 0xffffffffffffffff
  mov [RBP-1904], RAX ; [RBP-1904] holds the variable aedcgrttuu_10122
  mov RAX, [RBP-1720]
  mov [RBP-1912], RAX ; [RBP-1912] holds the variable dptupfplck_10126
  mov RAX, [RBP-1720]
  mov [RBP-1920], RAX ; [RBP-1920] holds the variable nnqchicnis_10130
  mov RAX, 0x7fffffffffffffff
  mov [RBP-1928], RAX ; [RBP-1928] holds the variable lsakxajsjk_10134
  mov RAX, [RBP-1912]
  mov [RBP-1936], RAX ; [RBP-1936] holds the variable npgtxofkai_10138
  mov RAX, [RBP-1840]
done_705:
  mov [RBP-1896], RAX ; [RBP-1896] holds the variable if_10091
  mov RAX, [RBP-1856]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1896]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-1904], RAX ; [RBP-1904] holds the variable vnumbfenip_10076
  mov RAX, [RBP-1720]
  mov [RBP-1912], RAX ; [RBP-1912] holds the variable iknmmkauku_10149
  mov RAX, [RBP-1912]
  mov [RBP-1920], RAX ; [RBP-1920] holds the variable ayplzvcrns_10153
  mov RAX, [RBP-1904]
  mov [RBP-1928], RAX ; [RBP-1928] holds the variable tevqsdgely_10157
  mov RAX, [RBP-1912]
  mov [RBP-1936], RAX ; [RBP-1936] holds the variable dslsmbhhtj_10161
  mov RAX, [RBP-400]
  mov [RBP-1944], RAX ; [RBP-1944] holds the variable fpotulmsdo_10165
  mov RAX, [RBP-1840]
  mov [RBP-1952], RAX ; [RBP-1952] holds the variable lzozblfizz_10169
  mov RAX, 100
  mov [RBP-1960], RAX ; [RBP-1960] holds the variable cbmiyqiewt_10173
  mov RAX, [RBP-400]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1968], RAX ; [RBP-1968] holds the variable unary_10146
  mov RAX, [RBP-1760]
  mov [RBP-1976], RAX ; [RBP-1976] holds the variable kgbulgvzjm_10180
  mov RAX, 100
  mov [RBP-1984], RAX ; [RBP-1984] holds the variable fnwcbnrlhe_10184
  mov RAX, [RBP-1760]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-1992], RAX ; [RBP-1992] holds the variable unary_10177
  mov RAX, [RBP-1968]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1992]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2000], RAX ; [RBP-2000] holds the variable oouwmvfdzw_10143
  mov RAX, [RBP-400]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1312]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2008], RAX ; [RBP-2008] holds the variable binop_10193
  mov RAX, [RBP-1720]
  mov [RBP-2016], RAX ; [RBP-2016] holds the variable qlrwgqavwl_10198
  mov RAX, [RBP-2016]
  mov [RBP-2024], RAX ; [RBP-2024] holds the variable dzihrbqbsj_10202
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2032], RAX ; [RBP-2032] holds the variable mlrgevsccx_10206
  mov RAX, [RBP-2032]
  mov [RBP-2040], RAX ; [RBP-2040] holds the variable bmlponwkrr_10210
  mov RAX, [RBP-1760]
  mov [RBP-2048], RAX ; [RBP-2048] holds the variable rfnmwoqhon_10214
  mov RAX, [RBP-400]
  mov [RBP-2056], RAX ; [RBP-2056] holds the variable pwhhmtpsti_10218
  mov RAX, [RBP-1904]
  mov [RBP-2064], RAX ; [RBP-2064] holds the variable oxdyifjrlj_10222
  mov RAX, [RBP-2040]
  mov [RBP-2072], RAX ; [RBP-2072] holds the variable dhiyrakikp_10226
  mov RAX, [RBP-2072]
  mov [RBP-2080], RAX ; [RBP-2080] holds the variable goqrhlgaiz_10230
  mov RAX, [RBP-2064]
  mov [RBP-2088], RAX ; [RBP-2088] holds the variable hajpvppyhy_10234
  mov RAX, [RBP-2008]
  mov R11, RAX
  mov RAX, [RBP-1904]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_670
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_670
_cmp_fail_670:
  mov RAX, 0x7fffffffffffffff
_cmp_done_670:
  mov [RBP-2096], RAX ; [RBP-2096] holds the variable binop_10192
  mov RAX, [RBP-2096]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_652
  mov RAX, [RBP-400]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -64
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2112], RAX ; [RBP-2112] holds the variable binop_10239
  mov RAX, [RBP-1760]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2120], RAX ; [RBP-2120] holds the variable unary_10242
  mov RAX, [RBP-2112]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2120]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  jmp near done_652
if_false_652:
  mov RAX, [RBP-2000]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -196
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2112], RAX ; [RBP-2112] holds the variable binop_10245
  mov RAX, [RBP-2112]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
done_652:
  mov [RBP-2104], RAX ; [RBP-2104] holds the variable ezcolnuqav_10189
  mov RAX, [RBP-1312]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2112], RAX ; [RBP-2112] holds the variable unary_10253
  mov RAX, [RBP-1720]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_646
  mov RAX, [RBP-400]
  jmp near done_646
if_false_646:
  mov RAX, [RBP-1312]
done_646:
  mov [RBP-2120], RAX ; [RBP-2120] holds the variable if_10255
  mov RAX, [RBP-2112]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2120]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2128], RAX ; [RBP-2128] holds the variable binop_10252
  mov RAX, [RBP-1840]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2136], RAX ; [RBP-2136] holds the variable unary_10260
  mov RAX, -164
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1840]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2144], RAX ; [RBP-2144] holds the variable binop_10262
  mov RAX, [RBP-2136]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2144]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2152], RAX ; [RBP-2152] holds the variable binop_10259
  mov RAX, [RBP-2128]
  mov R11, RAX
  mov RAX, [RBP-2152]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_632
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_632
_cmp_fail_632:
  mov RAX, 0x7fffffffffffffff
_cmp_done_632:
  mov [RBP-2160], RAX ; [RBP-2160] holds the variable ggwtzxxifl_10249
  mov RAX, -40
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1840]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2168], RAX ; [RBP-2168] holds the variable jhcahdfkbd_10271
  mov RAX, [RBP-2000]
  mov R11, RAX
  mov RAX, [RBP-2104]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_626
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_626
_cmp_fail_626:
  mov RAX, 0x7fffffffffffffff
_cmp_done_626:
  mov [RBP-2176], RAX ; [RBP-2176] holds the variable mgqyjcywyl_10277
  mov RAX, -144
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2184], RAX ; [RBP-2184] holds the variable lphyzzzysg_10283
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_621
  ;; or_rhs {
  mov RAX, 0xffffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_621
  mov RAX, 0x7fffffffffffffff
or_done_621:
  mov [RBP-2192], RAX ; [RBP-2192] holds the variable oopnijqzzv_10288
  mov RAX, 0xffffffffffffffff
  mov [RBP-2200], RAX ; [RBP-2200] holds the variable ctwyngvfnc_10295
  mov RAX, [RBP-400]
  mov [RBP-2208], RAX ; [RBP-2208] holds the variable yjmmgojrsj_10299
  mov RAX, [RBP-2160]
  mov [RBP-2216], RAX ; [RBP-2216] holds the variable nvwreqnhpy_10303
  mov RAX, [RBP-1368]
  mov [RBP-2224], RAX ; [RBP-2224] holds the variable odaehllflv_10307
  mov RAX, [RBP-1840]
  mov [RBP-2232], RAX ; [RBP-2232] holds the variable cnwrorvxck_10311
  mov RAX, [RBP-2184]
  mov [RBP-2240], RAX ; [RBP-2240] holds the variable uwijlufkbb_10315
  mov RAX, [RBP-1720]
  mov [RBP-2248], RAX ; [RBP-2248] holds the variable zlsvowemul_10319
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2256], RAX ; [RBP-2256] holds the variable lwrcqugorc_10323
  mov RAX, [RBP-2176]
  mov [RBP-2264], RAX ; [RBP-2264] holds the variable ycwlaavsfh_10327
  mov RAX, [RBP-2160]
  mov [RBP-2272], RAX ; [RBP-2272] holds the variable egqegiilal_10331
  mov RAX, [RBP-2104]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1368]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2280], RAX ; [RBP-2280] holds the variable binop_10336
  mov RAX, 62
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2288], RAX ; [RBP-2288] holds the variable unary_10339
  mov RAX, [RBP-2280]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2288]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2296], RAX ; [RBP-2296] holds the variable binop_10335
  mov RAX, 26
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2296]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2304], RAX ; [RBP-2304] holds the variable hjcwesyyeg_10266
  mov RAX, [RBP-1840]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1312]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2312], RAX ; [RBP-2312] holds the variable mqerjwfcdf_10347
  mov RAX, [RBP-1368]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2320], RAX ; [RBP-2320] holds the variable cychubildm_10353
  ;; or_lhs {
  mov RAX, [RBP-1720]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_592
  ;; or_rhs {
  mov RAX, [RBP-2160]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_592
  mov RAX, 0x7fffffffffffffff
or_done_592:
  mov [RBP-2328], RAX ; [RBP-2328] holds the variable binop_and_or_10357
  mov RAX, [RBP-2328]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_571
  mov RAX, [RBP-400]
  mov R11, RAX
  mov RAX, [RBP-1760]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... < ...
  mov RAX, R11
  cmp RAX, R12
  jge near _cmp_fail_588
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_588
_cmp_fail_588:
  mov RAX, 0x7fffffffffffffff
_cmp_done_588:
  mov [RBP-2344], RAX ; [RBP-2344] holds the variable binop_10361
  mov RAX, [RBP-2344]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_581
  mov RAX, [RBP-400]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  jmp near done_581
if_false_581:
  mov RAX, [RBP-1312]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1312]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
done_581:
  jmp near done_571
if_false_571:
  mov RAX, [RBP-1720]
  mov [RBP-2344], RAX ; [RBP-2344] holds the variable cidahuqhhv_10372
  mov RAX, [RBP-1368]
  mov [RBP-2352], RAX ; [RBP-2352] holds the variable rhmfevpqbl_10376
  mov RAX, [RBP-2352]
  mov [RBP-2360], RAX ; [RBP-2360] holds the variable scrdrsllbs_10380
  mov RAX, -144
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
done_571:
  mov [RBP-2336], RAX ; [RBP-2336] holds the variable remhsrdrhb_10342
  ;; or_lhs {
  mov RAX, [RBP-2160]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_568
  ;; or_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_568
  mov RAX, 0x7fffffffffffffff
or_done_568:
  mov [RBP-2344], RAX ; [RBP-2344] holds the variable binop_and_or_10389
  mov RAX, [RBP-2344]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_559
  mov RAX, [RBP-1760]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1840]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  jmp near done_559
if_false_559:
  mov RAX, [RBP-1720]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_560
  mov RAX, -170
  jmp near done_560
if_false_560:
  mov RAX, 120
done_560:
done_559:
  mov [RBP-2352], RAX ; [RBP-2352] holds the variable if_10388
  mov RAX, [RBP-2352]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2360], RAX ; [RBP-2360] holds the variable qqfnalwtvv_10385
  mov RAX, [RBP-2304]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2304]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2368], RAX ; [RBP-2368] holds the variable binop_10407
  mov RAX, 62
  mov [RBP-2376], RAX ; [RBP-2376] holds the variable mfivctuqtg_10412
  mov RAX, [RBP-2160]
  mov [RBP-2384], RAX ; [RBP-2384] holds the variable brnopvmqgl_10416
  mov RAX, [RBP-2384]
  mov [RBP-2392], RAX ; [RBP-2392] holds the variable kpdvfwyanl_10420
  mov RAX, 94
  mov [RBP-2400], RAX ; [RBP-2400] holds the variable ugrzuhffaa_10424
  mov RAX, [RBP-2104]
  mov [RBP-2408], RAX ; [RBP-2408] holds the variable mfnpdbltdx_10428
  mov RAX, [RBP-2368]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -22
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2416], RAX ; [RBP-2416] holds the variable kmmhxiiqnc_10404
  mov RAX, [RBP-1840]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2424], RAX ; [RBP-2424] holds the variable unary_10436
  mov RAX, [RBP-2160]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_540
  mov RAX, [RBP-400]
  jmp near done_540
if_false_540:
  mov RAX, [RBP-1904]
done_540:
  mov [RBP-2432], RAX ; [RBP-2432] holds the variable if_10438
  mov RAX, [RBP-2424]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2432]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2440], RAX ; [RBP-2440] holds the variable escovtpyrq_10433
  mov RAX, [RBP-1840]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 40
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2448], RAX ; [RBP-2448] holds the variable binop_10446
  mov RAX, [RBP-400]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2360]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2456], RAX ; [RBP-2456] holds the variable binop_10449
  mov RAX, [RBP-2448]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2456]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2464], RAX ; [RBP-2464] holds the variable scdleiiwqc_10443
  ;; or_lhs {
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_524
  mov RAX, [RBP-2160]
  jmp near done_524
if_false_524:
  mov RAX, [RBP-1720]
done_524:
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_520
  ;; or_rhs {
  mov RAX, [RBP-2336]
  mov R11, RAX
  mov RAX, [RBP-1840]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_521
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_521
_cmp_fail_521:
  mov RAX, 0x7fffffffffffffff
_cmp_done_521:
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_520
  mov RAX, 0x7fffffffffffffff
or_done_520:
  mov [RBP-2472], RAX ; [RBP-2472] holds the variable yeihaosfii_10453
  mov RAX, [RBP-2472]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_516
  mov RAX, 0xffffffffffffffff
  jmp near done_516
if_false_516:
  mov RAX, [RBP-2472]
done_516:
  mov [RBP-2480], RAX ; [RBP-2480] holds the variable cpllcxuhzk_10468
  mov RAX, 0xffffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_512
  mov RAX, 0xffffffffffffffff
  jmp near done_512
if_false_512:
  mov RAX, 0x7fffffffffffffff
done_512:
  mov [RBP-2488], RAX ; [RBP-2488] holds the variable poeormihps_10475
  mov RAX, [RBP-2360]
  mov [RBP-2496], RAX ; [RBP-2496] holds the variable khicqubygv_10486
  mov RAX, 34
  mov [RBP-2504], RAX ; [RBP-2504] holds the variable whczzocuix_10490
  mov RAX, [RBP-2488]
  mov [RBP-2512], RAX ; [RBP-2512] holds the variable gofkcfmxtu_10494
  mov RAX, [RBP-2304]
  mov [RBP-2520], RAX ; [RBP-2520] holds the variable jyvhsgrzyf_10482
  mov RAX, [RBP-1840]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2304]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2528], RAX ; [RBP-2528] holds the variable gscrlkhddo_10499
  mov RAX, [RBP-2360]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2536], RAX ; [RBP-2536] holds the variable ykdkfncacn_10464
  mov RAX, [RBP-2304]
  mov R11, RAX
  mov RAX, [RBP-2536]
  mov R12, RAX
  ;; ... == ...
  mov RAX, R11
  cmp RAX, R12
  jne near _cmp_fail_500
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_500
_cmp_fail_500:
  mov RAX, 0x7fffffffffffffff
_cmp_done_500:
  mov [RBP-2544], RAX ; [RBP-2544] holds the variable binop_10510
  mov RAX, [RBP-2544]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_492
  ;; and_lhs {
  mov RAX, [RBP-1720]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_496
  ;; and_rhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_496
  mov RAX, 0xffffffffffffffff
and_done_496:
  jmp near done_492
if_false_492:
  ;; and_lhs {
  mov RAX, [RBP-2160]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_493
  ;; and_rhs {
  mov RAX, [RBP-2472]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_493
  mov RAX, 0xffffffffffffffff
and_done_493:
done_492:
  mov [RBP-2552], RAX ; [RBP-2552] holds the variable soquyiijvm_10507
  ;; or_lhs {
  mov RAX, [RBP-2472]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_489
  ;; or_rhs {
  mov RAX, [RBP-1720]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_489
  mov RAX, 0x7fffffffffffffff
or_done_489:
  mov [RBP-2560], RAX ; [RBP-2560] holds the variable icwvcroubu_10524
  mov RAX, 78
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2568], RAX ; [RBP-2568] holds the variable uvogwnxwxf_10530
  mov RAX, 114
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 52
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2576], RAX ; [RBP-2576] holds the variable kotxztrrad_10535
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2584], RAX ; [RBP-2584] holds the variable yrfyqfusbg_10545
  mov RAX, [RBP-2560]
  mov [RBP-2592], RAX ; [RBP-2592] holds the variable cydfjfctcv_10549
  mov RAX, [RBP-2592]
  mov [RBP-2600], RAX ; [RBP-2600] holds the variable pqixmmzfos_10553
  mov RAX, [RBP-2160]
  mov [RBP-2608], RAX ; [RBP-2608] holds the variable yqncjtmied_10557
  mov RAX, 6
  mov [RBP-2616], RAX ; [RBP-2616] holds the variable cpdjnkwpjx_10561
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2624], RAX ; [RBP-2624] holds the variable rgelcxolgr_10565
  mov RAX, [RBP-2616]
  mov [RBP-2632], RAX ; [RBP-2632] holds the variable blnbqiybva_10569
  mov RAX, [RBP-2584]
  mov [RBP-2640], RAX ; [RBP-2640] holds the variable irkkplavzm_10573
  mov RAX, [RBP-400]
  mov [RBP-2648], RAX ; [RBP-2648] holds the variable xebxlbxvrl_10541
  mov RAX, [RBP-2568]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1760]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... * ...
  mov RAX, R11
  sar RAX, 1
  imul RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2656], RAX ; [RBP-2656] holds the variable rzlgwcndek_10578
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_468
  mov RAX, 0x7fffffffffffffff
  jmp near done_468
if_false_468:
  mov RAX, [RBP-2560]
done_468:
  mov [RBP-2664], RAX ; [RBP-2664] holds the variable pgorbvsqqr_10584
  ;; and_lhs {
  mov RAX, [RBP-2472]
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_465
  ;; and_rhs {
  mov RAX, [RBP-2552]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_465
  mov RAX, 0xffffffffffffffff
and_done_465:
  mov [RBP-2672], RAX ; [RBP-2672] holds the variable dwzkimhlda_10591
  mov RAX, [RBP-2472]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_461
  mov RAX, [RBP-2568]
  jmp near done_461
if_false_461:
  mov RAX, -108
done_461:
  mov [RBP-2680], RAX ; [RBP-2680] holds the variable bdfyyiejyk_10597
  mov RAX, -2
  mov [RBP-2688], RAX ; [RBP-2688] holds the variable pewnxwirja_10608
  mov RAX, [RBP-1720]
  mov [RBP-2696], RAX ; [RBP-2696] holds the variable mkrqjumgol_10612
  mov RAX, [RBP-2560]
  mov [RBP-2704], RAX ; [RBP-2704] holds the variable aaavkdazeg_10616
  mov RAX, [RBP-2664]
  mov [RBP-2712], RAX ; [RBP-2712] holds the variable mmqiuatcdo_10620
  mov RAX, 24
  mov [RBP-2720], RAX ; [RBP-2720] holds the variable kmuchnurgb_10624
  mov RAX, [RBP-2680]
  mov [RBP-2728], RAX ; [RBP-2728] holds the variable vpbrxtzsvi_10628
  mov RAX, [RBP-2696]
  mov [RBP-2736], RAX ; [RBP-2736] holds the variable dpfrcaqove_10632
  mov RAX, [RBP-400]
  mov [RBP-2744], RAX ; [RBP-2744] holds the variable xkuwlrsyjf_10636
  mov RAX, [RBP-2680]
  mov [RBP-2752], RAX ; [RBP-2752] holds the variable exdjrjqine_10604
  mov RAX, [RBP-2464]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, 104
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2760], RAX ; [RBP-2760] holds the variable vnvlzpurvl_10641
  mov RAX, -110
  mov R11, RAX
  mov RAX, [RBP-2000]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... <= ...
  mov RAX, R11
  cmp RAX, R12
  jg near _cmp_fail_446
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_446
_cmp_fail_446:
  mov RAX, 0x7fffffffffffffff
_cmp_done_446:
  mov [RBP-2768], RAX ; [RBP-2768] holds the variable ndvyqjgdnh_10520
  mov RAX, [RBP-2552]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_442
  mov RAX, [RBP-1720]
  jmp near done_442
if_false_442:
  mov RAX, [RBP-2768]
done_442:
  mov [RBP-2776], RAX ; [RBP-2776] holds the variable if_10653
  mov RAX, [RBP-2776]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_434
  ;; or_lhs {
  mov RAX, [RBP-2472]
  ;; } or_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_lhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_438
  ;; or_rhs {
  mov RAX, [RBP-2552]
  ;; } or_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; or_check_rhs:
  cmp RAX, 0xffffffffffffffff
  je near or_done_438
  mov RAX, 0x7fffffffffffffff
or_done_438:
  jmp near done_434
if_false_434:
  mov RAX, [RBP-2104]
  mov R11, RAX
  mov RAX, [RBP-2536]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_435
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_435
_cmp_fail_435:
  mov RAX, 0x7fffffffffffffff
_cmp_done_435:
done_434:
  mov [RBP-2784], RAX ; [RBP-2784] holds the variable okfjytcywo_10650
  mov RAX, [RBP-2536]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2792], RAX ; [RBP-2792] holds the variable unary_10667
  mov RAX, [RBP-2792]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  add RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2800], RAX ; [RBP-2800] holds the variable ewvvfprdrh_10664
  mov RAX, [RBP-2536]
  mov [RBP-2808], RAX ; [RBP-2808] holds the variable hldgdfpucr_10675
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2816], RAX ; [RBP-2816] holds the variable ajcwqdmyir_10679
  mov RAX, [RBP-1720]
  mov [RBP-2824], RAX ; [RBP-2824] holds the variable jxjevidcdo_10683
  mov RAX, [RBP-1312]
  mov [RBP-2832], RAX ; [RBP-2832] holds the variable nmddvzcwcm_10687
  mov RAX, [RBP-2552]
  mov [RBP-2840], RAX ; [RBP-2840] holds the variable kpzwepnwto_10671
  mov RAX, 0x7fffffffffffffff
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_421
  mov RAX, [RBP-2464]
  jmp near done_421
if_false_421:
  mov RAX, [RBP-2416]
done_421:
  mov [RBP-2848], RAX ; [RBP-2848] holds the variable espeqadigg_10692
  mov RAX, [RBP-2000]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, -134
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2856], RAX ; [RBP-2856] holds the variable ywrhxipzle_10699
  ;; and_lhs {
  mov RAX, 0x7fffffffffffffff
  ;; } and_lhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_lhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_415
  ;; and_rhs {
  mov RAX, [RBP-2472]
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_415
  mov RAX, 0xffffffffffffffff
and_done_415:
  mov [RBP-2864], RAX ; [RBP-2864] holds the variable ceortynfpx_10705
  mov RAX, [RBP-2848]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1904]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... - ...
  mov RAX, R11
  sub RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2872], RAX ; [RBP-2872] holds the variable qdjymrzlhv_10711
  mov RAX, [RBP-400]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-1904]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2880], RAX ; [RBP-2880] holds the variable upcksikwyj_10717
  mov RAX, [RBP-2840]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_405
  mov RAX, [RBP-2104]
  jmp near done_405
if_false_405:
  mov RAX, [RBP-2440]
done_405:
  mov [RBP-2888], RAX ; [RBP-2888] holds the variable yvhjftljdb_10400
  mov RAX, [RBP-1368]
  mov [RBP-2896], RAX ; [RBP-2896] holds the variable ayaeawdyya_10730
  mov RAX, [RBP-1312]
  mov [RBP-2904], RAX ; [RBP-2904] holds the variable yijaltkpjg_10734
  mov RAX, [RBP-1904]
  mov [RBP-2912], RAX ; [RBP-2912] holds the variable vkofmrodoa_10738
  mov RAX, [RBP-2904]
  mov [RBP-2920], RAX ; [RBP-2920] holds the variable iwjdtozltc_10742
  mov RAX, [RBP-2904]
  mov [RBP-2928], RAX ; [RBP-2928] holds the variable vmsxmpapks_10746
  mov RAX, [RBP-2160]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_379
  mov RAX, [RBP-1720]
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_if_not_bool
  cmp RAX, 0xffffffffffffffff
  jne near if_false_395
  mov RAX, 40
  jmp near done_395
if_false_395:
  mov RAX, 196
done_395:
  jmp near done_379
if_false_379:
  mov RAX, [RBP-400]
  mov [RBP-2944], RAX ; [RBP-2944] holds the variable ecdcblqbws_10756
  mov RAX, [RBP-1720]
  mov [RBP-2952], RAX ; [RBP-2952] holds the variable razzsmnwll_10760
  mov RAX, [RBP-2160]
  mov [RBP-2960], RAX ; [RBP-2960] holds the variable ouzsdufifc_10764
  mov RAX, [RBP-2304]
  mov [RBP-2968], RAX ; [RBP-2968] holds the variable pjmtgtpqlr_10768
  mov RAX, 0x7fffffffffffffff
  mov [RBP-2976], RAX ; [RBP-2976] holds the variable kxgnsknzrg_10772
  mov RAX, [RBP-2952]
  mov [RBP-2984], RAX ; [RBP-2984] holds the variable zcbhannbza_10776
  mov RAX, [RBP-2976]
  mov [RBP-2992], RAX ; [RBP-2992] holds the variable cxccvbnnjr_10780
  mov RAX, [RBP-2944]
done_379:
  mov [RBP-2936], RAX ; [RBP-2936] holds the variable if_10727
  mov RAX, [RBP-2936]
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; add1(...)
  sub RAX, 2
  jo near _global_overflow_abort
  mov [RBP-2944], RAX ; [RBP-2944] holds the variable unary_10726
  mov RAX, [RBP-352]
  mov R11, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_arith_not_num
  mov RAX, [RBP-2944]
  mov R12, RAX
  ;; Assert that RAX holds a number
  test QWORD RAX, 0x1
  cmovne RSI, RAX
  jne near _global_assertion_failed_arith_not_num
  ;; ... + ...
  mov RAX, R11
  add RAX, R12
  jo near _global_overflow_abort
  mov [RBP-2952], RAX ; [RBP-2952] holds the variable binop_8708
  mov RAX, [RBP-192]
  mov R11, RAX
  mov RAX, [RBP-2952]
  mov R12, RAX
  ;; Assert that R11 holds a number
  test QWORD R11, 0x1
  cmovne RSI, R11
  jne near _global_assertion_failed_comparison_not_num
  ;; Assert that R12 holds a number
  test QWORD R12, 0x1
  cmovne RSI, R12
  jne near _global_assertion_failed_comparison_not_num
  ;; ... > ...
  mov RAX, R11
  cmp RAX, R12
  jle near _cmp_fail_371
  mov RAX, 0xffffffffffffffff
  jmp near _cmp_done_371
_cmp_fail_371:
  mov RAX, 0x7fffffffffffffff
_cmp_done_371:
  ;; } and_rhs
  ;; Assert that RAX has the tag 7 (aka: 'bool')
  mov R11, RAX
  shl R11, 61
  shr R11, 61
  cmp R11, 0x7
  cmovne RSI, RAX
  jne near _global_assertion_failed_logic_not_bool
  ;; and_check_rhs:
  mov R10, 0x7fffffffffffffff
  cmp RAX, R10
  je near and_done_6
  mov RAX, 0xffffffffffffffff
and_done_6:
  leave
  ret
  ;; Error labels: 
_global_assertion_failed_arith_not_num: ; Assertion failed, found a not-number when doing arithmetic
  mov RDI, 2
  call error
_global_assertion_failed_comparison_not_num: ; Assertion failed, found a not-number when doing a comparison
  mov RDI, 1
  call error
_global_assertion_failed_if_not_bool: ; Assertion failed, found a not-boolean as a condition in an if
  mov RDI, 4
  call error
_global_assertion_failed_logic_not_bool: ; Assertion failed, found a not-boolean when doing boolean logic
  mov RDI, 3
  call error
_global_overflow_abort: ; Call the error function when an integer overflow is detected
  mov RDI, 5
  call error
_global_assertion_failed_not_tuple: ; Assertion failed, expected a tuple
  mov RDI, 6
  call error
_global_assertion_failed_index_too_large: ; Assertion failed, tuple index too large
  mov RDI, 8
  call error
_global_assertion_failed_index_too_small: ; Assertion failed, tuple index too small
  mov RDI, 7
  call error
_global_assertion_failed_index_nil: ; Assertion failed, indexed into a tuple
  mov RDI, 9
  call error
_global_assertion_failed_no_more_heap_space: ; Assertion failed, out of space on our heap
  mov RDI, 10
  call error
_global_assertion_failed_not_a_closure: ; Assertion failed, tried to call a not-closure
  mov RDI, 11
  call error
_global_assertion_failed_arity_error: ; Assertion failed, tried to call a function with the wrong arity
  mov RDI, 12
  call error
_global_assertion_failed_out_of_stack_memory: ; Assertion failed, tried to call a function with the wrong arity
  mov RDI, 13
  call error