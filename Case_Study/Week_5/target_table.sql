--CREATING CHANNEL TABLE 
CREATE TABLE CHANNEL_DIM(
DATE_CREATED DATE,
IS_RECORD_INACTIVE CHAR,
LAST_MODIFIED_DATE DATE,
LIST_ID NUMBER(20,0),
LIST_ITEM_NAME VARCHAR(20),
KPI_DW_SKEY NUMBER(20,0),
KPI_DW_INSERT_DATE DATE,
KPI_DW_UPDATE_DATE DATE
);

--LOCATION_DIM
CREATE TABLE LOCATION_DIM(
LOCATION_ID NUMBER(20,0),
ADDRESS    VARCHAR(150),
CITY VARCHAR(50),
COUNTRY VARCHAR(50),
DATE_LAST_MODIFIED DATE,
FULL_NAME VARCHAR(60),
ISINACTIVE VARCHAR(5),
NAME VARCHAR(50),
KPI_DW_SKEY NUMBER(20,0),
KPI_DW_INSERT_DATE DATE,
KPI_DW_UPDATE_DATE DATE
);


--TRANSACTION_LINE_FACT
CREATE TABLE TRANSACTION_LINE_FACT(
TRANSACTION_ID NUMBER(20,0),
TRANSACTION_LINE_ID NUMBER(20,0),
TRANID VARCHAR(30),
TRANSACTION_TYPE VARCHAR(50),
TRANDATE DATE ,
KPI_CHANNEL_SKEY NUMBER(20,0),
KPI_LOCATION_SKEY NUMBER(20,0),
KPI_DEPARTMENT_SKEY NUMBER(20,0),
KPI_ITEM_SKEY        NUMBER(20,0),
AMOUNT NUMBER(8,2),
COST NUMBER(8,2),
UNITS NUMBER(5,0),
KPI_DW_SKEY NUMBER(20,0)
);

--DEPARTMENT_DIM
CREATE TABLE DEPARTMENT_DIM(
DATE_LAST_MODIFIED DATE,
DEPARTMENT_ID NUMBER(20,0),
ISINACTIVE VARCHAR(5),
NAME VARCHAR(10),
WS_DESCRIPTION VARCHAR(50),
KPI_DW_SKEY NUMBER(20,0),
KPI_DW_INSERT_DATE DATE,
KPI_DW_UPDATE_DATE DATE
);

--ITEM_DIM
CREATE TABLE ITEM_DIM (
ITEM_ID NUMBER(20,0),
SKU VARCHAR(100),
TYPE_NAME VARCHAR(30),
SALESDESCRIPTION VARCHAR(100),
KPI_DW_SKEY NUMBER(20,0),
KPI_DW_INSERT_DATE DATE,
KPI_DW_UPDATE_DATE DATE,
KPI_CLASS_SKEY NUMBER(20,0),
WS_MERCHANDISE_DEPARTMENT_SKEY NUMBER(20,0),
WS_MERCHANDISE_COLLECTION_SKEY NUMBER(20,0),
WS_MERCHANDISE_CLASS_SKEY      NUMBER(20,0),
WS_MERCHANDISE_SUBCLASS_SKEY   NUMBER(20,0)
);

--CLASS_DIM
CREATE TABLE CLASS_DIM(
CLASS_ID NUMBER(20,0),
DATE_LAST_MODIFIED DATE,
FULL_NAME VARCHAR(30),
ISINACTIVE VARCHAR(5),
NAME VARCHAR(5),
KPI_DW_SKEY NUMBER(20,0),
KPI_DW_INSERT_DATE DATE,
KPI_DW_UPDATE_DATE DATE
);

--KPI_ITEM_MERCHANDISE_DEPTARMENT_DIM

CREATE TABLE MERCHANDISE_DEPTARMENT_DIM (
ITEM_MERCHANDISE_DEPARTMENT_ID NUMBER(20,0),
DESCRIPTION VARCHAR(50),
ITEM_MERCHANDISE_DEPARTMENT_NA VARCHAR(10),
KPI_DW_SKEY NUMBER(20,0),
KPI_DW_INSERT_DATE DATE,
KPI_DW_UPDATE_DATE DATE
);

--ITEM_MERCHANDISE_COLLECTION_DIM
CREATE TABLE MERCHANDISE_COLLECTION_DIM (
ITEM_MERCHANDISE_COLLECTION_ID NUMBER(20,0),
DESCRIPTION  VARCHAR(50),
ITEM_MERCHANDISE_COLLECTION_NA VARCHAR(50),
KPI_DW_SKEY NUMBER(20,0),
KPI_DW_INSERT_DATE DATE,
KPI_DW_UPDATE_DATE DATE
);
--KPI_ITEM_MERCHANDISE_CLASS_DIM
CREATE TABLE MERCHANDISE_CLASS_DIM(
ITEM_MERCHANDISE_CLASS_ID NUMBER(20,0),
DESCRIPTION VARCHAR(50),
ITEM_MERCHANDISE_CLASS_NAME VARCHAR(5),
KPI_DW_SKEY NUMBER(20,0),
KPI_DW_INSERT_DATE DATE,
KPI_DW_UPDATE_DATE DATE
);

