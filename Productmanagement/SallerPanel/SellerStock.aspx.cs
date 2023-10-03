using Productmanagement.App_Code;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Productmanagement.SallerPanel
{
    public partial class SellerStock : System.Web.UI.Page
    {
        ClsStocksmanage stocksmanage = new ClsStocksmanage();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getallusers(0);
            }
        }

        public void getallusers(int pagenumber)
        
        
        {

            try
            {
                string userid = Session["userid"].ToString();
                //DataTable ds = addproducts.SallerSearching(txtsearch.Text);
                DataTable dt = stocksmanage.GetSellerStock(userid);

                if (dt.Rows.Count > 0)
                {

                    PagedDataSource pgitems = new PagedDataSource();
                    //if (txtsearch.Text != null && txtsearch.Text != "")
                    //{
                    //    pgitems.DataSource = ds.DefaultView;
                    //    pgitems.AllowPaging = true;
                    //}
                    //else
                    //{
                    pgitems.DataSource = dt.DefaultView;
                    pgitems.AllowPaging = true;
                    // }





                    //control page size from here 
                    pgitems.PageSize = 5;
                    pgitems.CurrentPageIndex = pagenumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }


                    Repeater1.DataSource = pgitems;
                    Repeater1.DataBind();


                }
                else
                {
                    Repeater1.DataSource = null;
                    Repeater1.DataBind();
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {

            }
        }
        protected void rptPaging_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            int pagenumber = Convert.ToInt32(e.CommandArgument) - 1;
            getallusers(pagenumber);
        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Order")
            {
                string stockid= e.CommandArgument.ToString();
                Response.Redirect("../SallerPanel/ProductList.aspx?stockid=" + stockid);
               
            }
            else if (e.CommandName == "profit")
            {
                lblstockid.Text = e.CommandArgument.ToString();
              
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive').modal();", true);
            }

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                int result = stocksmanage.SellPriceFixed(txtsellprice.Text, txtdiscount.Text,dd_distcountType.SelectedValue, lblstockid.Text, txtmrp.Text);
                if (result > 0)
                {
                    txtmassage.InnerText = "Sell price save has been success";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
                }
                getallusers(0);

            }
            catch (Exception ex)
            {

            }
        }
    }
}