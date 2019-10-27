using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LetsFly.Models
{
    public class FlightViewModel
    {
        
        public List<Airport> Airport { get; set; }

        
        public string Origin { get; set; }

        
        public string Destination { get; set; }

        [Required(ErrorMessage = "Please Select Date")]
        [Display(Name = "Date")]
        public DateTime FlightDate { get; set; }

        public List<Flight> Flight { get; set; }


    }
}