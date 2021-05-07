using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BurcinAkan_Blog
{
    public partial class arama : System.Web.UI.Page
    {
        DataModel dmm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            int queryCount = Request.QueryString.Count;
            var sorgu = "";
            if (queryCount>1)
            {
                for (int i =0; i <queryCount; i++)
                {
                    sorgu += "Baslik LIKE '%" + Request.QueryString[i] + "%' or";                  
                }
                sorgu = sorgu.Substring(0, sorgu.Length - 3);

            }
            else
            {
                sorgu = "Baslik LIKE '%" + Request.QueryString[0] + "%'";
            }
            SqlConnection cnn = new SqlConnection("Data Source = LAPTOP - 67I32MNL; Initial Catalog = blogsitesi; Integrated Security = True");
            SqlCommand cmd = new SqlCommand("Select * from Makaleler where " + sorgu, cnn);
            cnn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Response.Write(dr["Baslik"].ToString());
            }
            else
            {
                Response.Write("No rows found.");
            }
            dr.Close();

        }
    }
}