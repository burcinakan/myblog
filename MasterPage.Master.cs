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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
       
            DataModel dm = new DataModel();
            protected void Page_Load(object sender, EventArgs e)
            {
                lv_kategoriler.DataSource = dm.KategoriListele();
                lv_kategoriler.DataBind();
                if (Session["uye"] != null)
                {
                    Uye u = (Uye)Session["uye"];
                    lbl_uye.Text = u.Isim + " " + u.Soyad;
                    pnl_girisVar.Visible = true;
                    pnl_girisYok.Visible = false;
                }
                else
                {
                    pnl_girisVar.Visible = false;
                    pnl_girisYok.Visible = true;
                }
            lv_duyurular.DataSource = dm.DuyuruListele();
            lv_duyurular.DataBind();
            if (Session["uye"] != null)
            {
                Uye u = (Uye)Session["uye"];
                lbl_uye.Text = u.Isim + " " + u.Soyad;
                pnl_girisVar.Visible = true;
                pnl_girisYok.Visible = false;
            }
            else
            {
                pnl_girisVar.Visible = false;
                pnl_girisYok.Visible = true;
            }
        }

            protected void lbtn_cikisYap_Click(object sender, EventArgs e)
            {
                Session["uye"] = null;
                Response.Redirect("Default.aspx");
            }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
          
        }

    }
    
}