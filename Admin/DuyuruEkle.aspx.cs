using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BurcinAkan_Blog.Admin
{
    public partial class DuyuruEkle : System.Web.UI.Page
    {
        DataModel dm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {

            lv_duyurular.DataSource = dm.DuyuruListele();
            lv_duyurular.DataBind();
            if (!IsPostBack)
            {
                if (Request.QueryString.Count != 0)
                {
                    Duyuru duy = dm.DuyuruGetir(Convert.ToInt32(Request.QueryString["duyid"]));
                    tb_isim.Text = duy.Baslik;
                    lbtn_guncelle.Visible = true;
                    lbtn_ekle.Visible = false;
                }
                else
                {
                    lbtn_guncelle.Visible = false;
                    lbtn_ekle.Visible = true;
                }
            }

        }

        protected void lbtn_ekle_Click(object sender, EventArgs e)
        {

            if (!String.IsNullOrEmpty(tb_isim.Text))
            {
                Duyuru d = new Duyuru();
                d.Baslik = tb_isim.Text;
                if (dm.DuyuruEkle(d))
                {

                    pnl_basarili.Visible = true;
                    pnl_basarisiz.Visible = false;
                }
                else
                {
                    pnl_basarili.Visible = false;
                    pnl_basarisiz.Visible = true;
                }
                tb_isim.Text = "";
                lv_duyurular.DataSource = dm.DuyuruListele();
                lv_duyurular.DataBind();
            }
        }

        protected void lv_duyurular_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            int sayi = dm.DuyuruListele().Count(d => d.ID == id);
            if (sayi == 0)
            {
                dm.DuyuruSil(id);
            }
            else
            {
                pnl_basarisiz.Visible = true;
            }
            lv_duyurular.DataSource = dm.DuyuruListele();
            lv_duyurular.DataBind();
        }

        protected void lbtn_guncelle_Click(object sender, EventArgs e)
        {
            Duyuru duy = dm.DuyuruGetir(Convert.ToInt32(Request.QueryString["duyid"]));
            duy.Baslik = tb_isim.Text;
            dm.DuyuruGuncelle(duy);
            Response.Redirect("DuyuruEkle.aspx");
        }

    }
}