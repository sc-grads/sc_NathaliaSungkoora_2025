/*CALCULATING COST BY HAND*/

COST = (#pages read sequentially) * seq_page_cost 
       + (# pages read at random) * random_page_cost 
       + (# rows scanned) * cpu_tuple_cost 
       + (# index entries scanned) * cpu_index_tuple_cost 
       + (# times function/operator evaluated) * cpu_operator_cost
Where

seq_page_cost = 1.0 
random_page_cost = 4.0
cpu_tuple_cost = 0.01
cpu_index_tuple_cost = 0.005
cpu_operator_cost = 0.0025

--What is the cost for a query node that has to open 5 pages of data sequentially
--and then process 100 rows total?
COST = 
	5 * 1.0 = 5
	0 * 4.0 = 0
	100 * 0.01 = 1
	0 * 0.005 = 0
	0 * 0.0025 = 0
--Adding these together: 
5 + 0 + 1 + 0 + 0 = 6
= 6
--Therefore, the total cost is 6.


--What is the cost for a query node that has to open 4 pages of an index (probably at random),
--process 75 tuples from the index, then open 20 different pages from a heap file (also at random)
--and process 214 tuples?

COST = (#pages read sequentially) * seq_page_cost 
       + (# pages read at random) * random_page_cost 
       + (# rows scanned) * cpu_tuple_cost 
       + (# index entries scanned) * cpu_index_tuple_cost 
       + (# times function/operator evaluated) * cpu_operator_cost
Where

seq_page_cost = 1.0 
random_page_cost = 4.0
cpu_tuple_cost = 0.01
cpu_index_tuple_cost = 0.005
cpu_operator_cost = 0.0025

--ANSWER:
COST = 
    4 * 4.0 = 16       -- cost of opening 4 index pages (random page cost)
    75 * 0.005 = 0.375 -- cost of processing 75 index tuples (cpu index tuple cost)
    20 * 4.0 = 80      -- cost of opening 20 heap pages (random page cost)
    214 * 0.01 = 2.14  -- cost of processing 214 heap tuples (cpu tuple cost)
--Adding these together:
16 + 0.375 + 80 + 2.14 = 98.52
= 98.52
--Therefore, the total cost is 98.52.


