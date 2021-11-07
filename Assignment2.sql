select * from pubs.dbo.authors
select * from pubs.dbo.titleauthor
select * from pubs.dbo.titles

SELECT au_lname, title_id FROM pubs.dbo.authors JOIN pubs.dbo.titleauthor ON authors.au_id = titleauthor.au_id

SELECT title, au_lname FROM (pubs.dbo.titleauthor JOIN pubs.dbo.titles ON titleauthor.title_id = titles.title_id) JOIN pubs.dbo.authors ON titleauthor.au_id = authors.au_id

SELECT title, au_lname 
	FROM (pubs.dbo.titleauthor JOIN pubs.dbo.titles ON titleauthor.title_id = titles.title_id) 
		JOIN pubs.dbo.authors ON titleauthor.au_id = authors.au_id

SELECT title, au_lname, pub_name
	FROM pubs.dbo.titleauthor JOIN pubs.dbo.titles ON titleauthor.title_id = titles.title_id
		JOIN pubs.dbo.authors ON titleauthor.au_id = authors.au_id
		JOIN pubs.dbo.publishers ON titles.pub_id = publishers.pub_id

SELECT au_lname, pub_name FROM pubs.dbo.authors, pubs.dbo.publishers

SELECT * FROM pubs.dbo.titles WHERE royalty >=  (SELECT AVG(royalty) FROM pubs.dbo.titles)
SELECT * FROM pubs.dbo.titles WHERE royalty = (SELECT MAX(royalty) FROM pubs.dbo.titles)

CREATE TABLE fatins.dbo.CustomerAndSuppliers
(
	cust_id CHAR(5) PRIMARY KEY CHECK (cust_id LIKE '[C][0-9][0-9][0-9]'),
	cust_fname VARCHAR(15) NOT NULL,
	cust_lname VARCHAR(15),
	cust_address TEXT,
	cust_phoneNo CHAR(11) CHECK (cust_phoneNo LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	cust_city VARCHAR(12) DEFAULT 'Rajshahi',
	sales_amnt MONEY CHECK(sales_amnt >= 0),
	proc_amnt MONEY CHECK(proc_amnt >= 0)
)

select * from fatins.dbo.CustomerAndSuppliers

INSERT fatins.dbo.CustomerAndSuppliers
	(cust_id,cust_fname,cust_lname,cust_address,cust_phoneNo,cust_city,sales_amnt,proc_amnt)
	VALUES
	('C002','Fatin','Ishmam','Mirpur Dhaka','01521430100','Dhaka',20,0)
	
CREATE TABLE fatins.dbo.Item
(
	item_id CHAR(6) PRIMARY KEY CHECK(item_id LIKE '[P][0-9][0-9][0-9][0-9][0-9]'),
	item_name CHAR(12),
	item_catagory CHAR(10),
	item_price FLOAT(12) CHECK(item_price >= 0),
	item_last_sold DATE DEFAULT GETDATE()
)

SELECT * from fatins.dbo.Item

INSERT fatins.dbo.Item
	(item_id, item_name, item_catagory, item_price)
	VALUES
	('P00001','Desktop','Computer','20000') 


CREATE TABLE fatins.dbo.Transactions
(
	tran_id CHAR(10) PRIMARY KEY CHECK(tran_id LIKE '[t][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	item_id CHAR(6) FOREIGN KEY REFERENCES fatins.dbo.Item(item_id),
	cust_id CHAR(5) FOREIGN KEY REFERENCES fatins.dbo.CustomerAndSuppliers(cust_id),
	tran_type CHAR(1) CHECK(tran_type = 's' OR tran_type = 'o'),
	tran_quantity INTEGER CHECK(tran_quantity > 0),
	tran_date DATETIME DEFAULT GETDATE()
)

SELECT * FROM fatins.dbo.Transactions

INSERT fatins.dbo.Transactions
	(tran_id, item_id, cust_id, tran_type, tran_quantity)
	VALUES
	('T000000001','P00001','C002','s',1) 
