using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace AB_CustomerWebAPI_1.Model
{
    public class CustomerContext : DbContext
    {
        public DbSet<Customer> Customers { get; set; }
       
    }
  
    
}