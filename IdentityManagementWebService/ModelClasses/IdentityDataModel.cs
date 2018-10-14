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
        [JsonProperty]
        public List<IdentityTaskData> IdentityTaskData
            {
            get;
            set;
            }
        [JsonProperty]
        public string CurrentDate
            {
            get;
            set;
            }
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
        public string UserName
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
        public string Name
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
        }
    }