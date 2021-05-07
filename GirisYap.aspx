<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GirisYap.aspx.cs" Inherits="BurcinAkan_Blog.GirisYap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            
            width: 150px;
            font: bold 12px arial,verdana;
            color: #5d4d4d;
            height:50px;
            padding-left:20px;

        }
       
        .auto-style2 {
           
            font: bold 12px arial,verdana;
            color: #5d4d4d;
            
           
        }
        .auto-style2 text{
            height:50px;
        }
       .auto-style3 a {
           float:right;
           color:#5d4d4d;
           height:50px;
           margin-right:10px;
           margin-top:25px;
           font:bold 16px arial,verdana;
       }
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <div>
        
        <table border="1" style="margin-left:auto; margin-right:auto; height:200px; width:400px; margin-top:40px; ">
            <tr>
                <td colspan="2" class="auto-style2">
                    <img style="height:200px; width:200px; margin-left:100px; " src="Resimler/brcnakn.png" />

                </td>
                
            </tr>
            <tr>
                <td colspan="2" class="auto-style2">
                   
                    <h3 style=" margin-left:100px;">Üye Değilseniz Lütfen Üye Olun...</h3>

                </td>
                
            </tr>
            <tr>
                <td class="auto-style1">Mail Adres:</td>
                <td ><asp:TextBox ID="tb_mail" runat="server"  style="margin-left:20px; height:20px;"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style1">Şifre:</td>
                <td><asp:TextBox ID="tb_sifre" runat="server" TextMode="Password"  style="margin-left:20px; height:20px;"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style3">
                    <asp:LinkButton ID="lbtn_girisYap" runat="server" OnClick="lbtn_girisYap_Click">Giriş Yap</asp:LinkButton>
                    <a href="UyeOl.aspx" style="color:darkgrey; float:left;">Üye Ol Sayfasına Git</a>
                </td>
            </tr>
           
            <tr>
                <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
            </tr>
        </table>
    </div>
</asp:Content>