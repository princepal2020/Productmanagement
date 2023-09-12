using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Net;
using System.Security.Cryptography.X509Certificates;

namespace Productmanagement.App_Code
{
    public class ClsUser : ClsConnectionString
    {
        public DataTable GetState()
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_TblStateMaster", con);
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
        public DataTable GetDistrict(string stateid)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_TblDistrictMAster", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StateId", stateid);
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
        public int AddUSer(string Userid, string Username, string Mobile_no, string Email_id, string Company_Name, string Password, string User_Type, string Address, string Aadhar_No, string Pancard_No, string Gstin_no, string User_image, string Aadhar_image, string Pancard_image, string Store_Name, string Branch_Details, string Dob, string Createby, string state, string District, string city, string Adhar_back_image)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_TblUSerMaster", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Userid", Userid);
                cmd.Parameters.AddWithValue("@Username", Username);
                cmd.Parameters.AddWithValue("@Mobile_no", Mobile_no);
                cmd.Parameters.AddWithValue("@Email_id", Email_id);
                cmd.Parameters.AddWithValue("@Company_Name", Company_Name);
                cmd.Parameters.AddWithValue("@Password", Password);
                cmd.Parameters.AddWithValue("@User_Type", User_Type);
                cmd.Parameters.AddWithValue("@Address", Address);
                cmd.Parameters.AddWithValue("@Aadhar_No", Aadhar_No);
                cmd.Parameters.AddWithValue("@Pancard_No", Pancard_No);
                cmd.Parameters.AddWithValue("@Gstin_no", Gstin_no);
                cmd.Parameters.AddWithValue("@User_image", User_image);
                cmd.Parameters.AddWithValue("@Aadhar_image", Aadhar_image);
                cmd.Parameters.AddWithValue("@Pancard_image", Pancard_image);
                cmd.Parameters.AddWithValue("@Store_Name", Store_Name);
                cmd.Parameters.AddWithValue("@Branch_Details", Branch_Details);
                cmd.Parameters.AddWithValue("@Dob", Dob);
                cmd.Parameters.AddWithValue("@Create_By", Createby);
                cmd.Parameters.AddWithValue("@state", state);
                cmd.Parameters.AddWithValue("@District", District);
                cmd.Parameters.AddWithValue("@city", city);
                cmd.Parameters.AddWithValue("@Adhar_back_image", Adhar_back_image);
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
        public int AddUpdate(string Userid, string Username, string Mobile_no, string Email_id, string Company_Name, string Password, string User_Type, string Address, string Aadhar_No, string Pancard_No, string Gstin_no, string User_image, string Aadhar_image, string Pancard_image, string Store_Name, string Branch_Details, string Dob, string Createby, string state, string District, string city,string adharbackimg)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_UserUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Userid", Userid);
                cmd.Parameters.AddWithValue("@Username", Username);
                cmd.Parameters.AddWithValue("@Mobile_no", Mobile_no);
                cmd.Parameters.AddWithValue("@Email_id", Email_id);
                cmd.Parameters.AddWithValue("@Company_Name", Company_Name);
                cmd.Parameters.AddWithValue("@Password", Password);
                cmd.Parameters.AddWithValue("@Address", Address);
                cmd.Parameters.AddWithValue("@Aadhar_No", Aadhar_No);
                cmd.Parameters.AddWithValue("@Pancard_No", Pancard_No);
                cmd.Parameters.AddWithValue("@Gstin_no", Gstin_no);
                cmd.Parameters.AddWithValue("@User_image", User_image);
                cmd.Parameters.AddWithValue("@Aadhar_image", Aadhar_image);
                cmd.Parameters.AddWithValue("@Pancard_image", Pancard_image);
                cmd.Parameters.AddWithValue("@Store_Name", Store_Name);
                cmd.Parameters.AddWithValue("@Branch_Details", Branch_Details);
                cmd.Parameters.AddWithValue("@Dob", Dob);
                cmd.Parameters.AddWithValue("@UpdateBy", Createby);
                cmd.Parameters.AddWithValue("@state", state);
                cmd.Parameters.AddWithValue("@District", District);
                cmd.Parameters.AddWithValue("@city", city);
                cmd.Parameters.AddWithValue("@Adhar_back_image", adharbackimg);
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
        public int Deleteuser(string userid)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_DeleteUSer", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid",( userid));
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
        public DataTable GetSingleUser(string userid)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_GetUserSigleuser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserId", userid);
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
        public DataTable Getstatewithid(string state)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Select *from tblstateMaster where StateId= "+Convert.ToInt32( state), con);
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
        public DataTable Getdistrictwithid(string did)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Select *from TblDistrictMAster where District_Id= " +Convert.ToInt32(did), con);
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
        public DataTable Getuser()
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_GetUser", con);
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
        public DataTable GetUsertype()
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_GetUserType", con);
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
        public DataTable GetUser()
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_GetUser", con);
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

    }
}





