using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace IdentityManagementWebService.ModelClasses
    {
    public class AffiliateDataModel
        {
        [JsonProperty]
        public string Name
            {
            get;
            set;
            }
        [JsonProperty]
        public List<string> Identities
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
        }
    }