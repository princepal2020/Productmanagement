using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Productmanagement.App_Code
{
    public class ClsStocksmanage : ClsConnectionString
    {
        public int AddQuntity(string product_code, string quntity)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_QuntityAdd", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@product_code", product_code);
                cmd.Parameters.AddWithValue("@quntity", Convert.ToInt32(quntity));
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                return result;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public DataTable GetStocks()
        {
            try
            {
                commandname = "Sp_GetStocks";
                DataTable dt = GetWithoutParameter();
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }

            //try{
            //    string strcon = getconnection();
            //    SqlConnection con = new SqlConnection(strcon);
            //    SqlCommand cmd = new SqlCommand("Sp_GetStocks", con);
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    SqlDataAdapter adp = new SqlDataAdapter(cmd);
            //    DataTable dt = new DataTable();
            //    adp.Fill(dt);
            //    return dt;  

            //}
            //catch (Exception ex)
            //{
            //    return null;
            //}

        }
        public int AddStocks(string product_code, string product_name, string brand_name, string Quantity, string sizeid, string discounttype, string descount, string productmrp, string productprice, string sellprice, string MFGDate, string expiredate, string Createby, string Taxid)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_TblStockManage", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductCode", product_code);
                cmd.Parameters.AddWithValue("@ProductName", product_name);
                cmd.Parameters.AddWithValue("@BrandName", brand_name);
                cmd.Parameters.AddWithValue("@Quantity", Quantity);
                cmd.Parameters.AddWithValue("@SizeID", Convert.ToInt32(sizeid));
                cmd.Parameters.AddWithValue("@DistCountType", discounttype);
                cmd.Parameters.AddWithValue("@Discount", Convert.ToDecimal(descount));
                cmd.Parameters.AddWithValue("@ProductMRP", Convert.ToDecimal(productmrp));
                cmd.Parameters.AddWithValue("@ProductPrice", Convert.ToDecimal(productprice));
                cmd.Parameters.AddWithValue("@SellPrice", Convert.ToDecimal(sellprice));
                cmd.Parameters.AddWithValue("@MFGDate", MFGDate);
                cmd.Parameters.AddWithValue("@ExpriyDate", expiredate);
                cmd.Parameters.AddWithValue("@CreateBy", Createby);
                cmd.Parameters.AddWithValue("@TaxTypeId", Convert.ToInt32(Taxid));
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                return result;

            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public DataTable GetSize()
        {
            try
            {
                commandname = "Sp_GetTblSizeMaster";
                DataTable dt = GetWithoutParameter();
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }

            //try
            //{
            //    string strcon = getconnection();
            //    SqlConnection con = new SqlConnection(strcon);
            //    SqlCommand cmd = new SqlCommand("Sp_GetTblSizeMaster", con);
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    SqlDataAdapter adp = new SqlDataAdapter(cmd);
            //    DataTable dt = new DataTable();
            //    adp.Fill(dt);
            //    return dt;  

            //}
            //catch (Exception ex)
            //{
            //    return null;
            //}

        }
        public DataTable GetTaxType()
        {
            try
            {
                commandname = "Sp_GetTblTaxd";
                DataTable dt = GetWithoutParameter();
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }

            //try
            //{
            //    string strcon = getconnection();
            //    SqlConnection con = new SqlConnection(strcon);
            //    SqlCommand cmd = new SqlCommand("Sp_GetTblTaxd", con);
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    SqlDataAdapter adp = new SqlDataAdapter(cmd);
            //    DataTable dt = new DataTable();
            //    adp.Fill(dt);
            //    return dt;  

            //}
            //catch (Exception ex)
            //{
            //    return null;
            //}
        }

        public DataTable GetTaxType(string id)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_GetTblTax", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TblTax", Convert.ToInt32(id));
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public int AddSize(string size, string description, string userid)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_TblSizeMaster", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SizeName", size);
                cmd.Parameters.AddWithValue("@Size_Description", description);
                cmd.Parameters.AddWithValue("@CreateBy", userid);
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                return result;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public int AddTax(string CGST, string c, string IGST, string userid)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_TblTax", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CGST", Convert.ToInt32(CGST));
                cmd.Parameters.AddWithValue("@SGST", Convert.ToInt32(CGST));
                cmd.Parameters.AddWithValue("@IGST", Convert.ToInt32(IGST));
                cmd.Parameters.AddWithValue("@CreateBy", userid);
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                return result;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public DataTable Searching(string tsxt)
        {
            string strcon = getconnection();
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("Sp_SearchStock", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Search", tsxt);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            return dt;
        }
        public DataTable GetSellerStock(string userid)
        {
            string strcon = getconnection();
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("Sp_GetSaller", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@userid", userid);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            return dt;
        }
        public int SellPriceFixed(string sell_Price, string SDiscount, string DisCountType, string SellerStockId, string ProductMRP)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_SellPriceFixed", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sell_Price", Convert.ToDecimal(sell_Price));
                cmd.Parameters.AddWithValue("@SDiscount", Convert.ToDecimal(SDiscount));
                cmd.Parameters.AddWithValue("@DisCountType", Convert.ToDecimal(DisCountType));
                cmd.Parameters.AddWithValue("@SellerStockId", Convert.ToDecimal(SellerStockId));
                cmd.Parameters.AddWithValue("@MRP", Convert.ToDecimal(ProductMRP));
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                return result;

            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public DataTable GetTotalItemAdmin()
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("select  isnull (sum (Quantity),0)as Total_Quantity from tblStockManage", con);
                cmd.CommandType = CommandType.Text;
               
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable GetTotalSaller()
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("select count(*) as TotalSaller from TblUSerMaster where ParentId=2", con);
                cmd.CommandType = CommandType.Text;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable GetTotalSell()
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("select  isnull(sum  (qunatity),0)as Totalapprove from  TblOrderProduct where Status='Approve'", con);
                cmd.CommandType = CommandType.Text;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable GetTotalPending()
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("select  count(*) Totalpendig from  TblOrderProduct where Status='Pending'", con);
                cmd.CommandType = CommandType.Text;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable GetTotalReject()
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("select  count(*)as Totalreject from  TblOrderProduct where Status='Reject' and Status='Cancel'", con);
                cmd.CommandType = CommandType.Text;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable GetCustomerList()
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("select Count(*)as totalCustomer from tblcustomermaster", con);
                cmd.CommandType = CommandType.Text;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable GetSellitemSaller(string sellarid)
        {               
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("select SUM(isnull(Sell_Quentity,0)) as totalsell from TblSellMaster where SellBy=" + sellarid, con);
                cmd.CommandType = CommandType.Text;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable GetSallerCustomer(string sellarid)
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("select count(*)as totalCustomer from  TblCustomerMaster where CreateBy=" + sellarid, con);
                cmd.CommandType = CommandType.Text;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable GetSallerTotalItems(string sellarid)
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("select sum(isnull(Quantity,0))as totalitems from TblSalllerStock where SellerID=" + sellarid, con);
                cmd.CommandType = CommandType.Text;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public int AddCustomer(string Customerid,string Name,string Mobil_No,string sallerid)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("SP_InsertCustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Customerid", Customerid);
                cmd.Parameters.AddWithValue("@Name", Name);
                cmd.Parameters.AddWithValue("@Mobil_No", Mobil_No);
                cmd.Parameters.AddWithValue("@status", "1");
                cmd.Parameters.AddWithValue("@CreateBy", sallerid);
                
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                return result;

            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public int AddSellProduct(string Sell_Quentity,string Customer_id,string Product_Code,string Cstockid,string SellBy)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_TblSellMaster", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Sell_Quentity", Convert.ToInt32(Sell_Quentity));
                cmd.Parameters.AddWithValue("@Customer_id", Customer_id);
                cmd.Parameters.AddWithValue("@Product_Code", Product_Code);
                cmd.Parameters.AddWithValue("@Cstockid",Convert.ToInt32(Cstockid));
                cmd.Parameters.AddWithValue("@status", "Success");
                cmd.Parameters.AddWithValue("@SellBy", SellBy);
                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();
                return result;

            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public DataTable CheckDuclicateCustomer(string mobile)
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("Sp_CheckCustomerRegister", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Mobil_No", mobile);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

    }
}