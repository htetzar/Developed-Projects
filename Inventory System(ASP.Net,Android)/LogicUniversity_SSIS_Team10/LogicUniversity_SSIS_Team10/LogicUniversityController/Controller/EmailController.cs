using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityController.Controller
{

    //Author Htet Zar Chi Aung.
    //Team 10.
    public class EmailController
    {
        public static void SendEmail(string ToEmail, string Subj, string Message, byte[] attachment = null, string attachmentName = null)
        {

            string HostAdd = "smtp.gmail.com";
            string FromEmailid = "ssisstoreclerk@gmail.com";
            string Pass = "ssisstoreclerk12345";
            string mailPort = "587"; //465 -> SSL false; //587 -> SSL true;
            bool requiredSSL = true;

            //creating the object of MailMessage
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress(FromEmailid); //From Email Id

            mailMessage.BodyEncoding = System.Text.Encoding.UTF8;
            mailMessage.SubjectEncoding = System.Text.Encoding.UTF8;

            mailMessage.Subject = Subj; //Subject of Email
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = Message; //body or message of Email
            mailMessage.IsBodyHtml = true;

            mailMessage.To.Add(new MailAddress(ToEmail));

            SmtpClient smtp = new SmtpClient();
            smtp.Host = HostAdd;              //host of emailaddress for example smtp.gmail.com etc
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

            //network and security related credentials

            smtp.EnableSsl = requiredSSL;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = mailMessage.From.Address;
            NetworkCred.Password = Pass;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = NetworkCred;
            smtp.Timeout = 300000;
            smtp.Port = Convert.ToInt32(mailPort);

            if (attachment != null && !string.IsNullOrEmpty(attachmentName))
            {
                MemoryStream stream = new MemoryStream(attachment);
                mailMessage.Attachments.Add(new Attachment(stream, attachmentName));
            }

            smtp.Send(mailMessage); //sending Email
            smtp.Dispose();

        }
        public static void SendEmailByDeptHead(string ToEmail, string Subj, string Message, byte[] attachment = null, string attachmentName = null)
        {

            string HostAdd = "smtp.gmail.com";
            string FromEmailid = "ssisdepthead@gmail.com";
            string Pass = "ssisdepthead12345";
            string mailPort = "587"; //465 -> SSL false; //587 -> SSL true;
            bool requiredSSL = true;

            //creating the object of MailMessage
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress(FromEmailid); //From Email Id

            mailMessage.BodyEncoding = System.Text.Encoding.UTF8;
            mailMessage.SubjectEncoding = System.Text.Encoding.UTF8;

            mailMessage.Subject = Subj; //Subject of Email
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = Message; //body or message of Email
            mailMessage.IsBodyHtml = true;

            mailMessage.To.Add(new MailAddress(ToEmail));

            SmtpClient smtp = new SmtpClient();
            smtp.Host = HostAdd;              //host of emailaddress for example smtp.gmail.com etc
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

            //network and security related credentials

            smtp.EnableSsl = requiredSSL;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = mailMessage.From.Address;
            NetworkCred.Password = Pass;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = NetworkCred;
            smtp.Timeout = 300000;
            smtp.Port = Convert.ToInt32(mailPort);

            if (attachment != null && !string.IsNullOrEmpty(attachmentName))
            {
                MemoryStream stream = new MemoryStream(attachment);
                mailMessage.Attachments.Add(new Attachment(stream, attachmentName));
            }

            smtp.Send(mailMessage); //sending Email
            smtp.Dispose();
        }
        public static void SendEmailToDelegatedStaff(string ToEmail, string Subj, string Message, byte[] attachment = null, string attachmentName = null)
        {

            string HostAdd = "smtp.gmail.com";
            string FromEmailid = "ssisdepthead@gmail.com";
            string Pass = "ssisdepthead12345";
            string mailPort = "587"; //465 -> SSL false; //587 -> SSL true;
            bool requiredSSL = true;

            //creating the object of MailMessage
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress(FromEmailid); //From Email Id

            mailMessage.BodyEncoding = System.Text.Encoding.UTF8;
            mailMessage.SubjectEncoding = System.Text.Encoding.UTF8;

            mailMessage.Subject = Subj; //Subject of Email
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = Message; //body or message of Email
            mailMessage.IsBodyHtml = true;

            mailMessage.To.Add(new MailAddress(ToEmail));

            SmtpClient smtp = new SmtpClient();
            smtp.Host = HostAdd;              //host of emailaddress for example smtp.gmail.com etc
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

            //network and security related credentials

            smtp.EnableSsl = requiredSSL;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = mailMessage.From.Address;
            NetworkCred.Password = Pass;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = NetworkCred;
            smtp.Timeout = 300000;
            smtp.Port = Convert.ToInt32(mailPort);

            if (attachment != null && !string.IsNullOrEmpty(attachmentName))
            {
                MemoryStream stream = new MemoryStream(attachment);
                mailMessage.Attachments.Add(new Attachment(stream, attachmentName));
            }

            smtp.Send(mailMessage); //sending Email
            smtp.Dispose();

        }
    }
}
