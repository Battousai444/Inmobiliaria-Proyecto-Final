<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="webEmpleados.aspx.cs" Inherits="WEB.webInmoviliaria.webEmpleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
            <td class="text-center" colspan="2" style="font-size: x-large; height: 68px;"><strong>
                <br />
                ADMINISTRACIÓN DE EMPLEADOS</strong></td>
        </tr>
        <tr>
            <td style="font-size: large; width: 394px;"><strong>DOCUMENTO:</strong></td>
            <td>
                <asp:TextBox ID="txtDocumento" runat="server" style="font-size: large" TextMode="Number"></asp:TextBox>
                <asp:Button ID="btnConsultaVentas" runat="server" OnClick="btnConsultaVentas_Click" Text="CONSULTAR VENTAS EMPLEADO" Width="257px" />
            </td>
        </tr>
        <tr>
            <td style="font-size: large; width: 394px;"><strong>NOMBRE:</strong></td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" style="font-size: large"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="font-size: large; width: 394px;"><strong>PRIMER APELLIDO:</strong></td>
            <td>
                <asp:TextBox ID="txtPrimerApellido" runat="server" style="font-size: large"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="font-size: large; width: 394px;"><strong>SEGUNDO APELLIDO:</strong></td>
            <td>
                <asp:TextBox ID="txtSegundoApellido" runat="server" style="font-size: large"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="font-size: large; width: 394px;"><strong>DIRECCIÓN:</strong></td>
            <td>
                <asp:TextBox ID="txtDireccion" runat="server" style="font-size: large"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="font-size: large; height: 30px; width: 394px;">C<span style="font-weight: bold">ORREO:</span></td>
            <td style="height: 30px">
                <asp:TextBox ID="txtCorreo" runat="server" style="font-size: large"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="text-center" style="height: 22px; width: 394px;">
                <asp:Button ID="btnIngresar" runat="server" style="font-size: x-large" Text="INGRESAR" Width="220px" BackColor="#0033CC" Font-Bold="True" ForeColor="White" OnClick="btnIngresar_Click" />
            </td>
            <td class="text-center" style="height: 22px">
                <asp:Button ID="btnActualizar" runat="server" style="font-size: x-large" Text="ACTUALIZAR" Width="220px" BackColor="#0033CC" Font-Bold="True" ForeColor="White" OnClick="btnActualizar_Click" />
            </td>
        </tr>
        <tr>
            <td class="text-center" style="width: 394px">
                <asp:Button ID="btnBorrar" runat="server" style="font-size: x-large" Text="BORRAR" Width="220px" BackColor="#0033CC" Font-Bold="True" ForeColor="White" OnClick="btnBorrar_Click" />
            </td>
            <td class="text-center">
                <asp:Button ID="btnConsultar" runat="server" style="font-size: x-large" Text="CONSULTAR" Width="220px" BackColor="#0033CC" Font-Bold="True" ForeColor="White" OnClick="btnConsultar_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-left">
                <asp:Label ID="lblError" runat="server" style="font-size: large"></asp:Label>
                <div class="text-center">
                    <asp:GridView ID="grdEmpleados" runat="server" Width="1004px" OnSelectedIndexChanged="grdEmpleados_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ButtonType="Button" SelectText="telefonos" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-left">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <strong>
                <asp:Button ID="btnPrincipal" runat="server" BackColor="#0099FF" ForeColor="White" OnClick="btnPrincipal_Click" style="font-weight: bold; font-size: large" Text="VOLVER A LA PAGINA PRINCIPAL" Width="536px" />
                </strong>
            </td>
        </tr>
    </table>
</asp:Content>