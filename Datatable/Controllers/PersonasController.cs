using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Datatable.Models;
using Datatable.Models.ViewModels;
using System.Linq.Dynamic;

namespace Datatable.Controllers
{
    public class PersonasController : Controller
    {
        public string draw = "";
        public string start = "";
        public string length = "";
        public string sortColumn = "";
        public string sortColumnDir = "";
        public string searchValue = "";
        public int pageSize, skip, recordsTotal;

        // GET: Personas
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Json()
        {
            List<TablePesonasViewModel> lst = new List<TablePesonasViewModel>();

            //logistica datatable
            var draw = Request.Form.GetValues("draw").FirstOrDefault();
            var start = Request.Form.GetValues("start").FirstOrDefault();
            var length = Request.Form.GetValues("length").FirstOrDefault();
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            var searchValue = Request.Form.GetValues("search[value]").FirstOrDefault();


            pageSize = length != null ? Convert.ToInt32(length) : 0;
            skip = start != null ? Convert.ToInt32(start) : 0;
            recordsTotal = 0;


            //conexión base de datos
            using (DatatableEntities db = new DatatableEntities())
            {
                IQueryable<TablePesonasViewModel> query = (from d in db.persona
                       select new TablePesonasViewModel
                       {
                           Id = d.id,
                           Nombre = d.nombre,
                           Edad = d.edad
                       });
                if (searchValue != "")
                    query = query.Where(d => d.Nombre.Contains(searchValue));
                //Sorting    
                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDir)))
                {
                    query = query.OrderBy(sortColumn + " " + sortColumnDir);
                }

                recordsTotal = query.Count();

                lst = query.Skip(skip).Take(pageSize).ToList();
            }

            return Json(new { draw=draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = lst });
        }
    }
}