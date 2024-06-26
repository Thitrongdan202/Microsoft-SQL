-- Tạo bảng KHOA
CREATE TABLE KHOA (
    MAKHOA VARCHAR(4) PRIMARY KEY,
    TENKHOA VARCHAR(40),
    NGTLAP SMALLDATETIME,
    TRGKHOA CHAR(4)
);

-- Tạo bảng MONHOC
CREATE TABLE MONHOC (
    MAMH VARCHAR(10) PRIMARY KEY,
    TENMH VARCHAR(40),
    TCLT TINYINT,
    TCTH TINYINT,
    MAKHOA VARCHAR(4),
    FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
);

-- Tạo bảng DIEUKIEN
CREATE TABLE DIEUKIEN (
    MAMH VARCHAR(10),
    MAMH_TRUOC VARCHAR(10),
    PRIMARY KEY (MAMH, MAMH_TRUOC),
    FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH),
    FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC(MAMH)
);

-- Tạo bảng GIAOVIEN
CREATE TABLE GIAOVIEN (
    MAGV CHAR(4) PRIMARY KEY,
    HOTEN VARCHAR(40),
    HOCVI VARCHAR(10),
    HOCHAM VARCHAR(10),
    GIOITINH VARCHAR(3),
    NGSINH SMALLDATETIME,
    NGVL SMALLDATETIME,
    HESO NUMERIC(4,2),
    MUCLUONG MONEY,
    MAKHOA VARCHAR(4),
    FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
);

-- Tạo bảng LOP
CREATE TABLE LOP (
    MALOP CHAR(3) PRIMARY KEY,
    TENLOP VARCHAR(40),
    TRGLOP CHAR(5),
    SISO TINYINT,
    MAGVCN CHAR(4),
    FOREIGN KEY (MAGVCN) REFERENCES GIAOVIEN(MAGV)
);

-- Tạo bảng HOCVIEN
CREATE TABLE HOCVIEN (
    MAHV CHAR(5) PRIMARY KEY,
    HO VARCHAR(40),
    TEN VARCHAR(10),
    NGSINH SMALLDATETIME,
    GIOITINH VARCHAR(3),
    NOISINH VARCHAR(40),
    MALOP CHAR(3),
    FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
);

-- Tạo bảng GIANGDAY
CREATE TABLE GIANGDAY (
    MALOP CHAR(3),
    MAMH VARCHAR(10),
    MAGV CHAR(4),
    HOCKY TINYINT,
    NAM SMALLINT,
    TUNGAY SMALLDATETIME,
    DENNGAY SMALLDATETIME,
    PRIMARY KEY (MALOP, MAMH, MAGV, HOCKY, NAM),
    FOREIGN KEY (MALOP) REFERENCES LOP(MALOP),
    FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH),
    FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV)
);

-- Tạo bảng KETQUATHI
CREATE TABLE KETQUATHI (
    MAHV CHAR(5),
    MAMH VARCHAR(10),
    LANTHI TINYINT,
    NGTHI SMALLDATETIME,
    DIEM NUMERIC(4,2),
    KQUA VARCHAR(10),
    PRIMARY KEY (MAHV, MAMH, LANTHI),
    FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV),
    FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
);

-- Thêm dữ liệu vào bảng KHOA
INSERT INTO KHOA (MAKHOA, TENKHOA, NGTLAP, TRGKHOA) VALUES
('KHMT', 'Khoa hoc may tinh', '2005-06-07', 'GV01'),
('HTTT', 'He thong thong tin', '2005-06-07', 'GV02'),
('CNPM', 'Cong nghe phan mem', '2005-06-07', 'GV04'),
('MTT', 'Mang va truyen thong', '2005-10-20', 'GV03'),
('KTMT', 'Ky thuat may tinh', '2005-12-20', NULL);

-- Thêm dữ liệu vào bảng MONHOC
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES
('THDC', 'Tin hoc dai cuong', 4, 1, 'KHMT'),
('CTRR', 'Cau truc roi rac', 5, 0, 'KHMT'),
('CSDL', 'Co so du lieu', 3, 1, 'HTTT'),
('CTDLGT', 'Cau truc du lieu va giai thuat', 3, 1, 'KHMT'),
('PTTKTT', 'Phan tich thiet ke thuat toan', 3, 0, 'KHMT'),
('DHMT', 'Do hoa may tinh', 3, 1, 'KHMT'),
('KTMT', 'Kien truc may tinh', 3, 0, 'KTMT'),
('TKCSDL', 'Thiet ke co so du lieu', 3, 1, 'HTTT'),
('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', 4, 1, 'HTTT'),
('HDH', 'He dieu hanh', 4, 0, 'KTMT'),
('NMCNPM', 'Nhap mon cong nghe phan mem', 3, 0, 'CNPM'),
('LTCFW', 'Lap trinh C for win', 3, 1, 'CNPM'),
('LTHDT', 'Lap trinh huong doi tuong', 3, 1, 'CNPM');

-- Thêm dữ liệu vào bảng DIEUKIEN
INSERT INTO DIEUKIEN (MAMH, MAMH_TRUOC) VALUES
('CSDL', 'CTRR'),
('CSDL', 'CTDLGT'),
('CTDLGT', 'THDC'),
('PTTKTT', 'THDC'),
('PTTKTT', 'CTDLGT'),
('DHMT', 'THDC'),
('LTHDT', 'THDC'),
('PTTKHTTT', 'CSDL');

