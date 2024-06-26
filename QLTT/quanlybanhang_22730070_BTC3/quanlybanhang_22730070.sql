-- Tạo bảng Khách Hàng
CREATE TABLE KHACHHANG (
    MAKH CHAR(4) PRIMARY KEY,
    HOTEN VARCHAR(40),
    DCHI VARCHAR(50),
    SODT VARCHAR(20),
    NGSINH SMALLDATETIME,
    NGDK SMALLDATETIME,
    DOANHSO MONEY
);

-- Tạo bảng Nhân Viên
CREATE TABLE NHANVIEN (
    MANV CHAR(4) PRIMARY KEY,
    HOTEN VARCHAR(40),
    SODT VARCHAR(20),
    NGVL SMALLDATETIME
);

-- Tạo bảng Sản Phẩm
CREATE TABLE SANPHAM (
    MASP CHAR(4) PRIMARY KEY,
    TENSP VARCHAR(40),
    DVT VARCHAR(20),
    NUOCSX VARCHAR(40),
    GIA MONEY
);

-- Tạo bảng Hóa Đơn
CREATE TABLE HOADON (
    SOHD INT PRIMARY KEY,
    NGHD SMALLDATETIME,
    MAKH CHAR(4),
    MANV CHAR(4),
    TRIGIA MONEY,
    FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH),
    FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
);

-- Tạo bảng Chi Tiết Hóa Đơn
CREATE TABLE CTHD (
    SOHD INT,
    MASP CHAR(4),
    SL INT,
    PRIMARY KEY (SOHD, MASP),
    FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
);
-- Thêm dữ liệu vào bảng NHANVIEN
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES
('NV01', 'Nguyen Nhu Nhut', '0927345678', '2006-04-13'),
('NV02', 'Le Thi Phi Yen', '0987567390', '2006-04-21'),
('NV03', 'Nguyen Van B', '0997047382', '2006-04-27'),
('NV04', 'Ngo Thanh Tuan', '0913758498', '2006-06-24'),
('NV05', 'Nguyen Thi Truc Thanh', '0918590387', '2006-07-20');

