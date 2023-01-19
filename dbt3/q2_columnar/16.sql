-- @(#)16.sql	2.1.8.1
-- TPC-H/TPC-R Parts/Supplier Relationship Query (Q16)
-- Functional Query Definition
-- Approved February 1998
\timing
select
	p_brand,
	p_type,
	p_size,
	count(distinct ps_suppkey) as supplier_cnt
from
	partsupp_columnar,
	part_columnar
where
	p_partkey = ps_partkey
	and p_brand <> 'Brand#23'
	and p_type not like 'PROMO PLTEED%'
	and p_size in (8, 4, 27, 16, 32, 22, 45, 3)
	and ps_suppkey not in (
		select
			s_suppkey
		from
			supplier_columnar
		where
			s_comment like '%Customer%Complaints%'
	)
group by
	p_brand,
	p_type,
	p_size
order by
	supplier_cnt desc,
	p_brand,
	p_type,
	p_size;
