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
    public partial class Default : System.Web.UI.Page
    {
        DataModel dm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count == 0)
            {
                lv_makaleler.DataSource = dm.MakaleListele();
                lv_makaleler.DataBind();

            }
            else
            {
                int id = Convert.ToInt32(Request.QueryString["kid"]);
                if (dm.MakaleListele().Count(s => s.Kategori_ID == id) != 0)
                {
                    lv_makaleler.DataSource = dm.MakaleListele().Where(s => s.Kategori_ID == id);
                    lv_makaleler.DataBind();
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
           
        }

        
    }
}