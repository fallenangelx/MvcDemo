using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Dados;

namespace MvcDemo.Models
{
    public class CredentialsModel
    {
        public string Username { get; set; }
        [DataType(DataType.Password)]
        public string Password { get; set; }
        public string Email { get; set; }
        [Key]
        public int UserId { get; set; }
    }

    public class DataModelContext : DbContext
    {
        public DbSet<CredentialsModel> Credential { get; set; }
    }
}