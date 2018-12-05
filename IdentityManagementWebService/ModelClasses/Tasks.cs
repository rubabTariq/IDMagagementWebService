using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace IdentityManagementWebService.ModelClasses
    {
    public class Tasks
        {
        public Tasks (List<string> value)
            {
            SelectTasks = value;
            }
        [JsonProperty]
        public List<string> SelectTasks
            {
            get;
            set;
            }
        }
    }