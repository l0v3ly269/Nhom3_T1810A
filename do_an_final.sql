CREATE DATABASE du_an_cong_vien;
go
use du_an_cong_vien;

CREATE TABLE loai_khu(
	id_lk int IDENTITY(1,1) PRIMARY KEY,
	ten_lk Nvarchar(255) NOT NULL,
	anh_lk varchar(50) NOT NULL,
	mota_lk Ntext NOT NULL,
	CONSTRAINT ten_lk UNIQUE (ten_lk),
);

CREATE TABLE khu(
	id_khu int IDENTITY(1,1) PRIMARY KEY,
	ten_khu Nvarchar(255) NOT NULL,
	anh_khu varchar(50) NOT NULL,
	gt_khu Ntext NOT NULL,
	CONSTRAINT ten_khu UNIQUE (ten_khu),
	id_lk int FOREIGN KEY REFERENCES loai_khu(id_lk) NOT NULL,
);

CREATE TABLE dich_vu_tro_choi(
	id_dvtc int IDENTITY(1,1) PRIMARY KEY,
	ten_dvtc Nvarchar(255) NOT NULL,
	anh_dvtc varchar(50) NOT NULL,
	mota_dvtc Ntext NOT NULL,
	CONSTRAINT ten_dvtc UNIQUE (ten_dvtc),
	id_khu int FOREIGN KEY REFERENCES khu(id_khu) NOT NULL,
);

CREATE TABLE khach_hang(
	id_kh int IDENTITY(1,1) PRIMARY KEY,
	ten_kh Nvarchar(255) NOT NULL,
	birth_kh date NOT NULL,
	cmt_kh varchar(50) NOT NULL,
	sdt_kh varchar(20) NOT NULL,
	dc_kh Nvarchar(255) NOT NULL,
	CONSTRAINT cmt_kh UNIQUE (cmt_kh),
);

CREATE TABLE tai_khoan(
	id_tk int IDENTITY(1,1) PRIMARY KEY,
	ten_tk varchar(16) NOT NULL,
	pass_tk varchar(20) NOT NULL,
	CONSTRAINT ten_tk UNIQUE (ten_tk),
	id_kh int FOREIGN KEY REFERENCES khach_hang(id_kh) NOT NULL,
);

CREATE TABLE hoa_don(
	id_hd int IDENTITY(1,1) PRIMARY KEY,
	ms_hd varchar(50) NOT NULL,
	tong_tien_hd decimal(16,0) NOT NULL,
	CONSTRAINT ms_hd UNIQUE (ms_hd),
	id_tk int FOREIGN KEY REFERENCES tai_khoan(id_tk) NOT NULL,
);

CREATE TABLE loai_ve(
	id_lv int IDENTITY(1,1) PRIMARY KEY,
	ten_lv Nvarchar(255) NOT NULL,
	ms_lv varchar(50) NOT NULL,
	gia_lv decimal(16,0) NOT NULL,
	CONSTRAINT ms_lv UNIQUE (ms_lv),
	id_hd int FOREIGN KEY REFERENCES hoa_don(id_hd) NOT NULL,
	id_khu int FOREIGN KEY REFERENCES khu(id_khu) NOT NULL,
	id_dvtc int FOREIGN KEY REFERENCES dich_vu_tro_choi(id_dvtc) NOT NULL,
);

CREATE TABLE uu_dai(
	id_ud int IDENTITY(1,1) PRIMARY KEY,
	ten_ud Nvarchar(255) NOT NULL,
	ms_ud varchar(50) NOT NULL,
	percent_ud int NOT NULL,
	CONSTRAINT ms_ud UNIQUE (ms_ud),
	id_hd int FOREIGN KEY REFERENCES hoa_don(id_hd) NOT NULL,
);
