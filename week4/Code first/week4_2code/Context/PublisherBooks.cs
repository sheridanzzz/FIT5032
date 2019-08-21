using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using week4_2code.Models;

namespace week4_2code.Context
{
    public class PublisherBooks : DbContext
    {

        public DbSet<Publisher> Publishers { get; set; }

        public DbSet<Book> Books { get; set; }
    }
}