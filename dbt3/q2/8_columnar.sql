-- @(#)8.sql	2.1.8.1
-- TPC-H/TPC-R National Market Share Query (Q8)
-- Functional Query Definition
-- Approved February 1998

select
	o_year,
	sum(case
		when nation = 'INDONESIA' then volume
		else 0
	end) / sum(volume) as mkt_share
from
	(
		select
			extract(year from o_orderdate) as o_year,
			l_extendedprice * (1 - l_discount) as volume,
			n2.n_name as nation
		from
			part_columnar,
			supplier_columnar,
			lineitem_columnar,
			orders_columnar,
			customer_columnar,
			nation_columnar n1,
			nation_columnar n2,
			region_columnar
		where
			p_partkey = l_partkey
			and s_suppkey = l_suppkey
			and l_orderkey = o_orderkey
			and o_custkey = c_custkey
			and c_nationkey = n1.n_nationkey
			and n1.n_regionkey = r_regionkey
			and r_name = 'ASIA'
			and s_nationkey = n2.n_nationkey
			and o_orderdate between date('1995-01-01') and date('1996-12-31')
			and p_type = 'MEDIUM BURNISHED STEEL'
	) as all_nations
group by
	o_year
order by
	o_year;
