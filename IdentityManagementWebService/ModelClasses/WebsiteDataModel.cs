using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityManagementWebService.ModelClasses
    {
    public class WebsiteDataModel
        {

        private string websiteName;

        public string WebsiteName
            {
            get
                {
                return websiteName;
                }
            set
                {
                websiteName = value;
                }
            }

        private string websiteID;

        public string WebsiteID
            {
            get
                {
                return websiteID;
                }
            set
                {
                websiteID = value;
                }
            }
        private string password;

        public string Password
            {
            get
                {
                return password;
                }
            set
                {
                password = value;
                }
            }
        private string pin;

        public string PIN
            {
            get
                {
                return pin;
                }
            set
                {
                pin = value;
                }
            }
        private string accountNumber;

        public string AccountNumber
            {
            get
                {
                return accountNumber;
                }
            set
                {
                accountNumber = value;
                }
            }
        private string  securityQuestion;

        public string  SecurityQuestion
            {
            get
                {
                return securityQuestion;
                }
            set
                {
                securityQuestion = value;
                }
            }
        private string securityAnswer;

        public string SecurityAnswer
            {
            get
                {
                return securityAnswer;
                }
            set
                {
                securityAnswer = value;
                }
            }



        }
    }