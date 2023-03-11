--drop database quanlysinhvien
--create database quanlysinhvien

use quanlysinhvien

create table THANHPHAN
(
 id_tp nvarchar(25) not null,
 id_diem nvarchar(25),
 chuyen_can int,
 bai_tap int,
 thi int,
 thanh_phan int
);
alter table THANHPHAN add  primary key(id_tp); 

create table MONHOC
(
 id_mh nvarchar(25) not null,
 ten_mon_hoc nvarchar(100),
 tin_chi int,
 id_khoa nvarchar(25),
);
alter table MONHOC add primary key(id_mh);

create table HOCKY
(
 id_hk nvarchar(25) not null,
 ten_hoc_ky int,
);
alter table HOCKY add primary key(id_hk);

create table DIEM 
(
 id_diem nvarchar(25) not null,
 diem_cc int,
 diem_bt int,
 diem_thi int,
 diem_kt int,
 diem_th int,
 id_gv nvarchar(25),
 id_mh nvarchar(25),
 id_sv nvarchar(25),
 id_hk nvarchar(25),
);
alter table DIEM add primary key(id_diem);

create table SINHVIEN
(
 id_sv nvarchar(25) not null,
 ten_sv nvarchar(50),
 email_sv nvarchar(80),
 dob_sv varchar(20),
 gender_sv int,
 phone_sv varchar(14),
 lop_hanh_chinh_sv nvarchar(50)
);
alter table SINHVIEN add primary key(id_sv);

create table LOP
(
 id_lop nvarchar(25) not null,
 ten_lop nvarchar(20),
 id_khoa nvarchar(25),
);
alter table LOP add primary key(id_lop);

create table HOC
(
 id_sv nvarchar(25),
 id_lop nvarchar(25),
);

create table KHOA
(
 id_khoa nvarchar(25) not null,
 ten_khoa nvarchar(26),
)
alter table KHOA add primary key(id_khoa);

create table GIANGVIEN
(
 id_gv nvarchar(25) not null,
 ten_gv nvarchar(50),
 sdt_gv varchar(14),
 email_gv varchar(50),
 gender_gv int,
 id_khoa nvarchar(25),
)
alter table GIANGVIEN add primary key(id_gv);

create table DAYHOC
(
 id_gv nvarchar(25),
 id_mh nvarchar(25),
);

alter table DAYHOC add foreign key(id_gv) references GIANGVIEN(id_gv);
alter table DAYHOC add foreign key(id_mh) references MONHOC(id_mh);
alter table GIANGVIEN add foreign key(id_khoa) references KHOA(id_khoa);
alter table MONHOC add foreign key(id_khoa) references KHOA(id_khoa);
alter table DIEM add foreign key(id_gv) references GIANGVIEN(id_gv);
alter table DIEM add foreign key(id_mh) references MONHOC(id_mh);
alter table DIEM add foreign key(id_sv) references SINHVIEN(id_sv);
alter table DIEM add foreign key(id_hk) references HOCKY(id_hk);
alter table HOC add foreign key(id_sv) references SINHVIEN(id_sv);
alter table HOC add foreign key(id_lop) references LOP(id_lop);
alter table LOP add foreign key(id_khoa) references KHOA(id_khoa)
alter table THANHPHAN add foreign key(id_diem) references DIEM(id_diem)


