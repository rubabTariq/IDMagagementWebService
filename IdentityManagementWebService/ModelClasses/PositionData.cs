using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace IdentityManagementWebService.ModelClasses
    {
    public class PositionData
        {
        [JsonProperty]
        public string PositionLabel
            {
            get;
            set;
            }
    [JsonProperty]
    public string PositionWebsite
            {
        get;
        set;
        }
    [JsonProperty]
    public string SelectSelection
            {
        get;
        set;
        }
        [JsonProperty]
        public string StartEndTime
            {
            get;
            set;
            }
        [JsonProperty]
        public List<string> SelectTasks
            {
            get;
            set;
            }
        [JsonProperty]
        public List<string> SelectCountries
            {
            get;
            set;
            }
        [JsonProperty]
        public List<string> SelectedIdentities
            {
            get;
            set;
            }
        [JsonProperty]
        public string Note
            {
            get;
            set;
            }
        }
    }