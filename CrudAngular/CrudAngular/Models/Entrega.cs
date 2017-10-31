using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CrudAngular.Models
{
    public class Entrega
    {
        [Key]
        [HiddenInput(DisplayValue = false)]
        public int Id { get; set; }

        [Required]
        [EmailAddress]
        [Display(Name = "Correo Electronico")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [Display(Name = "Nombre")]
        public string Name { get; set; }

        [Display(Name = "Estado")]
        public bool Estado { get; set; }


    }
}