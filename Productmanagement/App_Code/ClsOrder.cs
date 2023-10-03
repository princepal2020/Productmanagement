using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Productmanagement.App_Code
{
    public class ClsOrder : ClsConnectionString
    {
        public int ProductOrder(string Order_Id, string StockId, string Qunatity, string Order_By, string PRICE, string total_amount, string PaymentIamge, string paymentmode)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_TblOrderProductInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Order_Id", Order_Id);
                cmd.Parameters.AddWithValue("@StockId", StockId);
                cmd.Parameters.AddWithValue("@Qunatity", Qunatity);
                cmd.Parameters.AddWithValue("@Order_By", Order_By);
                cmd.Parameters.AddWithValue("@PRICE", Convert.ToDecimal(PRICE));
                cmd.Parameters.AddWithValue("@Total_Amount", Convert.ToDecimal(total_amount));
                cmd.Parameters.AddWithValue("@PaymentIamge", PaymentIamge);
                cmd.Parameters.AddWithValue("@Status", "Pending");
                cmd.Parameters.AddWithValue("@paymentmode", paymentmode);
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
        public DataTable GetOrder(string userid)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_GetOrderList", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataAdapter Adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                Adp.Fill(dt);
                return dt;
            }
            catch (Exception Ex)
            {
                return null;
            }
        }
        public DataTable GetOrder()
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_GetAdminOrderListAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
               
                SqlDataAdapter Adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                Adp.Fill(dt);
                return dt;
            }
            catch (Exception Ex)
            {
                return null;
            }
        }

        public DataTable GetCustomerList(string sellerid)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("SELECT *FROM TblCustomerMaster WHERE CreateBy="+ sellerid, con);
                cmd.CommandType = CommandType.Text;

                SqlDataAdapter Adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                Adp.Fill(dt);
                return dt;
            }
            catch (Exception Ex)
            {
                return null;
            }
        }
        public int UpdateOrderStatus(string orderid, string status, string userid)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_UpdateOrderStatus", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@order_id", orderid);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@updatby", userid);
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

        public int AddSallerStock(string salllerid, string stockid, string quentity, string price)
        {
            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_AddSallerStock", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@SellerID", salllerid);
                cmd.Parameters.AddWithValue("@Stockid", Convert.ToInt32(stockid));
                cmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(quentity));
                cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(price));
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

        public DataTable Getqunatity(string stockid)
        {

            try
            {
                string constr = getconnection();
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("Sp_GetQuantity", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@stockId", Convert.ToInt32(stockid));
                SqlDataAdapter Adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                Adp.Fill(dt);
                return dt;
            }
            catch (Exception Ex)
            {
                return null;
            }

        }
    }
}