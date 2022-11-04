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
	ten_loai_dich_vu VARCHAR(45)
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

-- Task 1


-- Task 2

SELECT 
	* 
FROM 
	nhan_vien nv
WHERE 
	nv.ho_ten IN ('H%', 'T%', 'K%') AND CHAR_LENGTH(nv.ho_ten) <= 15;

-- Task 3

SELECT
	* 
FROM 
	khach_hang kh
WHERE 
	YEAR(now()) - YEAR(kh.ngay_sinh) BETWEEN 18 AND 50 AND kh.dia_chi IN ('Đà Nẵng', 'Quảng Trị');

-- Task 4

SELECT 
	kh.ma_khach_hang, kh.ho_ten,
    COUNT(kh.ma_khach_hang) AS 'Số lần đặt phòng'
FROM 
	khach_hang kh 
INNER JOIN 
	hop_dong hd
ON 
	kh.ma_khach_hang = hd.ma_khach_hang AND kh.ma_loai_khach = 5
GROUP BY 
	kh.ma_khach_hang
ORDER BY 
	COUNT(ma_khach_hang) ASC;

-- Task 5

SELECT 
	kh.ma_khach_hang, 
    kh.ho_ten, 
    lk.ten_loai_khach, 
    hd.ma_hop_dong, 
    dv.ten_dich_vu, 
    hd.ngay_lam_hop_dong, 
    hd.ngay_ket_thuc, 
    SUM(dv.chi_phi_thue + hdct.so_luong * dvdk.gia) AS tong_tien
FROM 
	khach_hang kh 
    LEFT JOIN loai_khach lk USING (ma_loai_khach) 
	LEFT JOIN hop_dong hd USING (ma_khach_hang) 
	LEFT JOIN hop_dong_chi_tiet hdct USING (ma_hop_dong)
	LEFT JOIN dich_vu_di_kem dvdk USING (ma_dich_vu_di_kem)
	LEFT JOIN dich_vu dv USING (ma_dich_vu)
    LEFT JOIN (
		SELECT
			kh.ma_khach_hang AS ma_khach_hang,
            SUM(dv.chi_phi_thue) AS chi_phi_thue
		FROM
			khach_hang kh
            INNER JOIN hop_dong hd USING (ma_khach_hang)
            INNER JOIN dich_vu dv USING (ma_dich_vu)
		GROUP BY
			kh.ma_khach_hang
			) tmp USING (ma_khach_hang)
	GROUP BY
			kh.ma_khach_hang;


-- Task 6

SELECT
	ma_dich_vu,
    ten_dich_vu,
    dien_tich,
    chi_phi_thue,
    ten_loai_dich_vu
FROM
	dich_vu
    JOIN loai_dich_vu USING (ma_loai_dich_vu)
    LEFT JOIN hop_dong hd USING (ma_dich_vu)
WHERE
	hd.ngay_lam_hop_dong NOT BETWEEN '2021-01-01' AND '2021-03-31';
    
-- Task 7

SELECT
	ma_dich_vu,
    ten_dich_vu,
    dien_tich,
    chi_phi_thue,
    so_nguoi_toi_da,
    ten_loai_dich_vu
FROM
	dich_vu dv
    JOIN loai_dich_vu USING (ma_loai_dich_vu)
WHERE
	EXISTS (
		SELECT 
			1
		FROM
			hop_dong hd
		WHERE
			dv.ma_dich_vu = hd.ma_dich_vu AND
            YEAR(hd.ngay_lam_hop_dong) = 2020
		) AND 
	NOT EXISTS (
		SELECT 
			1
		FROM
			hop_dong hd
		WHERE
			dv.ma_dich_vu = hd.ma_dich_vu AND
            YEAR(hd.ngay_lam_hop_dong) = 2021
		);
        
-- Task 8

SELECT 
	DISTINCT ho_ten 
FROM 
	khach_hang;

-- Task 9

