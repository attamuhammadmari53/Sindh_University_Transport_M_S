﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Sindh_University_Transport_M_S.Models
{
    public class Points_Get
    {
        public int P_Id { get; set; }
        [Required]
        public string P_Name { get; set; }
        [Required]
        public string P_Type { get; set; }
        [Required]
        public string P_Number { get; set; }
        public HttpPostedFileBase P_Photo { get; set; }
        [Required]
        public string P_S_Timing { get; set; }
        [Required]
        public string P_E_Timing { get; set; }
        [Required]
        public string Shift { get; set; }
        public int LocationId { get; set; }
    }
}