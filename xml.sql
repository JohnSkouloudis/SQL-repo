      


create table customer_orders as
select distinct p.product_id,o.customer_id
from orders o join products p on o.product_id=p.product_id
where o.days_to_process<=20
order by customer_id;


create table test1 as
SELECT    distinct XMLElement("customers",
                    XMLAGG(
                        XMLElement("customer",XMLAttributes(c.customer_id as "id",c.marital_status as "maritalstatus",c.gender as "gender"
                        ), XMLFOREST(
                               c.age_group as "agegroup",
                               c.income_level as "incomelevel"                               
                                                                  
                         
                        ) ,XMLELEMENT("address",XMLForest(
                                c.address.city AS "city",
                                c.address.street AS "street",
                                c.address.num AS "number"
                                    )) ,XMLElement("products",
                                             XMLAgg(
                                            XMLElement("product",
                                                XMLAttributes(p.product_id as "id"),
                                                XMLForest(
                                                    p.productname AS "productname",
                                                    p.categoryname AS "productcategory"),       
                                                XMLELEMENT("producttypes",(SELECT XMLAGG(XMLELEMENT("producttype",t.column_value))from products po,table(po.producttypes)t where po.product_id=p.product_id  )
                                                        )
                                                
                                                
                                                        
                                                        )
                                                    )
                                                    
                                                )
                                    
                                    
                                    
                     )
                    )
                   ).getClobVal() AS xml_output
from customers c join customer_orders co on c.customer_id=co.customer_id join products p on co.product_id=p.product_id
where c.customer_id<=30
group by c.customer_id,c.marital_status ,c.gender,c.age_group,c.income_level,c.address.city ,c.address.street ,c.address.num; 


/*
--1)

//customer[agegroup='Above 70' and @gender='Male']/@id
//customer[ @gender='Female'and agegroup='60-70']/products/product[productcategory='Cameras']/../../@id
//customer[ @gender='Male'and agegroup='Above 70']/products/product[productcategory='Accessories']/../../@id
//customer[ @gender='Male'and agegroup='Above 70']/products/product[productcategory='Monitors']/../../@id
--2)

//customer[@gender='Female']//products/product[producttypes/producttype='games']/productcategory
distinct-values(//customer[@gender='Female']//products/product[producttypes/producttype='games']/productcategory)

--3)

distinct-values(//customer[incomelevel='high' and address/city='Larissa' and address/street='Filellinon Street']//products/product/producttypes/producttype)
//customer[incomelevel='high' and address/city='Larissa' and address/street='Filellinon Street']//products/product/producttypes/producttype


distinct-values(//customer[incomelevel='high' and address/city='Volos' and address/street='Ermou Street']//products/product/producttypes/producttype)
//customer[incomelevel='high' and address/city='Volos' and address/street='Ermou Street']//products/product/producttypes/producttype


select *
from customers c join customer_orders co on c.customer_id=co.customer_id join products p on co.product_id=p.product_id
where c.customer_id<=30
order by c.customer_id;
*\