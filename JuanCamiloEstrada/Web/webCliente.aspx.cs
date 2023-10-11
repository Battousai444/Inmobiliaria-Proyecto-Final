using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases.BaseDatos;

namespace WEB.webInmoviliaria
{
    public partial class webCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LlenarGrid();
            }
        }
        private void LlenarGrid()
        {
            clsCliente oCliente = new clsCliente();
            oCliente.grdClientes = grdClientes;
            if (!oCliente.LlenarGrid())
            {
                lblError.Text = oCliente.Error;
            }
        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string Documento, PrimerNombre, PrimerApellido, SegundoApellido, Direccion; 
            Int32 Edad;


            Documento = txtDocumento.Text;
            PrimerNombre = txtPrimerNombre.Text;
            PrimerApellido = txtPrimerApellido.Text;
            SegundoApellido = txtSegundoApellido.Text;
            Direccion = txtDireccion.Text;
            Edad = Convert.ToInt32(txtEdad.Text);

            clsCliente oCliente = new clsCliente();

            oCliente.Documento = Documento;
            oCliente.PrimerNombre = PrimerNombre;
            oCliente.PrimerApellido = PrimerApellido;
            oCliente.SegundoApellido = SegundoApellido;
            oCliente.Direccion = Direccion;
            oCliente.Edad = Edad;

            if (oCliente.Insertar())
            {
                lblError.Text = "Se ingresó el cliente de documento: " + Documento + " a la base de datos";
                LlenarGrid();

            }
            else
            {
                lblError.Text = oCliente.Error;
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string Documento, PrimerNombre, PrimerApellido, SegundoApellido, Direccion;
            Int32 Edad;


            Documento = txtDocumento.Text;
            PrimerNombre = txtPrimerNombre.Text;
            PrimerApellido = txtPrimerApellido.Text;
            SegundoApellido = txtSegundoApellido.Text;
            Direccion = txtDireccion.Text;
            Edad = Convert.ToInt32(txtEdad.Text);

            clsCliente oCliente = new clsCliente();
            oCliente.Documento = Documento;
            oCliente.PrimerNombre = PrimerNombre;
            oCliente.PrimerApellido = PrimerApellido;
            oCliente.SegundoApellido = SegundoApellido;
            oCliente.Direccion = Direccion;
            oCliente.Edad = Edad;

            if (oCliente.Actualizar())
            {
                lblError.Text = "Se actualizaron los datos del cliente de documento: " + Documento + " a la base de datos";
                LlenarGrid();
            }
            else
            {
                lblError.Text = oCliente.Error;
            }
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            string Documento;
            Documento = txtDocumento.Text;


            clsCliente oCliente = new clsCliente();

            oCliente.Documento = Documento;


            if (oCliente.Eliminar())
            {
                lblError.Text = "Se actualizaron los datos del cliente de documento: " + Documento + " a la base de datos";
                LlenarGrid();
            }
            else
            {
                lblError.Text = oCliente.Error;
            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            string Documento;

            Documento = txtDocumento.Text;

            clsCliente oCliente = new clsCliente();

            oCliente.Documento = Documento;

            if (oCliente.Consultar())
            {
                txtPrimerNombre.Text = oCliente.PrimerNombre;
                txtPrimerApellido.Text = oCliente.PrimerApellido;
                txtSegundoApellido.Text = oCliente.SegundoApellido;
                txtDireccion.Text = oCliente.Direccion;
                txtEdad.Text = oCliente.Edad.ToString();

                lblError.Text = "Se consultó la información";
            }
            else
            {
                lblError.Text = oCliente.Error;

                txtPrimerNombre.Text = "";
                txtPrimerApellido.Text = "";
                txtSegundoApellido.Text = "";
                txtDireccion.Text = "";
                txtEdad.Text = "";
            }
        }

        protected void grdEmpleados_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Documento, Nombre, Direccion, Edad;

            Documento = grdClientes.SelectedRow.Cells[1].Text;
            Nombre = grdClientes.SelectedRow.Cells[2].Text;
            Direccion = grdClientes.SelectedRow.Cells[3].Text;
            Edad = grdClientes.SelectedRow.Cells[4].Text;

            //para navegar a otras paginas de utilizan el objeto Response, con el metodo .Redirect()
            //como esta en la misma carpeta se llama solo con el nombre
            //para los parametros, se utiliza el simbolo de interrogacion, para indicar que empiezan los parametros, los
            //cuales tiene un nombre y un valor, asignados por el simbolo "=" y si es mas de un parametro se conecta cone l simboplo9de "&"
            string sURL = "webTelefonoCliente.aspx?Documento=" + Documento + "&Nombre=" + Nombre +
                "&Direccion=" + Direccion + "&Edad=" + Edad;
            Response.Redirect(sURL);
        }

        protected void btnPrincipal_Click(object sender, EventArgs e)
        {
            Response.Redirect("PagPrincipal.aspx");
        }

        protected void btnConsultaCliente_Click(object sender, EventArgs e)
        {
            string Documento;
            Documento = txtDocumento.Text;
            string sURL = "webComprasCliente.aspx?Documento=" + Documento;
            Response.Redirect(sURL);
        }
    }
}