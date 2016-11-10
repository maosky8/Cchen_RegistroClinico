using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCHEN_FichaMedica_Negocio.Custom
{
    public class ResultadoBuscadorAnalisisLab
    {
        public int ID { get; set; }
        public int Id_AnalisisLab { get; set; }
        public string AnalisisLab { get; set;  }
        public string Fecha { get; set; }
        public string Resultado { get; set; }
        public string Unidad { get; set; }
        public string Lugar { get; set; }
        public string Estado { get; set; }
        public int idEstado { get; set; }
        public string Editar { get; set; }
        public string NombreArchivo { get; set; }
        public string Ruta { get; set; }
        public int Tamano { get; set; }
    }
}
