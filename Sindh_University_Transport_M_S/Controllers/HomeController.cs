using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;
using System.Web.Mvc;
using Sindh_University_Transport_M_S.Models;

namespace Sindh_University_Transport_M_S.Controllers
{
    public class HomeController : Controller
    {
        private Transport_ModelContainer db = new Transport_ModelContainer();
        // GET: Home
        public ActionResult Index()
        {

            ViewBag.PointData = db.Points.ToList();
            return View(db.Cities.ToList());
        }

        public ActionResult AllPoints()
        {
            int? page = 1;
            string search = "";
            if (Session["page"] != null)
            {
                page = int.Parse(Session["page"].ToString());
            }
            if (Session["search"] != null)
            {
                search = Session["search"].ToString();
            }
            if (search != "")
            {
                var data = db.Points.Where(x => x.Location.Name.StartsWith(search) || x.Location.Name == null).ToList().ToPagedList(page ?? 1, 2);
                return View(data);
            }
            else
            {
                var data = db.Points.ToList().ToPagedList(page ?? 1, 2);
                return View(data);
            }

        }

        public ActionResult Areas(int? id)
        {

            return View(db.Areas.Where(a=>a.CityId==id).ToList());
        }


        public ActionResult AllPointsCities()
        {

            int? id = null;
            if (Session["id"] != null)
            {
                id = int.Parse(Session["id"].ToString());
            }

            var data = db.Points.Where(x => x.LocationId == x.Location.Id
            && x.Location.AreaId == x.Location.Area.Id
            && x.Location.Area.CityId == x.Location.Area.City.Id
            && x.Location.Area.City.Id == x.Location.Area.City.Id
            && x.Location.Area.City.Id == id

            );

            return View(data.ToList());

        }

        public ActionResult AboutUS()
        {
            return View();
        }












        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Login_Admin log)
        {
            if (ModelState.IsValid)
            {
                bool check = db.Admins.Any(x => x.Email == log.Email && x.Password ==log.Password);
                if (check)
                {
                    return RedirectToAction("Index","Admins");
                }
                else
                {
                    ViewBag.msg = "email or password is incorrect";
                    return View();
                }
            }
            return View();
        }
    }
}