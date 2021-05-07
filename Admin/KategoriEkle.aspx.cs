using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BurcinAkan_Blog.Admin
{
    public partial class KategoriEkle : System.Web.UI.Page
    {
        DataModel dm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lv_kategoriler.DataSource = dm.KategoriListele();
            lv_kategoriler.DataBind();
            if (!IsPostBack)
            {
                if (Request.QueryString.Count != 0)
                {
                    Kategori kat = dm.KategoriGetir(Convert.ToInt32(Request.QueryString["katid"]));
                    tb_isim.Text = kat.Isim;
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
                Kategori k = new Kategori();
                k.Isim = tb_isim.Text;
                if (dm.KategoriEkle(k))
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
                lv_kategoriler.DataSource = dm.KategoriListele();
                lv_kategoriler.DataBind();
            }
        }

        protected void lv_kategoriler_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            //listView içerisinde link button ile silme işlemi yapılacaksa bu metot kullanılmalıdır
            int id = Convert.ToInt32(e.CommandArgument);
            int sayi = dm.MakaleListele().Count(s => s.Kategori_ID == id);
            if (sayi == 0)
            {
                dm.KategoriSil(id);
            }
            else
            {
                pnl_basarisiz.Visible = true;
            }
            lv_kategoriler.DataSource = dm.KategoriListele();
            lv_kategoriler.DataBind();
        }

        protected void lbtn_guncelle_Click(object sender, EventArgs e)
        {
            Kategori kat = dm.KategoriGetir(Convert.ToInt32(Request.QueryString["katid"]));
            kat.Isim = tb_isim.Text;
            dm.KategoriGuncelle(kat);
            Response.Redirect("KategoriEkle.aspx");
        }
    }
}