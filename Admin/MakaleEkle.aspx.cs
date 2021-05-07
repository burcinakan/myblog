using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BurcinAkan_Blog.Admin
{
    public partial class MakaleEkle : System.Web.UI.Page
    {
        DataModel dm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Kategori> Kategoriler = dm.KategoriListele();
            ddl_kategoriler.DataSource = Kategoriler;
            ddl_kategoriler.DataBind();
        }

        protected void lbtn_ekle_Click(object sender, EventArgs e)
        {
            //File upload kontrolümde dosya seçilmiş ise
            Makale m = new Makale();
            m.Baslik = tb_baslik.Text;
            m.EklemeTarih = DateTime.Now;
            m.Goruntuleme = 0;
            m.Icerik = tb_icerik.Text;
            m.Kategori_ID = Convert.ToInt32(ddl_kategoriler.SelectedItem.Value);
            m.OrtalamaPuan = 0;
            m.PuanAdet = 0;
            m.Yonetici_ID = ((Yonetici)Session["yonetici"]).ID;
            m.Durum = true;
            if (fu_resim.HasFile)
            {
                //Dosya Hakkında Bilgi Verir
                FileInfo fi = new FileInfo(fu_resim.FileName);
                string uzanti = fi.Extension;//uzantı her zaman . ile beraber gelir
                string dosyaAdi = Guid.NewGuid().ToString() + uzanti;
                if (uzanti == ".jpg" || uzanti == ".png" || uzanti == ".gif")//dosyanı uzantısı
                {
                    fu_resim.SaveAs(Server.MapPath("../MakaleResim/" + dosyaAdi));
                    m.KapakResim = dosyaAdi;
                }
            }
            if (dm.MakaleEkle(m))
            {
                pnl_basarili.Visible = true;
                pnl_basarisiz.Visible = false;
            }
            else
            {
                pnl_basarili.Visible = false;
                pnl_basarisiz.Visible = true;
            }
        }
    }
}