--KPI_TEM_MERCHANDISE_SUBCLASS_DIM
CREATE TABLE MERCHANDISE_SUBCLASS_DIM (
ITEM_MERCHANDISE_SUBCLASS_ID NUMBER(20,0),
DESCRIPTION VARCHAR(50),
ITEM_MERCHANDISE_SUBCLASS_NAME VARCHAR(10),
KPI_DW_SKEY  NUMBER(20,0),
KPI_DW_INSERT_DATE DATE,
KPI_DW_UPDATE_DATE DATE
);

--INSERTING DATA INTO TARET TABLE

--CHANNEL_DIM
SELECT * FROM channel_dim;
INSERT INTO CHANNEL_DIM(DATE_CREATED,IS_RECORD_INACTIVE,LAST_MODIFIED_DATE,LIST_ID,LIST_ITEM_NAME)(SELECT * FROM HII.CHANNEL);
create sequence kpi_dw_skey;
UPDATE CHANNEL_DIM SET kpi_dw_skey=kpi_dw_skey.nextval;

UPDATE CHANNEL_DIM 
SET kpi_dw_insert_date=(SELECT SYSDATE FROM DUAL)
WHERE kpi_dw_skey in (SELECT kpi_dw_skey FROM CHANNEL_DIM );

UPDATE CHANNEL_DIM 
SET kpi_dw_UPDATE_date=(SELECT SYSDATE FROM DUAL)
WHERE kpi_dw_skey in (SELECT kpi_dw_skey FROM CHANNEL_DIM );

ALTER TABLE CHANNEL_DIM  ADD CONSTRAINT pk_CHANNEL_DIM  PRIMARY KEY (kpi_dw_skey);

DESC channel_dim;

--LOCATION_DIM
select * from location_dim;
insert into location_dim(location_id,address,city,country,date_last_modified,full_name,isinactive,name)(select * from HII.locations);
create sequence kpi_dw_skey;
update location_dim set kpi_dw_skey=kpi_dw_skey.nextval;

UPDATE LOCATION_DIM 
SET kpi_dw_insert_date=(SELECT SYSDATE FROM DUAL)
WHERE kpi_dw_skey in (SELECT kpi_dw_skey FROM LOCATION_DIM );

UPDATE LOCATION_DIM 
SET kpi_dw_update_date=(SELECT SYSDATE FROM DUAL)
WHERE kpi_dw_skey in (SELECT kpi_dw_skey FROM LOCATION_DIM );

ALTER TABLE  LOCATION_DIM 
ADD CONSTRAINT PK_LOCATION_DIM  PRIMARY KEY(KPI_DW_SKEY);

--KPI_DEPARTMENT_DIM
select 
insert into DEPARTMENT_DIM(DATE_LAST_MODIFIED,DEPARTMENT_ID,ISINACTIVE,NAME,WS_DESCRIPTION)
(select * from HII.DEPARTMENTS);

UPDATE DEPARTMENT_DIM
SET kpi_dw_update_date=(SELECT SYSDATE FROM DUAL)
WHERE kpi_dw_skey in (SELECT kpi_dw_skey FROM DEPARTMENT_DIM );

UPDATE DEPARTMENT_DIM
SET kpi_dw_insert_date=(SELECT SYSDATE FROM DUAL)
WHERE kpi_dw_skey in (SELECT kpi_dw_skey FROM DEPARTMENT_DIM );

update DEPARTMENT_DIM set kpi_dw_skey=kpi_dw_skey.nextval;

ALTER TABLE  DEPARTMENT_DIM 
ADD CONSTRAINT PK_DEPARTMENT_DIM PRIMARY KEY(KPI_DW_SKEY);

alter table DEPARTMENT_DIM modify NAME VARCHAR(20);

--TRANSACTION_LINE_FACT
insert into TRANSACTION_LINE_FACT(TRANSACTION_ID,TRANSACTION_LINE_ID,TRANID,TRANSACTION_TYPE,AMOUNT,COST,UNITS)
(select  TRANSACTION_LINES.TRANSACTION_ID,TRANSACTION_LINES.TRANSACTION_LINE_ID,TRANSACTIONS.TRANID,TRANSACTIONS.TRANSACTION_TYPE,TRANSACTION_LINES.AMOUNT,TRANSACTION_LINES.COST,TRANSACTION_LINES.UNITS
from HII.TRANSACTION_LINES JOIN HII.TRANSACTIONS ON HII.TRANSACTION_LINES.TRANSACTION_ID =HII.TRANSACTIONS.TRANSACTION_ID);

KPI_CHANNEL_SKEY NUMBER(20,0),
KPI_LOCATION_SKEY NUMBER(20,0),
KPI_DEPARTMENT_SKEY NUMBER(20,0),
KPI_ITEM_SKEY        NUMBER(20,0),
KPI_DW_SKEY NUMBER(20,0)

