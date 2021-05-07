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
    public partial class MakaleGuncelle : System.Web.UI.Page
    {
        DataModel dm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count != 0)
                {
                    ddl_kategoriler.DataSource = dm.KategoriListele();
                    ddl_kategoriler.DataBind();
                    int id = Convert.ToInt32(Request.QueryString["makid"]);
                    Makale m = dm.MakaleGetir(id);
                    tb_baslik.Text = m.Baslik;
                    tb_icerik.Text = m.Icerik;
                    ddl_kategoriler.SelectedValue = m.Kategori_ID.ToString();
                    img_resim.ImageUrl = "../MakaleResim/" + m.KapakResim;
                }
                else { Response.Redirect("MakaleListele.aspx"); }
            }

        }

        protected void lbtn_ekle_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["makid"]);
            Makale m = dm.MakaleGetir(id);
            m.Kategori_ID = Convert.ToInt32(ddl_kategoriler.SelectedItem.Value);
            m.Icerik = tb_icerik.Text;
            m.Baslik = tb_baslik.Text;
            if (fu_resim.HasFile)
            {
                FileInfo fi = new FileInfo(fu_resim.FileName);
                string uzanti = fi.Extension;
                string dosyaAdi = Guid.NewGuid().ToString() + uzanti;
                if (uzanti == ".jpg" || uzanti == ".png" || uzanti == ".gif")
                {
                    fu_resim.SaveAs(Server.MapPath("../MakaleResim/" + dosyaAdi));
                    m.KapakResim = dosyaAdi;
                    img_resim.ImageUrl = "../MakaleResim/" + dosyaAdi;
                }
            }
            if (dm.MakaleGuncelle(m))
            {
                pnl_basarili.Visible = true;
                pnl_basarisiz.Visible = false;
            }
            else
            {
                pnl_basarili.Visible = false;
                pnl_basarisiz.Visible = true;
            }
            //Response.Redirect("MakaleGuncelle.aspx?makid=" + id);
        }
    }
}