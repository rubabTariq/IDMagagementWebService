using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IdentityManagementWebService.ModelClasses;
using Newtonsoft.Json;

namespace IdentityManagementWebService
    {
    public partial class AddIdentity : System.Web.UI.Page
        {
        protected void Page_Load (object sender, EventArgs e)
            {
            countDiv.InnerText = "2";
            }
        [System.Web.Services.WebMethod]
        public static void Send (IdentityDataModel identityData)
            {
            var j = JsonConvert.SerializeObject(identityData);
            //IdentityDataModel.GetInstance.AddIdentity(new IdentityDataModel(title, firstName, last_Name, email, phone, address, date, country, zip, city, state, language, currency, birthCountry));
            HttpContext.Current.Response.Redirect("Pages/Identities.aspx", false);
            }
        [System.Web.Services.WebMethod]
        public static void AddWebsite (string websiteName, string websiteId, string userPassword, string websiteAccountNumber, string PIN, string SecurityQuestion, string SecurityAnswer)
            {
            WebsiteDataModel model = new WebsiteDataModel();
            model.WebsiteName = websiteName;
            model.WebsiteID = websiteId;
            model.Password = userPassword;
            model.AccountNumber = websiteAccountNumber;
            model.PIN = PIN;
            model.SecurityQuestion = SecurityQuestion;
            model.SecurityAnswer = SecurityAnswer;
           // IdentityDataModel.GetInstance.AddWebsite(model);
            }

        [System.Web.Services.WebMethod]
        public static void Draft (string title, string firstName, string last_Name, string email, string phone, string address, string date, string country, string zip, string city, string state, string language, string currency, string birthCountry)
            {
           // IdentityDataModel.GetInstance.AddIdentity(new IdentityDataModel(title, firstName, last_Name, email, phone, address, date, country, zip, city, state, language, currency, birthCountry));
            }
        }
    }