UPDATE TRANSACTION_LINE_FACT SET KPI_CHANNEL_SKEY=kpi_dw_skey.nextval;

UPDATE TRANSACTION_LINE_FACT SET KPI_LOCATION_SKEY=kpi_dw_skey.nextval;
UPDATE TRANSACTION_LINE_FACT SET KPI_DEPARTMENT_SKEY=kpi_dw_skey.nextval;
UPDATE TRANSACTION_LINE_FACT SET KPI_ITEM_SKEY=kpi_dw_skey.nextval;
UPDATE TRANSACTION_LINE_FACT SET KPI_DW_SKEY=kpi_dw_skey.nextval;

ALTER TABLE TRANSACTION_LINE_FACT
ADD CONSTRAINT PK_TRANSACTION_LINE_FACT PRIMARY KEY(KPI_DW_SKEY);


update DEPARTMENT_DIM set kpi_dw_skey=kpi_dw_skey.nextval;

SELECT * FROM TRANSACTION_LINE_FACT;



insert into TRANSACTION_LINE_FACT(TRANDATE)(SELECT HII.TRANSACTIONS.TRANDATE from HII.TRANSACTION_LINES JOIN HII.TRANSACTIONS ON HII.TRANSACTION_LINES.TRANSACTION_ID =HII.TRANSACTIONS.TRANSACTION_ID);
 


UPDATE TRANSACTION_LINE_FACT
SET TRANDATE = HII.TRANSACTIONS.TRANDATE 
WHERE  TRANSACTION_ID = (SELECT TRANSACTION_ID FROM  HII.TRANSACTIONS);

UPDATE ITEM_DIM  set KPI_CLASS_SKEY=(select CLASS_ID from hii.ITEMS  where item_dim.item_id=hii.items.item_id);

update transaction_line_fact f set kpi_channel_skey = (select channel_id from transaction.transactions t where f.transaction_id=t.transaction_id);


UPDATE ITEM_DIM SET WS_MERCHANDISE_DEPARTMENT_SKEY=(SELECT  WS_MERCHANDISE_DEPARTMENT_ID FROM HII.ITEMS WHERE HII.ITEMS.ITEM_ID=item_dim.item_id )

UPDATE ITEM_DIM SET WS_MERCHANDISE_COLLECTION_SKEY=(SELECT  WS_MERCHANDISE_COLLECTION_ID FROM HII.ITEMS WHERE HII.ITEMS.ITEM_ID=item_dim.item_id )

UPDATE ITEM_DIM SET WS_MERCHANDISE_CLASS_SKEY=(SELECT  WS_MERCHANDISE_CLASS_ID  FROM HII.ITEMS WHERE HII.ITEMS.ITEM_ID=item_dim.item_id )

UPDATE ITEM_DIM SET WS_MERCHANDISE_SUBCLASS_SKEY=(SELECT  WS_MERCHANDISE_SUBCLASS_ID  FROM HII.ITEMS WHERE HII.ITEMS.ITEM_ID=item_dim.item_id )

UPDATE ITEM_DIM
SET kpi_dw_insert_date=(SELECT SYSDATE FROM DUAL)
WHERE kpi_dw_skey in (SELECT kpi_dw_skey FROM ITEM_DIM );

select * from ITEM_DIM;


ALTER TABLE ITEM_DIM ADD 

ALTER TABLE ITEM_DIM 
ADD CONSTRAINT fk_CLASS
FOREIGN KEY (KPI_CLASS_SKEY) REFERENCES MERCHANDISE_DEPTARMENT_DIM(KPI_DW_SKEY);

ALTER TABLE ITEM_DIM 
ADD CONSTRAINT fk_CLASS_DEPARTMENT_SKEY
FOREIGN KEY (WS_MERCHANDISE_DEPARTMENT_SKEY) REFERENCES MERCHANDISE_DEPTARMENT_DIM (KPI_DW_SKEY);


ALTER TABLE ITEM_DIM 
ADD CONSTRAINT fk_CLASS_COLLECTION_SKEY
FOREIGN KEY (WS_MERCHANDISE_COLLECTION_SKEY) REFERENCES MERCHANDISE_COLLECTION_DIM (KPI_DW_SKEY);



ALTER TABLE ITEM_DIM 
ADD CONSTRAINT fk_CLASS_SUBCLASS_SKEY
FOREIGN KEY (WS_MERCHANDISE_SUBCLASS_SKEY) REFERENCES MERCHANDISE_CLASS_DIM (KPI_DW_SKEY);


ALTER TABLE TRANSACTION_LINE_FACT 
ADD CONSTRAINT fk_ITEM_SKEY
FOREIGN KEY (KPI_ITEM_SKEY) REFERENCES ITEM_DIM (KPI_DW_SKEY);

DELETE FROM TRANSACTION_LINE_FACT 
WHERE KPI_ITEM_SKEY NOT IN (SELECT KPI_DW_SKEY FROM ITEM_DIM);

 





