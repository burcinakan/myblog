<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master"  AutoEventWireup="true" CodeBehind="MakaleListele.aspx.cs" Inherits="BurcinAkan_Blog.Admin.MakaleListele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .durumbutton {
            font-size: 9pt;
            padding: 3px;
            margin: 2px;
            background-color: #0094ff;
            color: white;
            border: 1px solid #025997;
            border-radius: 2px;
        }

        .silbutton {
            font-size: 9pt;
            padding: 3px;
            margin: 2px;
            background-color: #ff5d5d;
            color: white;
            border: 1px solid #ff0000;
            border-radius: 2px;
        }

        .guncellebutton {
            font-size: 9pt;
            padding: 3px;
            margin: 2px;
            background-color: #ff6a00;
            color: white;
            border: 1px solid #ff0000;
            border-radius: 2px;
        }

        .sayfabuttononceki {
            padding: 3px;
            border: 1px solid gray;
            border-top-left-radius: 7px;
            border-bottom-left-radius: 7px;
            background-color:#e5e5e5;
        }

        .sayfabutton {
            padding: 3px;
            border: 1px solid gray;
            background-color:#e5e5e5;
        }

        .sayfabuttonsonraki {
            padding: 3px;
            border: 1px solid gray;
            border-top-right-radius: 7px;
            border-bottom-right-radius: 7px;
            background-color:#e5e5e5;
        }

        .secilibutton {
            padding: 3px;
            border: 1px solid gray;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Makale Listele</h2>
    <hr />
    <%-- <asp:GridView ID="gv_makale" runat="server"></asp:GridView>--%>
    <%-- <asp:GridView ID="gv_makale" runat="server" AutoGenerateColumns="false" CssClass="tablo" HeaderStyle-CssClass="tablobaslik">
        <Columns>
            <asp:BoundField HeaderText="Numara" DataField="ID"/>
            <asp:BoundField HeaderText="Makale Başlığı" DataField="Baslik"/>
            <asp:BoundField HeaderText="Kategori" DataField="Kategori_ID_Str" />
            <asp:BoundField HeaderText="Görüntüleme" DataField="Goruntuleme"/>
            <asp:BoundField HeaderText="Puan" DataField="OrtalamaPuan" />
            <asp:BoundField HeaderText="Durum" DataField="Durum_Str" />
        </Columns>
    </asp:GridView>--%>
    <asp:DropDownList ID="ddl_sirala" runat="server" OnSelectedIndexChanged="ddl_sirala_SelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem Text="Puana Göre Azalan" Value="1">
        </asp:ListItem>
        <asp:ListItem Text="Puana Göre Artan" Value="2"></asp:ListItem>
    </asp:DropDownList>
    <asp:ListView ID="lv_makaleler" runat="server" OnItemCommand="lv_makaleler_ItemCommand" OnPagePropertiesChanging="lv_makaleler_PagePropertiesChanging" AllowPaging="true" AllowSorting="true">
        <LayoutTemplate>
            <table class="tablo">
                <tr class="tablobaslik">
                    <td>ID</td>
                    <td>Başlık</td>
                    <td>Kategori</td>
                    <td>Görüntüleme</td>
                    <td>Puan</td>
                    <td>Durum</td>
                    <td>Seçenekler</td>
                </tr>
                <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                <tr>
                    <td colspan="7">Makale Verileri</td>
                </tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("ID") %></td>
                <td><%# Eval("Baslik") %></td>
                <td><%# Eval("Kategori_ID_Str") %></td>
                <td><%# Eval("Goruntuleme") %></td>
                <td><%# Eval("OrtalamaPuan") %></td>
                <td><%# Eval("Durum_Str") %></td>               
                <td>
                    <asp:LinkButton ID="lbtn_durum" runat="server" CommandName="durum" CommandArgument='<%# Eval("ID") %>' CssClass="durumbutton"><i class="fa fa-eye"></i></asp:LinkButton>

                    <a href='MakaleGuncelle.aspx?makid=<%# Eval("ID") %>' class="guncellebutton"><i class="fa fa-edit"></i></a>

                    <asp:LinkButton ID="lbtn_sil" runat="server" CommandName="sil" CommandArgument='<%# Eval("ID") %>' CssClass="silbutton"><i class="fa fa-trash"></i></asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            Henüz hiçbir makale eklenmemiş.
        </EmptyDataTemplate>
    </asp:ListView>
    <br />
    <br />
    <asp:DataPager ID="lv_makaleler_pager" runat="server" PagedControlID="lv_makaleler" PageSize="5">
        <Fields>
            <asp:NextPreviousPagerField ShowNextPageButton="false" ButtonCssClass="sayfabuttononceki" />
            <asp:NumericPagerField ButtonType="Link" NumericButtonCssClass="sayfabutton" CurrentPageLabelCssClass="secilibutton" />
            <asp:NextPreviousPagerField ShowPreviousPageButton="false" ButtonCssClass="sayfabuttonsonraki" />
        </Fields>
    </asp:DataPager>

</asp:Content>
