create database demo;
create table products (
	id int primary key not null,
    productCode int not null,
    productName varchar(45),
    productPrice double,
    productDescription varchar(45),
    productStatus varchar(45)
);

create unique index id_product on products (id);

create index name_price_product on products (productName, productPrice);

explain select * from products;

create view products_view as
select p.productCode, p.productName, p.productPrice, p.productStatus 
from products p;

alter view products_view as
select p.productCode, p.productName, p.productPrice, p.productStatus 
from products p where p.productCode = 1;

drop view products_view;

delimiter //
create procedure findAllProduct ()
begin
select * from products;
end //
delimiter ;

delimiter //
create procedure editProductById (in id int)
begin
update products p
set id = 1, productCode = 001, productName = 'Tủ lạnh', productPrice = 10000000, productDescription = 'aaaa', productStatus = 'aaaaaa' where p.id = id;
end //
delimiter ;

delimiter //
create procedure addProduct ()
begin
insert products 
value (
id = 1, productCode = 001, productName = 'Tủ lạnh', productPrice = 10000000, productDescription = 'aaaa', productStatus = 'aaaaaa');
end //
delimiter ;

delimiter //
create procedure removeProductById (in id int)
begin
delete from products p where p.id = id;
end //
delimiter ;
