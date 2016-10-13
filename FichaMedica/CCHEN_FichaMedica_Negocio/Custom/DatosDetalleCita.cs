using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCHEN_FichaMedica_Negocio.Custom
{
    public class DatosDetalleCita
    {
        public int IdCita { get; set; }
        public int EstadoCita { get; set; }
        public string NombrePaciente { get; set; }
        public int? RutPaciente { get; set; }
        public int TipoCita { get; set; }
        public string FechaCita { get; set; }
        public string HoraCita { get; set; }
        public string HoraRealCita { get; set; }
        public string NumeroContacto { get; set; }
        public string Observaciones { get; set; }
        public string Responsable { get; set; }
    }
}
