using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCHEN_FichaMedica_Negocio.Custom
{
    public class ResultadoBuscadorCita
    {
        public int IdCita { get; set; }
        public string EstadoCita { get; set; }
        public string NombrePaciente { get; set; }
        public string RutPaciente { get; set; }
        public string TipoCita { get; set; }
        public string FechaCita { get; set; }
        public string HoraCita { get; set; }
        public string HoraRealCita { get; set; }

    }
}