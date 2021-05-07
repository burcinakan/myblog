<%@ Page Language="C#"  MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BurcinAkan_Blog.Admin.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Yönetim</h2>
    <hr />
    <div class="form genis">
        <div class="formbaslik">
            <h3>Onay Bekleyen Yorumlar</h3>
        </div>
        <div class="formIcerik">
            <asp:ListView ID="lv_yorumlar" runat="server" OnItemCommand="lv_yorumlar_ItemCommand">
                <LayoutTemplate>
                    <table class="tablo">
                        <tr class="tablobaslik">
                            <td>Yorum Yapan</td>
                            <td>Yorum İçerik</td>
                            <td>Yorum Tarih</td>
                            <td>işlem</td>
                        </tr>
                        <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("Uye_ID_Str") %></td>
                        <td><%# Eval("Icerik") %></td>
                        <td><%# Eval("YorumTarih") %></td>
                        <td>
                            <asp:LinkButton ID="lbtn_onayla" runat="server" CommandName="onayla" CommandArgument='<%# Eval("ID") %>'>Onayla</asp:LinkButton>
                            <asp:LinkButton ID="lbtn_sil" runat="server" CommandName="sil" CommandArgument='<%# Eval("ID") %>'>Sil</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>

</asp:Content>
