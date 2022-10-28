CREATE DATABASE Casestudy_Module_3;
CREATE TABLE khach_hang (
	ma_khach_hang INT PRIMARY KEY NOT NULL,
	ma_loai_khach INT NOT NULL,
    CONSTRAINT FK_khachhang_loaikhach FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach (ma_loai_khach),
	ho_ten VARCHAR(45),
	ngay_sinh DATE,
	gioi_tinh BIT(1),
	so_cmnd VARCHAR(45),
	so_dien_thoai VARCHAR(45),
	email VARCHAR(45),
	dia_chi VARCHAR(45)
);

CREATE TABLE vi_tri (
	ma_vi_tri INT PRIMARY KEY NOT NULL,
	ten_vi_tri VARCHAR(45)
);

CREATE TABLE trinh_do (
	ma_trinh_do INT PRIMARY KEY NOT NULL,
	ten_trinh_do VARCHAR(45)
);

CREATE TABLE nhan_vien (
	ma_nhan_vien INT PRIMARY KEY NOT NULL,
	ho_ten VARCHAR(45),
	ngay_sinh DATE,
	so_cmnd VARCHAR(45),
	luong DOUBLE,
	so_dien_thoai VARCHAR(45),
	email VARCHAR(45),
	dia_chi VARCHAR(45),
	ma_vi_tri INT NOT NULL,
    CONSTRAINT FK_nhanvien_vitri FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri (ma_vi_tri),
	ma_trinh_do INT NOT NULL,
    CONSTRAINT FK_nhanvien_trinhdo FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do (ma_trinh_do),
	ma_bo_phan INT NOT NULL,
    CONSTRAINT FK_nhanvien_bophan FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan (ma_bo_phan)
);

CREATE TABLE bo_phan (
	ma_bo_phan INT PRIMARY KEY NOT NULL,
	ten_bo_phan VARCHAR(45)
);

CREATE TABLE hop_dong (
	ma_hop_dong INT PRIMARY KEY NOT NULL,
	ngay_lam_hop_dong DATETIME,
	ngay_ket_thuc DATETIME,
	tien_dat_coc DOUBLE,
	ma_nhan_vien INT NOT NULL,
    CONSTRAINT FK_hopdong_nhanvien FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien (ma_nhan_vien),
	ma_khach_hang INT NOT NULL,
    CONSTRAINT FK_hopdong_khachhang FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang (ma_khach_hang),
	ma_dich_vu INT NOT NULL,
    CONSTRAINT FK_dichvu_hopdong FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu (ma_dich_vu)
);

CREATE TABLE loai_dich_vu (
	ma_loai_dich_vu INT PRIMARY KEY NOT NULL,
	ten_dich_vu VARCHAR(45)
);

CREATE TABLE dich_vu (
	ma_dich_vu INT PRIMARY KEY NOT NULL,
	ten_dich_vu VARCHAR(45),
	dien_tich INT,
	chi_phi_thue DOUBLE,
	so_nguoi_toi_da INT,
	ma_kieu_thue INT NOT NULL,
    CONSTRAINT FK_dichvu_kieuthue FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue (ma_kieu_thue),
	ma_loai_dich_vu INT NOT NULL,
    CONSTRAINT FK_dichvu_loaidichvu FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu (ma_loai_dich_vu),
	tieu_chuan_phong VARCHAR(45),
	mo_ta_tien_nghi_khac VARCHAR(45),
	dien_tich_ho_boi DOUBLE,
	so_tang INT
);

CREATE TABLE kieu_thue (
	ma_kieu_thue INT PRIMARY KEY NOT NULL,
	ten_kieu_thue VARCHAR(45)
);

CREATE TABLE hop_dong_chi_tiet (
	ma_hop_dong_chi_tiet INT PRIMARY KEY NOT NULL,
	ma_hop_dong INT,
    CONSTRAINT FK_hopdongchitiet_hopdong FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong (ma_hop_dong),
	ma_dich_vu_di_kem INT,
    CONSTRAINT FK_hopdongchitiet_dichvudikem FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem),
	so_luong INT
);

CREATE TABLE dich_vu_di_kem (
	ma_dich_vu_di_kem INT PRIMARY KEY NOT NULL,
	ten_dich_vu_di_kem VARCHAR(45),
	gia DOUBLE,
	don_vi VARCHAR(45),
	trang_thai VARCHAR(45)
);

CREATE TABLE loai_khach (
	ma_loai_khach INT PRIMARY KEY NOT NULL,
	ten_loai_khach VARCHAR(45)
);
