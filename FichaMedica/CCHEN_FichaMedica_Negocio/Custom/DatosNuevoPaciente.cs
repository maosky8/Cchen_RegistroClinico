using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCHEN_FichaMedica_Negocio.Custom
{
    public class DatosNuevoPaciente
    {
        public int RutPaciente { get; set; }
        public string DV { get; set; }
        public string Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string FechaNacimiento { get; set; }
        public int Sexo { get; set; }
        public string Profesion { get; set; }
        public int NivelEducacional { get; set; }
        public string Ocupacion { get; set; }
        public int Departamento { get; set; }
        public int Sede { get; set; }
        public string Direccion { get; set; }
        public int EstadoCivil { get; set; }
        public int Prevision { get; set; }
        public string FonoContacto { get; set; }
        public string FonoEmergencia { get; set; }
        public string ContactoEmergencia { get; set; }


    }
}
