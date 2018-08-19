using System;
using System.Collections.Generic;
using System.IO;
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
            string getemail = Request.QueryString["email"];
            string websitename = "www.facebook.com";
            string _username = "rubabKhawaja";
            if ( null != getemail )
                {

                //find identity from azure table and render content in fields.
                ListItem selectedtitle = title.Items.FindByText("Miss");
                selectedtitle.Selected = true;
                first_name.Value = "Samina";
                last_name.Value = "Tariq";
                email.Value = "coolroxi786@yahoo.com";
                phone.Value = "1234-123-12345";
                address.Value = "abcggss";
                date.Value = "2018-08-01";
                ListItem Selectedcountry= country.Items.FindByText("Pakistan");
                Selectedcountry.Selected = true;
                zip.Value = "12345";
                city.Value = "Rawalpindi";
                ListItem Selectedstate = state.Items.FindByText("Virginia");
                Selectedstate.Selected = true;
                ListItem Selectedlanguage = language.Items.FindByText("Urdu");
                Selectedlanguage.Selected = true;
                ListItem Selectedcurrency = currency.Items.FindByText("Pakistan Rupees");
                Selectedcurrency.Selected = true;
                female.Checked = true;
                birthcountry.Value = "Pakistan";
                websiteContainer.Attributes.CssStyle.Add("Visibility", "visible");
                websiteContainer.InnerHtml+="<div id=\"" + _username + "\" style=\"border:solid;Background-color:white;height:auto;word-wrap: break-word;\">" +
                                   "<label class=\"labelText\" style=\"display:inline\">Website:</label>" +
                                "<p type=\"text\" class=\"AddWebsiteName\"  readonly=\"readonly\" style=\"border:none;background:none;display:inline\">"+websitename+"</p><br />" +
                                   "<label class=\"labelText\" style=\"display:inline\">ID:</label>" +
                                 "<p type=\"text\" class=\"Addusername\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + websitename + "</p><br />" +
                                  "<label class=\"labelText\" style=\"display:inline\">Password:</label>" +
                                 "<p type=\"text\" class=\"AddPassword\"    readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + websitename + "</p><br />" +
                                   "<label class=\"labelText\" style=\"display:inline\">Account Number:</label>" +
                                 "<p type=\"text\" class=\"AddWebsiteAccountNumber\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + websitename + "</p><br />" +
                                   "<label class=\"labelText\" style=\"display:inline\">PIN:</label>" +
                                 "<p type=\"text\" class=\"AddWebsitePIN\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + websitename + "</p><br />" +
                                   "<label class=\"labelText\" style=\"display:inline\">Security Question:</label>" +
                                 "<p type=\"text\" class=\"AddWebsitequestion\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + websitename + "</p><br />" +
                                   "<label class=\"labelText\" style=\"display:inline\">Security Answer:</label>" +
                                 "<p type=\"text\" class=\"AddWebsiteAnswer\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + websitename + "</p><br />" +
                                 "</div><br />";
                }

            countDiv.InnerText = "2";
            }
        [System.Web.Services.WebMethod]
        public static void Send (IdentityDataModel IdentityData)
            {
            string json = JsonConvert.SerializeObject(IdentityData);
            //write string to file
            System.IO.File.WriteAllText(AppDomain.CurrentDomain.BaseDirectory + @"\IdentitiesData.txt", json);
            }
        [System.Web.Services.WebMethod]
        public static void AddWebsite (string websiteName, string websiteId, string userPassword, string websiteAccountNumber, string PIN, string SecurityQuestion, string SecurityAnswer)
            {
            WebsiteDataModel model = new WebsiteDataModel();
            model.WebsiteName = websiteName;
            model.UserName = websiteId;
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