SELECT 
	month(hd.ngay_lam_hop_dong) AS thang, 
    COUNT(kh.ma_khach_hang) AS so_khach_hang_dat_phong
FROM 
	khach_hang kh 
    JOIN hop_dong hd
WHERE 
	YEAR(hd.ngay_lam_hop_dong) = 2021
GROUP BY 
	MONTH(hd.ngay_lam_hop_dong);

-- Task 10

SELECT
	hd.ma_hop_dong,
    ngay_lam_hop_dong,
    ngay_ket_thuc,
    tien_dat_coc,
    SUM(hdct.so_luong) AS 'so_luong_dich_vu_di_kem'
FROM
	hop_dong hd
    LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY
	hd.ma_hop_dong;
    

-- Task 11;

SELECT
	ma_dich_vu_di_kem,
    ten_dich_vu_di_kem,
    gia,
    don_vi,
    trang_thai
FROM
	dich_vu_di_kem dvdk
    JOIN hop_dong_chi_tiet hdct USING (ma_dich_vu_di_kem)
    JOIN hop_dong USING (ma_hop_dong)
    JOIN khach_hang kh USING (ma_khach_hang)
    JOIN loai_khach lk USING (ma_loai_khach)
WHERE
	lk.ten_loai_khach = 'Diamond'
    AND 
		kh.dia_chi LIKE '%Vinh%'
        OR kh.dia_chi LIKE '%Quang Ngai%';
	

-- Task 12

SELECT 
	hd.ma_hop_dong, 
    nv.ho_ten, kh.ho_ten, 
    kh.so_dien_thoai, 
    dv.ten_dich_vu, 
    SUM(hdct.so_luong) AS 'so_luong_dich_vu_di_kem'
FROM 
	hop_dong hd 
    INNER JOIN nhan_vien nv USING (ma_nhan_vien)
	INNER JOIN khach_hang kh USING (ma_khach_hang)
	INNER JOIN dich_vu dv USING (ma_dich_vu)
	INNER JOIN  hop_dong_chi_tiet hdct USING (ma_hop_dong)
WHERE 
	(hd.ngay_lam_hop_dong BETWEEN '2020-10-01' AND '2020-12-31') 
    AND (hd.ngay_lam_hop_dong NOT BETWEEN '2021-01-01' AND '2021-06-30')
GROUP BY 
	hd.ma_hop_dong;

-- Task 13



-- Task 14

SELECT
		ma_hop_dong,
		ten_loai_dich_vu,
        ten_dich_vu_di_kem,
        count(ma_dich_vu_di_kem) so_lan_dung_dvdk
    FROM
        dich_vu_di_kem
        JOIN hop_dong_chi_tiet USING(ma_dich_vu_di_kem)
        JOIN hop_dong USING (ma_hop_dong)
        JOIN dich_vu USING (ma_dich_vu)
        JOIN loai_dich_vu USING (ma_loai_dich_vu)
    GROUP by
        ma_dich_vu_di_kem
        HAVING so_lan_dung_dvdk = 1;

-- Task 15

SELECT 
	ma_nhan_vien,
	ho_ten,
    ten_trinh_do,
    ten_bo_phan,
    so_dien_thoai,
    dia_chi,
    COUNT(hd.ma_nhan_vien) AS so_hop_dong
FROM 
	nhan_vien
    JOIN trinh_do USING (ma_trinh_do)
    JOIN bo_phan USING (ma_bo_phan)
    JOIN hop_dong hd USING (ma_nhan_vien)
WHERE
	YEAR(hd.ngay_lam_hop_dong) BETWEEN 2020 AND 2021
GROUP BY
	hd.ma_nhan_vien
HAVING
	so_hop_dong <= 3;

-- Task 16

DELETE 
FROM 
	nhan_vien nv
		WHERE EXISTS (
			SELECT
				*
			FROM 
				hop_dong hd
			WHERE
				nv.ma_nhan_vien = hd.ma_nhan_vien AND
				YEAR(ngay_lam_hop_dong) NOT BETWEEN 2019 AND 2021
            );

