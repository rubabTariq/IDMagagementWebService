using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityManagementWebService.ModelClasses
    {
    public class WebsiteDataModel
        {


        public string WebsiteName
            {
            get;
            set;
            }


        public string UserName
            {
            get;
            set;
            }

        public string Password
            {
            get;
            set;
            }

        public string PIN
            {
            get;
            set;
            }

        public string AccountNumber
            {
            get;
            set;
            }
        public string  SecurityQuestion
            {
            get;
            set;
            }
        public string SecurityAnswer
            {
            get;
            set;
            }
        }
    }