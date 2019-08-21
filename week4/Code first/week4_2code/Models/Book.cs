using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace week4_2code.Models
{
    public class Book
    {
        public int id { get; set; }

        public string name { get; set; }

        public virtual Publisher Publisher { get; set;}
    }
}