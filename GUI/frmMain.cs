﻿using BUS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace GUI
{
    public partial class frmMain : Form
    {
        BUS_Employee busEmployee = new BUS_Employee();
        frmEmployee fEmployee = new frmEmployee();
        frmProduct fProduct = new frmProduct();
        frmCustomer fCustomer = new frmCustomer();

        frmAccount fAccount;
        frmBill fBill;
        static bool isCheckRole = false;
        public frmMain(string email)
        {
            InitializeComponent();
            if (!busEmployee.GetEmployeeRole(email))
            {
                btnEmployee.Visible = false;
                btnProduct.Checked = true;
                fProduct.TopLevel = false;
                fProduct.Dock = DockStyle.Fill;
                pnlBody.Controls.Add(fProduct);
                fProduct.Show();
            }
            isCheckRole = busEmployee.IsCheckRole(email);
            fAccount = new frmAccount(email);
            fBill = new frmBill();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnEmployee_Click(object sender, EventArgs e)
        {
            if (isCheckRole)
            {
                pnlBody.Controls.Clear();
                fEmployee.TopLevel = false;
                fEmployee.Dock = DockStyle.Fill;
                pnlBody.Controls.Add(fEmployee);
                fEmployee.Show();
            }
            else
            {
                MessageBox.Show("Không có quyền truy cập!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
           
        }

        private void btnProduct_Click(object sender, EventArgs e)
        {
            pnlBody.Controls.Clear();
            fProduct.TopLevel = false;
            pnlBody.Controls.Add(fProduct);
            fProduct.Dock = DockStyle.Fill;
            fProduct.Show();
        }

        private void btnCustomer_Click(object sender, EventArgs e)
        {
            pnlBody.Controls.Clear();
            fCustomer.TopLevel = false;
            pnlBody.Controls.Add(fCustomer);
            fCustomer.Dock = DockStyle.Fill;
            fCustomer.Show();  
        }
        private void btnBill_Click(object sender, EventArgs e)
        {
            pnlBody.Controls.Clear();
            fBill.TopLevel = false;
            pnlBody.Controls.Add(fBill);
            fBill.Dock = DockStyle.Fill;
            fBill.Show();
        }
        
        private void btnAccount_Click(object sender, EventArgs e)
        {
            pnlBody.Controls.Clear();
            fAccount.TopLevel = false;
            pnlBody.Controls.Add(fAccount);
            fAccount.Dock = DockStyle.Fill;
            fAccount.Show();

        }
    }
}
