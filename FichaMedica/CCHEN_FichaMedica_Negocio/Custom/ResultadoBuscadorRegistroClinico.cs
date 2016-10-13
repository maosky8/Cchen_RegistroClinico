using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCHEN_FichaMedica_Negocio.Custom
{
    public class ResultadoBuscadorRegistroClinico
    {
        public int IdRutPaciente { get; set; }
        public string RutPaciente { get; set; }
        public string NombrePaciente { get; set; }
        public string Sexo { get; set; }
        public string Sede { get; set; }
        public string Departamento { get; set; }

    }
}
