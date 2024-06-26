﻿using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace BUS
{
    public class BUS_Bill
    {
        QLSanPhamDataContext db = new QLSanPhamDataContext();
        public Array ListOfBills()
        {
            var bill = db.tblBills.ToList();

            var result = from p in bill
                         join c in db.tblCustomers 
                         on
                         p.CustomerId equals c.Id
                         select new
                         {
                             Id = p.Id,
                             Name = c.Name,
                             Time = p.DateOfPayment,
                             Totalprice = p.TotalPrice
                         };
            return result.ToArray();
        }

        public bool InsertBill(tblBill bill)
        {
            try
            {
                return true;
            }
            catch
            {
                return false;
            }
        }

        public Array SearchCustomerInBill(string name)
        {
            
            var result = from p in db.tblBills.ToList()
            join c in db.tblCustomers
                         on
                         p.CustomerId equals c.Id
                         select new
                         {
                             Name = c.Name
                         };
            var listName = from c in result
                           where c.Name.Contains(name)
                           select c;
            return listName.ToArray();
                   
        }
        public bool DeleteBill(int id)
        {
            try
            {
                var bill = db.tblBills.FirstOrDefault(emp => emp.Id == id);
                db.tblBills.DeleteOnSubmit(bill);
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public double GetRevenueInMay()
        {
            return 0;//dalBill.GetRevenueInMay();
        }

        public double GetRevenueInJune()
        {
            return 0;// dalBill.GetRevenueInJune();
        }

        public double GetRevenueInJuly()
        {
            return 0;// dalBill.GetRevenueInJuly();
        }
    }
}