-- Thêm dữ liệu vào bảng KHACHHANG
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES
('KH01', 'Nguyen Van A', '731 Tran Hung Dao, Q5, TpHCM', '08823451', '1960-10-22', 13060000, '2006-07-22'),
('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '1974-04-03', 280000, '2006-07-30'),
('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', '1980-06-12', 3860000, '2006-08-05'),
('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q10, TpHCM', '0917325476', '1965-03-09', 250000, '2006-10-02'),
('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '08246108', '1950-03-10', 21000, '2006-10-28'),
('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738', '1981-12-31', 915000, '2006-11-24'),
('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565', '1971-04-06', 12500, '2006-12-01'),
('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '0938435756', '1971-01-10', 365000, '2006-12-13'),
('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM', '08654763', '1979-09-03', 70000, '2007-01-14'),
('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TpHCM', '08768904', '1983-05-02', 67500, '2007-01-16');

-- Thêm dữ liệu vào bảng SANPHAM
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES
('BC01', 'But chi', 'cay', 'Singapore', 3000),
('BC02', 'But chi', 'cay', 'Singapore', 5000),
('BC03', 'But chi', 'cay', 'Viet Nam', 3500),
('BC04', 'But chi', 'hop', 'Viet Nam', 30000),
('BB01', 'But bi', 'cay', 'Viet Nam', 5000),
('BB02', 'But bi', 'cay', 'Trung Quoc', 7000),
('BB03', 'But bi', 'hop', 'Thai Lan', 100000),
('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', 2500),
('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', 4500),
('TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', 3000),
('TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', 5500),
('TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', 23000),
('TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', 53000),
('TV07', 'Tap 100 trang', 'chuc', 'Trung Quoc', 34000),
('ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', 40000),
('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', 55000),
('ST03', 'So tay loai 2', 'quyen', 'Viet Nam', 51000),
('ST04', 'So tay', 'quyen', 'Thai Lan', 55000),
('ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000),
('ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000),
('ST07', 'Phan khong bui', 'hop', 'Viet Nam', 7000),
('ST08', 'Bong bang', 'cai', 'Viet Nam', 1000),
('ST09', 'But long', 'cay', 'Viet Nam', 5000),
('ST10', 'But long', 'cay', 'Trung Quoc', 7000);

-- Thêm dữ liệu vào bảng HOADON
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES
(1001, '2006-07-23', 'KH01', 'NV01', 320000),
(1002, '2006-08-12', 'KH01', 'NV02', 840000),
(1003, '2006-08-23', 'KH02', 'NV01', 100000),
(1004, '2006-09-01', 'KH02', 'NV01', 180000),
(1005, '2006-10-20', 'KH01', 'NV02', 3800000),
(1006, '2006-10-16', 'KH01', 'NV03', 2430000),
(1007, '2006-10-28', 'KH03', 'NV03', 510000),
(1008, '2006-10-28', 'KH01', 'NV03', 440000),
(1009, '2006-10-28', 'KH03', 'NV04', 200000),
(1010, '2006-11-01', 'KH01', 'NV01', 5200000),
(1011, '2006-11-04', 'KH04', 'NV03', 250000),
(1012, '2006-11-30', 'KH05', 'NV03', 21000),
(1013, '2006-12-12', 'KH06', 'NV01', 5000),
(1014, '2006-12-31', 'KH03', 'NV02', 3150000),
(1015, '2007-01-01', 'KH06', 'NV01', 910000),
(1016, '2007-01-01', 'KH07', 'NV02', 12500),
(1017, '2007-01-02', 'KH08', 'NV03', 35000),
(1018, '2007-01-13', 'KH08', 'NV03', 330000),
(1019, '2007-01-13', 'KH01', 'NV03', 30000),
(1020, '2007-01-14', 'KH09', 'NV04', 70000),
(1021, '2007-01-16', 'KH10', 'NV03', 67500),
(1022, '2007-01-16', NULL, 'NV03', 7000),
(1023, '2007-01-17', NULL, 'NV01', 330000);

-- Thêm dữ liệu vào bảng CTHD
INSERT INTO CTHD (SOHD, MASP, SL) VALUES
(1001, 'TV02', 10),
(1001, 'ST01', 5),
(1001, 'BC01', 5),
(1001, 'BC02', 10),
(1001, 'ST08', 10),
(1002, 'BC04', 20),
(1002, 'BB01', 20),
(1002, 'BB02', 20),
(1003, 'BB03', 10),
(1004, 'TV01', 20),
(1004, 'TV02', 10),
(1004, 'TV03', 10),
(1004, 'TV04', 10),
(1005, 'TV05', 50),
(1005, 'TV06', 50),
(1006, 'TV07', 20),
(1006, 'ST01', 30),
(1006, 'ST02', 10),
(1007, 'ST03', 10),
(1008, 'ST04', 8),
(1009, 'ST05', 10),
(1010, 'TV07', 50),
(1010, 'ST07', 50),
(1010, 'ST08', 100),
(1010, 'ST04', 50),
(1010, 'TV03', 100),
(1011, 'ST06', 50),
(1012, 'ST07', 3),
(1013, 'ST08', 5),
(1014, 'BC02', 80),
(1014, 'BB02', 100),
(1014, 'BC04', 60),
(1014, 'BB01', 50),
(1015, 'BB02', 30),
(1015, 'BB03', 7),
(1016, 'TV01', 5),
(1017, 'TV02', 1),
(1017, 'TV03', 1),
(1017, 'TV04', 5),
(1018, 'ST04', 6),
(1019, 'ST05', 1),
(1019, 'ST06', 2),
(1020, 'ST07', 10),
(1021, 'ST08', 5),
(1021, 'TV01', 7),
(1021, 'TV02', 10),
(1022, 'ST07', 1),
(1023, 'ST04', 6);

-- I. Ngôn ngữ định nghĩa dữ liệu (Data Definition Language):
-- 2. Thêm thuộc tính GHICHU vào bảng SANPHAM
ALTER TABLE SANPHAM ADD GHICHU VARCHAR(20);

-- 3. Thêm thuộc tính LOAIKH vào bảng KHACHHANG
ALTER TABLE KHACHHANG ADD LOAIKH TINYINT;

-- 4. Thay đổi kiểu dữ liệu của thuộc tính GHICHU trong bảng SANPHAM
ALTER TABLE SANPHAM ALTER COLUMN GHICHU VARCHAR(100);

-- 5. Xóa thuộc tính GHICHU khỏi bảng SANPHAM
ALTER TABLE SANPHAM DROP COLUMN GHICHU;

-- 6. Tạo bảng mới để lưu các loại khách hàng và sửa đổi bảng KHACHHANG để sử dụng khóa ngoại
CREATE TABLE LOAIKH (
    LOAIKH_ID TINYINT PRIMARY KEY,
    Description VARCHAR(50)
);
INSERT INTO LOAIKH VALUES (1, 'Vang lai'), (2, 'Thuong xuyen'), (3, 'VIP');
ALTER TABLE KHACHHANG ADD CONSTRAINT FK_LOAIKH FOREIGN KEY (LOAIKH) REFERENCES LOAIKH(LOAIKH_ID);

-- 7. Đặt ràng buộc cho thuộc tính DVT trong bảng SANPHAM chỉ chấp nhận các giá trị nhất định
ALTER TABLE SANPHAM ADD CONSTRAINT CHK_DVT CHECK (DVT IN ('cay', 'hop', 'cai', 'quyen', 'chuc'));

-- 8. Ràng buộc giá sản phẩm phải từ 500 đồng trở lên
ALTER TABLE SANPHAM ADD CONSTRAINT CHK_GIA_MIN CHECK (GIA >= 500);

-- 9. Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.
GO
CREATE TRIGGER trg_EnsureAtLeastOneProduct
ON HOADON
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE NOT EXISTS (SELECT 1 FROM CTHD WHERE CTHD.SOHD = inserted.SOHD))
    BEGIN
        RAISERROR ('Mỗi hóa đơn phải có ít nhất một chi tiết hóa đơn.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- 10. Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó.
GO
CREATE TRIGGER trg_CheckNgayDK
ON KHACHHANG
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE NGDK <= NGSINH)
    BEGIN
        RAISERROR ('Ngày đăng ký phải lớn hơn ngày sinh.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- 11. Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày khách hàng đó đăng ký thành viên (NGDK).
GO
CREATE TRIGGER trg_CheckNgayMuaHang
ON HOADON
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted i JOIN KHACHHANG k ON i.MAKH = k.MAKH WHERE i.NGHD < k.NGDK)
    BEGIN
        RAISERROR ('Ngày mua hàng phải lớn hơn hoặc bằng ngày đăng ký thành viên.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- 12. Ngày bán hàng (NGHD) của một nhân viên phải lớn hơn hoặc bằng ngày nhân viên đó vào làm.
GO
CREATE TRIGGER trg_CheckNgayBanHang
ON HOADON
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted i JOIN NHANVIEN n ON i.MANV = n.MANV WHERE i.NGHD < n.NGVL)
    BEGIN
        RAISERROR ('Ngày bán hàng phải lớn hơn hoặc bằng ngày vào làm của nhân viên.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- 13. Mỗi một hóa đơn phải có ít nhất một chi tiết hóa đơn.
-- (Đã được thực hiện ở trigger trg_EnsureAtLeastOneProduct)

-- 14. Trị giá của một hóa đơn là tổng thành tiền (số lượng * đơn giá) của các chi tiết thuộc hóa đơn đó.
GO
CREATE TRIGGER trg_UpdateTriGia
ON CTHD
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE HOADON
    SET TRIGIA = (SELECT SUM(SL * GIA) FROM CTHD c JOIN SANPHAM s ON c.MASP = s.MASP WHERE c.SOHD = HOADON.SOHD)
    WHERE SOHD IN (SELECT DISTINCT SOHD FROM inserted UNION SELECT DISTINCT SOHD FROM deleted);
END;
GO

-- 15. Doanh số của một khách hàng là tổng trị giá các hóa đơn mà khách hàng thành viên đó đã mua.
GO
CREATE TRIGGER trg_UpdateDoanhSo
ON HOADON
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE KHACHHANG
    SET DOANHSO = (SELECT SUM(TRIGIA) FROM HOADON WHERE MAKH = KHACHHANG.MAKH)
    WHERE MAKH IN (SELECT DISTINCT MAKH FROM inserted UNION SELECT DISTINCT MAKH FROM deleted);
END;
GO

-- II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language)
-- 2. Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM
SELECT * INTO SANPHAM1 FROM SANPHAM;

-- Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG
SELECT * INTO KHACHHANG1 FROM KHACHHANG;

-- 3. Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)
UPDATE SANPHAM1
SET GIA = GIA * 1.05
WHERE NUOCSX = 'Thai Lan';

-- 4. Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1)
UPDATE SANPHAM1
SET GIA = GIA * 0.95
WHERE NUOCSX = 'Trung Quoc' AND GIA <= 10000;

-- 5. Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 
-- có doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1)
UPDATE KHACHHANG1
SET LOAIKH = (SELECT LOAIKH_ID FROM LOAIKH WHERE Description = 'VIP')
WHERE (NGDK < '2007-01-01' AND DOANHSO >= 10000000) 
   OR (NGDK >= '2007-01-01' AND DOANHSO >= 2000000);

-- III. Ngôn ngữ truy vấn dữ liệu có cấu trúc
-- 1. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc';

-- 2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE DVT IN ('cay', 'quyen');

-- 3. In ra danh sách các sản phẩm (MASP, TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP LIKE 'B%01';

-- 4. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' AND GIA BETWEEN 30000 AND 40000;

-- 5. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE (NUOCSX = 'Trung Quoc' OR NUOCSX = 'Thai Lan') AND GIA BETWEEN 30000 AND 40000;

-- 6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD IN ('2007-01-01', '2007-01-02');

-- 7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD BETWEEN '2007-01-01' AND '2007-01-31'
ORDER BY NGHD ASC, TRIGIA DESC;

-- 8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT DISTINCT KHACHHANG.MAKH, KHACHHANG.HOTEN
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.MAKH = HOADON.MAKH
WHERE HOADON.NGHD = '2007-01-01';

-- 9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SELECT HOADON.SOHD, HOADON.TRIGIA
FROM HOADON
JOIN NHANVIEN ON HOADON.MANV = NHANVIEN.MANV
WHERE NHANVIEN.HOTEN = 'Nguyen Van B' AND HOADON.NGHD = '2006-10-28';

-- 10. In ra danh sách các sản phẩm (MASP, TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT DISTINCT SANPHAM.MASP, SANPHAM.TENSP
FROM SANPHAM
JOIN CTHD ON SANPHAM.MASP = CTHD.MASP
JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
JOIN KHACHHANG ON HOADON.MAKH = KHACHHANG.MAKH
WHERE KHACHHANG.HOTEN = 'Nguyen Van A' AND HOADON.NGHD BETWEEN '2006-10-01' AND '2006-10-31';

-- 11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02');

-- 12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02') AND SL BETWEEN 10 AND 20;

-- 13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT SOHD
FROM CTHD
WHERE MASP = 'BB01' AND SL BETWEEN 10 AND 20
INTERSECT
SELECT SOHD
FROM CTHD
WHERE MASP = 'BB02' AND SL BETWEEN 10 AND 20;

-- 14. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
SELECT DISTINCT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
UNION
SELECT DISTINCT SANPHAM.MASP, SANPHAM.TENSP
FROM SANPHAM
JOIN CTHD ON SANPHAM.MASP = CTHD.MASP
JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
WHERE HOADON.NGHD = '2007-01-01';

-- 15. In ra danh sách các sản phẩm (MASP, TENSP) không bán được.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP NOT IN (SELECT MASP FROM CTHD);

-- 16. In ra danh sách các sản phẩm (MASP, TENSP) không bán được trong năm 2006.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP NOT IN (
    SELECT MASP
    FROM CTHD
    JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
    WHERE YEAR(HOADON.NGHD) = 2006
);

-- 17. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' AND MASP NOT IN (
    SELECT MASP
    FROM CTHD
    JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
    WHERE YEAR(HOADON.NGHD) = 2006
);

-- 18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
SELECT SOHD
FROM HOADON
WHERE NOT EXISTS (
    SELECT MASP
    FROM SANPHAM
    WHERE NUOCSX = 'Singapore'
    EXCEPT
    SELECT MASP
    FROM CTHD
    WHERE CTHD.SOHD = HOADON.SOHD
);

-- 19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
SELECT SOHD
FROM HOADON
WHERE YEAR(NGHD) = 2006 AND NOT EXISTS (
    SELECT MASP
    FROM SANPHAM
    WHERE NUOCSX = 'Singapore'
    EXCEPT
    SELECT MASP
    FROM CTHD
    WHERE CTHD.SOHD = HOADON.SOHD
);

-- 20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*)
FROM HOADON
WHERE MAKH IS NULL;

-- 21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT MASP)
FROM CTHD
JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
WHERE YEAR(HOADON.NGHD) = 2006;

