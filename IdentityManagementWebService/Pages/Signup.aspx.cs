using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using IdentityManagementWebService.ModelClasses;

namespace IdentityManagementWebService.Pages
    {
    public partial class Signup : System.Web.UI.Page
        {
        protected void Page_Load (object sender, EventArgs e)
            {
            countDiv.InnerText = DashBoard.Count.ToString();
            }
        [WebMethod]
        public static bool EditAccount (string email,string newemailsignup, string username, string password,string existingpassword)
            {
            AcountInformation account = new AcountInformation();
            account.Email = newemailsignup;
            account.UserName = username;
            account.Password = password;
            Response response = AccountInfoDynamoDb.Instance.UpdateDataInDynamoDb(account, email, existingpassword);
            return response.Statusvalue;
            }


    }
    }