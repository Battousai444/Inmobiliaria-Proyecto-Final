using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases.BaseDatos;
using libComunes.CapaDatos;

namespace WEB.webInmoviliaria
{
    public partial class webVenta_Alquiler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LlenarGrid();
                LlenarComboDeCombos();
            }
        }
        private void LlenarGrid()
        {
            clsVenta_Alquiler oRedsidencias = new clsVenta_Alquiler();
            oRedsidencias.grdVentaAlquiler = grdVentaAlquiler;
            if (!oRedsidencias.LlenarGridVenta())
            {
                lblError.Text = oRedsidencias.Error;
            }
        }
        public void LlenarComboDeCombos()
        {
            clsVenta_Alquiler ocombosVenta = new clsVenta_Alquiler();
            
            ocombosVenta.cboEmpleado = cboEmpleado;
            ocombosVenta.cboPago = cboPago;

            
            if (ocombosVenta.LlenarComboEmpleado() == false)
            {
                lblError.Text = ocombosVenta.Error;
            }
            if (ocombosVenta.LlenarComboPago() == false)
            {
                lblError.Text = ocombosVenta.Error;
            }
        }

        protected void btnBuscarcliente_Click(object sender, EventArgs e)
        {
            String Documento;
            Documento = txtCedula.Text;
            clsVenta_Alquiler oVenta = new clsVenta_Alquiler();
            oVenta.DocumentoCliente = Documento;
            if (oVenta.ConsultarCliente())
            {
                lblNombreCliente.Text = oVenta.NombreCliente;
            }
            else
            {
                lblError.Text = "El documento del cliente no está registrado";
                lblNombreCliente.Text = "-";
            }
        }

        protected void btnRealizarPago_Click(object sender, EventArgs e)
        {
            string DocumentoEmpleado, DocumentoCliente;
            Int32 CodigoResidencia, MetodoPago;

            DocumentoEmpleado = cboEmpleado.SelectedValue;
            DocumentoCliente = txtCedula.Text;
            CodigoResidencia = Convert.ToInt32(lblCodigo.Text);
            MetodoPago = Convert.ToInt32(cboPago.SelectedValue);

            clsVenta_Alquiler oVenta = new clsVenta_Alquiler();

            oVenta.DocumentoEmpleado = DocumentoEmpleado;
            oVenta.DocumentoCliente = DocumentoCliente;
            oVenta.codigo_Residencia = CodigoResidencia;
            oVenta.MetodoPago = MetodoPago;
            if (oVenta.Insertar())
            {
                ActualizarResidencia();
                lblError.Text = "Se ingresó la venta del cliente: " + DocumentoCliente + " fué exitosa";
                LlenarGrid();

            }
            else
            {
                lblError.Text = oVenta.Error;
            }

        }
        public void ActualizarResidencia()
        {
            string Direccion, Tamaño, estado;
            Int32 codigo;

            Direccion = lblDireccion.Text;
            Tamaño = lblTamaño.Text;
            estado = "OCUPADO";
            codigo = Convert.ToInt32(lblCodigo.Text);

            clsVenta_Alquiler oResidencias = new clsVenta_Alquiler();

            oResidencias.codigo_Residencia = codigo;
            oResidencias.Direccion = Direccion;
            oResidencias.Tamaño = Tamaño;
            oResidencias.Estado = estado;
            if (oResidencias.Actualizar())
            {
                lblError.Text = "";
                LlenarGrid();
            }
            else
            {
                lblError.Text = oResidencias.Error;
            }
        }
        protected void btnPagPrincipal_Click(object sender, EventArgs e)
        {
            Response.Redirect("PagPrincipal.aspx");
        }

        protected void btnDetalles_Click(object sender, EventArgs e)
        {
            Response.Redirect("webDetallesCliente.aspx");
        }

        protected void grdVentaAlquiler_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCodigo.Text = grdVentaAlquiler.SelectedRow.Cells[1].Text;
            lblDireccion.Text = grdVentaAlquiler.SelectedRow.Cells[2].Text;
            lblTamaño.Text = grdVentaAlquiler.SelectedRow.Cells[3].Text;
            lblAmueblado.Text = grdVentaAlquiler.SelectedRow.Cells[4].Text;
            lblGaraje.Text = grdVentaAlquiler.SelectedRow.Cells[5].Text;
            lblInternet.Text = grdVentaAlquiler.SelectedRow.Cells[6].Text;
            lblPatio.Text = grdVentaAlquiler.SelectedRow.Cells[7].Text;
            lblPiscina.Text = grdVentaAlquiler.SelectedRow.Cells[8].Text;
            lblTerraza.Text = grdVentaAlquiler.SelectedRow.Cells[9].Text;
            lblTipoResidencia.Text = grdVentaAlquiler.SelectedRow.Cells[10].Text;
            lblUbicacion.Text = grdVentaAlquiler.SelectedRow.Cells[11].Text;
            //droAmueblado();
            //droGarage();
            //droInternet();
            //droPatio();
            //droPisina();
            //droTerraza();
            //droTipoResidencia();
            //droUbicacion();
            lblPrecio.Text = grdVentaAlquiler.SelectedRow.Cells[12].Text;
        }
        private void droUbicacion()
        {
            String valor = grdVentaAlquiler.SelectedRow.Cells[11].Text;
            string SQL;
            string valoint = "0";
            int VAL = 0;



            SQL = "SELECT codUbicacion1 " +
            "FROM dbo.tblUbicacion " +
            "WHERE NombreUbicacion = @rValor";



            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@rvalor", valor);
            if (oConexion.Consultar())
            {
                if (oConexion.Reader.HasRows)
                {
                    //leer
                    oConexion.Reader.Read();
                    VAL = oConexion.Reader.GetInt32(0);
                }



            }
            else
            {
                lblError.Text = "no dunciono";



            }
            valoint = VAL.ToString();
            lblUbicacion.Text= valoint;
        }
        private void droAmueblado()
        {
            String valor = grdVentaAlquiler.SelectedRow.Cells[4].Text;
            string SQL;
            string valoint = "0";
            int VAL = 0;



            SQL = "SELECT codAmueblado1 " +
            "FROM dbo.tblAmueblado " +
            "WHERE Amueblacion = @rValor";



            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@rvalor", valor);
            if (oConexion.Consultar())
            {
                if (oConexion.Reader.HasRows)
                {
                    //leer
                    oConexion.Reader.Read();
                    VAL = oConexion.Reader.GetInt32(0);
                }



            }
            else
            {
                lblError.Text = "no dunciono";



            }
            valoint = VAL.ToString();
            lblAmueblado.Text = valoint;
        }
        private void droGarage()
        {
            String valor = grdVentaAlquiler.SelectedRow.Cells[5].Text;
            string SQL;
            string valoint = "0";
            int VAL = 0;



            SQL = "SELECT codGarage1 " +
            "FROM dbo.tblGarage " +
            "WHERE EspacioGarage = @rValor";



            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@rvalor", valor);
            if (oConexion.Consultar())
            {
                if (oConexion.Reader.HasRows)
                {
                    //leer
                    oConexion.Reader.Read();
                    VAL = oConexion.Reader.GetInt32(0);
                }



            }
            else
            {
                lblError.Text = "no dunciono";



            }
            valoint = VAL.ToString();
            lblGaraje.Text = valoint;
        }
        private void droInternet()
        {
            String valor = grdVentaAlquiler.SelectedRow.Cells[6].Text;
            string SQL;
            string valoint = "0";
            int VAL = 0;



            SQL = "SELECT codInternet1 " +
            "FROM dbo.tblInternet " +
            "WHERE NombreInternet = @rValor";



            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@rvalor", valor);
            if (oConexion.Consultar())
            {
                if (oConexion.Reader.HasRows)
                {
                    //leer
                    oConexion.Reader.Read();
                    VAL = oConexion.Reader.GetInt32(0);
                }



            }
            else
            {
                lblError.Text = "no dunciono";



            }
            valoint = VAL.ToString();
            lblInternet.Text = valoint;
        }
        private void droPatio()
        {
            String valor = grdVentaAlquiler.SelectedRow.Cells[7].Text;
            string SQL;
            string valoint = "0";
            int VAL = 0;



            SQL = "SELECT codPatio1 " +
            "FROM dbo.tblPatio " +
            "WHERE TipoPatio = @rValor";



            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@rvalor", valor);
            if (oConexion.Consultar())
            {
                if (oConexion.Reader.HasRows)
                {
                    //leer
                    oConexion.Reader.Read();
                    VAL = oConexion.Reader.GetInt32(0);
                }



            }
            else
            {
                lblError.Text = "no dunciono";



            }
            valoint = VAL.ToString();
            lblPatio.Text = valoint;
        }
        private void droPisina()
        {
            String valor = grdVentaAlquiler.SelectedRow.Cells[8].Text;
            string SQL;
            string valoint = "0";
            int VAL = 0;



            SQL = "SELECT codPisina1 " +
            "FROM dbo.tblPisina " +
            "WHERE tamanoPisina = @rValor";



            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@rvalor", valor);
            if (oConexion.Consultar())
            {
                if (oConexion.Reader.HasRows)
                {
                    //leer
                    oConexion.Reader.Read();
                    VAL = oConexion.Reader.GetInt32(0);
                }



            }
            else
            {
                lblError.Text = "no dunciono";



            }
            valoint = VAL.ToString();
            lblPiscina.Text = valoint;
        }
        private void droTerraza()
        {
            String valor = grdVentaAlquiler.SelectedRow.Cells[9].Text;
            string SQL;
            string valoint = "0";
            int VAL = 0;



            SQL = "SELECT codTerraza1 " +
            "FROM dbo.tblTerraza " +
            "WHERE TipoTerraza = @rValor";



            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@rvalor", valor);
            if (oConexion.Consultar())
            {
                if (oConexion.Reader.HasRows)
                {
                    //leer
                    oConexion.Reader.Read();
                    VAL = oConexion.Reader.GetInt32(0);
                }



            }
            else
            {
                lblError.Text = "no dunciono";



            }
            valoint = VAL.ToString();
            lblTerraza.Text = valoint;
        }
        private void droTipoResidencia()
        {
            String valor = grdVentaAlquiler.SelectedRow.Cells[10].Text;
            string SQL;
            string valoint = "0";
            int VAL = 0;



            SQL = "SELECT codTipoResidencia1 " +
            "FROM dbo.tblTipoResidencia " +
            "WHERE TipoResidencia = @rValor";



            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@rvalor", valor);
            if (oConexion.Consultar())
            {
                if (oConexion.Reader.HasRows)
                {
                    //leer
                    oConexion.Reader.Read();
                    VAL = oConexion.Reader.GetInt32(0);
                }



            }
            else
            {
                lblError.Text = "no dunciono";



            }
            valoint = VAL.ToString();
            lblTipoResidencia.Text = valoint;
        }
    }
}