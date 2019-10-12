using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LetsFly.Models
{
    public class SendBulkEmail
    {
        //[Display(Name = "Email List")]
        //public int EmailId { get; set; }
        //public List<User> user { get; set; }

        public List<string> EmaiList { get; set; }

        [Required(ErrorMessage = "Please enter a subject.")]
        public string Subject { get; set; }

        [Required(ErrorMessage = "Please enter the contents")]
        public string Contents { get; set; }
        public string Attachment { get; set; }
    }
}