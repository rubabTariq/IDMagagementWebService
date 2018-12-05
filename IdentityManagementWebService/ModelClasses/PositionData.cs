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
        public string TotalDateTime
            {
            get;
            set;
            }
        [JsonProperty]
        public string StartTime
            {
            get;
            set;
            }
        [JsonProperty]
        public string EndTime
            {
            get;
            set;
            }
        [JsonProperty]
        public string StartDate
            {
            get;
            set;
            }
        [JsonProperty]
        public string EndDate
            {
            get;
            set;
            }
        [JsonProperty]
        public List<List<string>> TasksList
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
        [JsonProperty]
        public string Status
            {
            get;
            set;
            }
        [JsonProperty]
        public string TotalRunTime
            {
            get;
            set;
            }
        [JsonProperty]
        public string OpenPositionTime
            {
            get;
            set;
            }
        public string StartPositionTime
            {
            get;
            set;
            }
        public string IntervalPositionTime
            {
            get;
            set;
            }
        public string PositionIdentitiesCount
            {
            get;
            set;
            }
        public string CycleProgress
            {
            get;
            set;
            }
        public string TotalPLV
            {
            get;
            set;
            }
        public string AveragePLV
            {
            get;
            set;
            }
        public string CurrentAveragePLV
            {
            get;
            set;
            }
        public string CurrentPLV
            {
            get;
            set;
            }
        }
    }