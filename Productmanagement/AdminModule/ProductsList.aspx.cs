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
    public partial class ProductsList : System.Web.UI.Page
    {
        ClsAddproducts addproducts = new ClsAddproducts();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["CurrentPage"] = 1;
                GetDataList();
            }
        }

        public void GetDataList()
        {
            try
            {
                DataTable dt = addproducts.Getaddpimagejoin();
                if(dt!=null && dt.Rows.Count > 0)
                {
                   
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
            }
            catch(Exception ex)
            {

            }
        }

       

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                string product_code = e.CommandArgument.ToString();
                Response.Redirect ("AddProducts.aspx?product_code="+ product_code);
            }
            else if (e.CommandName == "Update")
            {
                string product_code = e.CommandArgument.ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive1').modal();", true);
                DataTable dt = addproducts.GetProductcode(product_code);
                if(dt!=null && dt.Rows.Count > 0)
                {
                    lblproductcode.Text = dt.Rows[0]["product_code"].ToString();
                    lblproductname.Text = dt.Rows[0]["product_Name"].ToString();
                    lblbrandame.Text = dt.Rows[0]["Brand_Name"].ToString();
                    lblhsncode.Text = dt.Rows[0]["product_hsn_ode"].ToString();
                    lblserialno.Text = dt.Rows[0]["product_serial_no"].ToString();
                    lbldetails.Text = dt.Rows[0]["product_details"].ToString();
                    lblbarcode.Text = dt.Rows[0]["product_varcode"].ToString();
                    
                }
            }
            else if(e.CommandName == "Delete")
            {
               
                lblmassege.Text = e.CommandArgument.ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive2').modal();", true);

            }
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            int result = addproducts.Deleteproducts(lblmassege.Text);
            if(result >0)
            {
                GetDataList();
            }
            else
            {

            }
        }
    }
}