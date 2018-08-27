using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Amazon.DynamoDBv2.DocumentModel;
using IdentityManagementWebService.ModelClasses;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace IdentityManagementWebService
    {
    public partial class AddIdentity : System.Web.UI.Page
        {
        private static string getEmail = null;
        private static IdentityDataModel identity = null;
        protected void Page_Load (object sender, EventArgs e)
            {
            getEmail = Request.QueryString["email"];
            if ( null != getEmail )
                {
                Response response = AmazonDynamoDBTable.Instance.GetDataInDynamoDb(getEmail);
                identity = response.IdentityDataModel.FirstOrDefault();
                //find identity from azure table and render content in fields.
                ListItem selectedtitle = title.Items.FindByText(identity.Title);
                selectedtitle.Selected = true;
                first_name.Value = identity.FirstName;
                last_name.Value = identity.LastName;
                email.Value = identity.Email;
                phone.Value = identity.Phone;
                address.Value = identity.Address;
                date.Value = identity.DateOfBirth;
                ListItem Selectedcountry = country.Items.FindByText(identity.CountryOfResidence);
                Selectedcountry.Selected = true;
                zip.Value = identity.ZipCode;
                city.Value = identity.City;
                ListItem Selectedstate = state.Items.FindByText(identity.State);
                Selectedstate.Selected = true;
                ListItem Selectedlanguage = language.Items.FindByText(identity.Language);
                Selectedlanguage.Selected = true;
                ListItem Selectedcurrency = currency.Items.FindByText(identity.Currency);
                Selectedcurrency.Selected = true;
                female.Checked = true;
                birthcountry.Value = identity.CountryOfBirth;

                List<WebsiteDataModel> websitelist = identity.WebsiteDataModel;
                if ( websitelist!=null && websitelist.Count > 0 )
                    {

                    foreach ( WebsiteDataModel website in websitelist )
                        {
                        websiteContainer.Attributes.CssStyle.Add("Visibility", "visible");
                    var websitearray = "{ WebsiteName:"+ website.WebsiteName + ", UserName: "+ website.UserName + ",  UserPassword: "+ website.UserPassword + "," +
                    "WebsiteAccountNumber: " + website.WebsiteAccountNumber + ", PIN:  " + website.PIN + ", SecurityQuestion: " + website.SecurityQuestion + "," +
                    "SecurityAnswer: " + website.SecurityAnswer + "}";

                    websiteContainer.InnerHtml += "<div id=\"" + website.UserName + "\" style=\"border:solid;Background-color:white;height:auto;word-wrap: break-word;\">" +
                                           "<label class=\"labelText\" style=\"display:inline\">Website:</label>" +
                                        "<p type=\"text\" class=\"AddWebsiteName\"  readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website.WebsiteName + "</p><br />" +
                                           "<label class=\"labelText\" style=\"display:inline\">ID:</label>" +
                                         "<p type=\"text\" class=\"Addusername\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website.UserName + "</p><br />" +
                                          "<label class=\"labelText\" style=\"display:inline\">Password:</label>" +
                                         "<p type=\"text\" class=\"AddPassword\"    readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website.UserPassword + "</p><br />" +
                                           "<label class=\"labelText\" style=\"display:inline\">Account Number:</label>" +
                                         "<p type=\"text\" class=\"AddWebsiteAccountNumber\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website.WebsiteAccountNumber + "</p><br />" +
                                           "<label class=\"labelText\" style=\"display:inline\">PIN:</label>" +
                                         "<p type=\"text\" class=\"AddWebsitePIN\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website.PIN + "</p><br />" +
                                           "<label class=\"labelText\" style=\"display:inline\">Security Question:</label>" +
                                         "<p type=\"text\" class=\"AddWebsitequestion\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website.SecurityQuestion + "</p><br />" +
                                           "<label class=\"labelText\" style=\"display:inline\">Security Answer:</label>" +
                                         "<p type=\"text\" class=\"AddWebsiteAnswer\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website.SecurityAnswer + "</p><br />" +
                                         "</div><br />";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Javascript", "UpdateWebsiteList('" + websitearray + "');", true);
                        }
                    }
                }
            countDiv.InnerText = "2";
            }
        [System.Web.Services.WebMethod]
        public static Response Send (IdentityDataModel IdentityData)
            {
            Response status;
            IdentityData=AmazonDynamoDBTable.Instance.SetEmptyValuestoNull(IdentityData);
            string json = JsonConvert.SerializeObject(IdentityData);
            if ( null == getEmail )
                {
                status = AmazonDynamoDBTable.Instance.SaveDataInDynamoDb(json, IdentityData);
                }
            else
                {
                status = AmazonDynamoDBTable.Instance.UpdateDataInDynamoDb(json, IdentityData);
                }
            return status;
            }
        [System.Web.Services.WebMethod]
        public static void AddWebsite (string websiteName, string websiteId, string userPassword, string websiteAccountNumber, string PIN, string SecurityQuestion, string SecurityAnswer)
            {
            WebsiteDataModel model = new WebsiteDataModel();
            model.WebsiteName = websiteName;
            model.UserName = websiteId;
            model.UserPassword = userPassword;
            model.WebsiteAccountNumber = websiteAccountNumber;
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