-- 22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu?
SELECT MAX(TRIGIA) AS MaxTriGia, MIN(TRIGIA) AS MinTriGia
FROM HOADON;

-- 23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(TRIGIA) AS AvgTriGia
FROM HOADON
WHERE YEAR(NGHD) = 2006;

-- 24. Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA) AS TotalRevenue
FROM HOADON
WHERE YEAR(NGHD) = 2006;

-- 25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT TOP 1 SOHD
FROM HOADON
WHERE YEAR(NGHD) = 2006
ORDER BY TRIGIA DESC;

-- 26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT KHACHHANG.HOTEN
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.MAKH = HOADON.MAKH
WHERE HOADON.SOHD = (
    SELECT TOP 1 SOHD
    FROM HOADON
    WHERE YEAR(NGHD) = 2006
    ORDER BY TRIGIA DESC
);

-- 27. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC;

-- 28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN (
    SELECT DISTINCT TOP 3 GIA
    FROM SANPHAM
    ORDER BY GIA DESC
);

-- 29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Thai Lan' AND GIA IN (
    SELECT DISTINCT TOP 3 GIA
    FROM SANPHAM
    ORDER BY GIA DESC
);

-- 30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' AND GIA IN (
    SELECT DISTINCT TOP 3 GIA
    FROM SANPHAM
    WHERE NUOCSX = 'Trung Quoc'
    ORDER BY GIA DESC
);

