<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="webVenta_Alquiler.aspx.cs" Inherits="WEB.webInmoviliaria.webVenta_Alquiler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="text-center" colspan="3" style="font-size: large"><strong>ADMINISTRACION VENTA Y ALQUILER</strong></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="font-size: medium"><strong>EMPLEADO:</strong></td>
            <td style="font-size: large"><strong>CLIENTE CEDULA: <asp:TextBox ID="txtCedula" runat="server" TextMode="Number"></asp:TextBox>
                </strong></td>
            <td style="font-size: large"><strong><span style="font-size: medium">NOMBRE CLIENTE:</span></strong>
                <asp:Label ID="lblNombreCliente" runat="server" Text="-"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; height: 37px">&nbsp;
                <asp:DropDownList ID="cboEmpleado" runat="server">
                </asp:DropDownList>
            </td>
            <td style="font-size: large; height: 37px;"></td>
            <td style="font-size: large; height: 37px;">&nbsp;
                <asp:Button ID="btnBuscarcliente" runat="server" OnClick="btnBuscarcliente_Click" Text="BUSCAR CLIENTE" BackColor="#66FF99" />
            </td>
        </tr>
        <tr>
            <td class="text-justify" colspan="3">
                <strong><span style="font-size: medium">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; METODO DE PAGO: </span></strong><asp:DropDownList ID="cboPago" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="text-center" colspan="3" style="font-size: large"><strong>RESIDENCIA</strong></td>
        </tr>
        <tr>
            <td class="modal-sm" style="height: 20px; width: 291px; text-align: center; font-size: medium">Código: <asp:Label ID="lblCodigo" runat="server" Text="-"></asp:Label>
            </td>
            <span style="font-size: medium">
            <td class="text-center" style="height: 20px; width: 358px">&nbsp;</td>
            <td class="text-center" style="height: 20px"><span style="font-size: medium">Internet</span>:</span><span style="font-size: medium"> <asp:Label ID="lblInternet" runat="server" Text="-"></asp:Label>
                </span>
            </td>
            </span>
        </tr>
        <tr>
            <span style="font-size: medium">
            <td class="modal-sm" style="width: 291px; text-align: center; font-size: medium; height: 27px"><span style="font-size: medium">Direccion: <asp:Label ID="lblDireccion" runat="server" Text="-"></asp:Label>
                </span>
            </td>
            <td class="text-center" style="width: 358px; height: 27px"><span style="font-size: medium">Garaje: <asp:Label ID="lblGaraje" runat="server" Text="-"></asp:Label>
                </span>
            </td>
            <td class="text-center" style="height: 27px"><span style="font-size: medium">Patio: <asp:Label ID="lblPatio" runat="server" Text="-"></asp:Label>
                </span>
            </td>
            </span>
        </tr>
        <tr>
            <span style="font-size: medium">
            <td class="modal-sm" style="width: 291px; text-align: center; font-size: medium">T<span style="font-size: medium">amaño: <asp:Label ID="lblTamaño" runat="server" Text="-"></asp:Label>
                </span>
            </td>
            <td class="text-center" style="width: 358px"><span style="font-size: medium">Amueblado: <asp:Label ID="lblAmueblado" runat="server" Text="-"></asp:Label>
                </span>
            </td>
            <td class="text-center"><span style="font-size: medium">Terraza: <asp:Label ID="lblTerraza" runat="server" Text="-"></asp:Label>
                </span>
            </td>
            </span>
        </tr>
        <tr>
            <span style="font-size: medium">
            <td class="modal-sm" style="width: 291px; text-align: center; font-size: medium"><span style="font-size: medium">Ubicación: <asp:Label ID="lblUbicacion" runat="server" Text="-"></asp:Label>
                </span>
            </td>
            <td class="text-center" style="width: 358px"><span style="font-size: medium">Piscina: <asp:Label ID="lblPiscina" runat="server" Text="-"></asp:Label>
                </span>
            </td>
            <td class="text-center"><span style="font-size: medium">Tipo Residencia: <asp:Label ID="lblTipoResidencia" runat="server" Text="-"></asp:Label>
                </span>
            </td>
            </span>
        </tr>
        <tr>
            <span style="font-size: medium">
            <td class="modal-sm" style="width: 291px; text-align: center; font-size: medium">&nbsp;</td>
            <td class="text-center" style="width: 358px"><span style="font-size: medium">Precio</span>:</span><span style="font-size: medium"> <asp:Label ID="lblPrecio" runat="server" Text="-"></asp:Label>
                </span>
            </td>
            <td class="text-center" style="font-size: medium">&nbsp;</td>
            </span>
        </tr>
        <tr>
            <td class="text-center" colspan="3"></td>
        </tr>
        <tr>
            <td class="text-center" colspan="3">
                <asp:Button ID="btnRealizarPago" runat="server" OnClick="btnRealizarPago_Click" Text="REALIZAR PAGO" BackColor="#99FF99" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblError" runat="server" Text="Label" BackColor="White" ForeColor="#FF3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="grdVentaAlquiler" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="992px" OnSelectedIndexChanged="grdVentaAlquiler_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" class="text-center">
                <asp:Button ID="btnPagPrincipal" runat="server" BackColor="#FF6666" OnClick="btnPagPrincipal_Click" style="font-weight: bold; font-size: large" Text="VOLVER AL MENÚ PRINCIPAL" />
            </td>
        </tr>
    </table>
</asp:Content>
