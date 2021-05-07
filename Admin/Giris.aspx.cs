using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BurcinAkan_Blog.Admin
{
    public partial class Giris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void lbtn_girisYap_Click(object sender, EventArgs e)
        {
            DataModel dm = new DataModel();
            if (!String.IsNullOrEmpty(tb_mail.Text) && !String.IsNullOrEmpty(tb_sifre.Text))
            {
                Yonetici y = dm.AdminGirisYap(tb_mail.Text.Trim(), tb_sifre.Text.Trim());
                if (y != null)
                {
                    if (y.Durum)
                    {
                        Session["yonetici"] = y;
                        Response.Redirect("Default.aspx");
                        //bu noktada yazılanlar çalışmaz
                    }
                    else
                    {
                        lbl_mesaj.Text = "Kullanıcı Hesabı duraklatılmış";
                    }
                }
                else
                {
                    lbl_mesaj.Text = "Kullanıcı Bulunamadı";
                }
            }
            else
            {
                lbl_mesaj.Text = "Mail adresi veya şifre boş olamaz!!!";
            }
            //dm.AdminGirisYap()
        }
    }   
}
