using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases.BaseDatos;

namespace WEB.webInmoviliaria
{
    public partial class webTelefonoCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                lblDocumento.Text = Request.QueryString.Get("Documento");
                lblNombre.Text = Request.QueryString.Get("Nombre");
                lblDireccion.Text = Request.QueryString.Get("Direccion");
                lblCorreo.Text = Request.QueryString.Get("Correo");
                LlenarComboTipoTelefono();
                LlenarGridTelefono();
            }
        }
        private void LlenarComboTipoTelefono()
        {
            clsTelefonoEmpleado oTipoTelefono = new clsTelefonoEmpleado();
            oTipoTelefono.cboTipoTelefono = cboTelefono;
            if (oTipoTelefono.LlenarCombo() == false)
            {
                lblError.Text = oTipoTelefono.Error;
            }
        }
        private void LlenarGridTelefono()
        {
            string Documento = lblDocumento.Text;

            clsEmpleados oCliente = new clsEmpleados();
            oCliente.Documento = Documento;
            oCliente.grdTelefonosEmpleado = grdTelefonos;
            if (!oCliente.LlenarGridTelefono())
            {
                lblError.Text = oCliente.Error;
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string Documento, Telefono;
            Int32 TipoTelefono;

            TipoTelefono = Convert.ToInt32(cboTelefono.SelectedValue);
            Documento = lblDocumento.Text;
            Telefono = txtNumeroTelefono.Text;

            clsEmpleados oCliente = new clsEmpleados();

            oCliente.Documento = Documento;
            oCliente.Telefono = Telefono;
            oCliente.TipoTelefono = TipoTelefono;
            if (oCliente.InsertarTelefono())
            {
                lblError.Text = "se agregó el telefono: " + Telefono;
                LlenarGridTelefono();
            }
            else
            {
                lblError.Text = oCliente.Error;
            }

        }
        protected void btnActualizar_Click(object sender, EventArgs e)
        {

            string Documento, Telefono;
            Int32 TipoTelefono, CodigoTelefono;

            CodigoTelefono = Convert.ToInt32(txtCodigoTelefono.Text);
            TipoTelefono = Convert.ToInt32(cboTelefono.SelectedValue);
            Documento = lblDocumento.Text;
            Telefono = txtNumeroTelefono.Text;

            clsEmpleados oCliente = new clsEmpleados();

            oCliente.CodigoTelefono = CodigoTelefono;
            oCliente.Documento = Documento;
            oCliente.Telefono = Telefono;
            oCliente.TipoTelefono = TipoTelefono;
            if (oCliente.ActualizarTelefono())
            {
                lblError.Text = "se actualizó el telefono: " + Telefono;
                LlenarGridTelefono();
            }
            else
            {
                lblError.Text = oCliente.Error;
            }

        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {

            Int32 CodigoTelefono;

            CodigoTelefono = Convert.ToInt32(txtCodigoTelefono.Text);


            clsEmpleados oCliente = new clsEmpleados();

            oCliente.CodigoTelefono = CodigoTelefono;

            if (oCliente.EliminarTelefono())
            {
                lblError.Text = "se eliminó el codigo de telefono: " + CodigoTelefono;
                LlenarGridTelefono();
            }
            else
            {
                lblError.Text = oCliente.Error;
            }
        }
        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("webEmpleados.aspx");
        }

        protected void grdTelefonos_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboTelefono.SelectedValue = grdTelefonos.SelectedRow.Cells[1].Text;
            txtCodigoTelefono.Text = grdTelefonos.SelectedRow.Cells[3].Text;
            txtNumeroTelefono.Text = grdTelefonos.SelectedRow.Cells[4].Text;
        }
    }
}