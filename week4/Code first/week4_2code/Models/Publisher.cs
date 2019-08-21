using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace week4_2code.Models
{
    public class Publisher
    {
        public int id { get; set;}

        public string PubName { get; set; }

        public List<Book> books { get; set; }

    }
}