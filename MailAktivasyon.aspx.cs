using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BurcinAkan_Blog
{
    public partial class MailAktivasyon : System.Web.UI.Page
    {
        DataModel dm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count != 0)
            {
                string kod = Request.QueryString["mid"];
                if (dm.MailAktifEt(kod))
                {
                    Response.Redirect("GirisYap.aspx");
                }
                else
                {
                    Response.Redirect("Hata.aspx");
                }

            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}