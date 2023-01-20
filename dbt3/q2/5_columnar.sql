-- @(#)5.sql	2.1.8.1
-- TPC-H/TPC-R Local Supplier Volume Query (Q5)
-- Functional Query Definition
-- Approved February 1998

select
	n_name,
	sum(l_extendedprice * (1 - l_discount)) as revenue
from
	customer_columnar,
	orders_columnar,
	lineitem_columnar,
	supplier_columnar,
	nation_columnar,
	region_columnar
where
	c_custkey = o_custkey
	and l_orderkey = o_orderkey
	and l_suppkey = s_suppkey
	and c_nationkey = s_nationkey
	and s_nationkey = n_nationkey
	and n_regionkey = r_regionkey
	and r_name = 'EUROPE'
	and o_orderdate >= date('1997-11-01')
	and o_orderdate < date('1997-11-01') + interval '1 year'
group by
	n_name
order by
	revenue desc;
