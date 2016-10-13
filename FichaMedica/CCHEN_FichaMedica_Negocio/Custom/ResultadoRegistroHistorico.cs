using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCHEN_FichaMedica_Negocio.Custom
{
    public class ResultadoRegistroHistorico
    {
        public int IdRegistroHistorico { get; set; }
        public int RutPaciente { get; set; }
        public string NombreArchivo { get; set; }
        public string Extension { get; set; }
        public string Tamano { get; set; }
        public string Ruta { get; set; }
    }
}

