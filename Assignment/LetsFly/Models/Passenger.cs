//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LetsFly.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Passenger
    {
        public int PassengerId { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PassportNo { get; set; }
        public int BookingNumber { get; set; }
    
        public virtual Booking Booking { get; set; }
    }
}