-- 31. In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
SELECT MAKH, HOTEN, DOANHSO, 
       RANK() OVER (ORDER BY DOANHSO DESC) AS Rank
FROM KHACHHANG
ORDER BY Rank;

-- 32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT COUNT(*) AS TotalProducts
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc';

-- 33. Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(*) AS TotalProducts
FROM SANPHAM
GROUP BY NUOCSX;

-- 34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT NUOCSX, MAX(GIA) AS MaxPrice, MIN(GIA) AS MinPrice, AVG(GIA) AS AvgPrice
FROM SANPHAM
GROUP BY NUOCSX;

-- 35. Tính doanh thu bán hàng mỗi ngày.
SELECT NGHD, SUM(TRIGIA) AS DailyRevenue
FROM HOADON
GROUP BY NGHD;

-- 36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT CTHD.MASP, SUM(CTHD.SL) AS TotalQuantity
FROM CTHD
JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
WHERE NGHD BETWEEN '2006-10-01' AND '2006-10-31'
GROUP BY CTHD.MASP;

-- 37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD) AS Month, SUM(TRIGIA) AS MonthlyRevenue
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD);

-- 38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT SOHD
FROM CTHD
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP) >= 4;

-- 39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT SOHD
FROM CTHD
JOIN SANPHAM ON CTHD.MASP = SANPHAM.MASP
WHERE SANPHAM.NUOCSX = 'Viet Nam'
GROUP BY SOHD
HAVING COUNT(DISTINCT CTHD.MASP) = 3;

