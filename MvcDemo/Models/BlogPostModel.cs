using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Dados;

namespace MvcDemo.Models
{
    public class BlogPostModel
    {
        public int PostId { get; set; }
        public string Post { get; set; }
        public string Title { get; set; }
        public string Tags { get; set; }
        public int UserId { get; set; }
    }

    //public class DataModelPostContext : DbContext
    //{
    //    public DbSet<BlogPostModel> BlogPosts { get; set; }
    //}
}