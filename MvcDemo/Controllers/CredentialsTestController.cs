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
            // lista os usuários
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
            // verifica se o usuário já existe no db
            foreach (var user in db.UserSet)
            {
                if (loginData.Username == user.UserName && loginData.Password == user.Password)
                    containuser = 1;
            }
            // se o conter o usuário, salva no cache para o usuário ficar logado
            if (containuser == 1)
            {
                Session.Add("logged", loginData);
                return true;
            }

            else
                return false;
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
                // verifica se todos os campos estão preenchidos se estiver, grava no db o novo usuário.
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
    }
}