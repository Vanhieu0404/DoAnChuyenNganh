﻿using System;
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
    public partial class GUISanPham : UserControl
    {
        BLL_SanPham sp = new BLL_SanPham();
        NhanVien UserAccout { get; set; }
        public GUISanPham(NhanVien UserAccout)
        {
            this.UserAccout = UserAccout;
            InitializeComponent();
        }
        private void setActionForm()
        {
            if (UserAccout.MaNhom == "User")
            {
                btnadd.Visible = false;
                btndel.Visible = false;
                btnedit.Visible = false;
                btnSetTinhTrang.Text = "Xem chi tiết sản phẩm";
            }
        }
        private void txtfind_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtfind_KeyDown(object sender, KeyEventArgs e)
        {
            if (txtfind.Text == "Nhập vào sản phẩm cần tìm") txtfind.Text = "";
        }

        private void txtfind_KeyUp(object sender, KeyEventArgs e)
        {
            if (txtfind.Text == "") txtfind.Text = "Nhập vào sản phẩm cần tìm";
        }

        private void btnfind_Click(object sender, EventArgs e)
        {
            if (txtfind.Text == "Nhập vào sản phẩm cần tìm" || txtfind.Text == "") MessageBox.Show("Chưa nhập sản phẩm cần tìm");
            else
            {
                if (sp.FindSanPham(txtfind.Text) != null)
                {
                    SanPham item = sp.FindSanPham(txtfind.Text);
                    txtTenSanPham.Text = item.TenSP;
                    if (item.TinhTrang == true)
                    {
                        radioButton1.Checked = true;
                    }
                    else
                    {
                        radioButton2.Checked = true;
                    }
                    txtNhaCungCap.Text = item.NhaCungCap.TenNCC;
                    txtSoLuong.Text = item.SoLuongTon.ToString();
                }
                else
                {
                    MessageBox.Show("Tìm kiếm thất bại");
                }
            }
        }

        private void SanPham_Load(object sender, EventArgs e)
        {
            setActionForm();
            cbLoaiSanPham.DataSource = sp.GetLoaiSanPham();
            cbLoaiSanPham.DisplayMember = "TenLoai";
            cbLoaiSanPham.ValueMember = "MaLoai";
            dtSP.DataSource = sp.GetSanPham(0);
            if (txtTenSanPham.Text == "")
            {
                btnedit.Enabled = false;
                btndel.Enabled = false;
                btnSetTinhTrang.Enabled = false;
            }
        }

        private void btnadd_Click(object sender, EventArgs e)
        {
            ThemSanPham fr = new ThemSanPham();
            fr.FormClosed += new FormClosedEventHandler(fr_formclosed);
            fr.ADD = true;
            fr.EDIT = false;
            fr.Show();
        }

        private void btnedit_Click(object sender, EventArgs e)
        {
            ThemSanPham fr = new ThemSanPham();
            fr.FormClosed += new FormClosedEventHandler(fr_formclosed);
            fr.EDIT = true;
            fr.ADD = false;
            fr.IDItem = IDSP.Text;
            fr.Show();
        }
        private void fr_formclosed(object sender, FormClosedEventArgs e)
        {
            dtSP.DataSource = sp.GetSanPham(0);
        }
        private void txtTenSanPham_TextChanged(object sender, EventArgs e)
        {
            btnedit.Enabled = true;
            btndel.Enabled = true;
            btnSetTinhTrang.Enabled = true;
        }

        private void dtSP_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int selectedRowIndex = dtSP.SelectedCells[0].RowIndex;
            string selectedValue = dtSP.Rows[selectedRowIndex].Cells[0].Value.ToString();

            SanPham item = sp.FindSanPham(selectedValue);
            IDSP.Text = item.MaSP;
            txtTenSanPham.Text = item.TenSP;

            if (item.TinhTrang == true)
            {
                radioButton1.Checked = true;
            }
            else
            {
                radioButton2.Checked = true;
            }

            txtNhaCungCap.Text = item.NhaCungCap.TenNCC;
            txtSoLuong.Text = item.SoLuongTon.ToString();

            // Hiển thị giá nhập và giá bán
            txtGiaNhap.Text = item.GiaNhap.ToString();
            txtGiaBan.Text = item.DonGia.ToString();
        }

        private void btndel_Click(object sender, EventArgs e)
        {
            if (sp.deleteSanPham(IDSP.Text) == true)
            {
                MessageBox.Show("Xoá thành công");
                dtSP.DataSource = sp.GetSanPham(0);
            }
            else
            {
                MessageBox.Show("Xoá thất bại");
            }
        }


        private void cbLoaiSanPham_SelectedValueChanged(object sender, EventArgs e)
        {
            int ID = 0;
            if (int.TryParse(cbLoaiSanPham.SelectedValue.ToString(), out ID))
            {
                dtSP.DataSource = sp.GetSanPham(ID);
            }

        }

        private void btnSetTinhTrang_Click(object sender, EventArgs e)
        {
            if (btnSetTinhTrang.Text == "Xem chi tiết sản phẩm")
            {
                ThemSanPham fr = new ThemSanPham();
                fr.FormClosed += new FormClosedEventHandler(fr_formclosed);
                fr.EDIT = true;
                fr.ADD = false;
                fr.IsView = true;
                fr.IDItem = IDSP.Text;
                fr.Show();
            }
            else
            {
                if (radioButton1.Checked == true)
                {
                    if (sp.checkSLTon(IDSP.Text) == 0)
                    {
                        MessageBox.Show("Số lượng tồn không hợp lệ\nSố lượng tồn : 0");
                    }
                    else
                    {
                        if (sp.setTinhTrang(IDSP.Text, true) == true)
                        {
                            MessageBox.Show("Cập nhập tình trạng thành công");
                        }
                    }
                }
                else
                {
                    if (sp.setTinhTrang(IDSP.Text, false) == true)
                    {
                        MessageBox.Show("Cập nhập tình trạng thành công");
                    }
                }
            }
        }

        private void dtSP_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
    
}
