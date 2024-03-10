using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BLL_NhaCungCap
    {
        DB_CuaHangNoiThatDataContext db = new DB_CuaHangNoiThatDataContext();

        public NhaCungCap FindNhaCungCap(int maNCC)
        {
            // Kiểm tra xem có nhà cung cấp nào có mã tương ứng không
            var ncc = db.NhaCungCaps.FirstOrDefault(n => n.MaNCC == maNCC);

            // Nếu không tìm thấy, trả về null
            if (ncc == null)
            {
                return null;
            }

            return ncc;
        }

        public object GetNhaCungCap(int v)
        {
            return db.NhaCungCaps.Select(r => r);
        }
        public bool insertNhaCungCap(NhaCungCap ncc)
        {
            try
            {
                db.NhaCungCaps.InsertOnSubmit(ncc);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool deleteNhaCungCap(int maNCC)
        {
            try
            {
                // Tìm nhà cung cấp cần xóa theo mã
                NhaCungCap ncc = db.NhaCungCaps.FirstOrDefault(r => r.MaNCC == maNCC);

                // Kiểm tra xem nhà cung cấp có tồn tại không
                if (ncc != null)
                {
                    db.NhaCungCaps.DeleteOnSubmit(ncc);
                    db.SubmitChanges();
                    return true;
                }
                else
                {
                    return false; // Trả về false nếu nhà cung cấp không tồn tại
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
