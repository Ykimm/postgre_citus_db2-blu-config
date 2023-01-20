-- @(#)20.sql	2.1.8.1
-- TPC-H/TPC-R Potential Part Promotion Query (Q20)
-- Function Query Definition
-- Approved February 1998

select
	s_name,
	s_address
from
	supplier_columnar,
	nation_columnar
where
	s_suppkey in (
		select
			distinct (ps_suppkey)
		from
			partsupp_columnar,
			part_columnar
		where
			ps_partkey=p_partkey
			and p_name like 'navy%'
			and ps_availqty > (
				select
					0.5 * sum(l_quantity)
				from
					lineitem_columnar
				where
					l_partkey = ps_partkey
					and l_suppkey = ps_suppkey
					and l_shipdate >= date('1995-01-01')
					and l_shipdate < date('1995-01-01') + interval '1 year'
			)
	)
	and s_nationkey = n_nationkey
	and n_name = 'ALGERIA'
order by
	s_name;
