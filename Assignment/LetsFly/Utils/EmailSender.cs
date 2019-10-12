using SendGrid;
using SendGrid.Helpers.Mail;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Threading.Tasks;

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

        public void SendAttachment(String toEmail, String subject, String contents, String attachment)
        {
            var client = new SendGridClient(API_KEY);
            var from = new EmailAddress("noreply@letsFly!.com", "Lets Fly!");
            var to = new EmailAddress(toEmail, "");
            var plainTextContent = contents;
            var htmlContent = "<p>" + contents + "</p>";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var bytes = File.ReadAllBytes(attachment);
            var file = Convert.ToBase64String(bytes);
            msg.AddAttachment("attachment", file);
            var response = client.SendEmailAsync(msg);
        }
    }
}