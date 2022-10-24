use quanlyvattu;
create table PHIEUXUAT (
SoPX int primary key not null,
NgayXuat datetime
);
create table VATTU (
MaVTU int primary key not null,
TenVTU varchar(50)
);
create table PHIEUNHAP (
SoPN int primary key not null,
NgayNhap datetime
);
create table DONDH (
SoDH int primary key not null,
NgayDH datetime
);
create table NHACC (
MaNCC int primary key not null,
TenNCC varchar(50) not null,
DiaChi varchar(100),
SDT int (50)
);
create table CHITIETPHIEUXUAT (
SoPX int primary key not null,
FOREIGN KEY (SoPX) REFERENCES PHIEUXUAT(SoPX),
DGXuat double,
SLXuat int
);
create table CHITIETPHIEUNHAP (
SoPN int primary key not null,
FOREIGN KEY (SoPN) REFERENCES PHIEUNHAP(SoPN),
DGNhap double,
SLNhap int
);