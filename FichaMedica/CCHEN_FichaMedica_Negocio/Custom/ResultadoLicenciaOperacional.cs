﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCHEN_FichaMedica_Negocio.Custom
{
    public class ResultadoLicenciaOperacional
    {
        public int IdLicenciaOperacional { get; set; }
        public string IdNombreLicenciaOperacional { get; set; }
        public string NombreMedico { get; set; }
        public string FechaRegistro { get; set; }
        public string FechaInicio { get; set; }
        public string FechaFin { get; set; }
        public string EstadoLicenciaOperacional { get; set; }
        public string Apreciacion { get; set; }
        public string Dias { get; set; }
    }
}