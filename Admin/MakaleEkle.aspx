<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master"  AutoEventWireup="true" CodeBehind="MakaleEkle.aspx.cs" Inherits="BurcinAkan_Blog.Admin.MakaleEkle" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
    <script src="ckeditor/ckeditor.js"></script>
</asp:Content>
 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Makale Ekle</h2>
    <hr />
    <asp:Panel ID="pnl_basarili" runat="server" Visible="false">
        <div class="mesajbasarili">
            <b>Başarılı!</b> Makale ekleme başarılı
        </div>
    </asp:Panel>
    <asp:Panel ID="pnl_basarisiz" runat="server" Visible="false">
         <div class="mesajbasarisiz">
            <b>Başarısız!</b> Makale eklerken bir hata oluştu
        </div>
    </asp:Panel>
    <div class="form genis" style="min-height: 250px;">
        <div class="formbaslik">
            Makale Bilgilerini Yazınız
        </div>
        <div class="formIcerik">
            <div class="satir">
                <label>Makale Adı:</label>
                <asp:TextBox ID="tb_baslik" runat="server" CssClass="formcontrol"></asp:TextBox>
            </div>
            <div class="satir">
                <label>Kategori:</label>
                <asp:DropDownList ID="ddl_kategoriler" runat="server" DataTextField="Isim" DataValueField="ID" AppendDataBoundItems="true" CssClass="formcontrol">
                    <asp:ListItem Value="-1">Kategori Seçiniz...</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="satir">
                <label>Makale İçerik</label>
                <asp:TextBox ID="tb_icerik" runat="server" TextMode="MultiLine" CssClass="formcontrol"></asp:TextBox>
           
            </div>
            <br />
            <div class="satir">
                <label>Kapak Resim:</label>
                <asp:FileUpload ID="fu_resim" runat="server" />
            </div>
            <div class="satir">
                <asp:LinkButton ID="lbtn_ekle" runat="server" Text="Makale Ekle" CssClass="buton" OnClick="lbtn_ekle_Click"></asp:LinkButton>
            </div>
        </div>
    </div>
    <script>      
        CKEDITOR.replace('ContentPlaceHolder1_tb_icerik');
    </script>
</asp:Content>
