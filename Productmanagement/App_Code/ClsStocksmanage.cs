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
        public int AddQuntity(string product_code ,string quntity )
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
            catch(Exception ex)
            {
                return 0;
            }
        }
        public DataTable GetStocks()
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_GetStocks", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                return dt;
            }
            catch(Exception ex)
            {
                return null;
            }
        }
        public int AddStocks(string product_code, string product_name, string brand_name, string Quantity, string sizeid, string discounttype, string descount, string productmrp, string productprice, string sellprice, string MFGDate, string expiredate, string Createby,string Taxid)
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
                cmd.Parameters.AddWithValue("@SellPrice",Convert.ToDecimal( sellprice));
                cmd.Parameters.AddWithValue("@MFGDate", MFGDate);
                cmd.Parameters.AddWithValue("@ExpriyDate", expiredate);
                cmd.Parameters.AddWithValue("@CreateBy", Createby);
                cmd.Parameters.AddWithValue("@TaxTypeId",Convert.ToInt32( Taxid));
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
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_GetTblSizeMaster", con);
                cmd.CommandType = CommandType.StoredProcedure;
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
        public DataTable GetTaxType()
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_GetTblTaxd", con);
                cmd.CommandType = CommandType.StoredProcedure;
               
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
      
        public DataTable GetTaxType(string id )
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
    }
}