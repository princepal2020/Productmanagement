using Productmanagement.App_Code;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Productmanagement.AdminModule
{
    public partial class OrderList : System.Web.UI.Page
    {
        ClsOrder clsOrder = new ClsOrder();
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
               
                //DataTable ds = addproducts.SallerSearching(txtsearch.Text);
                DataTable dt = clsOrder.GetOrder();

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
            try
            {
                if (e.CommandName == "ordercancel")
                {
                    ViewState["order_id"] = e.CommandArgument;
                    Label status = (Label)e.Item.FindControl("lblstatus");
                    ViewState["Status"] = status.Text;

                    btn_cancel1.Visible = true;
                    btn_approve.Visible = false;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive2').modal();", true);
                }
                else if (e.CommandName == "approve")
                {
                    Label stock = (Label)e.Item.FindControl("lblstockid");
                    Label Quantity = (Label)e.Item.FindControl("lblbrand");
                    Label price = (Label)e.Item.FindControl("lblmarp");
                    Label status = (Label)e.Item.FindControl("lblstatus");
                    ViewState["Status"] = status.Text;
                   

                    ViewState["order_id"] = e.CommandArgument;
                    ViewState["stock"] = stock.Text;
                    ViewState["Quantity"] = Quantity.Text;
                    ViewState["price"] = price.Text;
                    btn_cancel1.Visible = false;
                    btn_approve.Visible = true;
                    heading.InnerText = "Are you sure you want to approve";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive2').modal();", true);
                }
            }
            catch(Exception ex)
            {

            }
          

        }
        protected void btn_search_Click(object sender, EventArgs e)
        {
            getallusers(0);
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                {


                    Label status = (Label)e.Item.FindControl("lblstatus");
                    status.Width = 90;
                    if (status.Text.ToLower() == "pending")
                    {
                        status.ForeColor = Color.FromArgb(23, 32, 42);
                        status.BackColor = Color.FromArgb(247, 203, 115);



                    }
                    else if (status.Text.ToLower() == "approve")
                    {
                        status.ForeColor = Color.FromArgb(23, 32, 42);
                        status.BackColor = Color.FromArgb(74, 233, 127);

                    }
                    else if(status.Text.ToUpper()== "REJECT")
                    {
                        status.ForeColor = Color.FromArgb(23, 32, 42);

                        status.BackColor = Color.FromArgb(236, 127, 96);

                    }
                    else
                    {
                        status.ForeColor = Color.FromArgb(255, 255, 255);

                        status.BackColor = Color.FromArgb(247, 29, 29);
                    }


                }
            }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {

            string userid = Session["userid"].ToString();
            string order_id = ViewState["order_id"].ToString();
            string status = ViewState["Status"].ToString();
            if(status.ToLower()== "reject" || status.ToLower()== "cancel")
            {
                hmassage.InnerText = "Already Cancel/Reject";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
            }
            else if(status.ToLower() == "approve")
            {
                hmassage.InnerText = "Already approve";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
            }
            else
            {
                int result = clsOrder.UpdateOrderStatus(order_id, "Reject", userid);
                if (result > 0)
                {
                    txtmassage.InnerText = "Order Reject has been success : " + order_id;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);
                    getallusers(0);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
                }
            }
         
            }
        

        protected void btn_approve_Click(object sender, EventArgs e)
        
        {
            string userid = Session["userid"].ToString();
            string order_id = ViewState["order_id"].ToString();
            string stockid = ViewState["stock"].ToString();
            string Quantity = ViewState["Quantity"].ToString();
            string price = ViewState["price"].ToString();
            string status = ViewState["Status"].ToString();
            if (status.ToLower() == "reject" || status.ToLower() == "cancel")
            {
                hmassage.InnerText = "Already Cancel/Reject";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
            }
            else if (status.ToLower() == "approve")
            {
                hmassage.InnerText = "Already approve";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
            }
            else
            {
                DataTable dt = clsOrder.Getqunatity(stockid);
                if (dt.Rows.Count > 0)
                {
                    int maxQuantity =Convert.ToInt32( dt.Rows[0]["Quantity"]);
                    price = dt.Rows[0]["SellPrice"].ToString();
                    if (maxQuantity > Convert.ToInt32(Quantity))
                    {
                        int result = clsOrder.UpdateOrderStatus(order_id, "Approve", userid);
                        if (result > 0)
                        {
                            int rlt = clsOrder.AddSallerStock(userid, stockid, Quantity, price);
                            txtmassage.InnerText = "Order Approve has been success : " + order_id;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);
                            getallusers(0);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
                        }
                    }
                    else
                    {
                        hmassage.InnerText = "Quantity is low";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
                    }
                }
               
            }
            
        }
    }
}