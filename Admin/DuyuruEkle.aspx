<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DuyuruEkle.aspx.cs" Inherits="BurcinAkan_Blog.Admin.DuyuruEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .duzenle {
            width: 420px !important;
            float: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Duyuru Ekle</h2>
    <hr />
    <asp:Panel ID="pnl_basarili" runat="server" Visible="false">
        <div class="mesajbasarili">
            <b>Başarılı!</b> Duyuru ekleme/güncelleme başarılı
        </div>
    </asp:Panel>
    <asp:Panel ID="pnl_basarisiz" runat="server" Visible="false">
        <div class="mesajbasarisiz">
            <b>Başarısız!</b> Bu duyuru işlemi yapılamaz
        </div>
    </asp:Panel>
    <div class="form duzenle">
        <div class="formIcerik">
            <div class="satir">
                <label>Duyuru Adı:</label>
                <asp:TextBox ID="tb_isim" runat="server" CssClass="formcontrol"></asp:TextBox>
            </div>
            <div class="satir">
                <asp:LinkButton ID="lbtn_ekle" runat="server" CssClass="buton" Text="Duyuru Ekle" OnClick="lbtn_ekle_Click"></asp:LinkButton>
                <asp:LinkButton ID="lbtn_guncelle" runat="server" CssClass="buton" Text="Duyuru Güncelle" OnClick="lbtn_guncelle_Click"></asp:LinkButton>
            </div>
        </div>

    </div>
    <div class="form duzenle" style="margin-left: 15px;">
        <div class="formIcerik">
            <asp:ListView ID="lv_duyurular" runat="server" OnItemCommand="lv_duyurular_ItemCommand">
                <LayoutTemplate>
                    <table class="tablo">
                        <tr class="tablobaslik">
                            <td>ID</td>
                            <td>Duyuru</td>
                            <td>Seçenekler</td>
                        </tr>
                        <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("ID") %></td>
                        <td><%# Eval("Baslik") %></td>
                        <td>
                            <asp:LinkButton ID="lbtn_sil" runat="server" CommandArgument='<%# Eval("ID") %>'>Sil</asp:LinkButton>
                            <a href='DuyuruEkle.aspx?duyid=<%# Eval("ID") %>'>Düzenle</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
