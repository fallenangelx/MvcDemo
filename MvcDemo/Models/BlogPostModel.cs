namespace MvcDemo.Models
{
    public class BlogPostModel
    {
        public int PostId { get; set; }
        public string Post { get; set; }
        public string Title { get; set; }
        public int UserId { get; set; }
        public int TagsId { get; set; }
    }

    //public class DataModelPostContext : DbContext
    //{
    //    public DbSet<BlogPostModel> BlogPosts { get; set; }
    //}
}