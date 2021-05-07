using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BurcinAkan_Blog
{
    public partial class GirisYap : System.Web.UI.Page
    {
       
            DataModel dm = new DataModel();
           

            protected void lbtn_girisYap_Click(object sender, EventArgs e)
            {
                Uye u = dm.UyeGirisYap(tb_mail.Text.Trim(), tb_sifre.Text.Trim());
                if (u != null)
                {
                    if (u.Durum != false)
                    {
                        if (u.MailAktivasyon != false)
                        {
                            Session["Uye"] = u;
                            Response.Redirect("Default.aspx");
                        }
                        else
                        {
                            lbl_mesaj.Text = "Lütfen Mail Adresinizi Onaylayınız.";
                        }
                    }
                    else
                    {
                        lbl_mesaj.Text = "Üyeliğiniz askıya alınmıştır.";
                    }
                }
                else
                {
                    lbl_mesaj.Text = "Üyelik bilgileriniz bulunamadı.";
                }
            }
        }
    }