-- Thêm dữ liệu vào bảng GIAOVIEN
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES
('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '1950-05-02', '2004-11-01', 5.00, 2250000, 'KHMT'),
('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '1965-12-17', '2004-04-20', 4.50, 2025000, 'HTTT'),
('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '1950-08-01', '2004-09-23', 4.00, 1800000, 'CNPM'),
('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam', '1961-02-22', '2005-01-12', 4.50, 2025000, 'KTMT'),
('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam', '1958-03-12', '2005-01-12', 3.00, 1350000, 'HTTT'),
('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '1953-03-11', '2005-01-12', 4.50, 2025000, 'KHMT'),
('GV07', 'Nguyen Minh Tien', 'ThS', 'GV', 'Nam', '1971-11-23', '2005-03-01', 4.00, 1800000, 'KHMT'),
('GV08', 'Le Thi Tran', 'KS', NULL, 'Nu', '1974-03-26', '2005-03-01', 1.69, 760500, 'KHMT'),
('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu', '1966-12-31', '2005-03-01', 4.00, 1800000, 'HTTT'),
('GV10', 'Le Tran Anh Loan', 'KS', NULL, 'Nu', '1972-07-17', '2005-03-01', 1.86, 837000, 'CNPM'),
('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '1980-01-12', '2005-05-15', 2.67, 1201500, 'MTT'),
('GV12', 'Tran Van Anh', 'CN', NULL, 'Nu', '1981-03-29', '2005-05-15', 1.69, 760500, 'CNPM'),
('GV13', 'Nguyen Linh Dan', 'CN', NULL, 'Nu', '1980-05-23', '2005-05-15', 1.69, 760500, 'KTMT'),
('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '1976-11-30', '2005-05-15', 3.00, 1350000, 'MTT'),
('GV15', 'Le Ha Thanh', 'ThS', 'GV', 'Nam', '1978-05-04', '2005-05-15', 3.00, 1350000, 'KHMT');

-- Thêm dữ liệu vào bảng LOP
INSERT INTO LOP (MALOP, TENLOP, TRGLOP, SISO, MAGVCN) VALUES
('K11', 'Lop 1 khoa 1', 'K1108', 11, 'GV07'),
('K12', 'Lop 2 khoa 1', 'K1205', 12, 'GV09'),
('K13', 'Lop 3 khoa 1', 'K1305', 12, 'GV14');

-- Thêm dữ liệu vào bảng HOCVIEN
INSERT INTO HOCVIEN (MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) VALUES
('K1101', 'Nguyen Van', 'A', '1986-01-27', 'Nam', 'TpHCM', 'K11'),
('K1102', 'Tran Ngoc', 'Han', '1986-03-14', 'Nu', 'Kien Giang', 'K11'),
('K1103', 'Ha Duy', 'Lap', '1986-04-18', 'Nam', 'Nghe An', 'K11'),
('K1104', 'Tran Ngoc', 'Linh', '1986-03-30', 'Nu', 'Tay Ninh', 'K11'),
('K1105', 'Tran Minh', 'Long', '1986-02-27', 'Nam', 'TpHCM', 'K11'),
('K1106', 'Le Nhat', 'Minh', '1986-01-24', 'Nam', 'TpHCM', 'K11'),
('K1107', 'Nguyen Nhu', 'Nhut', '1986-01-27', 'Nam', 'Ha Noi', 'K11'),
('K1108', 'Nguyen Manh', 'Tam', '1986-02-27', 'Nam', 'Kien Giang', 'K11'),
('K1109', 'Phan Thi Thanh', 'Tam', '1986-01-27', 'Nu', 'Vinh Long', 'K11'),
('K1110', 'Le Hoai', 'Thuong', '1986-02-05', 'Nu', 'Can Tho', 'K11'),
('K1111', 'Le Ha', 'Vinh', '1986-12-25', 'Nam', 'Vinh Long', 'K11'),
('K1201', 'Nguyen Van', 'B', '1986-02-11', 'Nam', 'TpHCM', 'K12'),
('K1202', 'Nguyen Thi Kim', 'Duyen', '1986-01-18', 'Nu', 'TpHCM', 'K12'),
('K1203', 'Tran Thi Kim', 'Duyen', '1986-09-17', 'Nu', 'TpHCM', 'K12'),
('K1204', 'Truong My', 'Hanh', '1986-05-19', 'Nu', 'Dong Nai', 'K12'),
('K1205', 'Nguyen Thanh', 'Nam', '1986-04-17', 'Nam', 'TpHCM', 'K12'),
('K1206', 'Nguyen Thi Truc', 'Thanh', '1986-03-04', 'Nu', 'Kien Giang', 'K12'),
('K1207', 'Tran Thi Bich', 'Thuy', '1986-02-08', 'Nu', 'Nghe An', 'K12'),
('K1208', 'Huynh Thi Kim', 'Trieu', '1986-04-08', 'Nu', 'Tay Ninh', 'K12'),
('K1209', 'Pham Thanh', 'Trieu', '1986-02-23', 'Nam', 'TpHCM', 'K12'),
('K1210', 'Ngo Thanh', 'Tuan', '1986-02-14', 'Nam', 'TpHCM', 'K12'),
('K1211', 'Do Thi', 'Xuan', '1986-03-09', 'Nu', 'Ha Noi', 'K12'),
('K1212', 'Le Thi Phi', 'Yen', '1986-03-12', 'Nu', 'TpHCM', 'K12'),
('K1301', 'Nguyen Thi Kim', 'Cuc', '1986-06-09', 'Nu', 'Kien Giang', 'K13'),
('K1302', 'Truong Thi My', 'Hien', '1986-03-18', 'Nu', 'Nghe An', 'K13'),
('K1303', 'Le Duc', 'Hien', '1986-03-21', 'Nam', 'Tay Ninh', 'K13'),
('K1304', 'Le Quang', 'Hien', '1986-04-18', 'Nam', 'TpHCM', 'K13'),
('K1305', 'Le Thi', 'Huong', '1986-03-27', 'Nu', 'TpHCM', 'K13'),
('K1306', 'Nguyen Thai', 'Huu', '1986-03-30', 'Nam', 'Ha Noi', 'K13'),
('K1307', 'Tran Minh', 'Man', '1986-05-28', 'Nam', 'TpHCM', 'K13'),
('K1308', 'Nguyen Hieu', 'Nghia', '1986-04-08', 'Nam', 'Kien Giang', 'K13'),
('K1309', 'Nguyen Trung', 'Nghia', '1987-01-18', 'Nam', 'Nghe An', 'K13'),
('K1310', 'Tran Thi Hong', 'Tham', '1986-04-22', 'Nu', 'Tay Ninh', 'K13'),
('K1311', 'Tran Minh', 'Thuc', '1986-04-04', 'Nam', 'TpHCM', 'K13'),
('K1312', 'Nguyen Thi Kim', 'Yen', '1986-09-07', 'Nu', 'TpHCM', 'K13');

-- Thêm dữ liệu vào bảng GIANGDAY
INSERT INTO GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES
('K11', 'THDC', 'GV07', 1, 2006, '2006-01-02', '2006-05-12'),
('K12', 'THDC', 'GV06', 1, 2006, '2006-01-02', '2006-05-12'),
('K13', 'THDC', 'GV15', 1, 2006, '2006-01-02', '2006-05-12'),
('K11', 'CTRR', 'GV02', 1, 2006, '2006-01-09', '2006-05-17'),
('K12', 'CTRR', 'GV02', 1, 2006, '2006-01-09', '2006-05-17'),
('K13', 'CTRR', 'GV08', 1, 2006, '2006-01-09', '2006-05-17'),
('K11', 'CSDL', 'GV05', 2, 2006, '2006-06-01', '2006-07-15'),
('K12', 'CSDL', 'GV09', 2, 2006, '2006-06-01', '2006-07-15'),
('K13', 'CTDLGT', 'GV15', 2, 2006, '2006-06-01', '2006-07-15'),
('K13', 'CSDL', 'GV05', 3, 2006, '2006-08-01', '2006-12-15'),
('K13', 'DHMT', 'GV07', 3, 2006, '2006-08-01', '2006-12-15'),
('K11', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
('K12', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
('K11', 'HDH', 'GV04', 1, 2007, '2007-01-02', '2007-02-18'),
('K12', 'HDH', 'GV04', 1, 2007, '2007-01-02', '2007-03-20'),
('K11', 'DHMT', 'GV07', 1, 2007, '2007-02-18', '2007-03-20');

-- Thêm dữ liệu vào bảng KETQUATHI
INSERT INTO KETQUATHI (MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) VALUES
('K1101', 'CSDL', 1, '2006-07-20', 10.00, 'Dat'),
('K1101', 'CTDLGT', 1, '2006-12-28', 9.00, 'Dat'),
('K1101', 'THDC', 1, '2006-05-20', 9.00, 'Dat'),
('K1101', 'CTRR', 1, '2006-05-13', 9.50, 'Dat'),
('K1102', 'CSDL', 1, '2006-07-20', 4.00, 'Khong Dat'),
('K1102', 'CSDL', 2, '2006-07-27', 4.25, 'Khong Dat'),
('K1102', 'CSDL', 3, '2006-08-10', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 1, '2006-12-28', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 2, '2007-01-05', 4.00, 'Khong Dat'),
('K1102', 'CTDLGT', 3, '2007-01-15', 6.00, 'Dat'),
('K1102', 'THDC', 1, '2006-05-20', 5.00, 'Dat'),
('K1102', 'CTRR', 1, '2006-05-13', 7.00, 'Dat'),
('K1103', 'CSDL', 1, '2006-07-20', 3.50, 'Khong Dat'),
('K1103', 'CSDL', 2, '2006-07-27', 8.25, 'Dat'),
('K1103', 'CTDLGT', 1, '2006-12-28', 7.00, 'Dat'),
('K1103', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1103', 'CTRR', 1, '2006-05-13', 6.50, 'Dat'),
('K1104', 'CSDL', 1, '2006-07-20', 3.75, 'Khong Dat'),
('K1104', 'CTDLGT', 1, '2006-12-28', 4.00, 'Khong Dat'),
('K1104', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
('K1104', 'CTRR', 1, '2006-05-13', 4.00, 'Khong Dat'),
('K1104', 'CTRR', 2, '2006-05-20', 3.50, 'Khong Dat'),
('K1104', 'CTRR', 3, '2006-06-30', 4.00, 'Khong Dat'),
('K1201', 'CSDL', 1, '2006-07-20', 6.00, 'Dat'),
('K1201', 'CTDLGT', 1, '2006-12-28', 5.00, 'Dat'),
('K1201', 'THDC', 1, '2006-05-20', 8.50, 'Dat'),
('K1201', 'CTRR', 1, '2006-05-13', 9.00, 'Dat'),
('K1202', 'CSDL', 1, '2006-07-20', 8.00, 'Dat'),
('K1202', 'CTDLGT', 1, '2006-12-28', 4.00, 'Khong Dat'),
('K1202', 'CTDLGT', 2, '2007-01-05', 5.00, 'Dat'),
('K1202', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
('K1202', 'THDC', 2, '2006-05-27', 4.00, 'Khong Dat'),
('K1202', 'CTRR', 1, '2006-05-13', 3.00, 'Khong Dat'),
('K1202', 'CTRR', 2, '2006-05-20', 4.00, 'Khong Dat'),
('K1202', 'CTRR', 3, '2006-06-30', 6.25, 'Dat'),
('K1203', 'CSDL', 1, '2006-07-20', 9.25, 'Dat'),
('K1203', 'CTDLGT', 1, '2006-12-28', 9.50, 'Dat'),
('K1203', 'THDC', 1, '2006-05-20', 10.00, 'Dat'),
('K1203', 'CTRR', 1, '2006-05-13', 10.00, 'Dat'),
('K1204', 'CSDL', 1, '2006-07-20', 8.50, 'Dat'),
('K1204', 'CTDLGT', 1, '2006-12-28', 6.75, 'Dat'),
('K1204', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
('K1204', 'CTRR', 1, '2006-05-13', 6.00, 'Dat'),
('K1301', 'CSDL', 1, '2006-12-20', 4.25, 'Khong Dat'),
('K1301', 'CTDLGT', 1, '2006-07-25', 8.00, 'Dat'),
('K1301', 'THDC', 1, '2006-05-20', 7.75, 'Dat'),
('K1301', 'CTRR', 1, '2006-05-13', 8.00, 'Dat'),
('K1302', 'CSDL', 1, '2006-12-20', 6.75, 'Dat'),
('K1302', 'CTDLGT', 1, '2006-07-25', 5.00, 'Dat'),
('K1302', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1302', 'CTRR', 1, '2006-05-13', 8.50, 'Dat'),
('K1303', 'CSDL', 1, '2006-12-20', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 1, '2006-07-25', 4.50, 'Khong Dat'),
('K1303', 'CTDLGT', 2, '2006-08-07', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 3, '2006-08-15', 4.25, 'Khong Dat'),
('K1303', 'THDC', 1, '2006-05-20', 4.50, 'Khong Dat'),
('K1303', 'CTRR', 1, '2006-05-13', 3.25, 'Khong Dat'),
('K1303', 'CTRR', 2, '2006-05-20', 5.00, 'Dat'),
('K1304', 'CSDL', 1, '2006-12-20', 7.75, 'Dat'),
('K1304', 'CTDLGT', 1, '2006-07-25', 9.75, 'Dat'),
('K1304', 'THDC', 1, '2006-05-20', 5.50, 'Dat'),
('K1304', 'CTRR', 1, '2006-05-13', 5.00, 'Dat'),
('K1305', 'CSDL', 1, '2006-12-20', 9.25, 'Dat'),
('K1305', 'CTDLGT', 1, '2006-07-25', 10.00, 'Dat'),
('K1305', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1305', 'CTRR', 1, '2006-05-13', 10.00, 'Dat');
-- I. Ngôn ngữ định nghĩa dữ liệu (Data Definition Language): 
-- 1. Thêm vào 3 thuộc tính GHICHU, DIEMTB, XEPLOAI cho quan hệ HOCVIEN.
ALTER TABLE HOCVIEN
ADD GHICHU TEXT,
    DIEMTB DECIMAL(4, 2),
    XEPLOAI VARCHAR(10);
-- 2.	Mã học viên là một chuỗi 5 ký tự, 3 ký tự đầu là mã lớp, 2 ký tự cuối cùng là số thứ tự học viên trong lớp. VD: “K1101” 
SELECT * FROM HOCVIEN
WHERE NOT (MAHV LIKE '[A-Z][A-Z][A-Z][0-9][0-9]');
-- 3. Thuộc tính GIOITINH chỉ có giá trị là “Nam” hoặc “Nu”. 
-- Thêm ràng buộc cho bảng HOCVIEN
ALTER TABLE HOCVIEN
ADD CONSTRAINT CHK_HOCVIEN_GIOITINH
CHECK (GIOITINH IN ('Nam', 'Nu'));

-- Thêm ràng buộc cho bảng GIAOVIEN
ALTER TABLE GIAOVIEN
ADD CONSTRAINT CHK_GIAOVIEN_GIOITINH
CHECK (GIOITINH IN ('Nam', 'Nu'));
-- 4. Điểm số của một lần thi có giá trị từ 0 đến 10 và cần lưu đến 2 số lẽ (VD: 6.22). 
-- Đầu tiên, thay đổi kiểu dữ liệu nếu cần
ALTER TABLE KETQUATHI
ALTER COLUMN DIEM DECIMAL(4, 2);

-- Sau đó thêm ràng buộc CHECK để đảm bảo điểm số từ 0 đến 10
ALTER TABLE KETQUATHI
ADD CONSTRAINT CHK_KETQUATHI_DIEM
CHECK (DIEM >= 0 AND DIEM <= 10);

-- 5. Kết quả thi là “Dat” nếu điểm từ 5 đến 10 và “Khong dat” nếu điểm nhỏ hơn 5.
CREATE TRIGGER SetExamResult
ON KETQUATHI
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE k
    SET KQUA = CASE
                   WHEN i.DIEM >= 5 THEN 'Dat'
                   ELSE 'Khong dat'
               END
    FROM KETQUATHI k
    JOIN inserted i ON k.MAHV = i.MAHV AND k.MAMH = i.MAMH AND k.LANTHI = i.LANTHI;
END;

-- 6. Học viên thi một môn tối đa 3 lần. 
CREATE TRIGGER CheckExamAttempts
ON KETQUATHI
INSTEAD OF INSERT
AS
BEGIN
    -- Kiểm tra số lần thi của học viên cho mỗi môn học
    DECLARE @count INT;

    SELECT @count = COUNT(*)
    FROM KETQUATHI
    WHERE MAHV = (SELECT MAHV FROM inserted)
    AND MAMH = (SELECT MAMH FROM inserted);

    IF (@count >= 3)
    BEGIN
        RAISERROR ('Học viên không thể thi quá 3 lần cho một môn học.', 16, 1);
        RETURN;
    END

    -- Nếu số lần thi chưa đạt 3 lần, cho phép thêm bản ghi
    INSERT INTO KETQUATHI (MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA)
    SELECT MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA
    FROM inserted;
END;

-- 7.	Học kỳ chỉ có giá trị từ 1 đến 3.
ALTER TABLE GIANGDAY
ADD CONSTRAINT CHK_GIANGDAY_HOCKY
CHECK (HOCKY >= 1 AND HOCKY <= 3);
-- 8.	Học vị của giáo viên chỉ có thể là “CN”, “KS”, “Ths”, ”TS”, ”PTS”.
 ALTER TABLE GIAOVIEN
ADD CONSTRAINT CHK_GIAOVIEN_HOCVI
CHECK (HOCVI IN ('CN', 'KS', 'ThS', 'TS', 'PTS'));
-- 9.	Lớp trưởng của một lớp phải là học viên của lớp đó.
CREATE TRIGGER CheckClassLeader
ON LOP
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * 
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1 
            FROM HOCVIEN hv
            WHERE hv.MAHV = i.TRGLOP AND hv.MALOP = i.MALOP
        )
    )
    BEGIN
        RAISERROR ('Lớp trưởng phải là học viên của lớp đó.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO


-- 10.	Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “PTS”.
CREATE TRIGGER CheckDepartmentHead
ON KHOA
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * 
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1 
            FROM GIAOVIEN gv
            WHERE gv.MAGV = i.TRGKHOA AND gv.MAKHOA = i.MAKHOA AND gv.HOCVI IN ('TS', 'PTS')
        )
    )
    BEGIN
        RAISERROR ('Trưởng khoa phải là giáo viên thuộc khoa với học vị "TS" hoặc "PTS".', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
-- 11.	Học viên ít nhất là 18 tuổi.
ALTER TABLE HOCVIEN
ADD CONSTRAINT CHK_HOCVIEN_AGE
CHECK (DATEDIFF(YEAR, NGSINH, GETDATE()) >= 18);

-- 12.	Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY).
ALTER TABLE GIANGDAY
ADD CONSTRAINT CHK_GIANGDAY_DATE
CHECK (TUNGAY < DENNGAY);
-- 13.	Giáo viên khi vào làm ít nhất là 22 tuổi.
ALTER TABLE GIAOVIEN
ADD CONSTRAINT CHK_GIAOVIEN_AGE
CHECK (DATEDIFF(YEAR, NGSINH, NGVL) >= 22);

-- 14.	Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 3.
ALTER TABLE MONHOC
ADD CONSTRAINT CHK_MONHOC_TINCHI
CHECK (ABS(TCLT - TCTH) <= 3);

-- 15.	Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này.
CREATE TRIGGER CheckExamEligibility
ON KETQUATHI
INSTEAD OF INSERT
AS
BEGIN
    -- Kiểm tra điều kiện để học viên chỉ được thi khi lớp đã học xong môn học
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN HOCVIEN h ON i.MAHV = h.MAHV
        JOIN GIANGDAY g ON h.MALOP = g.MALOP AND i.MAMH = g.MAMH
        WHERE i.NGTHI < g.DENNGAY
    )
    BEGIN
        RAISERROR ('Học viên chỉ được thi một môn học khi lớp của học viên đã học xong môn học này.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Chèn dữ liệu vào bảng KETQUATHI nếu điều kiện được thỏa mãn
    INSERT INTO KETQUATHI (MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA)
    SELECT MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA
    FROM inserted;
END;
GO

-- 16.	Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn
CREATE TRIGGER CheckMaxSubjectsPerTerm
ON GIANGDAY
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @MALOP CHAR(3), @HOCKY TINYINT, @NAM SMALLINT;

    SELECT @MALOP = MALOP, @HOCKY = HOCKY, @NAM = NAM
    FROM inserted;

    IF (
        SELECT COUNT(*)
        FROM GIANGDAY
        WHERE MALOP = @MALOP AND HOCKY = @HOCKY AND NAM = @NAM
    ) >= 3
    BEGIN
        RAISERROR ('Một lớp chỉ được học tối đa 3 môn mỗi học kỳ của một năm học.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY)
        SELECT MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY
        FROM inserted;
    END
GO

-- 17.	Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.
CREATE TRIGGER UpdateClassSize
ON HOCVIEN
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    -- Cập nhật sỉ số lớp sau khi chèn, xóa hoặc cập nhật học viên
    UPDATE LOP
    SET SISO = (
        SELECT COUNT(*)
        FROM HOCVIEN
        WHERE HOCVIEN.MALOP = LOP.MALOP
    );
END;
GO

-- 18.	Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong cùng một bộ không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ (“A”,”B”) và (“B”,”A”).
CREATE TRIGGER CheckCircularPrerequisites
ON DIEUKIEN
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN DIEUKIEN d
        ON i.MAMH = d.MAMH_TRUOC AND i.MAMH_TRUOC = d.MAMH
    )
    BEGIN
        RAISERROR ('Không tồn tại hai bộ có dạng (“A”,”B”) và (“B”,”A”).', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Chèn dữ liệu vào bảng DIEUKIEN nếu điều kiện được thỏa mãn
    INSERT INTO DIEUKIEN (MAMH, MAMH_TRUOC)
    SELECT MAMH, MAMH_TRUOC
    FROM inserted;
END;
GO
-- 19.	Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
CREATE TRIGGER CheckTeacherSalary
ON GIAOVIEN
INSTEAD OF INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN GIAOVIEN g
        ON i.HOCVI = g.HOCVI
        AND i.HOCHAM = g.HOCHAM
        AND i.HESO = g.HESO
        AND i.MUCLUONG <> g.MUCLUONG
    )
    BEGIN
        RAISERROR ('Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương phải bằng nhau.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Chèn hoặc cập nhật dữ liệu vào bảng GIAOVIEN nếu điều kiện được thỏa mãn
    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA)
        SELECT MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA
        FROM inserted;
    END

    IF EXISTS (SELECT 1 FROM deleted)
    BEGIN
        DELETE FROM GIAOVIEN
        WHERE MAGV IN (SELECT MAGV FROM deleted);
    END
END;
GO

--  20.	Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5.
CREATE TRIGGER CheckInsertConditionsOnKETQUATHI
ON KETQUATHI
INSTEAD OF INSERT
AS
BEGIN
 
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.LANTHI > 1
        AND EXISTS (
            SELECT 1
            FROM KETQUATHI k
            WHERE k.MAHV = i.MAHV
            AND k.MAMH = i.MAMH
            AND k.LANTHI = i.LANTHI - 1
            AND k.DIEM >= 5
        )
    )
    BEGIN
        RAISERROR ('Học viên chỉ được thi lại khi điểm của lần thi trước đó dưới 5.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Chèn dữ liệu vào bảng KETQUATHI nếu điều kiện được thỏa mãn
    INSERT INTO KETQUATHI (MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA)
    SELECT MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA
    FROM inserted;
END;
GO
-- xoá TRIGGER CheckInsertConditionsOnKETQUATHI
DROP TRIGGER IF EXISTS CheckInsertConditionsOnKETQUATHI;
GO

-- tạo lại TRIGGER CheckInsertConditionsOnKETQUATHI:
CREATE TRIGGER CheckInsertConditionsOnKETQUATHI
ON KETQUATHI
INSTEAD OF INSERT
AS
BEGIN
    -- 22. Học viên chỉ được thi môn mà lớp đã học xong
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN HOCVIEN h ON i.MAHV = h.MAHV
        JOIN GIANGDAY g ON h.MALOP = g.MALOP AND i.MAMH = g.MAMH
        WHERE i.NGTHI < g.DENNGAY
    )
    BEGIN
        RAISERROR ('Học viên chỉ được thi một môn học khi lớp của học viên đã học xong môn học này.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- 21. Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN KETQUATHI k ON i.MAHV = k.MAHV AND i.MAMH = k.MAMH AND i.LANTHI = k.LANTHI + 1
        WHERE i.NGTHI <= k.NGTHI
    )
    BEGIN
        RAISERROR ('Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Chèn dữ liệu vào bảng KETQUATHI nếu tất cả các điều kiện được thỏa mãn
    INSERT INTO KETQUATHI (MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA)
    SELECT MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA
    FROM inserted;
END;
GO


CREATE TRIGGER CheckTeachingAssignments
ON GIANGDAY
INSTEAD OF INSERT
AS
BEGIN
    -- 23. Xét thứ tự trước sau giữa các môn học
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN DIEUKIEN dk ON i.MAMH = dk.MAMH
        WHERE NOT EXISTS (
            SELECT 1
            FROM GIANGDAY g
            WHERE g.MAMH = dk.MAMH_TRUOC
              AND g.MALOP = i.MALOP
              AND g.DENNGAY < i.TUNGAY
        )
    )
    BEGIN
        RAISERROR ('Môn học phải được học sau khi hoàn thành các môn học trước.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- 24. Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN GIAOVIEN gv ON i.MAGV = gv.MAGV
        JOIN MONHOC mh ON i.MAMH = mh.MAMH
        WHERE gv.MAKHOA <> mh.MAKHOA
    )
    BEGIN
        RAISERROR ('Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Chèn dữ liệu vào bảng GIANGDAY nếu tất cả các điều kiện được thỏa mãn
    INSERT INTO GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY)
    SELECT MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY
    FROM inserted;
END;
GO

-- II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language)
--1 
UPDATE GIAOVIEN
SET HESO = HESO + 0.2
WHERE MAGV IN (
    SELECT TRGKHOA
    FROM KHOA
);


--2 
-- Tính toán điểm trung bình cho mỗi học viên
WITH LastExam AS (
    SELECT 
        MAHV, 
        MAMH, 
        MAX(LANTHI) AS LastLanthhi
    FROM 
        KETQUATHI
    GROUP BY 
        MAHV, MAMH
),
FinalScores AS (
    SELECT 
        k.MAHV, 
        k.MAMH, 
        k.DIEM
    FROM 
        KETQUATHI k
    INNER JOIN 
        LastExam l ON k.MAHV = l.MAHV AND k.MAMH = l.MAMH AND k.LANTHI = l.LastLanthhi
)
UPDATE HOCVIEN
SET DIEMTB = (
    SELECT AVG(f.DIEM)
    FROM FinalScores f
    WHERE f.MAHV = HOCVIEN.MAHV
);

-- 3.	Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất kỳ thi lần thứ 3 dưới 5 điểm.
UPDATE HOCVIEN
SET GHICHU = 'Cam thi'
WHERE MAHV IN (
    SELECT MAHV
    FROM KETQUATHI
    WHERE LANTHI = 3 AND DIEM < 5
);

-- 4.	Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau:
--Nếu DIEMTB  9 thì XEPLOAI =”XS”
--Nếu  8  DIEMTB < 9 thì XEPLOAI = “G”
--Nếu  6.5  DIEMTB < 8 thì XEPLOAI = “K”
--Nếu  5    DIEMTB < 6.5 thì XEPLOAI = “TB”
--Nếu  DIEMTB < 5 thì XEPLOAI = ”Y”
 
UPDATE HOCVIEN
SET XEPLOAI = CASE 
    WHEN DIEMTB >= 9 THEN 'XS'
    WHEN DIEMTB >= 8 AND DIEMTB < 9 THEN 'G'
    WHEN DIEMTB >= 6.5 AND DIEMTB < 8 THEN 'K'
    WHEN DIEMTB >= 5 AND DIEMTB < 6.5 THEN 'TB'
    ELSE 'Y'
END;

-- III. Ngôn ngữ truy vấn dữ liệu
-- 1. In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.
SELECT MAHV, HO + ' ' + TEN AS HOTEN, NGSINH, MALOP
FROM HOCVIEN
WHERE MAHV IN (SELECT TRGLOP FROM LOP);

-- 2. In ra bảng điểm khi thi (mã học viên, họ tên, lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp theo tên, họ học viên.
SELECT k.MAHV, h.HO + ' ' + h.TEN AS HOTEN, k.LANTHI, k.DIEM
FROM KETQUATHI k
JOIN HOCVIEN h ON k.MAHV = h.MAHV
WHERE k.MAMH = 'CTRR' AND h.MALOP = 'K12'
ORDER BY h.TEN, h.HO;

-- 3. In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ nhất đã đạt.
SELECT k.MAHV, h.HO + ' ' + h.TEN AS HOTEN, k.MAMH
FROM KETQUATHI k
JOIN HOCVIEN h ON k.MAHV = h.MAHV
WHERE k.LANTHI = 1 AND k.DIEM >= 5;

-- 4. In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).
SELECT k.MAHV, h.HO + ' ' + h.TEN AS HOTEN
FROM KETQUATHI k
JOIN HOCVIEN h ON k.MAHV = h.MAHV
WHERE k.MAMH = 'CTRR' AND h.MALOP = 'K11' AND k.LANTHI = 1 AND k.DIEM < 5;

-- 5. Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần thi).
SELECT DISTINCT k.MAHV, h.HO + ' ' + h.TEN AS HOTEN
FROM KETQUATHI k
JOIN HOCVIEN h ON k.MAHV = h.MAHV
WHERE k.MAMH = 'CTRR' AND h.MALOP LIKE 'K%' AND k.DIEM < 5
GROUP BY k.MAHV, h.HO, h.TEN
HAVING COUNT(DISTINCT k.LANTHI) = (
    SELECT COUNT(DISTINCT LANTHI) 
    FROM KETQUATHI 
    WHERE MAMH = 'CTRR' AND DIEM < 5
);

-- 6. Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.
SELECT DISTINCT mh.TENMH
FROM GIANGDAY gd
JOIN MONHOC mh ON gd.MAMH = mh.MAMH
JOIN GIAOVIEN gv ON gd.MAGV = gv.MAGV
WHERE gv.HOTEN = 'Tran Tam Thanh' AND gd.HOCKY = 1 AND gd.NAM = 2006;

-- 7. Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học kỳ 1 năm 2006.
SELECT DISTINCT mh.MAMH, mh.TENMH
FROM GIANGDAY gd
JOIN MONHOC mh ON gd.MAMH = mh.MAMH
JOIN LOP l ON gd.MALOP = l.MALOP
WHERE l.MALOP = 'K11' AND l.MAGVCN = gd.MAGV AND gd.HOCKY = 1 AND gd.NAM = 2006;

-- 8. Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”.
SELECT DISTINCT h.HO + ' ' + h.TEN AS HOTEN
FROM LOP l
JOIN HOCVIEN h ON l.TRGLOP = h.MAHV
JOIN GIANGDAY gd ON l.MALOP = gd.MALOP
JOIN GIAOVIEN gv ON gd.MAGV = gv.MAGV
WHERE gv.HOTEN = 'Nguyen To Lan' AND gd.MAMH = 'CSDL';

-- 9. In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du Lieu”.
SELECT dk.MAMH_TRUOC, mh.TENMH
FROM DIEUKIEN dk
JOIN MONHOC mh ON dk.MAMH_TRUOC = mh.MAMH
WHERE dk.MAMH = 'CSDL';

-- 10. Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên môn học) nào.
SELECT dk.MAMH, mh.TENMH
FROM DIEUKIEN dk
JOIN MONHOC mh ON dk.MAMH = mh.MAMH
WHERE dk.MAMH_TRUOC = 'CTRR';

-- 11. Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
SELECT DISTINCT gv.HOTEN
FROM GIANGDAY gd1
JOIN GIANGDAY gd2 ON gd1.MAGV = gd2.MAGV AND gd1.MAMH = gd2.MAMH AND gd1.HOCKY = gd2.HOCKY AND gd1.NAM = gd2.NAM
JOIN GIAOVIEN gv ON gd1.MAGV = gv.MAGV
WHERE gd1.MAMH = 'CTRR' AND gd1.HOCKY = 1 AND gd1.NAM = 2006 AND gd1.MALOP = 'K11' AND gd2.MALOP = 'K12';

-- 12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi lại môn này.
SELECT k.MAHV, h.HO + ' ' + h.TEN AS HOTEN
FROM KETQUATHI k
JOIN HOCVIEN h ON k.MAHV = h.MAHV
WHERE k.MAMH = 'CSDL' AND k.LANTHI = 1 AND k.DIEM < 5
AND NOT EXISTS (
    SELECT 1
    FROM KETQUATHI k2
    WHERE k2.MAHV = k.MAHV AND k2.MAMH = 'CSDL' AND k2.LANTHI > 1
);

-- 13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
SELECT gv.MAGV, gv.HOTEN
FROM GIAOVIEN gv
LEFT JOIN GIANGDAY gd ON gv.MAGV = gd.MAGV
WHERE gd.MAGV IS NULL;

-- 14. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.
SELECT gv.MAGV, gv.HOTEN
FROM GIAOVIEN gv
WHERE NOT EXISTS (
    SELECT 1
    FROM GIANGDAY gd
    JOIN MONHOC mh ON gd.MAMH = mh.MAMH
    WHERE gd.MAGV = gv.MAGV AND mh.MAKHOA = gv.MAKHOA
);

-- 15. Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm.
SELECT DISTINCT h.HO + ' ' + h.TEN AS HOTEN
FROM HOCVIEN h
JOIN KETQUATHI k ON h.MAHV = k.MAHV
WHERE h.MALOP = 'K11' AND (
    (SELECT COUNT(*) FROM KETQUATHI WHERE MAHV = h.MAHV AND MAMH = k.MAMH AND DIEM < 5) > 3
    OR (k.MAMH = 'CTRR' AND k.LANTHI = 2 AND k.DIEM = 5)
);

-- 16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.
SELECT gv.HOTEN
FROM GIANGDAY gd
JOIN GIAOVIEN gv ON gd.MAGV = gv.MAGV
WHERE gd.MAMH = 'CTRR'
GROUP BY gv.HOTEN, gd.HOCKY, gd.NAM
HAVING COUNT(DISTINCT gd.MALOP) >= 2;

-- 17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
WITH LastExam AS (
    SELECT MAHV, MAMH, MAX(LANTHI) AS LastLanthhi
    FROM KETQUATHI
    WHERE MAMH = 'CSDL'
    GROUP BY MAHV, MAMH
)
SELECT k.MAHV, h.HO + ' ' + h.TEN AS HOTEN, k.DIEM
FROM KETQUATHI k
JOIN LastExam l ON k.MAHV = l.MAHV AND k.MAMH = l.MAMH AND k.LANTHI = l.LastLanthhi
JOIN HOCVIEN h ON k.MAHV = h.MAHV;

-- 18. Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).
SELECT k.MAHV, h.HO + ' ' + h.TEN AS HOTEN, MAX(k.DIEM) AS DIEM
FROM KETQUATHI k
JOIN HOCVIEN h ON k.MAHV = h.MAHV
WHERE k.MAMH = 'CSDL'
GROUP BY k.MAHV, h.HO, h.TEN;

-- 19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
SELECT MAKHOA, TENKHOA
FROM KHOA
WHERE NGTLAP = (SELECT MIN(NGTLAP) FROM KHOA);

-- 20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
SELECT COUNT(*) AS SoLuongGiaoVien
FROM GIAOVIEN
WHERE HOCHAM IN ('GS', 'PGS');

-- 21. Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
SELECT MAKHOA, HOCVI, COUNT(*) AS SoLuongGiaoVien
FROM GIAOVIEN
WHERE HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'PTS')
GROUP BY MAKHOA, HOCVI;

-- 22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
SELECT MAMH, KQUA, COUNT(*) AS SoLuongHocVien
FROM KETQUATHI
GROUP BY MAMH, KQUA;

-- 23. Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học.
SELECT DISTINCT gv.MAGV, gv.HOTEN
FROM GIAOVIEN gv
JOIN LOP l ON gv.MAGV = l.MAGVCN
JOIN GIANGDAY gd ON gv.MAGV = gd.MAGV AND l.MALOP = gd.MALOP;

-- 24. Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
SELECT h.HO + ' ' + h.TEN AS HOTEN
FROM LOP l
JOIN HOCVIEN h ON l.TRGLOP = h.MAHV
WHERE l.SISO = (SELECT MAX(SISO) FROM LOP);

-- 25. Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần thi).
SELECT h.HO + ' ' + h.TEN AS HOTEN
FROM HOCVIEN h
WHERE h.MAHV IN (
    SELECT l.TRGLOP
    FROM LOP l
    JOIN KETQUATHI k ON l.TRGLOP = k.MAHV
    WHERE k.DIEM < 5
    GROUP BY l.TRGLOP, k.MAMH
    HAVING COUNT(DISTINCT k.LANTHI) >= 3
);

-- 26. Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT TOP 1 k.MAHV, h.HO + ' ' + h.TEN AS HOTEN, COUNT(*) AS SoMonDiem910
FROM KETQUATHI k
JOIN HOCVIEN h ON k.MAHV = h.MAHV
WHERE k.DIEM IN (9, 10)
GROUP BY k.MAHV, h.HO, h.TEN
ORDER BY SoMonDiem910 DESC;

-- 27. Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT MALOP, MAHV, HOTEN, MAX(SoMonDiem910) AS SoMonDiem910
FROM (
    SELECT h.MALOP, k.MAHV, h.HO + ' ' + h.TEN AS HOTEN, COUNT(*) AS SoMonDiem910
    FROM KETQUATHI k
    JOIN HOCVIEN h ON k.MAHV = h.MAHV
    WHERE k.DIEM IN (9, 10)
    GROUP BY h.MALOP, k.MAHV, h.HO, h.TEN
) AS Subquery
GROUP BY MALOP, MAHV, HOTEN;

-- 28. Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
SELECT gd.MAGV, gv.HOTEN, gd.HOCKY, gd.NAM, COUNT(DISTINCT gd.MAMH) AS SoMonHoc, COUNT(DISTINCT gd.MALOP) AS SoLopHoc
FROM GIANGDAY gd
JOIN GIAOVIEN gv ON gd.MAGV = gv.MAGV
GROUP BY gd.MAGV, gv.HOTEN, gd.HOCKY, gd.NAM;

-- 29. Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.
SELECT MAGV, HOTEN, HOCKY, NAM, MAX(SoLopHoc) AS SoLopHoc
FROM (
    SELECT gd.MAGV, gv.HOTEN, gd.HOCKY, gd.NAM, COUNT(DISTINCT gd.MALOP) AS SoLopHoc
    FROM GIANGDAY gd
    JOIN GIAOVIEN gv ON gd.MAGV = gv.MAGV
    GROUP BY gd.MAGV, gv.HOTEN, gd.HOCKY, gd.NAM
) AS Subquery
GROUP BY MAGV, HOTEN, HOCKY, NAM;

-- 30. Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
SELECT TOP 1 k.MAMH, mh.TENMH, COUNT(*) AS SoHocVienKhongDat
FROM KETQUATHI k
JOIN MONHOC mh ON k.MAMH = mh.MAMH
WHERE k.LANTHI = 1 AND k.DIEM < 5
GROUP BY k.MAMH, mh.TENMH
ORDER BY SoHocVienKhongDat DESC;

-- 31. Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).
SELECT k.MAHV, h.HO + ' ' + h.TEN AS HOTEN
FROM KETQUATHI k
JOIN HOCVIEN h ON k.MAHV = h.MAHV
WHERE k.LANTHI = 1
GROUP BY k.MAHV, h.HO, h.TEN
HAVING MIN(k.DIEM) >= 5;

-- 32. Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
WITH LastExam AS (
    SELECT MAHV, MAMH, MAX(LANTHI) AS LastLanthhi
    FROM KETQUATHI
    GROUP BY MAHV, MAMH
)
SELECT k.MAHV, h.HO + ' ' + h.TEN AS HOTEN
FROM KETQUATHI k
JOIN LastExam l ON k.MAHV = l.MAHV AND k.MAMH = l.MAMH AND k.LANTHI = l.LastLanthhi
JOIN HOCVIEN h ON k.MAHV = h.MAHV
GROUP BY k.MAHV, h.HO, h.TEN
HAVING MIN(k.DIEM) >= 5;

-- 33. Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1).
SELECT k.MAHV, h.HO + ' ' + h.TEN AS HOTEN
FROM KETQUATHI k
JOIN HOCVIEN h ON k.MAHV = h.MAHV
WHERE k.LANTHI = 1
GROUP BY k.MAHV, h.HO, h.TEN
HAVING COUNT(CASE WHEN k.DIEM >= 5 THEN 1 END) = COUNT(*);

-- 34. Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi sau cùng).
WITH LastExam AS (
    SELECT MAHV, MAMH, MAX(LANTHI) AS LastLanthhi
    FROM KETQUATHI
    GROUP BY MAHV, MAMH
)
SELECT k.MAHV, h.HO + ' ' + h.TEN AS HOTEN
FROM KETQUATHI k
JOIN LastExam l ON k.MAHV = l.MAHV AND k.MAMH = l.MAMH AND k.LANTHI = l.LastLanthhi
JOIN HOCVIEN h ON k.MAHV = h.MAHV
GROUP BY k.MAHV, h.HO, h.TEN
HAVING COUNT(CASE WHEN k.DIEM >= 5 THEN 1 END) = COUNT(*);

-- 35. Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau cùng).
WITH LastExam AS (
    SELECT MAHV, MAMH, MAX(LANTHI) AS LastLanthhi
    FROM KETQUATHI
    GROUP BY MAHV, MAMH
),
MaxScores AS (
    SELECT k.MAHV, k.MAMH, MAX(k.DIEM) AS MaxDiem
    FROM KETQUATHI k
    JOIN LastExam l ON k.MAHV = l.MAHV AND k.MAMH = l.MAMH AND k.LANTHI = l.LastLanthhi
    GROUP BY k.MAHV, k.MAMH
)
SELECT k.MAHV, h.HO + ' ' + h.TEN AS HOTEN, k.MAMH, k.DIEM
FROM KETQUATHI k
JOIN MaxScores m ON k.MAHV = m.MAHV AND k.MAMH = m.MAMH AND k.DIEM = m.MaxDiem
JOIN HOCVIEN h ON k.MAHV = h.MAHV;






