using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Productmanagement.App_Code
{
    public class ClsAddCategory_SubCategory : ClsConnectionString
    {
        public DataTable UpdateProduct(string product_code)
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("SP_CategoryGet", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@product_code", product_code);
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
        public DataTable GetCategoty()
        {
            try
            {
                commandname = "SP_CategoryGet";
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
            //    SqlCommand cmd = new SqlCommand("SP_CategoryGet", con);
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
        public DataTable GetSubCategoty( string categoryid)
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("Sp_GetSubCategory", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CatogeryId", Convert.ToInt32( categoryid));
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
        public int AddCategory(string categoryname, string description, string userid)
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("SP_InsertCatogery", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CatogeryName", categoryname);
                cmd.Parameters.AddWithValue("@CatogeryDescription", description);
                cmd.Parameters.AddWithValue("@createby", userid);
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

        public int AddSubCategory(string categoryid, string subcategoryname, string description ,string userid)
        {
            try
            {
                string strcon = getconnection();
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("SP_InsertSubCatogery", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SubCatogeryName", subcategoryname);
                cmd.Parameters.AddWithValue("@SubCatogeryDescription", description);
                cmd.Parameters.AddWithValue("@CatogeryId", Convert.ToInt32(categoryid));
                cmd.Parameters.AddWithValue("@createby", userid);
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