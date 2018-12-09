using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityManagementWebService.ModelClasses
    {
    public class IdentitiesFilterCriteria
        {
        private string date;

        public string Date
            {
            get
                {
                return date;
                }
            set
                {
                date = value;
                }
            }
        private string fname;

        public string FirstName
            {
            get
                {
                return fname;
                }
            set
                {
                fname = value;
                }
            }

        private string lname;

        public string LastName
            {
            get
                {
                return lname;
                }
            set
                {
                lname = value;
                }
            }

        private string email;

        public string Email
            {
            get
                {
                return email;
                }
            set
                {
                email = value;
                }
            }
        private string countryofResidence;

        public string CountryofResidence
            {
            get
                {
                return countryofResidence;
                }
            set
                {
                countryofResidence = value;
                }
            }
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
        private string affiliate;

        public string Affiliate
            {
            get
                {
                return affiliate;
                }
            set
                {
                affiliate = value;
                }
            }
        }
    }