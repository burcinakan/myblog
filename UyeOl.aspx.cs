using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BurcinAkan_Blog
{
    public partial class UyeOl : System.Web.UI.Page
    {
        DataModel dm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtn_uyeOl_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(tb_isim.Text) && !string.IsNullOrEmpty(tb_soyad.Text) && !string.IsNullOrEmpty(tb_mail.Text) && !string.IsNullOrEmpty(tb_sifre.Text) && !string.IsNullOrEmpty(tb_sifre_tekrar.Text) && !string.IsNullOrEmpty(tb_mail_tekrar.Text))
            {
                if (tb_mail.Text == tb_mail_tekrar.Text)
                {
                    if (tb_sifre.Text == tb_sifre_tekrar.Text)
                    {
                        Helpers h = new Helpers();
                        string aktivasyon = h.AktivasyonUret();
                        int sonuc = dm.UyeOl(new Uye()
                        {
                            Isim = tb_isim.Text,
                            Soyad = tb_soyad.Text,
                            Sifre = tb_sifre_tekrar.Text,
                            Email = tb_mail.Text,
                            Durum = true,
                            UyelikTarihi = DateTime.Now,
                            MailAktivasyon = false,
                            AktivasyonKodu = aktivasyon,
                        });
                        if (sonuc == 100)
                        {
                            lbl_mesaj.Text = "Bir hata oluştu.";
                        }
                        else if (sonuc == 101)
                        {
                            lbl_mesaj.Text = "Bu mail adresi ile daha önce kayıt olşturulmuş";
                        }
                        else
                        {
                            h.MailGonder(tb_mail.Text, h.AktivasyonMailIcerik(aktivasyon, tb_isim.Text + " " + tb_soyad.Text));
                            lbl_mesaj.Text = "Çok şükür üye olabildin...";
                        }
                    }
                    else
                    {
                        lbl_mesaj.Text = "şifreler eşleşmiyor";
                    }
                }
                else
                {
                    lbl_mesaj.Text = "Mail adresleri eşleşmiyor";
                }
            }
            else
            {
                lbl_mesaj.Text = "Lütfen tüm metin alanlarını doldurunuz";
            }
        }
    }
}