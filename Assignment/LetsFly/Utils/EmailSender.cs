using SendGrid;
using SendGrid.Helpers.Mail;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations.Sql;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Threading.Tasks;
using LetsFly.Models;

namespace LetsFly.Utils
{

    public class EmailSender
    {

        private const String API_KEY = "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";

        public void Send(String toEmail, String subject, String contents)
        {
            var client = new SendGridClient(API_KEY);
            var from = new EmailAddress("noreply@LetsFly.com", "Lets Fly Admin");
            var to = new EmailAddress(toEmail, "");
            var plainTextContent = contents;
            var htmlContent = "<p>" + contents + "</p>";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var response = client.SendEmailAsync(msg);
        }

        public void SendAttachment(String toEmail, String subject, String contents, String attachment, String fileName)
        {
            var client = new SendGridClient(API_KEY);
            var from = new EmailAddress("noreply@LetsFly.com", "Lets Fly!");
            var to = new EmailAddress(toEmail, "");
            var plainTextContent = contents;
            var htmlContent = "<p>" + contents + "</p>";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var bytes = File.ReadAllBytes(attachment);
            var file = Convert.ToBase64String(bytes);
            msg.AddAttachment(fileName, file);
            var response = client.SendEmailAsync(msg);
        }

        public void SendBooking(Flight model, string toEmail)
        {
            
                DateTime date = model.DepartureDate;
                string stringDate = date.ToString("dd MM yyyy");
                
                var client = new SendGridClient(API_KEY);
                var msg = new SendGridMessage();
                //var from = new EmailAddress("noreply@LetsFly.com", "Lets Fly!");
                msg.SetFrom(new EmailAddress("noreply@LetsFly.com", "Lets Fly Admin"));
                //var to = new EmailAddress(toEmail, "");s
                msg.AddTo(new EmailAddress(toEmail));

               
                msg.SetTemplateId("d-e70373776ffb4924a3f106f316c353d5");

                msg.AddSubstitution("-flightno-", model.FlightNumber);
                msg.AddSubstitution("-departure-", model.DepartureAirport);
                msg.AddSubstitution("-Arrival-", model.ArrivalAirport);
                msg.AddSubstitution("-date-", stringDate);

                var response = client.SendEmailAsync(msg);
                var status = response.Status.ToString();

        }
    }
}