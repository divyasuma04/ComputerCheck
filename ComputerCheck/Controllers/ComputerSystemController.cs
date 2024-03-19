using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DBLayer;

namespace ComputerCheck.Controllers
{
    public class ComputerSystemController : ApiController
    {
        private readonly ComputerSystemDBEntities _context = new ComputerSystemDBEntities();

        public ComputerSystemController()
        {
            _context.Configuration.ProxyCreationEnabled = false;
        }
        // GET api/values
        public IEnumerable<ComputerSystem> Get()
        {
            return _context.ComputerSystems.ToList();
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
