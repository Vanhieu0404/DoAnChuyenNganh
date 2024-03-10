using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;

namespace QL_CUAHANGNOITHAT
{
    public partial class GUINhaCC : UserControl
    {
        DB_CuaHangNoiThatDataContext db = new DB_CuaHangNoiThatDataContext();

        BLL_NhaCungCap ncc = new BLL_NhaCungCap();
        public GUINhaCC()
        { 
            InitializeComponent();
        }
        
        private void txtDienThoai_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void txtfind_KeyDown(object sender, KeyEventArgs e)
        {
            if (txtfind.Text == "Nhập vào nhà cung cấp cần tìm") txtfind.Text = "";

        }

        private void txtfind_KeyUp(object sender, KeyEventArgs e)
        {
            if (txtfind.Text == "") txtfind.Text = "Nhập vào nhà cung cấp cần tìm";

        }

        private void txtfind_Click(object sender, EventArgs e)
        {
            if (txtfind.Text == "Nhập vào nhà cung cấp cần tìm" || txtfind.Text == "")
            {
                MessageBox.Show("Chưa nhập nhà cung cấp cần tìm");
            }
            else
            {
                // Kiểm tra xem chuỗi nhập vào có phải là số nguyên không
                if (int.TryParse(txtfind.Text, out int maNCC))
                {
                    // Gọi hàm tìm nhà cung cấp theo mã nhà cung cấp có dạng int
                    NhaCungCap foundNCC = ncc.FindNhaCungCap(maNCC);

                    if (foundNCC != null)
                    {
                        // Hiển thị thông tin nhà cung cấp tìm được
                        txtMaNCC.Text = foundNCC.MaNCC.ToString();
                        txtTenNCC.Text = foundNCC.TenNCC;
                        // Các bước khác nếu cần
                    }
                    else
                    {
                        MessageBox.Show("Không tìm thấy nhà cung cấp với mã " + maNCC);
                    }
                }
                else
                {
                    MessageBox.Show("Mã nhà cung cấp phải là một số nguyên.");
                }
            }
        }

        private void GUINhaCC_Load(object sender, EventArgs e)
        {
            dtNCC.SelectionChanged += dtNCC_SelectionChanged;// Load dữ liệu nhà cung cấp vào DataGridView
            dtNCC.DataSource = ncc.GetNhaCungCap(0); // Giả sử bạn có một phương thức GetNhaCungCap trả về danh sách nhà cung cấp

            // Kiểm tra điều kiện để ẩn hoặc hiện các nút chỉnh sửa, xóa, hay bất kỳ điều gì khác
            

            // Hiển thị thông tin của nhà cung cấp đầu tiên trong danh sách (nếu có)
            if (dtNCC.Rows.Count > 0)
            {
                // Giả sử cột 0 là mã NCC, cột 1 là tên NCC, cột 2 là địa chỉ, cột 3 là số điện thoại trong DataGridView
                txtMaNCC.Text = dtNCC.Rows[0].Cells[0].Value.ToString();
                txtTenNCC.Text = dtNCC.Rows[0].Cells[1].Value.ToString();
                txtDiaChi.Text = dtNCC.Rows[0].Cells[2].Value.ToString();
                txtDienThoai.Text = dtNCC.Rows[0].Cells[3].Value.ToString();

                // Các bước khác nếu cần
            }
        }
        private void fr_formclosed(object sender, FormClosedEventArgs e)
        {
            dtNCC.DataSource = ncc.GetNhaCungCap(0);
        }
        private void btnadd_Click(object sender, EventArgs e)
        {
            ThemNCC fr = new ThemNCC();
            fr.FormClosed += new FormClosedEventHandler(fr_formclosed);
            fr.ADD = true;
            fr.EDIT = false;
            fr.Show();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void dtNCC_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dtNCC.Rows[e.RowIndex];

                // Hiển thị thông tin từ dòng được chọn lên các textbox
                txtMaNCC.Text = row.Cells["MaNCC"].Value.ToString();
                txtTenNCC.Text = row.Cells["TenNCC"].Value.ToString();
                txtDiaChi.Text = row.Cells["DiaChi"].Value.ToString();
                txtDienThoai.Text = row.Cells["DienThoai"].Value.ToString();
            }
        }

        private void dtNCC_SelectionChanged(object sender, EventArgs e)
        {
            // Kiểm tra xem có dòng được chọn không
            if (dtNCC.SelectedRows.Count > 0)
            {
                // Lấy dữ liệu từ dòng được chọn
                DataGridViewRow selectedRow = dtNCC.SelectedRows[0];

                // Hiển thị dữ liệu lên các TextBox
                txtMaNCC.Text = selectedRow.Cells["MaNCC"].Value.ToString();
                txtTenNCC.Text = selectedRow.Cells["TenNCC"].Value.ToString();
                txtDiaChi.Text = selectedRow.Cells["DiaChi"].Value.ToString();
                txtDienThoai.Text = selectedRow.Cells["DienThoai"].Value.ToString();
            }
        }

        private void btnedit_Click(object sender, EventArgs e)
        {
           
        }
        private void LoadData()
        {
            // Giả sử có một phương thức GetNhaCungCap để lấy dữ liệu từ cơ sở dữ liệu
            // và gán nó vào DataGridView dtNCC
            dtNCC.DataSource = GetNhaCungCap();
        }

        public List<NhaCungCap> GetNhaCungCap()
        {
            try
            {
                // Lấy danh sách nhà cung cấp từ cơ sở dữ liệu
                List<NhaCungCap> listNhaCungCap = db.NhaCungCaps.ToList();

                // Trả về danh sách nhà cung cấp
                return listNhaCungCap;
            }
            catch (Exception)
            {
                // Xử lý ngoại lệ nếu có
                return null;
            }
        }

        private void dtNCC_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void btndel_Click(object sender, EventArgs e)
        {
            // Kiểm tra xem có dòng nào được chọn không
            if (dtNCC.SelectedRows.Count > 0)
            {
                // Lấy mã nhà cung cấp từ dòng được chọn
                int maNCC = int.Parse(dtNCC.SelectedRows[0].Cells["MaNCC"].Value.ToString());

                // Kiểm tra xem có xóa thành công hay không
                if (ncc.deleteNhaCungCap(maNCC))
                {
                    MessageBox.Show("Xoá thành công");
                    LoadData(); // Load lại dữ liệu sau khi xóa
                }
                else
                {
                    MessageBox.Show("Xoá thất bại");
                }
            }
            else
            {
                MessageBox.Show("Vui lòng chọn một nhà cung cấp để xoá.");
            }
        }
    }
}
