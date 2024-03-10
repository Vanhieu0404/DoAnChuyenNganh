go
create database DB_CuaHangNoiThat

USE DB_CuaHangNoiThat
GO
/****** Object:  Table [dbo].[CTPhieuNhap]    Script Date: 01/12/2023 12:50:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuNhap](
	[MaCT] [varchar](10) NOT NULL primary key,
	[MaPN] [varchar](10) NULL,
	[MaSP] [varchar](10) NULL,
	[SoLuong] [int] NULL,
)
GO
/****** Object:  Table [dbo].[CTHoaDon]    Script Date: 01/12/2023 12:50:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoaDon](
	[MaCT] [int] IDENTITY(1,1) NOT NULL primary key,
	[MaHD] [varchar](10) NULL,
	[MaSP] [varchar](10) NULL,
	[SoLuong] [int] NULL,
)
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 01/12/2023 12:50:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [varchar](10) NOT NULL primary key,
	[NgayLap] [date] NULL,
	[MaKH] [varchar](10) NULL,
	[MaNV] [varchar](10) NULL,
	[TinhTrang] [bit] NULL,
	[TongTien] [decimal](18, 0) NULL,
)
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 01/12/2023 12:50:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [varchar](10) NOT NULL primary key,
	[HoTen] [nvarchar](255) NULL,
	[Email] [varchar](max) NULL,
	[NgaySinh] [date] NULL,
	[DienThoai] [varchar](11) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[MatKhau] [varchar](max) NULL,
	[MaNhom] [varchar](6) NULL,
	[TinhTrang] [varchar](10) NULL,
	[HinhAnh] [varchar](max) NULL,
)
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 01/12/2023 12:50:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL primary key,
	[TenLoai] [nvarchar](100) NULL,
)
GO
/****** Object:  Table [dbo].[ManHinh]    Script Date: 01/12/2023 12:50:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManHinh](
	[MaMH] [int] IDENTITY(1,1) NOT NULL primary key,
	[TenMH] [varchar](15) NULL,
)
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 01/12/2023 12:50:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL primary key,
	[TenNCC] [nvarchar](255) NULL,
	[DienThoai] [varchar](11) NULL,
	[DiaChi] [nvarchar](max) NULL,
)
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 01/12/2023 12:50:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](10) NOT NULL primary key,
	[TenNV] [nvarchar](255) NULL,
	[CCCD] [varchar](13) NULL,
	[Email] [varchar](max) NULL,
	[NgaySinh] [date] NULL,
	[DienThoai] [varchar](11) NULL,
	[MatKhau] [varchar](max) NULL,
	[MaNhom] [varchar](6) NULL,
	[TinhTrang] [varchar](10) NULL,
	[HinhAnh] [varchar](max) NULL,
)
GO
/****** Object:  Table [dbo].[NhomNguoiDung]    Script Date: 01/12/2023 12:50:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomNguoiDung](
	[MaNhom] [varchar](6) NOT NULL primary key,
	[TenNhom] [nvarchar](255) NULL,
)
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 01/12/2023 12:50:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [varchar](10) NOT NULL primary key,
	[NgayLap] [date] NULL,
	[MaNV] [varchar](10) NULL,
	[TongTien] [decimal](18, 2) NULL,
)
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 01/12/2023 12:50:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL primary key,
	[MaMH] [int] NULL,
	[MaNhom] [varchar](6) NULL,
)
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 01/12/2023 12:50:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [varchar](10) NOT NULL primary key,
	[TenSP] [nvarchar](255) NULL,
	[TinhTrang] [bit] NULL,
	[MaNCC] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaLoai] [int] NULL,
	[KichThuoc] [nvarchar](50) NULL,
	[MauSac] [nvarchar](50) NULL,
	[ChatLieu] [nvarchar](50) NULL,
	[XuatXu] [nvarchar](50) NULL,
	[DonVi] [nvarchar](20) NULL,
	[ChuongTrinhApDung] [nvarchar](255) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[SoLuongTon] [int] NULL,
	[HinhAnh] [varchar](max) NULL,
	[DonGia] [decimal](18, 0) NOT NULL,
	[GiaNhap] [decimal](18, 0) NOT NULL,
	[GiaBan] [decimal](18, 0) NOT NULL,
)
GO
SET IDENTITY_INSERT [dbo].[CTHoaDon] ON 

INSERT [dbo].[CTHoaDon] ([MaCT], [MaHD], [MaSP], [SoLuong]) VALUES (1, N'15102301', N'1089271', 2)
INSERT [dbo].[CTHoaDon] ([MaCT], [MaHD], [MaSP], [SoLuong]) VALUES (2, N'15102301', N'1096293', 1)
INSERT [dbo].[CTHoaDon] ([MaCT], [MaHD], [MaSP], [SoLuong]) VALUES (3, N'15102301', N'2001081', 1)
INSERT [dbo].[CTHoaDon] ([MaCT], [MaHD], [MaSP], [SoLuong]) VALUES (4, N'16102301', N'1089271', 1)
INSERT [dbo].[CTHoaDon] ([MaCT], [MaHD], [MaSP], [SoLuong]) VALUES (5, N'16102301', N'2001081', 1)
INSERT [dbo].[CTHoaDon] ([MaCT], [MaHD], [MaSP], [SoLuong]) VALUES (6, N'20102301', N'1096293', 1)
INSERT [dbo].[CTHoaDon] ([MaCT], [MaHD], [MaSP], [SoLuong]) VALUES (7, N'20102301', N'2002253', 2)
INSERT [dbo].[CTHoaDon] ([MaCT], [MaHD], [MaSP], [SoLuong]) VALUES (8, N'20102302', N'1089271', 1)
INSERT [dbo].[CTHoaDon] ([MaCT], [MaHD], [MaSP], [SoLuong]) VALUES (9, N'26112301', N'2001081', 1)
INSERT [dbo].[CTHoaDon] ([MaCT], [MaHD], [MaSP], [SoLuong]) VALUES (10, N'26112301', N'2002148', 1)
INSERT [dbo].[CTHoaDon] ([MaCT], [MaHD], [MaSP], [SoLuong]) VALUES (11, N'26112301', N'2000485', 2)
INSERT [dbo].[CTHoaDon] ([MaCT], [MaHD], [MaSP], [SoLuong]) VALUES (12, N'26112301', N'2000236', 1)
SET IDENTITY_INSERT [dbo].[CTHoaDon] OFF
GO
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [MaNV], [TinhTrang], [TongTien]) VALUES (N'15102301', CAST(N'2023-10-15' AS Date), N'2311230001', N'Admin', 1, CAST(50000000 AS Decimal(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [MaNV], [TinhTrang], [TongTien]) VALUES (N'16102301', CAST(N'2023-10-16' AS Date), N'2311230002', NULL, 1, CAST(60000000 AS Decimal(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [MaNV], [TinhTrang], [TongTien]) VALUES (N'20102301', CAST(N'2023-10-20' AS Date), N'2311230001', NULL, 1, CAST(50000000 AS Decimal(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [MaNV], [TinhTrang], [TongTien]) VALUES (N'20102302', CAST(N'2023-10-20' AS Date), N'2311230001', NULL, 1, CAST(60000000 AS Decimal(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [MaNV], [TinhTrang], [TongTien]) VALUES (N'26112301', CAST(N'2023-11-26' AS Date), N'Ashikaga', NULL, 1, CAST(25000000 AS Decimal(18, 0)))
GO
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [Email], [NgaySinh], [DienThoai], [DiaChi], [MatKhau], [MaNhom], [TinhTrang], [HinhAnh]) VALUES (N'2311230001', N'Nguyễn Thành Đô', N'abcd@gmail.com', CAST(N'2005-06-25' AS Date), N'0123654789', N'78 Lê Trọng Tấn, phường Tây Thạnh, quận Tân Phú, thành phố Hồ Chí Minh', N'123456', N'Gue', N'Active', N'2311230001.jpg')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [Email], [NgaySinh], [DienThoai], [DiaChi], [MatKhau], [MaNhom], [TinhTrang], [HinhAnh]) VALUES (N'2311230002', N'Trần Văn Sĩ', N'xyz@gmail.com', CAST(N'2001-05-25' AS Date), N'0245613987', NULL, N'123456', N'Gue', N'Blocked', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [Email], [NgaySinh], [DienThoai], [DiaChi], [MatKhau], [MaNhom], [TinhTrang], [HinhAnh]) VALUES (N'Ashikaga', N'Trần Thiên Phong', N'def@gmail.com', CAST(N'2023-11-09' AS Date), N'0125864254', N'140 Lê Trọng Tấn, Sơn Kỳ, Tân Phú, , Hồ Chí Minh.', N'123456', N'Gue', N'Active', N'Ashikaga.jpg')
GO
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (1, N'Sofa')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (2, N'Ghế Thư Giãn')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (3, N'Bàn')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (4, N'Ghế')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (5, N'Giường Nệm')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (6, N'Chăn Ga Gối')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (7, N'Tủ Kệ')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (8, N'Nội Thất Văn Phòng')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (9, N'Trang Trí Nhà Cửa')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (10, N'Nhà Bếp')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (11, N'Phòng Tắm')
SET IDENTITY_INSERT [dbo].[Loai] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (1, N'JOY', N'Hồ Chí Minh',0147852365)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (2, N'STUDENT', N'Vũng tàu',015478556)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (3, N'DOMINIK', N'Lang Sơn',012554122)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (4, N'BARCELONA', N'Yên Bái ',0516556221)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (5, N'VIKING', N'Hà Tĩnh ',0125479986)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (6, N'CARINE', N'Sóc Trăng',0125896472)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (7, N'ALISON', N'Buôn Mê',0147856932)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (8, N'JULIANNE', N'Lào Cao',0157896412)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (9, N'MARGARET', N'Thanh Hóa',0879654123)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (10, N'VENICE', N'Tuyên Quang',0156987452)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (11, N'TINTIN', N'Đà Nẵng',0256398741)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (12, N'VERONA', N'Phú Yên ',0487965412)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (13, N'PRINCETON', N'Hội An',0145879654)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (14, N'KENNY', N'Khánh Hòa ',0135698745)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (15, N'HARRIS', N'Điện Biên',0157896314)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (16, N'PALL-MALL', N'Cái Bè',0178541239)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (17, N'HOUSTON', N'Bạc Liêu',0123654789)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (18, N'CONNEMARA', N'Trà Vinh',0578964133)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (19, N'ELISE', N'PLayKu',0547963214)
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [CCCD], [Email], [NgaySinh], [DienThoai], [MatKhau], [MaNhom], [TinhTrang], [HinhAnh]) VALUES (N'Admin', N'Nguyễn Chí Nguyện', N'0792xxxxxxx', N'abc@gmail.com', CAST(N'2002-05-16' AS Date), N'0123456789', N'123', N'Adm', N'Active', NULL)
GO
INSERT [dbo].[NhomNguoiDung] ([MaNhom], [TenNhom]) VALUES (N'Adm', N'Admin')
INSERT [dbo].[NhomNguoiDung] ([MaNhom], [TenNhom]) VALUES (N'Gue', N'Guest')
INSERT [dbo].[NhomNguoiDung] ([MaNhom], [TenNhom]) VALUES (N'User', N'User')
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TinhTrang], [MaNCC], [MoTa], [MaLoai], [KichThuoc], [MauSac], [ChatLieu], [XuatXu], [DonVi], [ChuongTrinhApDung], [GhiChu], [SoLuongTon], [HinhAnh], [DonGia],[GiaNhap],[GiaBan]) VALUES (N'1089271', N'Ghế Đơn / Ghế Bành Thư Giãn Connemara', 1, 18, N'Là một thiết kế đặc biệt của BAYA, ghế bành CONNEMARA có thể kết hợp hài hòa với bất kỳ phong cách nội thất nào. Khung và chân ghế làm từ gỗ đem lại sự vững chắc và độ bền cao. Đệm ngồi và tựa lưng êm ái với chất liệu mút bọc vải nhung thành phần 100% polyester giữ phom dáng ghế và đưa vẻ đẹp sang trọng vào tổ ấm.', 2, N'D80xW75xH60/77', N'Màu xanh dương', N'Vải tổng hợp', N'Việt Nam', N'PCS', N'1 Năm Bảo Hành;Đổi trả trong 3 ngày(Không áp dụng chính sách đổi trả và bảo hành với những sản phẩm CLEARANCE)', N'Sử dụng máy hút bụi hoặc dịch vụ vệ sinh sofa để làm sạch sản phẩm;Đặt sản phẩm tại nơi khô thoáng;Tránh độ ẩm và nhiệt độ cao, nguồn sáng mạnh và các vật dễ cháy;Không dùng vật sắc nhọn chà xát sản phẩm.', 20, N'1089271.jpg', CAST(7990000 AS Decimal(18, 0)), CAST(7000000 AS Decimal(18, 0)), CAST(7990000 AS Decimal(18, 0))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TinhTrang], [MaNCC], [MoTa], [MaLoai], [KichThuoc], [MauSac], [ChatLieu], [XuatXu], [DonVi], [ChuongTrinhApDung], [GhiChu], [SoLuongTon], [HinhAnh], [DonGia],[GiaNhap],[GiaBan]) VALUES (N'1096293', N'Ghế Dài Thư Giãn Màu Hồng Connemara', 1, 18, N'Ghế nằm CONNEMARA là một thiết kế đặc biệt của BAYA, lấy cảm hứng từ phong cách Art Deco hiện đại và ấn tượng. Sản phẩm được bọc vải nhung mềm mịn; với màu sắc và kiểu dáng cá tính, quyến rũ cho bạn thoải mái thư giãn, nghỉ ngơi. Kết hợp với các món nội thất khác trong cùng bộ sưu tập CONNEMARA để hoàn thiện việc bày trí không gian phòng khách sang trọng và ấm cúng.', 2, N'D85xW168xH80/42', N'Hồng', N'Vải tổng hợp', N'Việt Nam', N'PCS', N'1 Năm Bảo Hành;Đổi trả trong 3 ngày(Không áp dụng chính sách đổi trả và bảo hành với những sản phẩm CLEARANCE)', N'Sử dụng dịch vụ vệ sinh sofa định kỳ để bảo quản sản phẩm tốt nhất;Không tẩy trắng;Không sấy nóng;Không ủi sản phẩm;Lau sạch vết bẩn nhỏ bằng miếng bọt biển và nước hoặc dung dịch giặt rửa nhẹ;Lau ngay vết chất lỏng bị đổ để tránh thấm vào sản phẩm', 30, N'1096293.jpg', CAST(9990000 AS Decimal(18, 0)), CAST(7990000 AS Decimal(18, 0)), CAST(9990000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TinhTrang], [MaNCC], [MoTa], [MaLoai], [KichThuoc], [MauSac], [ChatLieu], [XuatXu], [DonVi], [ChuongTrinhApDung], [GhiChu], [SoLuongTon], [HinhAnh], [DonGia],[GiaNhap],[GiaBan]) VALUES (N'2000236', N'Vỏ gối tựa Polyester Vàng Elise', 1, 19, NULL, 6, N'L50xW30', N'Vàng', N'100% Polyester', N'Việt Nam', N'PCS', N'1 Năm Bảo Hành;Đổi trả trong 3 ngày(Không áp dụng chính sách đổi trả và bảo hành với những sản phẩm CLEARANCE)', NULL, 60, N'2000236.jpg', CAST(199000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), CAST(7990000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TinhTrang], [MaNCC], [MoTa], [MaLoai], [KichThuoc], [MauSac], [ChatLieu], [XuatXu], [DonVi], [ChuongTrinhApDung], [GhiChu], [SoLuongTon], [HinhAnh], [DonGia],[GiaNhap],[GiaBan]) VALUES (N'2000485', N'Bàn Ăn MDF Chân Sắt Verona', 1, 12, N'Bàn ăn VERONA nổi bật với màu trắng tinh khôi được làm từ gỗ công nghiệp bền chắc. Rất phù hợp với những gia đình ít người và không gian phòng bếp hạn chế. Mặt bàn được xử lý kỹ càng, mang vẻ đẹp tinh xảo. Chân bàn làm từ kim loại, cho độ cứng cáp và chắc chắn cao. Bạn có thể kết hợp bàn cùng các sản phẩm khác trong cùng bộ sưu tập VERONA để hoàn thiện nội thất phòng ăn của gia đình bạn.', 3, N'	L75xW75xH75', N'Trắng', N'MDF-Faux-granite', N'Việt Nam', N'PCS', N'1 Năm Bảo Hành;Đổi trả trong 3 ngày(Không áp dụng chính sách đổi trả và bảo hành với những sản phẩm CLEARANCE)', N'Đặt sản phẩm tại nơi khô ráo, thoáng mát; tránh để lâu ở những nơi ẩm thấp hay có nhiệt độ cao;Vệ sinh sản phẩm bằng khăn ẩm, sau đó lau khô.;Không dùng vật sắc nhọn chà xát sản phẩm', 30, N'2000485.jpg', CAST(1990000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(1990000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TinhTrang], [MaNCC], [MoTa], [MaLoai], [KichThuoc], [MauSac], [ChatLieu], [XuatXu], [DonVi], [ChuongTrinhApDung], [GhiChu], [SoLuongTon], [HinhAnh], [DonGia],[GiaNhap],[GiaBan]) VALUES (N'2001081', N'Bàn Làm Việc Nhỏ Gọn Student', 0, 2, N'Tránh để bàn tiếp xúc với nước hoặc chất tẩy rửa mạnh, vì nó có thể làm ảnh hưởng đến bề mặt bàn và gây ra các vết xước hoặc biến dạng. Bạn cũng nên tránh để bàn cà phê tiếp xúc với ánh nắng mặt trời trực tiếp trong thời gian dài, vì nó có thể làm mất màu và làm cho bề mặt bàn bị khô và nứt.

 
Thường xuyên lau chùi bàn cà phê với khăn mềm và ẩm để loại bỏ bụi và bảo vệ bề mặt của nó. Nếu bạn không sử dụng bàn trong một thời gian dài, bạn nên phủ nó bằng khăn tránh bụi hoặc đặt nó trong một bao bì để tránh bị tác động của môi trường bên ngoài.

Bộ sưu tập nội thất văn phòng Student: Sự kết hợp hoàn hảo giữa Thẩm mỹ và Công năng sử dụng

Trong nhịp sống hiện đại, nơi mà hoạt động làm việc và học tập tại nhà trở nên ngày càng quan trọng, việc chọn một sản phẩm bàn học hay tủ kệ văn phòng phù hợp là điều không thể thiếu. Những vật dụng này không chỉ phải đảm bảo tính chất lượng và chắc chắn mà còn phải thể hiện sự thẩm mỹ và phù hợp với môi trường làm việc và nội thất trong gia đình. Bộ sưu tập Student chính là sự lựa chọn hoàn hảo cho nhu cầu của bạn.

Khung sắt và về mặt hoàn thiện xuất sắc

Khung sắt là yếu tố quan trọng tạo nên sự chắc chắn và độ bền của các sản phẩm nội thất trong bộ sưu tập Student. Khung sắt được chế tạo bằng công nghệ tiên tiến, giúp đảm bảo tính cứng cáp và độ bền vượt trội. Với mức độ hoàn thiện cao, bạn có thể yên tâm sử dụng các sản phẩm trong thời gian dài mà không cần lo lắng về sự trầy xước hoặc biến dạng.

Mặt bàn và ngăn tủ kệ được làm từ gỗ công nghiệp cao cấp, chất lượng và hoàn thiện tinh tế. Gỗ công nghiệp không chỉ giúp bảo vệ môi trường mà còn đảm bảo tính chất lượng và đẹp mắt. Sự hoàn thiện tỉ mỉ trên mặt gỗ tạo nên một bề mặt mịn màng và dễ dàng vệ sinh, giúp bàn luôn giữ được vẻ đẹp ban đầu suốt thời gian dài.

Thiết kế hiện đại và thẩm mỹ

Bộ sản phẩm Student không chỉ có tính chất lượng và chắc chắn mà còn mang đậm phong cách hiện đại. Thiết kế đơn giản, gọn gàng và tiện dụng giúp các sản phẩm phù hợp với mọi không gian làm việc và gia đình. Bạn có thể dễ dàng kết hợp bàn, tủ kệ với các loại ghế và trang trí nội thất khác để tạo nên một môi trường làm việc thú vị và sáng tạo.', 3, N'D100xW48xH76', N'Nâu / Đen', N'MFC / Kim loại', N'Trung Quốc', N'PCS', N'1 Năm Bảo Hành;Đổi trả trong 3 ngày(Không áp dụng chính sách đổi trả và bảo hành với những sản phẩm CLEARANCE)', NULL, 0, N'2001081.jpg', CAST(1990000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(1990000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TinhTrang], [MaNCC], [MoTa], [MaLoai], [KichThuoc], [MauSac], [ChatLieu], [XuatXu], [DonVi], [ChuongTrinhApDung], [GhiChu], [SoLuongTon], [HinhAnh], [DonGia],[GiaNhap],[GiaBan]) VALUES (N'2001210', N'Sofa Vải Cho Phòng Khách Houston', 0, 17, NULL, 1, NULL, NULL, NULL, NULL, NULL, N'1 Năm Bảo Hành;Đổi trả trong 3 ngày(Không áp dụng chính sách đổi trả và bảo hành với những sản phẩm CLEARANCE)', NULL, 0, N'2001210.jpg', CAST(17900000 AS Decimal(18, 0)), CAST(10000000 AS Decimal(18, 0)), CAST(17900000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TinhTrang], [MaNCC], [MoTa], [MaLoai], [KichThuoc], [MauSac], [ChatLieu], [XuatXu], [DonVi], [ChuongTrinhApDung], [GhiChu], [SoLuongTon], [HinhAnh], [DonGia],[GiaNhap],[GiaBan]) VALUES (N'2002148', N'Ghế Ngồi Học xoay nâng hạ Joy Cho Trẻ Em', 1, 1, N'Ghế văn phòng Joy với bộ khung chắc chắn, nệm foam và bọc vải mesh là một lựa chọn phù hợp cho bàn học/bàn làm việc gia đình hoặc không gian công sở nhỏ.

1. Thiết kế:

- Ghế Joy có thiết kế trẻ trung và hiện đại, thích hợp cho các môi trường văn phòng hiện đại, như văn phòng công ty, cơ quan, hoặc không gian làm việc tại nhà.

- Ghế có kích thước nhỏ gọn, phù hợp với không gian nhỏ hoặc tạo ra sự gọn gàng cho văn phòng của bạn.

2. Đệm foam:

- Ghế Joy được trang bị đệm foam bọc bên trong lớp vải mesh, giúp cung cấp sự thoải mái và hỗ trợ cho người sử dụng trong thời gian dài.

- Foam có độ đàn hồi tốt, giúp giảm áp lực lên cơ lưng và cột sống, làm giảm mệt mỏi trong quá trình làm việc hoặc làm công việc liên quan đến ngồi nhiều giờ.

3. Vải mesh:

- Lớp vải mesh trải dọc lưng ghế Joy giúp cải thiện thông thoáng và thoáng khí, giúp người sử dụng cảm thấy thoải mái và không bị nóng khi ngồi trong thời gian dài.

- Vải mesh thường làm từ các sợi vải có độ co dãn, tạo sự ôm vừa vặn và hỗ trợ cho lưng và cổ.', 4, N'D51xW51xH74/84', N'	Hồng/ trắng', N'Nylon-base-Foam-Fabric', N'	Trung Quốc', N'PCS', N'1 Năm Bảo Hành;Đổi trả trong 3 ngày(Không áp dụng chính sách đổi trả và bảo hành với những sản phẩm CLEARANCE)', NULL, 40, N'2002148.jpg', CAST(1190000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(1190000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TinhTrang], [MaNCC], [MoTa], [MaLoai], [KichThuoc], [MauSac], [ChatLieu], [XuatXu], [DonVi], [ChuongTrinhApDung], [GhiChu], [SoLuongTon], [HinhAnh], [DonGia],[GiaNhap],[GiaBan]) VALUES (N'2002253', N'Giường MFC 1m6, 1m8 Dominik', 1, 3, N'Giường có ngăn kéo, cất đồ gọn gang Đầu giường có lưng tựa để người tựa vào nghỉ ngơi thoải mái trên giường', 5, N'L200xW160xH80', N'Dark-wood-Dark-grey', N'MFC', N'Việt Nam', N'PCS', N'1 Năm Bảo Hành;Đổi trả trong 3 ngày(Không áp dụng chính sách đổi trả và bảo hành với những sản phẩm CLEARANCE)', N'Tránh đặt sản phẩm dưới ánh sáng mặt trời trực tiếp và những nơi có độ ẩm cao.;Lau bụi bằng vải sạch, mềm, khô, không có xơ.;Làm sạch nhẹ nhàng bằng xà phòng nhẹ. Lau khô ngay bằng vải mềm, tránh ẩm ướt còn sót lại.;Làm sạch vết tràn ngay lập tức bằng cách thấm thay vì lau.;Nâng để di chuyển đồ đạc, tránh xô đẩy', 10, N'2002253.jpg', CAST(9990000 AS Decimal(18, 0)), CAST(9000000 AS Decimal(18, 0)), CAST(9990000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TinhTrang], [MaNCC], [MoTa], [MaLoai], [KichThuoc], [MauSac], [ChatLieu], [XuatXu], [DonVi], [ChuongTrinhApDung], [GhiChu], [SoLuongTon], [HinhAnh], [DonGia],[GiaNhap],[GiaBan]) VALUES (N'2002257', N'Tủ Quần Áo Dominik', 1, 3, N'Tiết kiệm diện tích, nhỏ gọn phù hợp với không gian hẹp', 7, N'D50xW82xH205.5', N'Dark-wood-Dark-grey', N'MFC', N'Việt Nam', N'PCS', N'1 Năm Bảo Hành;Đổi trả trong 3 ngày không cần lý do (Áp dụng cho sản phẩm nguyên giá)', N'Tránh để nước tiếp xúc với tủ. Không làm sạch bằng vải còn ướt. Dùng một miếng vải mềm, ẩm đã vắt khô nước. Khi cần thiết, hãy sử dụng xà phòng nhẹ, không chứa cồn, không gây mài mòn. Sau đó lau khô bằng một miếng vải khô khác để loại bỏ độ ẩm còn sót lại.;Tốt nhất sử dụng máy hút ẩm để ngăn ngừa nấm mốc khi thời tiết mùa nồm;Tránh đặt sản phẩm khu vực có ánh nắng chiếu trực tiếp và khu vực có độ ẩm cao.;Làm khô hoàn toàn quần áo trước khi cất giữ.;Không lưu trữ vật phẩm ẩm ướt trong tủ.', 15, N'2002257.jpg', CAST(5990000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(5990000 AS Decimal(18, 0)))
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhap_PhieuNhap] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [FK_CTPhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhap_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [FK_CTPhieuNhap_SanPham]
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK__CTHoaDon__MaHD__4AB81AF0] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK__CTHoaDon__MaHD__4AB81AF0]
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK__CTHoaDon__MaSP__4BAC3F29] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK__CTHoaDon__MaSP__4BAC3F29]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaKH__46E78A0C] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaKH__46E78A0C]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaNV__47DBAE45] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaNV__47DBAE45]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD FOREIGN KEY([MaNhom])
REFERENCES [dbo].[NhomNguoiDung] ([MaNhom])
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([MaNhom])
REFERENCES [dbo].[NhomNguoiDung] ([MaNhom])
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien]
GO
ALTER TABLE [dbo].[Quyen]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[ManHinh] ([MaMH])
GO
ALTER TABLE [dbo].[Quyen]  WITH CHECK ADD FOREIGN KEY([MaNhom])
REFERENCES [dbo].[NhomNguoiDung] ([MaNhom])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__MaLoai__3C69FB99] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__MaLoai__3C69FB99]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
select * from NhaCungCap
DELETE FROM [dbo].[NhaCungCap] WHERE [MaNCC] = 20;
