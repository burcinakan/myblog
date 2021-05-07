using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BurcinAkan_Blog.Admin
{
    public partial class MakaleListele : System.Web.UI.Page
    {
        DataModel dm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            //.Where kullanımı linq to object
            //=> lambda expresion
            //lv_makaleler.DataSource = dm.MakaleListele().Where(s=> s.Durum==true);
            if (!IsPostBack)
            {
                lv_makaleler.DataSource = dm.MakaleListele();
                lv_makaleler.DataBind();

            }
        }

        protected void lv_makaleler_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "durum")
            {
                dm.DurumDegistir(id);
            }
            else if (e.CommandName == "sil")
            {
                dm.MakaleSil(id);
            }
            Response.Redirect("MakaleListele.aspx");
        }

        protected void lv_makaleler_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            lv_makaleler_pager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            lv_makaleler.DataSource = dm.MakaleListele();
            lv_makaleler.DataBind();
        }

        protected void ddl_sirala_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_sirala.SelectedItem.Value == "1")
            {

                lv_makaleler.DataSource = dm.MakaleListele().OrderBy(s => s.Goruntuleme).ToList();
                lv_makaleler.DataBind();
            }
            else if (ddl_sirala.SelectedItem.Value == "2")
            {
                lv_makaleler.DataSource = dm.MakaleListele().OrderByDescending(s => s.Goruntuleme).ToList();
                lv_makaleler.DataBind();
            }
        }
    }
}