<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BurcinAkan_Blog.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
   
 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <asp:ListView ID="lv_makaleler" runat="server">
        <LayoutTemplate>
            <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        
        <ItemTemplate>
            <article class="makale">
                <h2><a href='MakaleDetay.aspx?makid=<%# Eval("ID") %>' style="text-decoration: none; color:#151233;">
                    <%# Eval("Baslik") %></a></h2>
                <div class="katbilgi">
                    <span class="kategori"><%# Eval("Kategori_ID_str") %></span>
                    <span class="bilgi"><i class="fa fa-eye"></i><%# Eval("Goruntuleme") %> |
                        <i class="fa fa-star-half-alt"></i>:<%# Eval("OrtalamaPuan") %></span><div style="clear: both"></div>
                </div>
                <img src='MakaleResim/<%# Eval("KapakResim") %>' style="margin-left:100px" />
                <hr />
                <div class="metin" style="font:bold 12px arial,verdana; color:#594539;" ><%# Eval("Ozet") %>...</div>
                <br />
                <div class="makaleLink">
                    <a href='MakaleDetay.aspx?makid=<%# Eval("ID") %>' style="font:bold 12px arial,verdana; color:#203c41;">Devamını Oku</a>
                </div>
            </article>

            




        </ItemTemplate>
           
    </asp:ListView>

</asp:Content>