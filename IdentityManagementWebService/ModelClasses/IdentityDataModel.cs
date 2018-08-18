using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace IdentityManagementWebService.ModelClasses
    {

    public class IdentityDataModel
        {
        [JsonProperty]
        public List<WebsiteDataModel> WebsiteDataModel
            {
            get;
            set;
            }
        //private  IList<WebsiteDataModel> _website = new List<WebsiteDataModel>();
        //private  IList<IdentityDataModel> _identities = new List<IdentityDataModel>();
        //private static IdentityDataModel instance;
        //public static IdentityDataModel GetInstance
        //    {
        //    get
        //        {
        //        if ( null == instance )
        //            instance = new IdentityDataModel();
        //        return instance;
        //        }
        //    }
        [JsonProperty]
        public string Address
            {
            get;
            set;
            }
        [JsonProperty]
        public string City
            {
            get;
            set;
            }
        [JsonProperty]
        public string CountryOfBirth
            {
            get;
            set;
            }
        [JsonProperty]
        public string CountryOfResidence
            {
            get;
            set;
            }
        [JsonProperty]
        public string Currency
            {
            get;
            set;
            }
        [JsonProperty]
        public string DateOfBirth
            {
            get;
            set;
            }
        [JsonProperty]
        public string Email
            {
            get;
            set;
            }
        [JsonProperty]
        public string FirstName
            {
            get;
            set;
            }
        [JsonProperty]
        public string Language
            {
            get;
            set;
            }
        [JsonProperty]
        public string LastName
            {
            get;
            set;
            }
        [JsonProperty]
        public string Phone
            {
            get;
            set;
            }
        [JsonProperty]
        public string State
            {
            get;
            set;
            }

        [JsonProperty]
        public string Title
            {
            get;
            set;
            }    
        [JsonProperty]
        public string ZipCode
            {
            get;
            set;
            }

        [JsonProperty]
        public string Gender
            {
            get;
            set;
            }


        //public void AddWebsite (WebsiteDataModel website)
        //    {
        //    _website.Add(website);
        //    }
        //public IList<WebsiteDataModel> GetWebsites ()
        //    {
        //    return _website;
        //    }
        //public void AddIdentity (IdentityDataModel Identity)
        //    {
        //    _identities.Add(Identity);
        //    }
        //public IList<IdentityDataModel> GetIdentities ()
        //    {
        //    return _identities;
        //    }
        //public IdentityDataModel (string title, string firstName, string lastName, string email, string phone, string address, string date, string country, string zip, string city, string state, string language, string currency, string birthCountry)
        //    {
        //    Title = title;
        //    FirstName = firstName;
        //    LastName = lastName;
        //    Email = email;
        //    Phone = phone;
        //    Address = address;
        //    DateOfBirth = date;
        //    CountryOfResidence = country;
        //    ZipCode = zip;
        //    City = city;
        //    State = state;
        //    Language = language;
        //    Currency = currency;
        //    CountryOfBirth = birthCountry;
        //    }
        }
    }