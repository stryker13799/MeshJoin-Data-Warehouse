DROP TABLE IF EXISTS PRODUCT,CUSTOMER,STORE,SUPPLIER,DATES,FACT;

CREATE TABLE `PRODUCT`(
`PRODUCT_ID` VARCHAR(6) NOT NULL,
`PRODUCT_NAME` VARCHAR(30) NOT NULL, 
`PRICE` DECIMAL(5,2) DEFAULT (0.0) NOT NULL, 
CONSTRAINT PRODUCT_PK PRIMARY KEY (PRODUCT_ID));

CREATE TABLE `CUSTOMER` (
`CUSTOMER_ID` VARCHAR(4) NOT NULL, 
`CUSTOMER_NAME` VARCHAR(30) NOT NULL,
CONSTRAINT CUSTOMER_PK PRIMARY KEY (CUSTOMER_ID));

CREATE TABLE `STORE` (
`STORE_ID` VARCHAR(4) NOT NULL, 
`STORE_NAME` VARCHAR(20) NOT NULL,
CONSTRAINT STORE_PK PRIMARY KEY (STORE_ID));

CREATE TABLE `SUPPLIER` (
`SUPPLIER_ID` VARCHAR(5) NOT NULL, 
`SUPPLIER_NAME` VARCHAR(30) NOT NULL,
CONSTRAINT SUPPLIER_PK PRIMARY KEY (SUPPLIER_ID));

CREATE TABLE `DATES` (
`DATE` DATE NOT NULL,
`DAY` TINYINT UNSIGNED NOT NULL,
`MONTH` TINYINT UNSIGNED NOT NULL,
`QUARTER` TINYINT UNSIGNED NOT NULL,
`YEAR` SMALLINT UNSIGNED NOT NULL,
`WEEKEND` VARCHAR(3) NOT NULL,
CONSTRAINT DATES_PK PRIMARY KEY (`DATE`));



CREATE TABLE `FACT` (
`PRODUCT_ID` VARCHAR(6) NOT NULL,
`QUANTITY` SMALLINT UNSIGNED NOT NULL,
`CUSTOMER_ID` VARCHAR(4) NOT NULL, 
`STORE_ID` VARCHAR(4) NOT NULL, 
`SUPPLIER_ID` VARCHAR(5) NOT NULL,
`SALE_PRICE` DECIMAL(5,2) DEFAULT (0.0) NOT NULL,
`DATE` DATE NOT NULL,
CONSTRAINT FK1_FACT FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID),
CONSTRAINT FK2_FACT FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
CONSTRAINT FK3_FACT FOREIGN KEY (STORE_ID) REFERENCES STORE(STORE_ID),
CONSTRAINT FK4_FACT FOREIGN KEY (SUPPLIER_ID) REFERENCES SUPPLIER(SUPPLIER_ID),
CONSTRAINT FK5_FACT FOREIGN KEY (`DATE`) REFERENCES DATES(`DATE`),
CONSTRAINT PK_FACT PRIMARY KEY (PRODUCT_ID,QUANTITY,CUSTOMER_ID,STORE_ID,SUPPLIER_ID,SALE_PRICE,`DATE`));