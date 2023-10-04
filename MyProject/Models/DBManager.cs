using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

namespace Myproject.Models
{
    public class DbManager
    {
        SqlConnection connection = new SqlConnection("Data Source=AYUSHSRIVASTAVA\\SQLEXPRESS;Initial Catalog=10MinZepto;Integrated Security=True");
        public int executeInsertUpdateDelete(string query)
        {
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int result = command.ExecuteNonQuery();
            connection.Close();
            return result;
        }
        public DataTable executeSelect(string query)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }
    }
}