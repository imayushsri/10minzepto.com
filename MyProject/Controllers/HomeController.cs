using Myproject.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;

namespace MyProject.Controllers
{
    public class HomeController : Controller
    {
        DbManager db = new DbManager();
        public ActionResult Index()
        {
            CartCount();  //method to calculate cart items
            DataTable category = db.executeSelect("select top 12 * from tbl_category order by CName");
            ViewBag.Category = category;

            string query1 = "select top 12 *, ((MRP-SaleRate)*100)/MRP from tbl_product order by ((MRP-SaleRate)*100)/MRP desc";
            DataTable product1 = db.executeSelect(query1);
            ViewBag.Product1 = product1;

            string query2 = "select top 12 *, ((MRP-SaleRate)*100)/MRP from tbl_product order by PId desc";
            DataTable Product2 = db.executeSelect(query2);
            ViewBag.Product2 = Product2;


            return View();
        }
        public ActionResult Product(int? CId, int? scname)
        {
            string query1, query2;
            if (CId.HasValue)
            {
                if (scname.HasValue)
                {
                    query2 = "select *,((MRP-SaleRate)*100)/MRP from tbl_product where SubCId =" + scname;
                }
                else
                {
                    query2 = "select *,((MRP-SaleRate)*100)/MRP from tbl_product where CId =" + CId;
                }
                query1 = "select * from tbl_subcategory where CId =" + CId;


            }
            else
            {
                query1 = "select * from tbl_subcategory";
                query2 = "select *,((MRP-SaleRate)*100)/MRP from tbl_product ";
            }
            ViewBag.product1 = db.executeSelect(query2);
            ViewBag.subcat = db.executeSelect(query1);

            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Contact(string name, long mobile, string email, string message)
        {

            int x = db.executeInsertUpdateDelete("Insert into tbl_Contact values('" + name + "'," + mobile + ",'" + email + "','" + message + "','" + DateTime.Now + "')");
            if (x > 0)
            {
                Response.Write("<script>alert ('Thanks for Contacting with us..')</script>");
            }
            else
            {
                Response.Write("<script>alert('Data not Saved...')</script>");
            }
            return View();
        }
        public ActionResult SignIn()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SignIn(string emailid, string password)
        {
            string query = "select * from tbl_user where Email = '"+emailid+"' and Password = '"+password+"'";
            DataTable dt = db.executeSelect(query);
            if(dt.Rows.Count > 0)
            {
                Session["username"] = dt.Rows[0][0];
                Session["useremail"] = dt.Rows[0][1];
                return RedirectToAction("Index");
            }
            else
            {
                return Content("<script>alert('Invalid Credentials'); location.href='/home/signin';</script>");
            }
        }
        public ActionResult logout()
        {
            Session.RemoveAll();
            return RedirectToAction("index","Home");
        }
        public ActionResult SignUp() 
        {
            return View();
        }
        [HttpPost]
        public ActionResult SignUp(string name, string email, long mobno, string password, string address, string landmark, string pincode)
        {
            DbManager dm = new DbManager();
            int x = dm.executeInsertUpdateDelete("insert into tbl_user values('" + name + "','" + email + "'," +mobno+ ",'" +password+ "','" +address+ "','"+landmark+"','"+pincode+"','"+DateTime.Now.ToString("yyyy-MM-dd hh:mm tt")+"')");
            if (x > 0)
                return Content("<script>alert('Now You are a Registered User!'); location.href='/home/SignUp';</script>");
            else
                return Content("<script>alert('Error in Registration!'); location.href='/home/SignUp';</script>");
        }

        [CheckUserSession]
        [HttpPost]
        public ActionResult addtocart(int? pid, int? salerate, int? quantity)
        {
            string email = Session["useremail"].ToString();
            string query = "insert into tbl_cart values(" + pid + ",'" + email + "','" + quantity + "'," + salerate * quantity + ",'" + DateTime.Now.ToString("yyyy-MM-dd hh:mm tt") + "')";
            int result = db.executeInsertUpdateDelete(query);
            if (result > 0)
            {
                return Content("<script>alert('Item Added in cart. Explore more product.'); location.href='/home/index';</script>");
            }
            else
            {
                return RedirectToAction("Index");
            }
        }
        public ActionResult AdminLogin() 
        {
            return View();
        }
        [HttpPost]
        public ActionResult AdminLogin(string adminid, string password)
        {
            string query = "select * from tbl_adminlogin where adminid='" + adminid + "' and password='" + password + "'";
            DbManager db = new DbManager();
            DataTable dt =  db.executeSelect(query);
            if(dt.Rows.Count > 0)
            {
                Session["Admin"] = adminid;
                return RedirectToAction("index","admin");
            }
            else
            {
                return Content("<script>alert('ID or Password is Invalid'); location.href='/home/AdminLogin';</script>");
            }
        }
        [CheckUserSession]
        public ActionResult cart()
        {
            if (Session["useremail"] != null)
            {
                string email = Session["useremail"].ToString();
                string query = "select tbl_product.* , tbl_cart.* from tbl_cart left join tbl_product on tbl_cart.PId = tbl_product.PId where tbl_cart.UId = '"+email+"'";
                DataTable dt = db.executeSelect(query);
                ViewBag.Cart = dt;
                return View();
            }
            else
            {
                return Content("<script>alert('Please try again after some times'); location.href='/home/signin'</script>");
            }
        }
        [CheckUserSession]
        public void CartCount()
        {
            if (Session["useremail"] != null)
            {
                string email = Session["useremail"].ToString();
                string query = "select sum(quantity), sum(Total) from tbl_cart where UId = '" + email + "'";
                DataTable dt = db.executeSelect(query);
                if(dt.Rows.Count > 0) 
                {
                    string cart = dt.Rows[0][0].ToString() + "items <br/>&#8377;" + dt.Rows[0][1].ToString();
                    Session["cart"] = cart;
                }
            }
        }
        public ActionResult deleteitem(int? CId)
        {
            string query = "delete from tbl_cart where CId ="+CId;
            int result = db.executeInsertUpdateDelete(query);
            if (result > 0)
            {
                return Content("<script>alert('Item Deleted'); location.href='/home/cart'</script>");    
            }
            else
            {
                return Content("<script>alert('Item Not Deleted'); location.href='/home/cart'</script>");
            }
        }
        [CheckUserSession]
        public ActionResult myorder()
        {
            if (Session["useremail"] != null)
            {
                string email = Session["useremail"].ToString();
                string query = "select tbl_product.*,tbl_order.* from tbl_order left join tbl_product on tbl_order.PId=tbl_product.PId where tbl_order.UId='" + email + "' ";
                DataTable dt = db.executeSelect(query);
                ViewBag.order = dt;
                return View();
            }
            else
            {
                return Content("<script>alert ('Please try again after some time ');location.href='/home/signin'</script>");
            }
        }
        public ActionResult order()
        {
            string email = Session["useremail"].ToString();
            DateTime today = DateTime.Now;
            string query = "insert into tbl_order select *,'pending','" + today.ToString("yyyy-MM-dd hh:mm tt") + "'from tbl_cart where UId='" + email + "' ";
            int result = db.executeInsertUpdateDelete(query);
            if (result > 0)
            {
                string q2 = "delete from tbl_cart where UId='" + email + "' ";
                db.executeInsertUpdateDelete(q2);
                CartCount();
                return Content("<script>alert('Order successful.You can check status from my order');location.href='/home/myorder'</script>");
            }
            else
            {
                return Content("<script>alert('Error. Try again');location.href='/home/cart'</script>");
            }
        }
    }
}
    class CheckUserSession : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpSessionStateBase session = filterContext.HttpContext.Session;
            if (session["useremail"] == null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary
            { { "controller","home"},

            { "action","signin"} });
            }
        }
    }