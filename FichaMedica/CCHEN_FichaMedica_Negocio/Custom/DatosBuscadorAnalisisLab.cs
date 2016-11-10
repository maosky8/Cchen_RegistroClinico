using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCHEN_FichaMedica_Negocio.Custom
{
    public class DatosBuscadorAnalisisLab
    {
        public int Rut { get; set; }
        public int? AnaLisisLab { get; set; }
        public int? Estado { get; set; }
        public DateTime? Desde { get; set; }
        public DateTime? Hasta { get; set; }
    }
}
