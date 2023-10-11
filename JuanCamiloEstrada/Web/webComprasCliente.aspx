<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="webComprasCliente.aspx.cs" Inherits="WEB.webInmoviliaria.webComprasCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="text-center" colspan="2" style="height: 20px; font-size: medium"><strong>INFORMACION DEL CLIENTE</strong></td>
        </tr>
        <tr>
            <td>CEDULA:
                <asp:Label ID="lblCedula" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="grdInfoCliente" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="946px">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="text-center" colspan="2" style="font-size: medium"><strong>RESIDENCIAS DEL CLIENTE</strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCodigo2" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 2px">CODIGO PROPIEDAD: <asp:Label ID="lblCodigoPropiedad" runat="server" Text="-"></asp:Label>
            </td>
            <td style="height: 2px"></td>
        </tr>
        <tr>
            <td style="height: 20px">TIPO PROPIEDAD:
                <asp:Label ID="lblTipoPropiedad" runat="server" Text="-"></asp:Label>
            </td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnTerminarContrato" runat="server" OnClick="btnTerminarContrato_Click" Text="TERMINAR CONTRATO" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="grdComprasCliente" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" OnSelectedIndexChanged="grdComprasCliente_SelectedIndexChanged" Width="934px">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="text-center" colspan="2"><strong>
                <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" style="font-weight: bold; font-size: large" Text="VOLVER" />
                </strong></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
