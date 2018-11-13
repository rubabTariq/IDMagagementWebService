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
    public partial class Signin : System.Web.UI.Page
        {
        protected void Page_Load (object sender, EventArgs e)
            {
            if ( null != Request.QueryString["logout"] )
                {
                Session["UserEmail"] = null;
                }
            }
        [WebMethod]
        public static bool SigninAccount (string email,string username, string password)
            {
            AcountInformation account = new AcountInformation();
            account.Email = email;
            account.UserName = username;
            account.Password = password;
            Response response = AccountInfoDynamoDb.Instance.GetDataInDynamoDb(account, email,password);
            return response.Statusvalue;
            }


    }
    }