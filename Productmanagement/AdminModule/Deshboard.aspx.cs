using Productmanagement.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Productmanagement.AdminModule
{
    public partial class Deshboard : System.Web.UI.Page
    {
        ClsStocksmanage clsStocksmanage = new ClsStocksmanage();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDashbordItem();
            }
            if (Session["mobile"] != null)
            {

            }
            else
            {
                Response.Redirect("../Default.aspx");
            }

        }
        public void GetDashbordItem()
        {
            try
            {
                DataTable totalitem= clsStocksmanage.GetTotalItemAdmin();
                DataTable totalpending= clsStocksmanage.GetTotalPending();
                DataTable totalreject= clsStocksmanage.GetTotalReject();
                DataTable totalsaller= clsStocksmanage.GetTotalSaller();
                DataTable totalsell = clsStocksmanage.GetTotalSell();
                DataTable todalCustomer = clsStocksmanage.GetCustomerList();
                if(totalitem.Rows.Count>0 && totalpending.Rows.Count>0 && totalreject.Rows.Count>0 && totalsaller.Rows.Count>0 && totalsell.Rows.Count > 0 && todalCustomer.Rows.Count>0)
                {
                    totalitems.InnerText = totalitem.Rows[0]["Total_Quantity"].ToString();
                    totalsupplier.InnerText = totalsaller.Rows[0]["TotalSaller"].ToString();
                    totalsells.InnerText = totalsell.Rows[0]["Totalapprove"].ToString();
                    totalpendings.InnerText = totalpending.Rows[0]["Totalpendig"].ToString();
                    totalrejects.InnerText = totalreject.Rows[0]["Totalreject"].ToString();
                    totalCustomer.InnerText = todalCustomer.Rows[0]["totalCustomer"].ToString();
                }

            }
            catch (Exception Ex)
            {

            }
        }
    }
}