using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Wicked_Candles.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Register()
        {
            return View();
        }

        //GET: Login
        public ActionResult Login()
        {
            return View();
        }

        //GET: Wishlist
        public ActionResult WishList()
        {
            return View();
        }
    }
}