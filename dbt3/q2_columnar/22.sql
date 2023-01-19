-- @(#)22.sql	2.1.8.1
-- TPC-H/TPC-R Global Sales Opportunity Query (Q22)
-- Functional Query Definition
-- Approved February 1998
\timing
select
	cntrycode,
	count(*) as numcust,
	sum(c_acctbal) as totacctbal
from
	(
		select
			substr(c_phone, 1, 2) as cntrycode,
			c_acctbal
		from
			customer_columnar
		where
			substr(c_phone, 1, 2) in
				('14', '28', '11', '17', '10', '26', '30')
			and c_acctbal > (
				select
					avg(c_acctbal)
				from
					customer_columnar
				where
					c_acctbal > 0.00
					and substr(c_phone, 1, 2) in
						('14', '28', '11', '17', '10', '26', '30')
			)
			and not exists (
				select
					*
				from
					orders_columnar
				where
					o_custkey = c_custkey
			)
	) as vip
group by
	cntrycode
order by
	cntrycode;
