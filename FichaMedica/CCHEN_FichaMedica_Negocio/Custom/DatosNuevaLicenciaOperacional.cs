using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCHEN_FichaMedica_Negocio.Custom
{
    public class DatosNuevaLicenciaOperacional
    {
        public string FechaRegistro { get; set; }
        public string FechaInicio { get; set; }
        public string FechaFin { get; set; }
        public int EstadoLicenciaOperacional { get; set; }
        public string Apreciacion { get; set; }
        public int Dias { get; set; }
        public int RegistroClinicoID { get; set; }
    }
}
