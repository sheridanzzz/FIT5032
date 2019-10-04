using SendGrid;
using SendGrid.Helpers.Mail;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LetsFly.Utils
{
    public class EmailSender
    {
        private const String API_KEY = "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";

        public void Send(String toEmail, String subject, String contents)
        {
            var client = new SendGridClient(API_KEY);
            var from = new EmailAddress("noreply@letsFly!.com", "Lets Fly!");
            var to = new EmailAddress(toEmail, "");
            var plainTextContent = contents;
            var htmlContent = "<p>" + contents + "</p>";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var response = client.SendEmailAsync(msg);


        }
    }
}