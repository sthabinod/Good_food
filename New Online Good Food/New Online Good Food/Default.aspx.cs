using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_Online_Good_Food
{
    
    public partial class _Default : Page
    {
        public string kow;
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            con.ConnectionString = @"Data Source = localhost;Persist Security Info=True;User ID=database_cw;Password=database_cw;Unicode=True";
            con.Open();
            cmd.CommandText = "select count(address_id) from address";
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                kow = rd["address_id"].ToString();

            }
            this.DataBind();

        }

        protected void Chart1_Load(object sender, EventArgs e)
        {
            
        }

        //public string GetSelectStatement()
        //{
        //    String ConnectionString =@"Data Source = localhost;Persist Security Info=True;User ID=database_cw;Password=database_cw;Unicode=True";
        //    SqlConnection conn = new SqlConnection(ConnectionString);
        //    string selectStatement = "select count(address_id) from address";
        //    SqlCommand comm = new SqlCommand(selectStatement, conn);
        //    comm.CommandType = System.Data.CommandType.Text;
        //    SqlDataReader reader = comm.ExecuteReader();

        //    // My code has a while, but you shouldn't need it with only one record
        //    reader.Read();
        //    string ID = (string)reader["ID"];
        //    return ID;
        //}
    }
}
