-- @(#)15.sql	2.1.8.1
-- TPC-H/TPC-R Top Supplier Query (Q15)
-- Functional Query Definition
-- Approved February 1998
\timing
with revenue0 as (
	select
		l_suppkey as supplier_no,
		sum(l_extendedprice * (1 - l_discount)) as total_revenue
	from
		lineitem_columnar
	where
		l_shipdate >= date('1993-12-01')
		and l_shipdate < date('1993-12-01') + interval '90 days'
	group by
		l_suppkey
)
select
	s_suppkey,
	s_name,
	s_address,
	s_phone,
	total_revenue
from
	supplier_columnar,
	revenue0_columnar
where
	s_suppkey = supplier_no
	and total_revenue = (
		select
			max(total_revenue)
		from
			revenue0_columnar
	)
;
