-- customer_columnar 

CREATE TABLE customer_columnar (
	c_custkey INTEGER,
	c_name VARCHAR(25),
	c_address VARCHAR(40),
	c_nationkey INTEGER,
	c_phone CHAR(15),
	c_acctbal REAL,
	c_mktsegment CHAR(10),
	c_comment VARCHAR(117)
)
USING columnar;

INSERT INTO customer_columnar
SELECT * FROM customer;



-- lineitem_columnar

CREATE TABLE lineitem_columnar (
	l_orderkey INTEGER,
	l_partkey INTEGER,
	l_suppkey INTEGER,
	l_linenumber INTEGER,
	l_quantity REAL,
	l_extendedprice REAL,
	l_discount REAL,
	l_tax REAL,
	l_returnflag CHAR(1),
	l_linestatus CHAR(1),
	l_shipDATE DATE,
	l_commitDATE DATE,
	l_receiptDATE DATE,
	l_shipinstruct CHAR(25),
	l_shipmode CHAR(10),
	l_comment VARCHAR(44)
)
USING columnar;

INSERT INTO lineitem_columnar
SELECT * FROM lineitem;



-- nation_columnar

CREATE TABLE nation_columnar (
	n_nationkey INTEGER,
	n_name CHAR(25),
	n_regionkey INTEGER,
	n_comment VARCHAR(152)
)
USING columnar;

INSERT INTO nation_columnar
SELECT * FROM nation;



-- orders_columnar

CREATE TABLE orders_columnar (
	o_orderkey INTEGER,
	o_custkey INTEGER,
	o_orderstatus CHAR(1),
	o_totalprice REAL,
	o_orderDATE DATE,
	o_orderpriority CHAR(15),
	o_clerk CHAR(15),
	o_shippriority INTEGER,
	o_comment VARCHAR(79)
)
USING columnar;

INSERT INTO orders_columnar
SELECT * FROM orders;



-- part_columnar

CREATE TABLE part_columnar (
	p_partkey INTEGER,
	p_name VARCHAR(55),
	p_mfgr CHAR(25),
	p_brand CHAR(10),
	p_type VARCHAR(25),
	p_size INTEGER,
	p_container CHAR(10),
	p_retailprice REAL,
	p_comment VARCHAR(23)
)
USING columnar;

INSERT INTO part_columnar
SELECT * FROM part;



-- partsupp_columnar

CREATE TABLE partsupp_columnar (
	ps_partkey INTEGER,
	ps_suppkey INTEGER,
	ps_availqty INTEGER,
	ps_supplycost REAL,
	ps_comment VARCHAR(199)
)
USING columnar;

INSERT INTO partsupp_columnar
SELECT * FROM partsupp;



-- region_columnar

CREATE TABLE region_columnar (
	r_regionkey INTEGER,
	r_name CHAR(25),
	r_comment VARCHAR(152)
)
USING columnar;

INSERT INTO region_columnar
SELECT * FROM region;



-- supplier_columnar

CREATE TABLE supplier_columnar (
	s_suppkey  INTEGER,
	s_name CHAR(25),
	s_address VARCHAR(40),
	s_nationkey INTEGER,
	s_phone CHAR(15),
	s_acctbal REAL,
	s_comment VARCHAR(101)
)
USING columnar;

INSERT INTO supplier_columnar
SELECT * FROM supplier;














