//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace LetsFly.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Rating
    {
        public int RatingId { get; set; }

        [Required(ErrorMessage = "Please Enter Rating number")]
        [Range(0, 5)]
        [Display(Name = "Rating number")]
        public int RatingNumber { get; set; }
        public string RatingImg { get; set; }
        public System.DateTime RatingDate { get; set; }

        [Required(ErrorMessage = "Please Enter Description")]
        [Display(Name = "Description")]
        [AllowHtml]
        public string RatingDescription { get; set; }

        [Required(ErrorMessage = "Please select Airline")]
        [Display(Name = "Airline")]
        public int AirlineId { get; set; }
        public string UserId { get; set; }
    
        public virtual Airline Airline { get; set; }
        public virtual User User { get; set; }
    }
}
