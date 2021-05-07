using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BurcinAkan_Blog
{
    public partial class MakaleDetay : System.Web.UI.Page
    {
        DataModel dm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count != 0)
            {
                int id = Convert.ToInt32(Request.QueryString["makid"]);
                dm.GoruntulemeArttir(id);
                Makale m = dm.MakaleGetir(id);
                ltrl_baslik.Text = m.Baslik;
                ltrl_icerik.Text = m.Icerik;
                ltrl_goruntuleme.Text = m.Goruntuleme.ToString();
                ltrl_kategori.Text = m.Kategori_ID_Str;
                ltrl_puan.Text = m.OrtalamaPuan.ToString();
                
                if (Session["uye"] != null)
                {
                    pnl_girisVar.Visible = true;
                    pnlGirisYok.Visible = false;
                }
                else
                {
                    pnl_girisVar.Visible = false;
                    pnlGirisYok.Visible = true;
                }
                lv_yorumlar.DataSource = dm.YorumListele(m.ID).Where(s => s.AdminOnay == true);
                lv_yorumlar.DataBind();
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btn_yorumYap_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tb_yorum.Text))
            {
                Yorum y = new Yorum();
                y.AdminOnay = false;
                y.Icerik = tb_yorum.Text;
                y.Makale_ID = Convert.ToInt32(Request.QueryString["makid"]);
                //Uye u = (Uye)Session["uye"];
                //y.Uye_ID = u.ID;
                y.Uye_ID = ((Uye)Session["uye"]).ID;
                y.YorumTarih = DateTime.Now;
                if (dm.YorumEkle(y))
                {
                    Response.Write("<script>alert('Yorum Ekleme Başarılı. ADMİN ONAYI BEKLENİYOR.')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Yorum Ekleme Başarısız')</script>");
                }
            }
        }
    }
}