<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="BurcinAkan_Blog.Admin.Giris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/formcss.css" rel="stylesheet" />
    <link href="css/GirisCss.css" rel="stylesheet" />
   
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="form" style="margin-left:auto; margin-right:auto; margin-top:200px; background-color:white">
                <div class="formbaslik" style="text-align:center">
                    BA-Yazılım Blog Yönetim Giriş
                </div>
                <div class="formIcerik">
                    <div class="satir">
                        <label>Mail Adresi:</label><asp:TextBox ID="tb_mail" Text="burcinakanblog@gmail.com" TextMode="Email" runat="server" CssClass="formcontrol"></asp:TextBox>
                    </div>
                    <div class="satir">
                        <label>Şifre:</label>
                        <asp:TextBox ID="tb_sifre" runat="server" TextMode="Password" Text="Şifrenizi Giriniz..."  CssClass="formcontrol"></asp:TextBox>
                    </div>
                    <div class="satir">
                        <asp:LinkButton ID="lbtn_girisYap" runat="server" CssClass="buton" OnClick="lbtn_girisYap_Click">Giriş Yap</asp:LinkButton>
                    </div>
                    <div class="satir">
                        <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
