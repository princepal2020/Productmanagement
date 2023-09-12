using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace Productmanagement.App_Code
{
    public class ClsAddproducts : ClsConnectionString
    {

        public int Deleteproducts(string product_code)
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("Sp_Deletestokaddproduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@product_code", product_code);
                con.Open();
                int result=cmd.ExecuteNonQuery();
                con.Close();
                return result;


            }
            catch(Exception ex) {
                return 0;
            }
        }
        public int productsUpdate(string  brand_name,string produts_name,string serialno,string shncode,string description,string image1,string image2,string image3,string image4,string image5,string image6,string product_code)
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("Sp_ProductUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@brand_name", brand_name);
                cmd.Parameters.AddWithValue("@Product_Name", produts_name);
                cmd.Parameters.AddWithValue("@Product_serial_No", serialno);
                cmd.Parameters.AddWithValue("@Product_HSN_ode", shncode);
                cmd.Parameters.AddWithValue("@Product_details", description);
                cmd.Parameters.AddWithValue("@Product_Image1", image1);
                cmd.Parameters.AddWithValue("@Product_Image2", image2);
                cmd.Parameters.AddWithValue("@Product_Image3", image3);
                cmd.Parameters.AddWithValue("@Product_Image4", image4);
                cmd.Parameters.AddWithValue("@Product_Image5", image5);
                cmd.Parameters.AddWithValue("@Product_Image6", image6);
                cmd.Parameters.AddWithValue("@Product_code", product_code);
                con.Open();
                int result= cmd.ExecuteNonQuery();
                con.Close();
                return result;


            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public DataTable GetProductcode(string productcode)
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("Sp_TblAddProductImagesGetUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Product_code", productcode);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return dt;
                }
                else
                {
                    return null;
                }


            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable Getaddpimagejoin()
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("Sp_TblAddProductImagesGet", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return dt;
                }
                else
                {
                    return null;
                }


            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public int AddProduct(string barnd_name, string product_Name, string product_code, string category, string subcategory, string hsncode, string serialno, string Product_details, string product_barcode, string userid)
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("Sp_TblAddProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Brand_Name", barnd_name);
                cmd.Parameters.AddWithValue("@Product_Name", product_Name);
                cmd.Parameters.AddWithValue("@Product_code", product_code);
                cmd.Parameters.AddWithValue("@Category", 1);
                cmd.Parameters.AddWithValue("@sub_category", 1);
                cmd.Parameters.AddWithValue("@Product_HSN_ode", hsncode);
                cmd.Parameters.AddWithValue("@Product_serial_No", serialno);
                cmd.Parameters.AddWithValue("@Product_details", Product_details);
                cmd.Parameters.AddWithValue("@Product_varcode", product_barcode);
                cmd.Parameters.AddWithValue("@CreateBy", Convert.ToInt32(userid));
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
        public int Addproductimage(int product_id, string Product_Image1, string Product_Image2, string Product_Image3, string Product_Image4, string Product_Image5, string Product_Image6, string userid)
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("sp_TblProductImage", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@product_id", product_id);
                cmd.Parameters.AddWithValue("@Product_Image1", Product_Image1);
                cmd.Parameters.AddWithValue("@Product_Image2", Product_Image2);
                cmd.Parameters.AddWithValue("@Product_Image3", Product_Image3);
                cmd.Parameters.AddWithValue("@Product_Image4", Product_Image4);
                cmd.Parameters.AddWithValue("@Product_Image5", Product_Image5);
                cmd.Parameters.AddWithValue("@Product_Image6", Product_Image6);
                cmd.Parameters.AddWithValue("@CreateBy", Convert.ToInt32(userid));
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