using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace IdentityManagementWebService.ModelClasses
    {
    public class AcountInformation
        {
        [JsonProperty]
        public string AdminName
            {
            get;
            set;
            }
        [JsonProperty]
        public string Password
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
        public string UserName
            {
            get;
            set;
            }
        
        }
    }