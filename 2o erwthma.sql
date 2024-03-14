
/*2ο ερώτημα – Δημιουργία και γέμισμα σχήματος*/

drop table customers;
drop table orders;
drop table products;
drop table max_delay_per_order;
drop table profit_per_order;
drop table deficit;
drop table profit;


//α)
create or replace function get_age_group(birth_date date) return VARCHAR is
age number(3);
age_group varchar(10);

BEGIN

  age := FLOOR(MONTHS_BETWEEN(SYSDATE, birth_date) / 12);

  
  IF age < 40 THEN
    age_group := 'Under 40';
  ELSIF age BETWEEN 40 AND 50 THEN
    age_group := '40-50';
  ELSIF age BETWEEN 50 AND 60 THEN
    age_group := '50-60';
  ELSIF age BETWEEN 60 AND 70 THEN
    age_group := '60-70';
  ELSE
    age_group := 'Above 70';
  END IF;

  RETURN age_group;
END get_age_group;


//β)
CREATE OR REPLACE FUNCTION get_income_level(income_level VARCHAR2) RETURN VARCHAR2 IS
  first_number NUMBER;
  second_number NUMBER;
  max_income NUMBER;

BEGIN
  
  first_number:=TO_NUMBER(REGEXP_REPLACE(REGEXP_SUBSTR(income_level, '[0-9,]+', 1, 1), ',', ''));
  second_number:=TO_NUMBER(REGEXP_REPLACE(REGEXP_SUBSTR(income_level, '[0-9,]+', 1, 2), ',', ''));
  max_income:=GREATEST(first_number,COALESCE(second_number, 0));
  
  IF max_income <= 129999 THEN
    RETURN 'low';
  ELSIF max_income >129999 and max_income<= 249999 THEN
    RETURN 'medium';
  ELSIF max_income >= 250000 THEN
    RETURN 'high';
  ELSE
    RETURN 'other';
  END IF;
END get_income_level;




//γ)
CREATE OR REPLACE FUNCTION fix_status(marital_status VARCHAR2) RETURN VARCHAR2 IS
  fixed_status VARCHAR2(20);
  v_marital_status VARCHAR2(20);
BEGIN
 
  v_marital_status := UPPER(marital_status);
  
  IF v_marital_status IN ('WIDOWED', 'SEPAR.', 'DIVORCED', 'NEVERM', 'SINGLE', 'DIVORC.') THEN
    fixed_status := 'Single';
  ELSIF v_marital_status = 'MARRIED' THEN
    fixed_status := 'Married';
  ELSE
    fixed_status := 'Unknown';
  END IF;

  RETURN fixed_status;
END fix_status;


create table customers as
select id as customer_id ,
gender , 
get_age_group(birth_date) as age_group , 
fix_status(marital_status) as marital_status,
get_income_level(income_level) as income_level
from xsales.customers;


create table products as
select p.identifier as product_id , p.name as productname , c.name as categoryname ,p.list_price as list_price
from xsales.products p join xsales.categories c on  p.subcategory_reference=c.id;

alter session set NLS_DATE_FORMAT='DD/MM/YY ';

create table orders as
select o.id as order_id ,
oi.product_id as product_id ,
o.customer_id as customer_id ,  
oi.amount as price ,
o.order_finished - oi.order_date as days_to_process,
oi.cost as cost,
o.channel as channel
from xsales.orders o join xsales.order_items oi on  o.id=oi.order_id;



//i)

SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE(calculate_the_profit_of_order(1));
    DBMS_OUTPUT.PUT_LINE(calculate_the_profit_of_order(2));
    DBMS_OUTPUT.PUT_LINE(calculate_the_profit_of_order(32));
    DBMS_OUTPUT.PUT_LINE(calculate_the_profit_of_order(41));
    DBMS_OUTPUT.PUT_LINE(calculate_the_profit_of_order(19));
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(max_delay(1));
    DBMS_OUTPUT.PUT_LINE(max_delay(2));
    DBMS_OUTPUT.PUT_LINE(max_delay(32));
    DBMS_OUTPUT.PUT_LINE(max_delay(41));
    DBMS_OUTPUT.PUT_LINE(max_delay(19));
END;
/


create table max_delay_per_order(
order_id number,
delay number
);


create or replace function max_delay( id number) return number is

v_days_to_process number;

cursor c1 is
select max(days_to_process)  
from orders
where order_id= id;
begin
    open c1;
    fetch c1 into v_days_to_process;
    close c1;
    
    if v_days_to_process>20 then
        v_days_to_process:=v_days_to_process-20;
    elsif v_days_to_process<=20 then
         v_days_to_process:=0;
    end if;
    
    return  v_days_to_process;
