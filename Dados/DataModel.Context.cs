﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Dados
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BlogDatabaseEntities : DbContext
    {
        public BlogDatabaseEntities()
            : base("name=BlogDatabaseEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Movies> MoviesSet { get; set; }
        public DbSet<BlogPost> BlogPostSet { get; set; }
        public DbSet<Comments> CommentsSet { get; set; }
        public DbSet<User> UserSet { get; set; }
        public DbSet<Tags> TagsSet { get; set; }
    }
}
