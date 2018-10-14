using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace IdentityManagementWebService.ModelClasses
    {
    public class WebsiteDataModel
        {

        [JsonProperty]
        public string WebsiteName
            {
            get;
            set;
            }
        [JsonProperty]
        public string Notes
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
        public string UserPassword
            {
            get;
            set;
            }
        [JsonProperty]
        public string PIN
            {
            get;
            set;
            }
        [JsonProperty]
        public string WebsiteAccountNumber
            {
            get;
            set;
            }
        [JsonProperty]
        public string  SecurityQuestion
            {
            get;
            set;
            }
        [JsonProperty]
        public string SecurityAnswer
            {
            get;
            set;
            }
        }
    }