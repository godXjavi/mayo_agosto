using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace P_orden_compra
{
    class ORDEN_CMPRA
    {
        public void insertar_ORDEN_COMPRA(ref string mensaje, int varid_ORDEN, string var_FECHA_EMICION, string var_FECHA_ENTREGA, int   var_CLAVE_CLIENTE)
        {
            SqlConnection universo = new SqlConnection();
            universo.ConnectionString = "data source=PC13" + "Initial Catalogo=Orden_Compras" + ";Integrated Security=true";
            SqlCommand cosmos = new SqlCommand();
            try
            {
                universo.Open();
                cosmos.CommandText = "Insert Into CLIENTES(id_ORDEN,FECHA_EMICION,FECHA_ENTREGA,CLAVE_CLIENTE) values ('" + varid_ORDEN + "','" + var_FECHA_EMICION + "','" + var_FECHA_ENTREGA + "','" + var_CLAVE_CLIENTE + "')";
                cosmos.Connection = universo;
                cosmos.ExecuteNonQuery();
                mensaje = "ORDEN DE COMPRA  INSERTADO PAPU OWO";
                universo.Close();
            }
            catch (Exception atomo)
            {
                cosmos = null;
                mensaje = "ERROR:" + atomo.Message;
            }

        }
        public void consultar_ORDEN_COMPRAS(ref string mensage, ListBox lista)
        {
            SqlConnection universo = new SqlConnection();
            SqlCommand cosmos = new SqlCommand();
            SqlDataReader recupilador;
            universo.ConnectionString = "data source=PC15" + "Initial Catalogo=Orden_Compras" + ";Integrated Security=true";
            mensage = "ORDEN DE COMPRAS REALIZADA";
            try
            {
                universo.Open();
                cosmos.CommandText = ("SELECT* FROM Orden_Compra");
                cosmos.Connection = universo;
                recupilador = cosmos.ExecuteReader();
                while (recupilador.Read())
                {
                    lista.Items.Add(recupilador[0].ToString() + "," + recupilador[1].ToString() + "," + recupilador[2].ToString() + "," + recupilador[3].ToString());
                }
                universo.Close();

            }
            catch (Exception REY)
            {
                universo = null;
                MessageBox.Show("ERROR PAPU" + REY.Message);

            }
        }
    }
}