-- Task 17

UPDATE khach_hang kh1
SET 
	ma_loai_khach = 04
WHERE
	kh1.ma_khach_hang IN
     (SELECT ma_khach_hang FROM 
		(SELECT 
			kh2.ma_khach_hang
		FROM
			khach_hang kh2
            JOIN hop_dong hd USING (ma_khach_hang)
            JOIN dich_vu dv USING (ma_dich_vu)
            JOIN hop_dong_chi_tiet hdct USING (ma_hop_dong)
            JOIN dich_vu_di_kem dvdk USING (ma_dich_vu_di_kem)
		WHERE
			ma_loai_khach = 03
            AND YEAR(ngay_lam_hop_dong) = 2021
		GROUP BY
			kh2.ma_khach_hang
		HAVING
			SUM(dv.chi_phi_thue + dvdk.gia * hdct.so_luong) > 10000000
		) AS temp
	);

-- Task 18

DELETE 
FROM 
	khach_hang kh
WHERE
	EXISTS (
		SELECT
			*
		FROM
			hop_dong hd
		WHERE
			ma_khach_hang = kh.ma_khach_hang
            AND YEAR(ngay_lam_hop_dong) < 2021
            );

-- Task 19

UPDATE dich_vu_di_kem dvdk1
SET 
	gia = gia * 2
WHERE
	dvdk1.ma_dich_vu_di_kem IN
     (SELECT ma_dich_vu_di_kem FROM 
		(SELECT 
			dvdk2.ma_dich_vu_di_kem
		FROM
			dich_vu_di_kem dvdk2
            JOIN hop_dong_chi_tiet hdct USING (ma_dich_vu_di_kem)
            JOIN hop_dong hd USING (ma_hop_dong)
		WHERE
			dvdk2.ma_dich_vu_di_kem = dvdk1.ma_dich_vu_di_kem
            AND YEAR(ngay_lam_hop_dong) = 2020
		GROUP BY
			dvdk2.ma_dich_vu_di_kem
		HAVING
			SUM(hdct.so_luong) > 10
		) AS temp
	);

-- Task 20

SELECT
	ma_nhan_vien AS id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
	nhan_vien
UNION (
	SELECT
		ma_khach_hang AS id,
        ho_ten,
        email,
		so_dien_thoai,
		ngay_sinh,
		dia_chi
	FROM
		khach_hang
        );
        
-- Task 21

CREATE VIEW 
	v_nhan_vien 
AS
	SELECT 
		ma_nhan_vien,
        ho_ten,
        dia_chi,
        ngay_sinh,
        so_cmnd,
        luong,
        so_dien_thoai,
        email,
        ma_bo_phan,
        ma_trinh_do,
        ma_vi_tri
	FROM
		nhan_vien nv
        JOIN hop_dong hd USING (ma_nhan_vien)
	WHERE
		dia_chi = 'Hải Châu' AND
		ngay_lam_hop_dong = '2019-12-12';
        
-- Task 22
        
UPDATE
	v_nhan_vien
SET dia_chi = 'Liên chiểu'

-- Task 23

DELIMITER //
CREATE PROCEDURE 
	sp_xoa_khach_hang (IN ma_kh_can_xoa INT)
    BEGIN
		DELETE
        FROM
			khach_hang kh
		WHERE
			kh.ma_khach_hang = ma_kh_can_xoa;
	END //
DELIMITER ;

-- Task 24

DELIMITER //
CREATE PROCEDURE 
	sp_them_moi_hop_dong (
	 	IN ma_hop_dong_moi INT,
        IN ngay_lam_hop_dong_moi DATETIME,
        IN ngay_ket_thuc_moi DATETIME,
        IN tien_dat_coc_moi DOUBLE,
        IN ma_nhan_vien_moi INT,
		IN ma_khach_hang_moi INT,
		IN ma_dich_vu_moi INT
BEGIN
	
DELIMITER ;

-- Task 25
        
-- Task 26
        
-- Task 27
        















