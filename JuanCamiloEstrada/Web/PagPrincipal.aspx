<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PagPrincipal.aspx.cs" Inherits="WEB.webInmoviliaria.PagPrincipal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
            <td style="width: 501px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="text-center" colspan="2" style="font-size: x-large"><strong>PÁGINA PRINCIPAL INMOBILIARIA</strong></td>
        </tr>
        <tr>
            <td style="width: 501px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="text-center" style="width: 501px"><strong>
                <asp:Button ID="BtnEmpleados" runat="server" OnClick="Button1_Click" style="font-size: large; font-weight: bold" Text="INGRESAR EMPLEADOS" />
                </strong></td>
            <td class="text-center">
                <asp:Button ID="BtnCasa" runat="server" OnClick="BtnCasa_Click" style="font-size: large; font-weight: bold" Text="VENDER O ALQUILAR CASA" />
            </td>
        </tr>
        <tr>
            <td style="width: 501px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="text-center" style="width: 501px"><strong>
                <asp:Button ID="BtnClientes" runat="server" OnClick="BtnClientes_Click" style="font-size: large; font-weight: bold" Text="INGRESAR CLIENTES" />
                </strong></td>
            <td class="text-center"><strong>
                <asp:Button ID="BtnRegistrarResidencia" runat="server" OnClick="BtnFacturacion_Click" style="font-size: large; font-weight: bold" Text="REGISTRAR UNA RESIDENCIA" />
                </strong></td>
        </tr>
        <tr>
            <td style="width: 501px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 501px" class="text-center">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 501px" class="text-center">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
