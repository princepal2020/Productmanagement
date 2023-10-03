using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Productmanagement.App_Code
{
    public class ClsConnectionString
    {


        public string commandname;


        public string connection = "Data Source=103.48.51.217,1232;DataBase=Product_management_DB   ;User Id=sa;Password=ffbj*2hFWn#2sn3@dd";
        //public string connection = "Data Source=SERVER;Initial Catalog=demo2;Integrated Security=True";
        public string getconnection()
        {
            return connection;
        }

        public DataTable GetWithoutParameter()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                SqlCommand cmd = new SqlCommand(commandname, con);
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
