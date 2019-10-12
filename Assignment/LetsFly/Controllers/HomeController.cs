using LetsFly.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LetsFly.Models;
using System.IO;

namespace LetsFly.Controllers
{
    [RequireHttps]
    public class HomeController : Controller
    {
        private LetsFlyModelContainer db = new LetsFlyModelContainer();
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Flights";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Booking";

            return View();
        }

        public ActionResult Send_Email()
        {
            return View(new SendEmails());
        }

        [HttpPost]
        public ActionResult Send_Email(SendEmails model, HttpPostedFileBase fileUploader)
        {
            if (ModelState.IsValid)
            {
                string serverPath = Server.MapPath("~/Uploads/");
                string fileName = Path.GetFileName(fileUploader.FileName);
                string filePath = serverPath + fileName;
                model.Attachment = filePath;
                fileUploader.SaveAs(serverPath + fileUploader.FileName);

                String toEmail = model.ToEmail;
                String subject = model.Subject;
                String contents = model.Contents;
                String attachment = model.Attachment;

                EmailSender es = new EmailSender();
                es.SendAttachment(toEmail, subject, contents, attachment, fileName);
                es.Send(toEmail, subject, contents);



                ViewBag.Result = "Email has been send.";


                ModelState.Clear();

                return View(new SendEmails());
            }

            return View();
        }

        //private IEnumerable<SelectListItem> GetEmails()
        //{
        //    var users = new User();
        //    var Emails = users
        //        .Select(x =>
        //            new SelectListItem
        //            {
        //                Value = x.UserRoleId.ToString(),
        //                Text = x.UserRole
        //            });

        //    return new SelectList(roles, "Value", "Text");
        //}
        public ActionResult Send_BulkEmails()
        {
            return View(new SendBulkEmail());
        }

        [HttpPost]
        public ActionResult Send_BulkEmails(SendBulkEmail model, HttpPostedFileBase fileUploader)
        {
            //model.EmaiList = db.Users.Select(e => e.Email).ToList();

            if (ModelState.IsValid)
            {

                var data = db.Users.Select(e => e.Email).ToList();

                foreach (var emailX in data)
                {
                    var toEmail = emailX.ToString();
                    String subject = "Thank you for registering";
                    String contents = "Welcome to Lets Fly!";

                    EmailSender es = new EmailSender();
                    es.Send(toEmail, subject, contents);
                }


                ViewBag.Result = "Emails have been sent.";


                ModelState.Clear();

                return View(new SendBulkEmail());
            }

            return View();
        }

        //private IEnumerable<SelectListItem> GetEmails()
        //{
        //    var users = new User();
        //    var Emails = db.Users.Select(x =>
        //            new SelectListItem
        //            {
        //                Value = x.UserRoleId.ToString(),
        //                Text = x.UserRole
        //            });

        //    return new SelectList(roles, "Value", "Text");
        //}
    }
}