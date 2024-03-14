//3ο ερωτημα
delete from plan_table;

explain plan for
select order_id, price-cost,days_to_process
from products p join orders o on o.product_id=p.product_id
join customers c on o.customer_id=c.customer_id
where p.categoryname='Accessories' and o.channel='Internet'
and c.gender='Male' and c.income_level='high' and
days_to_process=0;

select count(*)
from products p join orders o on o.product_id=p.product_id
join customers c on o.customer_id=c.customer_id
where p.categoryname='Accessories' and o.channel='Internet'
and c.gender='Male' and c.income_level='high' and
days_to_process=0;

select operation,options,object_name,object_type,id,parent_id,depth,cost,cpu_cost,io_cost,cardinality,filter_predicates,access_predicates,projection
from plan_table;

create index categoryname_idx ON products(categoryname);
create index p_orders_idx ON orders(product_id);
create  bitmap index o_channel_idx ON orders(channel);
create  index c_id_idx ON customers(customer_id);
create  bitmap index c_gender_idx ON customers(gender);
create  bitmap index c_income_level_idx_ ON customers(income_level);
create index days_to_process_idx ON orders(days_to_process);


drop index categoryname_idx ;
drop index p_orders_idx;
drop index o_channel_idx;
drop index c_id_idx;
drop index c_gender_idx;
drop index c_income_level_idx_;
drop index days_to_process_idx;


//4ο ερωτημα

delete from plan_table;

explain plan for
select order_id, price-cost,days_to_process
from products p join orders o on o.product_id=p.product_id
join customers c on o.customer_id=c.customer_id
where p.categoryname='Accessories' and o.channel='Internet'
and c.gender='Male' and c.income_level='high' and
days_to_process>100;

create  index customer_idx on customers(customer_id,gender,income_level);
create index order_idx on orders(product_id,days_to_process);
create  bitmap index o_channel_idx ON orders(channel);
create index product_idx on products(categoryname);

drop index customer_idx;
drop index order_idx;
drop index o_channel_idx;
drop index product_idx;

select operation,options,object_name,object_type,id,parent_id,depth,cost,cpu_cost,io_cost,cardinality,filter_predicates,access_predicates,projection
from plan_table;





