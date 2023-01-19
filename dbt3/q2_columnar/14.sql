-- @(#)14.sql	2.1.8.1
-- TPC-H/TPC-R Promotion Effect Query (Q14)
-- Functional Query Definition
-- Approved February 1998
\timing
select
	100.00 * sum(case
		when p_type like 'PROMO%'
			then l_extendedprice * (1 - l_discount)
		else 0
	end) / sum(l_extendedprice * (1 - l_discount)) as promo_revenue
from
	lineitem_columnar,
	part_columnar
where
	l_partkey = p_partkey
	and l_shipdate >= date('1995-01-01')
	and l_shipdate < date('1995-01-01') + interval '1 month';
