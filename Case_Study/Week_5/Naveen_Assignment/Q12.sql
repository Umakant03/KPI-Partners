--12) Questions on transaction_type:
--1. Find the Top 5 and Bottom 5 Items based on the Demand Amount values in a single query

select * from (select * from(select distinct(t.transaction_type), s.amount
from transactions t join transaction_lines s on t.transaction_id=s.transaction_id where t.transaction_type='Sales Order'
 group by t.transaction_type, s.amount
 order by s.amount desc)
 where rownum<=5) top5, (select * from
 (select distinct(t.transaction_type), s.amount
 from transactions t
 join transaction_lines s on t.transaction_id=s.transaction_id
 where t.transaction_type='Sales Order'
 group by t.transaction_type, s.amount
 order by s.amount) where rownum<=5) bottom5;
 
 --2) Which Department has the highest Demand and Sales Amount
 
select distinct(d.name) from departments d 
join transaction_lines t on d.department_id=t.department_id 
join transactions s on s.transaction_id=t.transaction_id
 group by s.transaction_type, d.name having max(t.amount) in (select max(t.amount) from transaction_lines t);
 
--4) Populate top 10 LOCATIONS based on number of Demand Transactions using Analytical functions
select * from(select distinct(l.city) from location_dim l 
join transaction_line_fact t on l.kpi_dw_skey=t.kpi_dw_skey 
where transaction_type='Sales Order') city where rownum<=10;

--5.Find Demand Amount, Demand Units, Sales Amount and Sales Units for each Channel
select transaction_type, sum(amount) as amount, sum(units) as units 
from transaction_line_fact 
group by transaction_type;


--6.Write a VIEW using target tables
create force view target_view as select t.transaction_id, t.transaction_line_id, t.trandate, t.transaction_type,
			i.type_name, 
			l.city, 
			d.name, 
			cd.list_item_name, 
			id.item_merch_department_na,
            id.description,
			ic.item_merch_collection_na,
			ic.description,
			c.item_merch_class_name,
			c.description,
			s.item_merch_subclass_name,
			s.description,
			t.amount,
			t.units
			from transaction_line_fact t join item_dim i on t.kpi_dw_skey =i.kpi_dw_skey
			join location_dim l on i.kpi_dw_skey = l.kpi_dw_skey
			join department_dim d on l.kpi_dw_skey = d.kpi_dw_skey
			join channel_dim cd on d.kpi_dw_skey = cd.kpi_dw_skey
			join item_merch_department_dim id on cd.kpi_dw_skey = id.kpi_dw_skey
			join item_merch_collection_dim ic on id.kpi_dw_skey = ic.kpi_dw_skey
			join item_merch_class_dim c on ic.kpi_dw_skey = c.kpi_dw_skey
			join item_merch_subclass_dim s on c.kpi_dw_skey = s.kpi_dw_skey;




