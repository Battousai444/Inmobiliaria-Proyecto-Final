using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases.BaseDatos;

namespace WEB.webInmoviliaria
{
    public partial class webVentasEmpleado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblCedula.Text = Request.QueryString.Get("Documento");
                LlenarGrid();
            }
        }
        private void LlenarGrid()
        {
            string Documento=lblCedula.Text;

            clsVentasEmpleado oCliente = new clsVentasEmpleado();
            oCliente.Documento = Documento;
            oCliente.grdInfoEmpleado = grdInfoEmpleado;
            oCliente.grdVentasEmpleado = grdVentasEmpleado;
            if (!oCliente.LlenarGridEmpleado())
            {
                lblError.Text = oCliente.Error;
            }
            if (!oCliente.LlenarGridVentas())
            {
                lblError.Text = oCliente.Error;
            }
        }

        protected void grdInfoEmpleado_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grdVentasEmpleado_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("webEmpleados.aspx");
        }
    }
}