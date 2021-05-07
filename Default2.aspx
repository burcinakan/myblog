<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="BurcinAkan_Blog.Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .thumbnailMakale {
            margin:5px;
            width: 140px;
            min-height: 260px;
            border: 1px solid silver;
            border-radius: 7px;
            padding: 10px;
            float: left;
        }

            .thumbnailMakale img {
                width: 120px
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="clear:both">
        <asp:ListView ID="lv_makaleler" runat="server">
            <LayoutTemplate>
                <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="thumbnailMakale">
                    <img src='MakaleResim/<%# Eval("KapakResim") %>' />
                    <hr />
                    <h2><a href='MakaleDetay.aspx?makid=<%# Eval("ID") %>' style="text-decoration: none; color:#203c41;">
                    <%# Eval("Baslik") %></a></h2>
                    <hr />
                    <%# Eval("Ozet") %>...
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
     <div class="clear:both"></div>
</asp:Content>
