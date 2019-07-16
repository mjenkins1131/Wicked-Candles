using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wicked_Candles.Models;

namespace Wicked_Candles.Controllers
{
    public class ShopController : Controller
    {
        Wicked_CandlesEntities2 db = new Wicked_CandlesEntities2();

        // GET: Shop
        public ActionResult Index()
        {
            return View(db.Products.ToList());
        }

        // GET: Product Details
        public ActionResult Product_Detail()
        {
            return View();
        }
    }
}