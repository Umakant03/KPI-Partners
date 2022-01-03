 --CREATE BRAND_NAME field in KPI_ITEM_DIM and populate values from NAME field present in KPI_CLASS_DIM
 --1. Provide the script to add the new column
 --2. Provide the UPDATE script to populate BRAND_NAME field

ALTER TABLE item_dim 
ADD BRAND_NAME VARCHAR2(5) ;

UPDATE item_dim 
SET BRAND_NAME =(SELECT NAME FROM class_dim WHERE class_dim.KPI_DW_SKEY=item_dim.KPI_DW_SKEY);


