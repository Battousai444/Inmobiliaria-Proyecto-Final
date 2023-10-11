using Clases.BaseDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB.webInmoviliaria
{
    public partial class webTelefonoCliente1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                lblDocumento.Text = Request.QueryString.Get("Documento");
                lblNombre.Text = Request.QueryString.Get("Nombre");
                lblDireccion.Text = Request.QueryString.Get("Direccion");
                lblEdad.Text = Request.QueryString.Get("Correo");
                LlenarComboTipoTelefono();
                LlenarGridTelefono();
            }
        }

        private void LlenarComboTipoTelefono()
        {
            clsTelefonoCliente oTipoTelefono = new clsTelefonoCliente();
            oTipoTelefono.cboTipoTelefono = cboTelefono;
            if (oTipoTelefono.LlenarCombo() == false)
            {
                lblError.Text = oTipoTelefono.Error;
            }
        }

        private void LlenarGridTelefono()
        {
            string Documento = lblDocumento.Text;

            clsCliente oCliente = new clsCliente();
            oCliente.Documento = Documento;
            oCliente.grdTelefonosCliente = grdTelefonos;
            if (!oCliente.LlenarGridTelefono())
            {
                lblError.Text = oCliente.Error;
            }
        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string Documento, Telefono;
            String TipoTelefono;

            TipoTelefono = cboTelefono.SelectedValue;
            Documento = lblDocumento.Text;
            Telefono = txtNumeroTelefono.Text;

            clsCliente oCliente = new clsCliente();

            oCliente.Documento = Documento;
            oCliente.NumTelCliente= Telefono;
            oCliente.CodTipoTelefono = TipoTelefono;
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
            string Documento, TipoTelefono, Telefono;
            Int32  CodigoTelefono;

            CodigoTelefono = Convert.ToInt32(txtCodigoTelefono.Text);
            TipoTelefono = cboTelefono.SelectedValue;
            Documento = lblDocumento.Text;
            Telefono = txtNumeroTelefono.Text;

            clsCliente oCliente = new clsCliente();

            oCliente.CodTelCliente = CodigoTelefono;
            oCliente.Documento = Documento;
            oCliente.NumTelCliente = Telefono;
            oCliente.CodTipoTelefono = TipoTelefono;
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


            clsCliente oCliente = new clsCliente();

            oCliente.CodTelCliente = CodigoTelefono;

            if (oCliente.EliminarTelefono())
            {
                lblError.Text = "se elimino el el telefono con código: " + CodigoTelefono;
                LlenarGridTelefono();
            }
            else
            {
                lblError.Text = oCliente.Error;
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("webCliente.aspx");
        }

        protected void grdTelefonos_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboTelefono.SelectedValue = grdTelefonos.SelectedRow.Cells[1].Text;
            txtCodigoTelefono.Text = grdTelefonos.SelectedRow.Cells[3].Text;
            txtNumeroTelefono.Text = grdTelefonos.SelectedRow.Cells[4].Text;
        }
    }
}