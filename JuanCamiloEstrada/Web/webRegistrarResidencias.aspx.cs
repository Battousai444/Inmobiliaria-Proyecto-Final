using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases.BaseDatos;
using libComunes.CapaDatos;
using libComunes.CapaObjetos;

namespace WEB.webInmoviliaria
{
    public partial class webRegistrarResidencias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LlenarGrid();
                LlenarComboDeCombos();
            }
        }
        private void LlenarComboDeCombos()
        {
            clsCombosResidencias oCombos = new clsCombosResidencias();
            oCombos.cboAmueblacion = dropAmueblado ;
            oCombos.cboGarage = dropGarage;
            oCombos.cboInternet = dropInternet;
            oCombos.cboPatio = dropPatio;
            oCombos.cboPisina = dropPisina;
            oCombos.cboTerraza = dropTerraza;
            oCombos.cboTipoResidencia = dropTipoResidencia;
            oCombos.cboUbicacion = dropUbicacion;

            if (oCombos.LlenarComboGarage() == false)
            {
                lblError.Text = oCombos.Error;
            }
            if (oCombos.LlenarComboIntenet() == false)
            {
                lblError.Text = oCombos.Error;
            }
            if (oCombos.LlenarComboUbicacion() == false)
            {
                lblError.Text = oCombos.Error;
            }
            if (oCombos.LlenarComboPatio() == false)
            {
                lblError.Text = oCombos.Error;
            }
            if (oCombos.LlenarComboTipoResidencia() == false)
            {
                lblError.Text = oCombos.Error;
            }
            if (oCombos.LlenarComboAmueblado() == false)
            {
                lblError.Text = oCombos.Error;
            }
            if (oCombos.LlenarComboPisina() == false)
            {
                lblError.Text = oCombos.Error;
            }
            if (oCombos.LlenarComboTerraza() == false)
            {
                lblError.Text = oCombos.Error;
            }

        }
        private void LlenarGrid()
        {
            clsResidencias oRedsidencias = new clsResidencias();
            oRedsidencias.grdResidencias = grdResidencias;
            if (!oRedsidencias.LlenarGrid())
            {
                lblError.Text = oRedsidencias.Error;
            }
        }


        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            string Direccion, Tamaño, estado ;
            Int32  ubicacion, garage, amueblado, pisina, internet, patio, terraza, tipoResidencia, precio;

            Direccion = txtDireccion.Text;
            Tamaño = txtTamaño.Text;
            estado = "DESOCUPADO";
            ubicacion = Convert.ToInt32(dropUbicacion.SelectedValue.ToString());
            garage = Convert.ToInt32(dropGarage.SelectedValue.ToString());
            amueblado = Convert.ToInt32(dropAmueblado.SelectedValue.ToString());
            pisina = Convert.ToInt32(dropPisina.SelectedValue.ToString());
            internet = Convert.ToInt32(dropInternet.SelectedValue.ToString());
            patio = Convert.ToInt32(dropPatio.SelectedValue.ToString());
            terraza = Convert.ToInt32(dropTerraza.SelectedValue.ToString());
            tipoResidencia = Convert.ToInt32(dropTipoResidencia.SelectedValue.ToString());
            precio = Convert.ToInt32(txtPrecio.Text);

            clsResidencias oResidencias = new clsResidencias();

            oResidencias.Direccion = Direccion;
            oResidencias.Tamaño = Tamaño;
            oResidencias.Estado = estado;
            oResidencias.codUbicacion = ubicacion;
            oResidencias.codGarage = garage;
            oResidencias.codAmueblado = amueblado;
            oResidencias.codPisina = pisina;
            oResidencias.codInternet = internet;
            oResidencias.codPatio = patio;
            oResidencias.codterraza = terraza;
            oResidencias.codTipoResidencia = tipoResidencia;
            oResidencias.precio = precio;
            if (oResidencias.Insertar())
            {
                lblError.Text = "Se ingresó la residencia con direccion: " + Direccion + " a la base de datos";
                LlenarGrid();

            }
            else
            {
                lblError.Text = oResidencias.Error;
            }

        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string Direccion, Tamaño, estado;
            Int32 ubicacion, garage, amueblado, pisina, internet, patio, terraza, tipoResidencia, precio, codigo;

            Direccion = txtDireccion.Text;
            Tamaño = txtTamaño.Text;
            estado = "DESOCUPADO";
            codigo = Convert.ToInt32(lblCodigo.Text);
            ubicacion = Convert.ToInt32(dropUbicacion.SelectedValue.ToString());
            garage = Convert.ToInt32(dropGarage.SelectedValue.ToString());
            amueblado = Convert.ToInt32(dropAmueblado.SelectedValue.ToString());
            pisina = Convert.ToInt32(dropPisina.SelectedValue.ToString());
            internet = Convert.ToInt32(dropInternet.SelectedValue.ToString());
            patio = Convert.ToInt32(dropPatio.SelectedValue.ToString());
            terraza = Convert.ToInt32(dropTerraza.SelectedValue.ToString());
            tipoResidencia = Convert.ToInt32(dropTipoResidencia.SelectedValue.ToString());
            precio = Convert.ToInt32(txtPrecio.Text);

            clsResidencias oResidencias = new clsResidencias();

            oResidencias.codigo_Residencia = codigo;
            oResidencias.Direccion = Direccion;
            oResidencias.Tamaño = Tamaño;
            oResidencias.Estado = estado;
            oResidencias.codUbicacion = ubicacion;
            oResidencias.codGarage = garage;
            oResidencias.codAmueblado = amueblado;
            oResidencias.codPisina = pisina;
            oResidencias.codInternet = internet;
            oResidencias.codPatio = patio;
            oResidencias.codterraza = terraza;
            oResidencias.codTipoResidencia = tipoResidencia;
            oResidencias.precio = precio;
            if (oResidencias.Actualizar())
            {
                lblError.Text = "se actualizo la residencia con el codigo: " + codigo + " en la base de datos";
                LlenarGrid();

            }
            else
            {
                lblError.Text = oResidencias.Error;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Int32 codigo;

            codigo = Convert.ToInt32(lblCodigo.Text);

            clsResidencias oResidencias = new clsResidencias();

            oResidencias.codigo_Residencia = codigo;

            if (oResidencias.Eliminar())
            {
                lblError.Text = "se eliminaron los datos de la residencia con el codigo: " + codigo + " en la base de datos";
                LlenarGrid();
            }
            else
            {
                lblError.Text = oResidencias.Error;
            }

        }

        protected void grdResidencias_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCodigo.Text = grdResidencias.SelectedRow.Cells[1].Text;
            txtDireccion.Text = grdResidencias.SelectedRow.Cells[2].Text;
            txtTamaño.Text = grdResidencias.SelectedRow.Cells[3].Text;

            droAmueblado();
            droGarage();
            droInternet();
            droPatio();
            droPisina();
            droTerraza();
            droTipoResidencia();
            droUbicacion();

            txtPrecio.Text = grdResidencias.SelectedRow.Cells[12].Text;

        }

        protected void btnPaginaPrin_Click(object sender, EventArgs e)
        {
            Response.Redirect("PagPrincipal.aspx");
        }
        private void droAmueblado()
        {
            String valor = grdResidencias.SelectedRow.Cells[4].Text;
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
            dropAmueblado.SelectedValue = valoint;
        }
        private void droGarage()
        {
            String valor = grdResidencias.SelectedRow.Cells[5].Text;
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
            dropGarage.SelectedValue = valoint;
        }
        private void droInternet()
        {
            String valor = grdResidencias.SelectedRow.Cells[6].Text;
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
            dropInternet.SelectedValue = valoint;
        }
        private void droPatio()
        {
            String valor = grdResidencias.SelectedRow.Cells[7].Text;
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
            dropPatio.SelectedValue = valoint;
        }
        private void droPisina()
        {
            String valor = grdResidencias.SelectedRow.Cells[8].Text;
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
            dropPisina.SelectedValue = valoint;
        }
        private void droTerraza()
        {
            String valor = grdResidencias.SelectedRow.Cells[9].Text;
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
            dropTerraza.SelectedValue = valoint;
        }
        private void droTipoResidencia()
        {
            String valor = grdResidencias.SelectedRow.Cells[10].Text;
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
            dropTipoResidencia.SelectedValue = valoint;
        }
        private void droUbicacion()
        {
            String valor = grdResidencias.SelectedRow.Cells[11].Text;
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
            dropUbicacion.SelectedValue = valoint;
        }
    }
}