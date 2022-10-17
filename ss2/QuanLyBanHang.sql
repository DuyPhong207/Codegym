use quanlybanhang;
create table Customer (
cID int primary key not null,
cName varchar(50) not null,
cAge int default 0
);
create table Orders (
oID int primary key not null,
cID int not null,
FOREIGN KEY (cID) REFERENCES Customer(cID),
oDate datetime not null,
oTotalPrice double
);
create table Product (
pID int primary key not null,
pName varchar(100) not null,
pPrice double not null
);
create table OrderDetail (
   oID INT NOT NULL,
   pID INT NOT NULL,
   PRIMARY KEY(oID,pID),
   FOREIGN KEY(oID) REFERENCES Orders(oID),
   FOREIGN KEY(pID) REFERENCES Product(pID),
   odQTY int not null
);

