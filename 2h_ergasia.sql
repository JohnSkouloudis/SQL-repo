--1o erwthma
--i)
drop index c_id_idx;
drop index p_id_idx;
drop index o_id_idx;
create  index c_id_idx ON customers(customer_id);
create index p_id_idx ON products(product_id);
create index o_id_idx ON orders(order_id);

SET SERVEROUTPUT ON;

ALTER TABLE customers DROP COLUMN address;


CREATE OR REPLACE TYPE ADDRESS AS OBJECT
(
city VARCHAR2(30),
street VARCHAR2(40),
num number(3)
);

alter table customers add address ADDRESS;

update customers set address=null;


create or replace procedure fill_address_column as

cursor c1 is
select customer_id from customers;

type cities_type is table of varchar(15);
type streets_type is table of varchar(30);
type code_type is table of number;


cities cities_type := cities_type('Athens', 'Thessaloniki', 'Patras', 'Heraklion', 'Larissa', 'Volos', 'Ioannina');

streets streets_type  := streets_type ('Adrianou Street', 'Athinas Street', 'Ermou Street', 'Panepistimiou Avenue',
'Patision Street', 'Vasilissis Sofias Avenue', 'Kifisias Avenue', 'Syngrou Avenue', 'Vouliagmenis
Avenue', 'Stadiou Street', 'Leoforos Alexandras', 'Akadimias Street', 'Solonos Street', 'Ploutarchou
Street', 'Ermou Street', 'Miaouli Street', 'Asklipiou Street','Filellinon Street', 'Tritis Septemvriou Street', 'Aiolou Street');

codes code_type := code_type();

i NUMBER := 1;

rand_city number;
rand_street number;
rand_num number;

new_address ADDRESS;

begin  

    while i<=100 loop

        codes.extend;
        codes(i) := i;
        i := i + 1;
    
    end loop;


    for cursor_row in c1 loop
    
        rand_city := trunc(dbms_random.value(1,cities.count)) ;
        rand_street := trunc(dbms_random.value(1,streets.count)) ;
        rand_num := trunc(dbms_random.value(1,codes.count)) ;
        
        
        new_address := ADDRESS(cities(rand_city), streets(rand_street), codes(rand_num));

        UPDATE Customers c 
        SET   c.address = new_address
        WHERE c.customer_id = cursor_row.customer_id;

    end loop;

end;

execute  fill_address_column;


select c.customer_id,c.address.city,c.address.street,c.address.num
from customers c;


--ii)


ALTER TABLE products DROP COLUMN producttypes;
drop table producttypes_table;


create index p_id_idx ON products(product_id);
drop index p_id_idx;


create type ProductTypesList as table of varchar(10);

alter table products 
add producttypes ProductTypesList
nested table producttypes store as producttypes_table;

--iii)

create or replace function  mapToProductTypes( categoryname VARCHAR2) return ProductTypesList is

producttypes ProductTypesList := ProductTypesList(); 

begin

if categoryname in('Recordable DVD Discs','Camcorders','Camera Batteries','Camera Media','Cameras') then
producttypes.extend;
producttypes(producttypes.LAST) := 'video';
end if;

if categoryname in('CD-ROM','Home Audio') then
producttypes.extend;
producttypes(producttypes.LAST) := 'audio';
end if;

if categoryname in('CD-ROM','Recordable DVD Discs','Bulk Pack Diskettes','Recordable CDs','Memory') then
producttypes.extend;
producttypes(producttypes.LAST) := 'storage';
end if;

if categoryname in('CD-ROM','Recordable DVD Discs','Game Consoles','Y Box Games','Y Box Accessories') then
producttypes.extend;
producttypes(producttypes.LAST) := 'games';
end if;

if categoryname in('Modems/Fax','Accessories','Desktop PCs','Memory','Operating Systems','Monitors','Portable PCs') then
producttypes.extend;
producttypes(producttypes.LAST) := 'computer';
end if;

if categoryname in('Documentation','Modems/Fax','Printer Supplies','Accessories') then
producttypes.extend;
producttypes(producttypes.LAST) := 'other';
end if;


return producttypes;

end mapToProductTypes;


DECLARE
  result ProductTypesList; 

BEGIN
 
  result := mapToProductTypes('CD-ROM');
  
 
  FOR i IN 1..result.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(result(i));
  END LOOP;
  
END;



UPDATE products p
SET   p.producttypes = mapToProductTypes( p.categoryname );

select p.product_id,p.categoryname, p.producttypes
from products p;

--iv)
--v)
--vi)

create type arrayproducttypes as varray(6) of varchar(10);

create or replace type product_type as object
(
product_id number, 
productname VARCHAR2(46), 
categoryname VARCHAR2(50), 
listprice VARCHAR2(10),
producttypes arrayproducttypes
);
        
create or replace type order_item as object
(
days_to_process NUMBER, 
price NUMBER(10,2), 
cost NUMBER(10,2),
channel VARCHAR2(20), 
product product_type
);

