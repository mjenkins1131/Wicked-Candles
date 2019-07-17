using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Wicked_Candles.Models;

namespace Wicked_Candles.Controllers
{
    [RoutePrefix("api/ShopApi")]
    public class ShopApiController : ApiController
    {
        Wicked_CandlesEntities2 db = new Wicked_CandlesEntities2();


        // GET api/Product
        [HttpGet]
        public IEnumerable<Product> Get()
        {
            return db.Products.ToList();
        }

        // GET api/Product/<ID>
        [HttpGet]
        [Route("api/ShopApi/{id}")]
        public Product Get(int id)
        {
            return (Product)db.Products.Where(p=> p.ProductID == id);
        }

        // POST api/Product
        public void Post([FromBody]string value)
        {
        }

        // PUT api/Product/<ID>
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/Product/5
        public void Delete(int id)
        {
        }
    }
}