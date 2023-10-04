using Myproject.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace MyProject.Controllers
{
    [CheckSession]
    public class AdminController : Controller
    {
        DbManager db = new DbManager();
        // GET: Admin
        public ActionResult Index()
        {
           return View();
        }
        public ActionResult Category()
        {
            DataTable category = db.executeSelect("select * from tbl_category order by CId desc");
            ViewBag.Category = category;
            return View();
        }
        
        [HttpPost]
        public ActionResult Category(string catname, HttpPostedFileBase caticon)
        {
            if (catname != null && caticon != null)
            {
                string query = "insert into tbl_category values('" + catname + "','" + caticon.FileName + "')";
                int result = db.executeInsertUpdateDelete(query);
                if (result > 0)
                {
                    //Server.MapPath () function is used to get physics location of any folder present at server 
                    caticon.SaveAs(Server.MapPath("/Content/CatPic/") +caticon.FileName);
                    return Content("<script>alert('Data Added');location.href='/admin/category'</script>");
                }
                else
                {
                    return Content("<script>alert('Not Added');location.href='/admin/category'</script>");
                }
            }
            else
            {
                return Content("<script>alert('Fill all fields properly');location.href='/admin/category'</script>");
            }

        }
        public ActionResult deleteitem(int? CId)
        {
            string query = "delete from tbl_category where CId =" + CId;
            int result = db.executeInsertUpdateDelete(query);
            if (result > 0)
            {
                return Content("<script>alert('Item Deleted'); location.href='/admin/category'</script>");
            }
            else
            {
                return Content("<script>alert('Item Not Deleted'); location.href='/admin/category'</script>");
            }
        }
        public ActionResult SubCategory()
        {
            DataTable dt = db.executeSelect("select CId, CName from tbl_category");
            ViewBag.SubCat = dt;
            //Select all Sub Category from Table
            string command = "select sc.SId, c.CName, sc.SubCatName, sc.SubCatPic from tbl_subcategory sc left join tbl_category c on c.CId = sc.CId";
            DataTable subcategory = db.executeSelect(command);
            ViewBag.SubCategory = subcategory;
            return View();
        }
        [HttpPost]
        public ActionResult SubCategory(int category, string subcatname, HttpPostedFileBase subcaticon)
        {
            string query = "insert into tbl_subcategory values("+category+",'"+subcatname+"','"+subcaticon.FileName+"')";
            int result = db.executeInsertUpdateDelete(query);
            if(subcatname != null && subcaticon != null)
            { 
            if (result > 0) 
            {
                subcaticon.SaveAs(Server.MapPath("/Content/SubCatPic/") + subcaticon.FileName);
                return Content("<script>alert('Sub Category Added Successfully'); location.href='/admin/SubCategory'</script>");
            }
            else
            {
                return Content("<script>alert('Sub Category Not Added'); location.href='/admin/SubCategory'</script>");

            }
        }
            else
            {
                return Content("<script>alert('Fill all fields properly');location.href='/admin/Subcategory'</script>");
            }
        }
        public ActionResult deletesubitem(int? SId)
        {
            string query = "delete from tbl_subcategory where SId =" + SId;
            int result = db.executeInsertUpdateDelete(query);
            if (result > 0)
            {
                return Content("<script>alert('Item Deleted'); location.href='/admin/subcategory'</script>");
            }
            else
            {
                return Content("<script>alert('Item Not Deleted'); location.href='/admin/subcategory'</script>");
            }
        }
        public ActionResult Product()
        {
            DataTable dt = db.executeSelect("select CId, CName from tbl_category");
            ViewBag.Cat = dt;
            DataTable sdt = db.executeSelect("select SId, SubCatName from tbl_subcategory");
            ViewBag.SubCat = sdt;
            string command = "select c.CId, c.CName, sc.SId, sc.SubCatName, pd.Title, pd.Description, pd.Model, pd.MRP, pd.SaleRate, pd.Pack, pd.Pic, pd.AddDate, pd.PId from tbl_subcategory sc left join tbl_category c on c.CId = sc.CId left join tbl_product pd on sc.SId = pd.SubCId order by PId desc";
            DataTable product = db.executeSelect(command);
            ViewBag.Product = product;
            return View();
        }
        [HttpPost]
        public ActionResult Product(int? pcat, int?  psubcat, string pname, string pdesc, string pmodel, int pmrp, int psalerate, string psize, HttpPostedFileBase picon)
        {
            string query = "insert into tbl_product values("+pcat+","+psubcat+",'"+pname+"','"+pdesc+"','"+pmodel+"',"+pmrp+","+psalerate+",'"+psize+"','"+picon.FileName+"','"+DateTime.Now.ToString("yyyy-MM-dd")+"')";
            int result = db.executeInsertUpdateDelete(query);
            if (result > 0) 
            {
                picon.SaveAs(Server.MapPath("/Content/ProductPic/") + picon.FileName);
                return Content("<script>alert('Product Added Successfully!'); location.href='/admin/Product';</script>");
            }
            else
            {
                return Content("<script>alert('Product Not Added'); location.href='/admin/Product'</script>");

            }
        }
        public ActionResult ProductManagement()
        {
            return View();
        }
        public ActionResult UserManagement()
        {
            return View();
        }
        public ActionResult CoustmerSupport()
        {
            return View();
        }
        public ActionResult Orders()
        {
            return View();
        }
        public ActionResult ChangePassword()
        {
            return View();
        }
        public ActionResult LogOut()
        {
            Session.Remove("admin");
            return RedirectToAction("adminlogin", "Home");
        }
    }
    //Filter to check session before executing any action method on Adminzone
    class CheckSession : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
           HttpSessionStateBase Session = filterContext.HttpContext.Session;
            if (Session["admin"] == null) 
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary
                {
                    {"Controller", "home" },
                    {"Action" , "adminlogin"}
                });
            }
        }
    }
}