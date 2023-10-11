<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="webRegistrarResidencias.aspx.cs" Inherits="WEB.webInmoviliaria.webRegistrarResidencias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 80%">
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td class="text-center" colspan="3" style="font-size: x-large; height: 34px"><strong>REGISTROS DE RESIDENCIAS</strong></td>
        </tr>
        <tr>
            <td class="modal-sm" style="height: 20px; width: 291px; text-align: center; font-size: medium">CODIGO:<asp:Label ID="lblCodigo" runat="server" Text="-"></asp:Label>
            </td>
            <span style="font-size: medium">
            <td class="text-center" style="height: 20px; width: 358px">&nbsp;</td>
            <td class="text-center" style="height: 20px"><span style="font-size: medium">Internet</span>:</span><asp:DropDownList ID="dropInternet" runat="server" style="font-size: medium">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 291px; text-align: center; font-size: medium; height: 27px"><span style="font-size: medium">Direccion:</span><asp:TextBox ID="txtDireccion" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
            <td class="text-center" style="width: 358px; height: 27px"><span style="font-size: medium">Garage:</span><asp:DropDownList ID="dropGarage" runat="server" style="font-size: medium">
                </asp:DropDownList>
            </td>
            <td class="text-center" style="height: 27px"><span style="font-size: medium">Patio:</span><asp:DropDownList ID="dropPatio" runat="server" style="font-size: medium; height: 24px;">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 291px; text-align: center; font-size: medium"><span style="font-size: medium">Tamaño:</span><asp:TextBox ID="txtTamaño" runat="server" style="font-size: medium"></asp:TextBox>
            </td>
            <td class="text-center" style="width: 358px"><span style="font-size: medium">Amueblado:</span><asp:DropDownList ID="dropAmueblado" runat="server" style="font-size: medium">
                </asp:DropDownList>
            </td>
            <td class="text-center"><span style="font-size: medium">Terraza:</span><asp:DropDownList ID="dropTerraza" runat="server" style="font-size: medium">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 291px; text-align: center; font-size: medium"><span style="font-size: medium">Ubicacion:</span><asp:DropDownList ID="dropUbicacion" runat="server" style="font-size: medium">
                </asp:DropDownList>
            </td>
            <td class="text-center" style="width: 358px"><span style="font-size: medium">Pisina:</span><asp:DropDownList ID="dropPisina" runat="server" style="font-size: medium">
                </asp:DropDownList>
            </td>
            <td class="text-center"><span style="font-size: medium">Tipo Residencia:</span><asp:DropDownList ID="dropTipoResidencia" runat="server" style="font-size: medium">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 291px; text-align: center; font-size: medium">&nbsp;</td>
            <span style="font-size: medium">
            <td class="text-center" style="width: 358px"><span style="font-size: medium">Precio</span>:</span><asp:TextBox ID="txtPrecio" runat="server" style="font-size: medium" TextMode="Number"></asp:TextBox>
            </td>
            <td class="text-center" style="font-size: medium">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 291px">&nbsp;</td>
            <td style="width: 358px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 291px; text-align: center">
                <asp:Button ID="btnInsertar" runat="server" Text="INSERTAR" OnClick="btnInsertar_Click" BackColor="#3366FF" ForeColor="White" />
            </td>
            <td class="text-center" style="width: 358px">
                <asp:Button ID="btnActualizar" runat="server" Text="ACTUALIZAR" OnClick="btnActualizar_Click" BackColor="#3366FF" ForeColor="White" />
            </td>
            <td class="text-center">
                <asp:Button ID="btnEliminar" runat="server" Text="ELIMINAR" OnClick="btnEliminar_Click" BackColor="#0066FF" ForeColor="White" />
            </td>
        </tr>
        <tr>
            <td style="text-align: left" colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left" colspan="3">
                <asp:Label ID="lblError" runat="server" style="font-size: medium; color: #FF0066; background-color: #FFFFFF"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: left" colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left" colspan="3">
            <span style="font-size: medium">
                <asp:GridView ID="grdResidencias" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Width="1091px" OnSelectedIndexChanged="grdResidencias_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
                </span>
            </td>
        </tr>
        <tr>
            <td class="text-center" colspan="3" style="height: 20px">
                <strong>
                <asp:Button ID="btnPaginaPrin" runat="server" BackColor="#33CCCC" ForeColor="White" OnClick="btnPaginaPrin_Click" style="font-weight: bold; font-size: large" Text="VOLVER A LA PÁGINA PRINCIPAL" Width="547px" />
                </strong>
            </td>
        </tr>
    </table>
</span></span>
</asp:Content>

