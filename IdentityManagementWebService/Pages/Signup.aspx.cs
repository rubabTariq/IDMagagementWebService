using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IdentityManagementWebService.Pages
    {
    public partial class Signup : System.Web.UI.Page
        {
        protected void Page_Load (object sender, EventArgs e)
            {

            }
        [WebMethod]
        public static bool EditAccount (string email, string username, string password)
            {
            //Need to check account from azure table and return result accordingly
            return false;
            }


    }
    }