<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="webTelefonoCliente.aspx.cs" Inherits="WEB.webInmoviliaria.webTelefonoCliente1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <table style="width: 71%">
            <tr>
                <td colspan="2" style="font-size: x-large" class="text-center"><strong>ADMNISTRACIÓN TELÉFONOS PARA 
                    CLIENTES</strong></td>
            </tr>
            <tr>
                <td class="text-left" style="font-size: large"><strong>DOCUMENTO:</strong></td>
                <td class="text-left">
                    <asp:Label ID="lblDocumento" runat="server" style="font-size: large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-left" style="font-size: large"><strong>NOMBRE:</strong></td>
                <td class="text-left">
                    <asp:Label ID="lblNombre" runat="server" style="font-size: large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-left" style="font-size: large"><strong>DIRECCIÓN:</strong></td>
                <td class="text-left">
                    <asp:Label ID="lblDireccion" runat="server" style="font-size: large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-left" style="font-size: large"><strong>EDAD:</strong></td>
                <td class="text-left">
                    <asp:Label ID="lblEdad" runat="server" style="font-size: large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-left" style="font-size: large"><strong>TIPO DE TELÉFONO:</strong></td>
                <td>
                    <asp:DropDownList ID="cboTelefono" runat="server" style="font-size: large">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="text-left" style="font-size: large"><strong>NÚMERO TELÉFONO:</strong></td>
                <td>
                    <asp:TextBox ID="txtCodigoTelefono" runat="server" style="font-size: large" TextMode="Number"></asp:TextBox>
                    <asp:TextBox ID="txtNumeroTelefono" runat="server" style="font-size: large" TextMode="Number"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-left" colspan="2">
                    <asp:Label ID="lblError" runat="server" style="font-size: large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-center">
                    <asp:Button ID="btnIngresar" runat="server" Text="INGRESAR" Width="200px" BackColor="#0033CC" BorderColor="#0033CC" Font-Bold="True" ForeColor="White" style="font-size: x-large" OnClick="btnIngresar_Click" />
                </td>
                <td class="text-center">
                    <asp:Button ID="btnActualizar" runat="server" Text="ACTUALIZAR" Width="200px" BackColor="#0033CC" BorderColor="#0033CC" Font-Bold="True" ForeColor="White" style="font-size: x-large" OnClick="btnActualizar_Click" />
                </td>
            </tr>
            <tr>
                <td class="text-center">
                    <asp:Button ID="btnEliminar" runat="server" Text="ELIMINAR" Width="200px" BackColor="#0033CC" BorderColor="#0033CC" Font-Bold="True" ForeColor="White" style="font-size: x-large" OnClick="btnEliminar_Click" />
                </td>
                <td class="text-center">
                    <asp:Button ID="btnRegresar" runat="server" 
                        Text="REGRESAR" Width="200px" BackColor="#0033CC" BorderColor="#0033CC" Font-Bold="True" ForeColor="White" style="font-size: x-large" OnClick="btnRegresar_Click" />
                </td>
            </tr>
            <tr>
                <td class="text-center" colspan="2">
                    
                    <asp:GridView ID="grdTelefonos" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" style="font-size: large" Width="795px" OnSelectedIndexChanged="grdTelefonos_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" SelectText="selec" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    
                </td>
            </tr>
        </table>
    </p>
</asp:Content>
