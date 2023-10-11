using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB.webInmoviliaria
{
    public partial class PagPrincipal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("webEmpleados.aspx");
        }

        protected void BtnClientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("webCliente.aspx");
        }

        protected void BtnCasa_Click(object sender, EventArgs e)
        {
            Response.Redirect("webVenta_Alquiler.aspx");
        }

        protected void BtnFacturacion_Click(object sender, EventArgs e)
        {
            Response.Redirect("webRegistrarResidencias.aspx");
        }
    }
}