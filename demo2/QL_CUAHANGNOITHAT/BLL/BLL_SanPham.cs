﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BLL_SanPham
    {
        private DAL_SanPham dalSanPham;
        DB_CuaHangNoiThatDataContext db = new DB_CuaHangNoiThatDataContext();
        private string maNCC;
        public BLL_SanPham()
        {
            dalSanPham = new DAL_SanPham(); // Khởi tạo đối tượng DAL_SanPham trong BLL_SanPham
        }

        // Hàm cập nhật số lượng tồn cho sản phẩm dựa trên mã sản phẩm
        public bool UpdateSoLuongTonByMaSP(string maSP, int soLuong)
        {
            try
            {
                // Gọi phương thức từ lớp DAL để thực hiện cập nhật số lượng tồn
                bool success = dalSanPham.UpdateSoLuongTonByMaSP(maSP, soLuong);

                // Trả về kết quả từ lớp DAL
                return success;
            }
            catch (Exception ex)
            {
                // Xử lý ngoại lệ (nếu có)
                // Đây có thể là nơi bạn log lỗi hoặc thực hiện các bước xử lý khác
                Console.WriteLine("Lỗi khi cập nhật số lượng tồn: " + ex.Message);
                return false;
            }
        }
        public object GetSanPham(int Producttype)
        {
                if (Producttype == 0)
                {
                    return db.SanPhams.Select(r => new { r.MaSP, r.TenSP, r.NhaCungCap.TenNCC, r.MauSac });
                }
                else
                {
                    return db.SanPhams.Where(r => r.MaLoai == Producttype).Select(r => new { r.MaSP, r.TenSP, r.NhaCungCap.TenNCC, r.MauSac });
                }
        }
        public SanPham FindSanPham(string index)
        {
            if (db.SanPhams.Where(r => r.MaSP == index || r.TenSP == index).FirstOrDefault() == null)
            {
                return null;               
            }
            return db.SanPhams.Where(r => r.MaSP == index || r.TenSP == index).FirstOrDefault();
        }
        public object GetNhaCungCap()
        {
            return db.NhaCungCaps.Select(r => r);
        }

        public object GetLoaiSanPham()
        {
            return db.Loais.Select(r => r);
        }
        public bool checkIDSP(int IDSP)
        {
            if (db.SanPhams.Where(r => r.MaSP == IDSP.ToString()).FirstOrDefault() != null) return true;
            return false;
        }
        public bool insertSanPham(SanPham SP)
        {
            try 
	        {	        
                db.SanPhams.InsertOnSubmit(SP);
                db.SubmitChanges();
		        return true;
	        }
	        catch (Exception)
	        {
                return false;
	        }
        }
        public bool deleteSanPham(string IDSP)
        {
            try
            {
                SanPham item = db.SanPhams.Where(r => r.MaSP == IDSP).FirstOrDefault();
                db.SanPhams.DeleteOnSubmit(item);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }
        public bool editSanPham(SanPham item)
        {
            try
            {
                SanPham edititem = db.SanPhams.Where(r => r.MaSP == item.MaSP).FirstOrDefault();
                edititem.TenSP = item.TenSP;
                edititem.MoTa = item.MoTa;
                edititem.KichThuoc = item.KichThuoc;
                edititem.MauSac = item.MauSac;
                edititem.ChatLieu = item.ChatLieu;
                edititem.XuatXu = item.XuatXu;
                edititem.DonVi = item.DonVi;
                edititem.ChuongTrinhApDung = item.ChuongTrinhApDung;
                edititem.GhiChu = item.GhiChu;
                edititem.SoLuongTon = item.SoLuongTon;

                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }
        public bool setTinhTrang(string IDProduct, bool statuses)
        {
            try
            {
                SanPham item = db.SanPhams.Where(r => r.MaSP == IDProduct).FirstOrDefault();
                item.TinhTrang = statuses;
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public int checkSLTon(string idproduct)
        {
            try
            {
                if (db.SanPhams.Where(r => r.MaSP == idproduct).Select(r => r.SoLuongTon).FirstOrDefault() == 0)
                {
                    return 0;
                }
                else
                {
                    int values = int.Parse(db.SanPhams.Where(r => r.MaSP == idproduct).Select(r => r.SoLuongTon).FirstOrDefault().ToString());
                    return values;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }
    }
}
