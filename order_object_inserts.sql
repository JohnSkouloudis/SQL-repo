delete from order_objects_table;

DECLARE

order1 order_type := order_type(133,72,order_item_list(
order_item(0,28,24,'Internet',product_type(128,'Model SM26273 Black Ink Cartridge','Printer Supplies','27.99',arrayproducttypes('other') ) )
)
);

order2 order_type := order_type(134,72,order_item_list(
order_item(760,37,40,'Internet',product_type(34,'External 6X CD-ROM','CD-ROM','39.99',arrayproducttypes('audio','storage','games') ) ),
order_item(0,22,17,'Internet',product_type(148,'Xtend Memory','Y Box Accessories','20.99',arrayproducttypes('games') ) ),
order_item(0,32,27,'Internet',product_type(140,'Endurance Racing','Y Box Games','29.99',arrayproducttypes('games') ) ),
order_item(60,87,34,'Internet',product_type(127,'Model CD13272 Tricolor Ink Cartridge','Printer Supplies','36.99',arrayproducttypes('other') ) )
)
);    
  
order3 order_type := order_type(135,72,order_item_list(
order_item(1,24,19,'Partners',product_type(113,'CD-R Mini Discs','Recordable CDs','22.99',arrayproducttypes('storage') ) ),
order_item(0,16,13,'Partners',product_type(125,'3 1/2" Bulk diskettes, Box of 50','Bulk Pack Diskettes','15.99',arrayproducttypes('storage') ) ),
order_item(305,8,6,'Partners',product_type(120,'DVD-R Disc with Jewel Case, 4.7 GB','Recordable DVD Discs','6.99',arrayproducttypes('video','storage','games') ) )
)
);  

order4 order_type := order_type(136,72,order_item_list(
order_item(62,48,37,'Direct Sales',product_type(42,'O/S Documentation Set - French','Documentation','44.99',arrayproducttypes('other') ) ),
order_item(122,959,837,'Direct Sales',product_type(15,'Envoy 256MB - 40GB','Desktop PCs','999.99',arrayproducttypes('computer') ) ),
order_item(62,12,9,'Direct Sales',product_type(48,'Keyboard Wrist Rest','Accessories','11.99',arrayproducttypes('computer','other') ) ),
order_item(62,33,26,'Direct Sales',product_type(133,'Model K8822S Cordless Phone Battery','Camera Batteries','30.99',arrayproducttypes('video') ) ),
order_item(0,12,10,'Direct Sales',product_type(146,'Adventures with Numbers','Y Box Games','11.99',arrayproducttypes('games') ) )
)
);  

order5 order_type := order_type(147,80,order_item_list(
order_item(3,49,26,'Direct Sales',product_type(36,'Envoy External 6X CD-ROM','CD-ROM','44.99',arrayproducttypes('audio','storage','games') ) ),
order_item(0,75,33,'Direct Sales',product_type(127,'Model CD13272 Tricolor Ink Cartridge','Printer Supplies','36.99',arrayproducttypes('other') ) )
)
);

order6 order_type := order_type(166,92,order_item_list(
order_item(0,9,7,'Direct Sales',product_type(117,'CD-R, Professional Grade, Pack of 10','Recordable CDs','8.99',arrayproducttypes('storage') ) )
)
);

order7 order_type := order_type(167,92,order_item_list(
order_item(0,46,38,'Internet',product_type(35,'External 8X CD-ROM','CD-ROM','49.99',arrayproducttypes('audio','storage','games') ) )
)
);

order8 order_type := order_type(168,92,order_item_list(
order_item(0,29,25,'Partners',product_type(35,'Model SM26273 Black Ink Cartridge','Printer Supplies','27.99',arrayproducttypes('other') ) )
)
);

order9 order_type := order_type(169,92,order_item_list(
order_item(946,25,19,'Direct Sales',product_type(23,'External 101-key keyboard','Accessories','21.99',arrayproducttypes('computer','other') ) ),
order_item(764,32,27,'Direct Sales',product_type(47,'Deluxe Mouse','Accessories','28.99',arrayproducttypes('computer','other') ) ),
order_item(187,9,7,'Direct Sales',product_type(117,'CD-R, Professional Grade, Pack of 10','Recordable CDs','8.99',arrayproducttypes('storage') ) ),
order_item(0,10,9,'Direct Sales',product_type(121,'DVD-RAM Jewel Case, Double-Sided, 9.4G','Recordable CDs','10.99',arrayproducttypes('video','storage','games') ) ),
order_item(1283,203,175,'Direct Sales',product_type(129,'Model NM500X High Yield Toner Cartridge','Printer Supplies','192.99',arrayproducttypes('other') ) ),
order_item(1129,201,166,'Direct Sales',product_type(129,'Model NM500X High Yield Toner Cartridge','Printer Supplies','192.99',arrayproducttypes('other') ) )
)
);

order10 order_type := order_type(170,95,order_item_list(
order_item(0,21,19,'Internet',product_type(23,'External 101-key keyboard','Accessories','21.99',arrayproducttypes('computer','other') ) ),
order_item(0,144,76,'Internet',product_type(138,'256MB Memory Card','Camera Media','69.99',arrayproducttypes('video') ) )
)
);

order11 order_type := order_type(171,95,order_item_list(
order_item(0,64,41,'Partners',product_type(24,'PCMCIA modem/fax 28800 baud','Modems/Fax','45.99',arrayproducttypes('computer','other') ) ),
order_item(0,9,7,'Partners',product_type(30,'Mouse Pad','Accessories','9.99',arrayproducttypes('computer','other') ) ),
order_item(793,8,7,'Partners',product_type(118,'OraMusic CD-R, Pack of 10','Recordable CDs','7.99',arrayproducttypes('storage') ) )
)
);

order12 order_type := order_type(5592,2519,order_item_list(
order_item(0,609,499,'Partners',product_type(20,'Home Theatre Package with DVD-Audio/Video Play','Home Audio','599.99',arrayproducttypes('audio') ) )
)
);

order13 order_type := order_type(5593,2519,order_item_list(
order_item(0,629,549,'Direct Sales',product_type(20,'Home Theatre Package with DVD-Audio/Video Play','Home Audio','599.99',arrayproducttypes('audio') ) )
)
);
    
BEGIN
    
    INSERT INTO order_objects_table VALUES (order1);
    INSERT INTO order_objects_table VALUES (order2);
    INSERT INTO order_objects_table VALUES (order3);
    INSERT INTO order_objects_table VALUES (order4);
    INSERT INTO order_objects_table VALUES (order5);
    INSERT INTO order_objects_table VALUES (order6);
    INSERT INTO order_objects_table VALUES (order7);
    INSERT INTO order_objects_table VALUES (order8);
    INSERT INTO order_objects_table VALUES (order9);
    INSERT INTO order_objects_table VALUES (order10);
    INSERT INTO order_objects_table VALUES (order11);
    INSERT INTO order_objects_table VALUES (order12);
    INSERT INTO order_objects_table VALUES (order13);
END;

    
    
    
    
    

SELECT o.order_id,o.customer_id,t.days_to_process,t.price,t.cost,t.channel,t.product.product_id,t.product.productname,t.product.categoryname,t.product.listprice,t.product.producttypes
from order_objects_table o,table(o.items) t
where o.order_id=5593;




