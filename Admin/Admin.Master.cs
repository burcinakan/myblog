using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BurcinAkan_Blog.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["yonetici"] != null)
            {
                Yonetici y = (Yonetici)Session["yonetici"];
                //lbl_kullanici.Text = ((Yonetici)Session["Yonetici"]).KullaniciAdi;
                lbl_kullanici.Text = y.Isim + " " + y.Soyad + " " + "(" + y.YoneticiTurStr + ")";
            }
            else
            {
                Response.Redirect("Giris.aspx");
            }
        }

        protected void lbl_cikis_Click(object sender, EventArgs e)
        {
            Session["yonetici"] = null;
            Response.Redirect("Giris.aspx");
        }
    }
}

