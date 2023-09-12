using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Productmanagement.App_Code
{
    public class ClsConnectionString
    {
        public string connection = "Data Source=103.48.51.217,1232;DataBase=Product_management_DB   ;User Id=sa;Password=ffbj*2hFWn#2sn3@dd";
        //public string connection = "Data Source=SERVER;Initial Catalog=demo2;Integrated Security=True";
        public string getconnection()
        {
            return connection;
        }
    }
}