-- 40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT TOP 1 KHACHHANG.MAKH, KHACHHANG.HOTEN
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.MAKH = HOADON.MAKH
GROUP BY KHACHHANG.MAKH, KHACHHANG.HOTEN
ORDER BY COUNT(HOADON.SOHD) DESC;

-- 41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất?
SELECT TOP 1 MONTH(NGHD) AS Month, SUM(TRIGIA) AS MonthlyRevenue
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
ORDER BY MonthlyRevenue DESC;

-- 42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT TOP 1 SANPHAM.MASP, SANPHAM.TENSP, SUM(CTHD.SL) AS TotalQuantity
FROM SANPHAM
JOIN CTHD ON SANPHAM.MASP = CTHD.MASP
JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
WHERE YEAR(HOADON.NGHD) = 2006
GROUP BY SANPHAM.MASP, SANPHAM.TENSP
ORDER BY TotalQuantity ASC;

-- 43. Mỗi nước sản xuất, tìm sản phẩm (MASP, TENSP) có giá bán cao nhất.
SELECT NUOCSX, MASP, TENSP, GIA
FROM (
    SELECT NUOCSX, MASP, TENSP, GIA, 
           ROW_NUMBER() OVER (PARTITION BY NUOCSX ORDER BY GIA DESC) AS Rank
    FROM SANPHAM
) AS ranked
WHERE Rank = 1;

-- 44. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT NUOCSX
FROM SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3;

-- 45. Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
SELECT TOP 1 KHACHHANG.MAKH, KHACHHANG.HOTEN
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.MAKH = HOADON.MAKH
WHERE KHACHHANG.MAKH IN (
    SELECT TOP 10 MAKH
    FROM KHACHHANG
    ORDER BY DOANHSO DESC
)
GROUP BY KHACHHANG.MAKH, KHACHHANG.HOTEN
ORDER BY COUNT(HOADON.SOHD) DESC;

