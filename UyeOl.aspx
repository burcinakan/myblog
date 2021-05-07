<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UyeOl.aspx.cs" Inherits="BurcinAkan_Blog.UyeOl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <style>
       .auto a{
           color:#5d4d4d;
           float:right;
           margin-right:20px;
           height:40px;
           margin-top:25px;
       }
   </style>
     <div>
        <table border="1" style="margin-left:auto; margin-right:auto; width:400px;"   >
            <tr>
                <td colspan="2" >
                    <img style="height:200px; width:200px; margin-left:100px; " src="Resimler/byazilim.png" />

                </td>
                
            </tr>
            <tr>
                <td colspan="2" style="font: bold 12px arial,verdana;
            color: #5d4d4d;">
                   
                    <h3 style=" margin-left:100px;">Üyelik Bilgilerinizi Giriniz...</h3>

                </td>
                
            </tr>
             <tr style="font: bold 12px arial,verdana;
            color: #5d4d4d; height:40px;">
                <td style="width:100px; padding-left:50px;">İsim:</td>

                <td><asp:TextBox ID="tb_isim" runat="server" style="margin-left:20px; height:20px;"></asp:TextBox></td>
            </tr>
            <tr style="font: bold 12px arial,verdana;
            color: #5d4d4d;height:40px;">
                <td style="padding-left:50px;">Soyad:</td>
                <td><asp:TextBox ID="tb_soyad" runat="server" style="margin-left:20px; height:20px;"></asp:TextBox></td>
            </tr>
            <tr style="font: bold 12px arial,verdana;
            color: #5d4d4d;height:40px;">
                <td style="padding-left:50px;">Mail Adres:</td>
                <td><asp:TextBox ID="tb_mail" runat="server" style="margin-left:20px; height:20px;"></asp:TextBox></td>
            </tr>
             <tr style="font: bold 12px arial,verdana;
            color: #5d4d4d;height:40px;">
                <td style="padding-left:50px;">Mail Tekrar:</td>
                <td><asp:TextBox ID="tb_mail_tekrar" runat="server" style="margin-left:20px; height:20px;"></asp:TextBox></td>
            </tr>
            <tr style="font: bold 12px arial,verdana;
            color: #5d4d4d;height:40px;">
                <td style="padding-left:50px;">Şifre:</td>
                <td><asp:TextBox ID="tb_sifre" runat="server" TextMode="Password" style="margin-left:20px; height:20px;"></asp:TextBox></td>
            </tr>
            <tr style="font: bold 12px arial,verdana;
            color: #5d4d4d;height:40px;">
                <td style="padding-left:50px;">Şifre Tekrar:</td>
                <td><asp:TextBox ID="tb_sifre_tekrar" runat="server" TextMode="Password" style=" margin-left:20px; height:20px;"></asp:TextBox></td>
            </tr>
            <tr style="font: bold 16px arial,verdana;">
                <td colspan="2" class="auto">
                    <asp:LinkButton ID="lbtn_uyeOl" runat="server" OnClick="lbtn_uyeOl_Click">Üye Ol</asp:LinkButton>
                    <a href="GirisYap.aspx" style="color:darkgrey; float:left;">Giriş Yap Sayfasına Git</a>
                </td>
            </tr>
            <tr>
                <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
            </tr>
        </table>
    </div>
</asp:Content>