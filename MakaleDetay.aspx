<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MakaleDetay.aspx.cs" Inherits="BurcinAkan_Blog.MakaleDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .yorumyap {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <article class="makale">
        <h2>
            <asp:Literal ID="ltrl_baslik" runat="server"></asp:Literal></h2>
        <div class="katbilgi">
            <span class="kategori">
                <asp:Literal ID="ltrl_kategori" runat="server"></asp:Literal></span>
            <span class="bilgi"><i class="fa fa-eye"></i>
                <asp:Literal ID="ltrl_goruntuleme" runat="server"></asp:Literal>
                |<i class="fa fa-star-half-alt"></i>:
                <asp:Literal ID="ltrl_puan" runat="server"></asp:Literal>
            </span>
            <div style="clear: both"></div>
        </div>
        
        <hr />
        <div class="metin">
            <asp:Literal ID="ltrl_icerik" runat="server"></asp:Literal>
        </div>
    </article>
    <br />
    <hr />
    <br />
    <div class="yorumpanel">
        <h3>Yorum Yap</h3>
        <hr />
        <asp:Panel ID="pnl_girisVar" runat="server" CssClass="yorumyap" Height="135px">
            <asp:TextBox ID="tb_yorum" runat="server" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:LinkButton ID="btn_yorumYap" runat="server" OnClick="btn_yorumYap_Click" CssClass="buton">Yorum Yap</asp:LinkButton>
        </asp:Panel>
        <asp:Panel ID="pnlGirisYok" runat="server" CssClass="yorumyok">
            <h4>Yorum yapabilmek için Lütfen <a href="GirisYap.aspx">giriş yapınız</a></h4>
        </asp:Panel>
        <div class="yorumlar">
            <asp:ListView ID="lv_yorumlar" runat="server">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="yorum">
                        <h4><%# Eval("Uye_ID_Str") %></h4>
                        <span><%# Eval("YorumTarih") %></span>
                        <hr />
                        <%# Eval("Icerik") %>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
