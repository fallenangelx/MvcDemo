using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dados;
using MvcDemo.Dto;
using MvcDemo.Models;

namespace MvcDemo.Controllers
{
    public class CredentialsTestController : Controller
    {
        private BlogDatabaseEntities db = new BlogDatabaseEntities();

        //
        // GET: /CredentialsTest/

        public ActionResult Index()
        {
            return View(db.UserSet.ToList());
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public bool DoLogin(LoginDTO loginData)
        {
            var containuser = 0;
            foreach (var user in db.UserSet)
            {
                if (loginData.Username == user.UserName && loginData.Password == user.Password)
                    containuser = 1;
            }

            if (containuser == 1)
            {
                Session.Add("logged", loginData);
                return true;
            }

            else
                return false;
        }

        //
        // GET: /CredentialsTest/Details/5

        public ActionResult Details(int id = 0)
        {
            User credentialsmodel = db.UserSet.Find(id);
            if (credentialsmodel == null)
            {
                return HttpNotFound();
            }
            return View(credentialsmodel);
        }

        //
        // GET: /CredentialsTest/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /CredentialsTest/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(User credentialsmodel)
        {
            if (ModelState.IsValid)
            {
                if ((credentialsmodel.UserName != null) &&
                    (credentialsmodel.Password != null) &&
                    (credentialsmodel.Email != null))
                {
                    db.UserSet.Add(credentialsmodel);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    return Content("Error, be sure to fill all the boxes!");
                }


            }

            return View(credentialsmodel);
        }

        //
        // GET: /CredentialsTest/Edit/5

        public ActionResult Edit(int id = 0)
        {
            User credentialsmodel = db.UserSet.Find(id);
            if (credentialsmodel == null)
            {
                return HttpNotFound();
            }
            return View(credentialsmodel);
        }

        //
        // POST: /CredentialsTest/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CredentialsModel credentialsmodel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(credentialsmodel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(credentialsmodel);
        }

        //
        // GET: /CredentialsTest/Delete/5

        public ActionResult Delete(int id = 0)
        {
            User credentialsmodel = db.UserSet.Find(id);
            if (credentialsmodel == null)
            {
                return HttpNotFound();
            }
            return View(credentialsmodel);
        }

        //
        // POST: /CredentialsTest/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            User credentialsmodel = db.UserSet.Find(id);
            db.UserSet.Remove(credentialsmodel);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}