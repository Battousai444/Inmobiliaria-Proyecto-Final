using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases.BaseDatos;

namespace WEB.webInmoviliaria
{
    public partial class webEmpleados : System.Web.UI.Page
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
            clsEmpleados oEmpleado = new clsEmpleados();
            oEmpleado.grdEmpleados = grdEmpleados;
            if (!oEmpleado.LlenarGrid())
            {
                lblError.Text = oEmpleado.Error;
            }
        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string Documento, Nombre, PrimerApellido, SegundoApellido, Direccion, Correo;


            Documento = txtDocumento.Text;
            Nombre = txtNombre.Text;
            PrimerApellido = txtPrimerApellido.Text;
            SegundoApellido = txtSegundoApellido.Text;
            Direccion = txtDireccion.Text;
            Correo = txtCorreo.Text;

            clsEmpleados oEmpleado = new clsEmpleados();

            oEmpleado.Documento = Documento;
            oEmpleado.Nombre = Nombre;
            oEmpleado.PrimerApellido = PrimerApellido;
            oEmpleado.SegundoApellido = SegundoApellido;
            oEmpleado.Direccion = Direccion;
            oEmpleado.Correo = Correo;

            if (oEmpleado.Insertar())
            {
                lblError.Text = "Se ingresó el cliente de documento: " + Documento + " a la base de datos";
                LlenarGrid();

            }
            else
            {
                lblError.Text = oEmpleado.Error;
            }

        }

            protected void btnActualizar_Click(object sender, EventArgs e)
            {
            string Documento, Nombre, PrimerApellido, SegundoApellido, Direccion, Correo;
            

            Documento = txtDocumento.Text;
            Nombre = txtNombre.Text;
            PrimerApellido = txtPrimerApellido.Text;
            SegundoApellido = txtSegundoApellido.Text;
            Direccion = txtDireccion.Text;
            Correo = txtCorreo.Text;

            clsEmpleados oEmpleado = new clsEmpleados();

            oEmpleado.Documento = Documento;
            oEmpleado.Nombre = Nombre;
            oEmpleado.PrimerApellido = PrimerApellido;
            oEmpleado.SegundoApellido = SegundoApellido;
            oEmpleado.Direccion = Direccion;
            oEmpleado.Correo = Correo;

            if (oEmpleado.Actualizar())
            {
                lblError.Text = "Se actualizaron los datos del cliente de documento: " + Documento + " a la base de datos";
                LlenarGrid();
            }
            else
            {
                lblError.Text = oEmpleado.Error;
            }
        }

            protected void btnBorrar_Click(object sender, EventArgs e)
            {
            string Documento;
            Documento = txtDocumento.Text;
            

            clsEmpleados oEmpleado = new clsEmpleados();

            oEmpleado.Documento = Documento;
           

            if (oEmpleado.Eliminar())
            {
                lblError.Text = "Se actualizaron los datos del cliente de documento: " + Documento + " a la base de datos";
                LlenarGrid();
            }
            else
            {
                lblError.Text = oEmpleado.Error;
            }
        }

            protected void btnConsultar_Click(object sender, EventArgs e)
            {
            string Documento;
            Documento = txtDocumento.Text;

            clsEmpleados oEmpleado = new clsEmpleados();

            oEmpleado.Documento = Documento;

            if (oEmpleado.Consultar())
            {
                txtNombre.Text = oEmpleado.Nombre;
                txtPrimerApellido.Text = oEmpleado.PrimerApellido;
                txtSegundoApellido.Text = oEmpleado.SegundoApellido;
                txtDireccion.Text = oEmpleado.Direccion;
                txtCorreo.Text = oEmpleado.Correo;

                lblError.Text = "Se consultó la información";
            }
            else
            {
                lblError.Text = oEmpleado.Error;

                txtNombre.Text = "";
                txtPrimerApellido.Text = "";
                txtSegundoApellido.Text = "";
                txtDireccion.Text = "";
                txtCorreo.Text = "";
            }


        }

        protected void grdEmpleados_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Documento, Nombre, Direccion, Correo;

            //documento =grdClientes.SelectedRow.cells[]
            Documento = grdEmpleados.SelectedRow.Cells[1].Text;
            Nombre = grdEmpleados.SelectedRow.Cells[2].Text;
            Direccion = grdEmpleados.SelectedRow.Cells[3].Text;
            Correo = grdEmpleados.SelectedRow.Cells[4].Text;

            //para navegar a otras paginas de utilizan el objeto Response, con el metodo .Redirect()
            //como esta en la misma carpeta se llama solo con el nombre
            //para los parametros, se utiliza el simbolo de interrogacion, para indicar que empiezan los parametros, los
            //cuales tiene un nombre y un valor, asignados por el simbolo "=" y si es mas de un parametro se conecta cone l simboplo9de "&"
            string sURL = "webTelefonoEmpleado.aspx?Documento=" + Documento + "&Nombre=" + Nombre +
                "&Direccion=" + Direccion + "&Correo=" + Correo;
            Response.Redirect(sURL);
        }

        protected void btnPrincipal_Click(object sender, EventArgs e)
        {
            Response.Redirect("PagPrincipal.aspx");
        }

        protected void btnConsultaVentas_Click(object sender, EventArgs e)
        {
            string Documento;
            Documento = txtDocumento.Text;
            string sURL = "webVentasEmpleado.aspx?Documento=" + Documento;
            Response.Redirect(sURL);
        }
    }
}