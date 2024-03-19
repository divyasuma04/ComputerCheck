using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBLayer;

namespace ComputerCheck.Controllers
{
    public class HomeController : Controller
    {
        private readonly ComputerSystemDBEntities _context = new ComputerSystemDBEntities();

        public HomeController()
        {
            _context.Configuration.ProxyCreationEnabled = false;
        }
        //Gets all the Computer Configuration available along with Details
        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";
            var computerSystems = _context.ComputerSystems
                .Include(cs => cs.StorageDevice)
                .Include(cs => cs.GraphicsCard)
                .Include(cs=> cs.Memory)
                .Include(cs => cs.Processor).ToList();

            return View(computerSystems);
        }

        // GET: Display a form to edit a Computer Configuration
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var computerSystems = _context.ComputerSystems.Where(c => c.computer_id == id).Include(cs => cs.StorageDevice)
                .Include(cs => cs.GraphicsCard)
                .Include(cs => cs.Memory)
                .Include(cs => cs.Processor).ToList().FirstOrDefault();
            if (computerSystems == null)
            {
                return HttpNotFound();
            }
            return View(computerSystems);
        }

        // POST: Update a Computer Configuration
        [HttpPost]
        public ActionResult Edit(ComputerSystem computerSystem)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _context.Entry(computerSystem.GraphicsCard).State = EntityState.Modified;
                    _context.Entry(computerSystem.Processor).State = EntityState.Modified;
                    _context.Entry(computerSystem.Memory).State = EntityState.Modified;
                    _context.Entry(computerSystem.StorageDevice).State = EntityState.Modified;
                    _context.Entry(computerSystem).State = EntityState.Modified;
                    _context.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    // Handle model validation errors
                    ViewData["ErrorMessage"] = "Model State is invalid, please correct the errors";
                    return View(computerSystem);
                }
            }
            catch (Exception e)
            {
                ViewData["ErrorMessage"] = $"Exception with the message {e.Message} is thrown";
                return View(computerSystem);
            }
        }

        // POST: Search Computer Configurations based on any search key
        [HttpPost]
        public ActionResult Search(string searchTerm)
        {
            var computerSystems = _context.ComputerSystems
                .Where(s => s.StorageDevice.capacity.Contains(searchTerm) || s.StorageDevice.type.Contains(searchTerm) || s.additional_notes.Contains(searchTerm) || s.GraphicsCard.model.Contains(searchTerm) || s.weight.Contains(searchTerm) || s.power_supply.Contains(searchTerm) || s.Processor.model.Contains(searchTerm))
                .Include(cs => cs.StorageDevice)
                .Include(cs => cs.GraphicsCard)
                .Include(cs => cs.Memory)
                .Include(cs => cs.Processor).ToList();
            return View("Index", computerSystems);
        }
    }
}
