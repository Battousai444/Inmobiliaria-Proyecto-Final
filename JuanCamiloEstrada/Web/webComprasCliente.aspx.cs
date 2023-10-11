using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases.BaseDatos;

namespace WEB.webInmoviliaria
{
    public partial class webComprasCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblCedula.Text = Request.QueryString.Get("Documento");
                LlenarGrid();
                btnTerminarContrato.Visible = false;
                lblCodigo2.Visible = false;
            }
        }
        private void LlenarGrid()
        {
            string Documento = lblCedula.Text;

            clsComprasCliente oCliente = new clsComprasCliente();
            oCliente.Documento = Documento;
            oCliente.grdInfoCliente = grdInfoCliente;
            oCliente.grdCompraCliente = grdComprasCliente;

            if (!oCliente.LlenarGridCliente())
            {
                lblError.Text = oCliente.Error;
            }
            if (!oCliente.LlenarGridCompras())
            {
                lblError.Text = oCliente.Error;
            }
        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("webCliente.aspx");
        }

        protected void grdComprasCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCodigoPropiedad.Text = grdComprasCliente.SelectedRow.Cells[1].Text;
            lblTipoPropiedad.Text= grdComprasCliente.SelectedRow.Cells[6].Text;
            lblCodigo2.Text = grdComprasCliente.SelectedRow.Cells[7].Text;
            if (lblTipoPropiedad.Text== "Alquiler")
            {
                btnTerminarContrato.Visible=true;
            }
            else
            {
                btnTerminarContrato.Visible = false;
                lblCodigo2.Visible = false;
            }
        }
        
        protected void btnTerminarContrato_Click(object sender, EventArgs e)
        {
                string estado;
                Int32 codigo;

                estado = "DESOCUPADO";
                codigo = Convert.ToInt32(lblCodigoPropiedad.Text);

                clsVenta_Alquiler oResidencias = new clsVenta_Alquiler();

                oResidencias.codigo_Residencia = codigo;
                oResidencias.Estado = estado;
                
                if (oResidencias.Actualizar())
                {
                    EliminarContrato();
                    lblError.Text = "";
                    LlenarGrid();

                }
                else
                {
                    lblError.Text = oResidencias.Error;
                }
        }
        public void EliminarContrato()
        {
            Int32 Codigo;
            Codigo = Convert.ToInt32(lblCodigo2.Text);

            clsComprasCliente oCliente = new clsComprasCliente();
            oCliente.codigo_Residencia = Codigo;

            if (oCliente.Eliminar())
            {
                lblError.Text = "La residencia con el código: " + Codigo + " fué retirada";
                LlenarGrid();
            }
            else
            {
                lblError.Text = oCliente.Error;
            }
        }
    }
}