end;

create or replace procedure find_max_delay_per_order as

begin

    delete from max_delay_per_order;
    
    insert into max_delay_per_order 
    select  distinct order_id, max_delay(order_id) as delay
    from orders;    

end;

create or replace procedure find_max_delay_per_order as

begin

    delete from max_delay_per_order;
    
    insert into max_delay_per_order 
    select order_id, max(days_to_process) - 20 as delay
    from orders
    where days_to_process > 20
    group by order_id
    
    union all 
    
    select order_id, 0 as delay
    from orders 
    group by order_id
    having max(days_to_process)<=20;

end;

execute find_max_delay_per_order;



//ii)


create table profit_per_order(
order_id number,
final_profit number
);

create or replace function  calculate_the_profit_of_order(id number) return number is
v_profit number;
cursor c1 is
 select sum(o.price - o.cost -(x.delay*0.001*(to_number(replace(p.list_price,'.',',') )) )) as final_profit
    from products p 
    join orders o on p.product_id=o.product_id
    join max_delay_per_order x on x.order_id=o.order_id
    where o.order_id=id;
begin
    open c1;
    fetch c1 into v_profit;
    close c1;
    return v_profit;
end;



create or replace procedure find_profit_per_order as
begin

    delete from profit_per_order;

    insert into profit_per_order(order_id,final_profit)
    select o.order_id ,sum(o.price - o.cost -(x.delay*0.001*(to_number(replace(p.list_price,'.',',') )) )) as final_profit
    from products p 
    join orders o on p.product_id=o.product_id
    join max_delay_per_order x on x.order_id=o.order_id
    group by o.order_id;

end;

execute find_profit_per_order;


//iii)
create table deficit(
order_id number ,
customer_id number ,
channel varchar2(20) ,
amount number 
);


create table profit(
order_id number ,
customer_id number ,
channel varchar2(20) ,
amount number 
);

CREATE OR REPLACE PROCEDURE FinalProfit as
v_order_id orders.order_id%type;
v_customer_id orders.customer_id%type;
v_channel orders.channel%type;
v_total_profit number;

CURSOR profit_cursor IS
    select o.order_id, o.customer_id, o.channel,
    sum(o.price - o.cost -(x.delay*0.001*(to_number(replace(p.list_price,'.',',') )) )) as final_profit
    FROM orders o
    JOIN products p ON p.product_id = o.product_id
    JOIN max_delay_per_order x ON x.order_id = o.order_id
    GROUP BY o.order_id, o.customer_id, o.channel;

BEGIN

    DELETE FROM deficit;
    DELETE FROM profit;

    
    FOR cursor_row IN profit_cursor LOOP
        v_order_id := cursor_row.order_id;
        v_customer_id := cursor_row.customer_id;
        v_channel := cursor_row.channel;
        v_total_profit := cursor_row.final_profit;

        IF v_total_profit < 0 THEN
            
            INSERT INTO deficit VALUES (v_order_id, v_customer_id, v_channel, ABS(v_total_profit));
            
        ELSIF v_total_profit > 0 THEN
            
            INSERT INTO profit VALUES (v_order_id, v_customer_id, v_channel, v_total_profit);
            
        END IF;
    END LOOP;
    

END;

execute finalprofit;

//iv)
//τα έσοδα και οι ζημιες  ανα φυλο
 
select c.gender,sum(case when t.profit > 0 THEN t.profit ELSE 0 END) as esoda,sum(case when t.profit < 0 THEN t.profit ELSE 0 END) as zhmies
from customers c join(
select   distinct final_profit as profit,customer_id,p.order_id
from profit_per_order p join orders o on p.order_id=o.order_id)t on t.customer_id=c.customer_id
group by c.gender;



//τα έσοδα ανα φυλο
select c.gender ,sum(p.amount) deficit
from profit p join customers c on p.customer_id=c.customer_id
group by c.gender;


//ζημιές ανα φυλο
select c.gender ,sum(d.amount) deficit
from deficit d join customers c on d.customer_id=c.customer_id
group by c.gender;

//v)
--εσοδα και ζημιες ανα channel
select t.channel,sum(case when t.profit > 0 THEN t.profit ELSE 0 END) as esoda,sum(case when t.profit < 0 THEN t.profit ELSE 0 END) as zhmies
from(
select  distinct final_profit as profit,p.order_id,o.order_id,o.channel as channel
from profit_per_order p join orders o on p.order_id=o.order_id) t
group by t.channel;


--εσοδα ανα channel
select channel,sum(amount)
from profit
group by channel;

--ζημιες ανα channel
select channel,sum(amount)
from deficit
group by channel;





    












