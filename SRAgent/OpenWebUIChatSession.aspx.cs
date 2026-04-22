using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SRAgent
{
    public partial class OpenWebUIChatSession : System.Web.UI.Page
    {
        static readonly DatabaseHelper databaseHelper = new DatabaseHelper();

        protected override void InitializeCulture()
        {
            string culture = Request.QueryString["culture"];

            if (culture != null)
            {
                HttpCookie cookie = new HttpCookie("culture", culture);
                cookie.Expires = DateTime.Now.AddYears(1);
                Response.Cookies.Add(cookie);
            }
            else if (Request.Cookies["culture"] != null)
            {
                culture = Request.Cookies["culture"].Value;
            }
            else
            {
                culture = "en-US";
            }

            System.Globalization.CultureInfo cultureInfo = new System.Globalization.CultureInfo(culture);
            System.Threading.Thread.CurrentThread.CurrentCulture = cultureInfo;
            System.Threading.Thread.CurrentThread.CurrentUICulture = cultureInfo;

            base.InitializeCulture();
        }

        private void RedirectToLogin()
        {
            Response.Redirect("~/login.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["Chatbot.UserId"] == null || Session["Chatbot.UserName"] == null)
                //{
                //    RedirectToLogin();
                //    return;
                //}
                Session["Chatbot.UserId"] = "10019";
                Session["Chatbot.UserName"] = "NTNU";

                //int topicId;
                //bool success = int.TryParse(Request.Form["topicId"], out topicId);
                //string englishLevel = Request.Form["englishLevel"];
                //string professionalLevel = Request.Form["professionalLevel"];
                //if (!success                                                                        ||
                //    (string.IsNullOrEmpty(englishLevel) && string.IsNullOrEmpty(professionalLevel)) ||
                //    (!string.IsNullOrEmpty(englishLevel) && !string.IsNullOrEmpty(professionalLevel)))
                //{
                //    RedirectToLogin();
                //    return;
                //}
                int topicId;
                bool success = int.TryParse(Request.QueryString["topicId"], out topicId);
                string englishLevel = Request.QueryString["questId"];
                string professionalLevel = string.Empty;
                if (!success ||
                    (string.IsNullOrEmpty(englishLevel) && string.IsNullOrEmpty(professionalLevel)) ||
                    (!string.IsNullOrEmpty(englishLevel) && !string.IsNullOrEmpty(professionalLevel)))
                {
                    RedirectToLogin();
                    return;
                }

                DatabaseHelper.Chat chatInfo = databaseHelper.GetChatInfo(topicId, englishLevel, professionalLevel);
                if (chatInfo == null)
                {
                    RedirectToLogin();
                    return;
                }

                Session["ChatSession.UserName"]          = (Session["Chatbot.UserName"] as string)[0];
                Session["ChatSession.TopicId"]           = chatInfo.TopicId;
                Session["ChatSession.EnglishLevel"]      = chatInfo.EnglishLevel;
                Session["ChatSession.ProfessionalLevel"] = chatInfo.ProfessionalLevel;
                Session["ChatSession.UserMaxTurns"]      = chatInfo.UserMaxTurns;
            }
        }
    }
}
