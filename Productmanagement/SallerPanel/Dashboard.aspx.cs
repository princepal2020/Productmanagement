using Productmanagement.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SallerPanel.SallerPanel
{
    public partial class Dashboard : System.Web.UI.Page
    {
        ClsStocksmanage clsStocksmanage = new ClsStocksmanage();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDashboardData();
            }
        }

         public void GetDashboardData()
        {
            try
            {
                string sallerid = Session["userid"].ToString();
                DataTable totalsellitem = clsStocksmanage.GetSellitemSaller(sallerid);
                DataTable totalsellercustomer = clsStocksmanage.GetSallerCustomer(sallerid);
                DataTable totalitems = clsStocksmanage.GetSallerTotalItems(sallerid);
                if (totalsellitem.Rows.Count > 0 && totalsellercustomer.Rows.Count>0 && totalitems.Rows.Count>0)
                {
                    totalcustomer.InnerText = totalsellercustomer.Rows[0]["totalCustomer"].ToString(); 
                    totalsell.InnerText= totalsellitem.Rows[0]["totalsell"].ToString();
                    totalitem.InnerText= totalitems.Rows[0]["totalitems"].ToString();
                }

            }catch(Exception ex)
            {

            }
        }
    }
}