create type order_item_list as table of order_item;

create or replace type order_type as object (
    order_id number,
    customer_id number,
    items order_item_list 
);

create table order_objects_table of order_type
nested table items store as items_table;



create or replace package order_package as
function object_order_profit(v_order_id number)return number;
function merge_orders(a number,b number) return number;
end order_package;

create or replace package body order_package as
    
    function object_order_profit(v_order_id number)return number is

        profit number:=0;

        cursor c1 is
        select t.price,t.cost
        from order_objects_table oo,table(oo.items) t
        where oo.order_id=v_order_id;

        begin

            for cursor_row in c1 loop

                profit:= profit +(cursor_row.price - cursor_row.cost);

            end loop;

        return profit;
end object_order_profit;

    function merge_orders(a number,b number) return number is

        new_profit number;

        a_order order_type;
        b_order order_type;
        begin

            select value(o) into a_order
            from order_objects_table o
            where o.order_id =a;
    
            select value(o) into b_order
            from order_objects_table o
            where o.order_id = b;
    
            if a_order is null or b_order  is null then
                new_profit := 0;
                return new_profit;
            end if;
    
            for i in 1..a_order.items.count loop
                b_order.items.extend;
                b_order.items(b_order.items.last) := a_order.items(i);
        
            end loop;
    
            UPDATE order_objects_table o
            SET o.items = b_order.items
            WHERE o.order_id = b;
    
            new_profit :=order_package.object_order_profit(b);   


    return new_profit;
end merge_orders;
    
end order_package;



SET SERVEROUTPUT ON;

begin
DBMS_OUTPUT.PUT_LINE('order 147  profit:' || order_package.object_order_profit(147));
DBMS_OUTPUT.PUT_LINE('order 169  profit:' || order_package.object_order_profit(169));
DBMS_OUTPUT.PUT_LINE('order 5592 profit:' || order_package.object_order_profit(5592));
DBMS_OUTPUT.PUT_LINE('order 5593 profit:' ||order_package.object_order_profit(5593));
DBMS_OUTPUT.PUT_LINE('new profit for order 5592 merged into order 5593 items is: '|| order_package.merge_orders(5592,5593));
DBMS_OUTPUT.PUT_LINE('order 5593 new profit:' || order_package.object_order_profit(5593));
end;


--vii)
drop table customer_order_details;

create table customer_order_details
(
customer_id number,
address varchar2(80),
product_count number,
orders_profit number
);

delete from customer_order_details;




create or replace procedure fill_details(v_city varchar,v_street varchar,v_code number)as

cursor c1 is
select c.customer_id id,c.address.city  city, c.address.street street, c.address.num post
from customers c
where c.address.city=v_city and c.address.street=v_street and c.address.num= v_code;

v_address VARCHAR2(80);
profit number;
v_count number;

begin

    for row in c1 loop
    
        profit:=0;
        v_count:=0;
    
        v_address := row.city || ',' || row.street || ',' || TO_CHAR(row.post);
        DBMS_OUTPUT.PUT_LINE('address is:'|| v_address);
        
        select sum(t.price - t.cost) into profit 
        from order_objects_table oo,table(oo.items) t
        where oo.customer_id=row.id;
        DBMS_OUTPUT.PUT_LINE('profit is:'|| profit );
        
        select sum(CARDINALITY(t.items)) into v_count
        from order_objects_table t
        where t.customer_id = row.id;
        DBMS_OUTPUT.PUT_LINE('count of products is:'|| v_count);

    insert into customer_order_details values(row.id,v_address,v_count,profit);

    end loop;

end fill_details;

select c.address.city,c.address.street,c.address.num
from customers c
where c.customer_id=72;


EXECUTE fill_details('Volos','Solonos Street', 8);



create or replace procedure fill_details2(v_city varchar,v_street varchar,v_code number)as

cursor c1 is
select c.customer_id id,c.address.city  city, c.address.street street, c.address.num post
from customers c
where c.address.city=v_city and c.address.street=v_street and c.address.num= v_code;

v_address VARCHAR2(80);
profit number;
v_count number;

begin

for row in c1 loop
    
        profit:=0;
        v_count:=0;
    
        v_address := row.city || ',' || row.street || ',' || TO_CHAR(row.post);
        DBMS_OUTPUT.PUT_LINE('address is:'|| v_address);
        
        select sum(price - cost) into profit 
        from orders
        where customer_id=row.id;
        DBMS_OUTPUT.PUT_LINE('profit is:'|| profit );
        
        select count(*) into v_count
        from orders
        where customer_id = row.id;
        DBMS_OUTPUT.PUT_LINE('count of products is:'|| v_count);

    insert into customer_order_details values(row.id,v_address,v_count,profit);

    end loop;

end fill_details2;

EXECUTE fill_details2('Volos','Solonos Street', 8);



