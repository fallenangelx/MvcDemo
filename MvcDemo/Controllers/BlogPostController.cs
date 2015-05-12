using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dados;
using MvcDemo.Models;

namespace MvcDemo.Controllers
{
    public class BlogPostController : Controller
    {
        private BlogDatabaseEntities db = new BlogDatabaseEntities();
        //
        // GET: /BlogPost/

        public ActionResult Index()
        {
            var blogpostmodel = db.BlogPostSet.ToList();
            return View(blogpostmodel);
        }

    }
}
