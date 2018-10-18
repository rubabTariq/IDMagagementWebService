using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace IdentityManagementWebService.ModelClasses
    {
    public class IdentityTaskData
        {
        [JsonProperty]
        public string Email
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
        public List<string> SelectedGames
            {
            get;
            set;
            }
        [JsonProperty]
        public string TaskName
            {
            get;
            set;
            }
        [JsonProperty]
        public string TaskWebsite
            {
            get;
            set;
            }
        [JsonProperty]
        public string SelectTask
            {
            get;
            set;
            }
        [JsonProperty]
        public string Section
            {
            get;
            set;
            }
        [JsonProperty]
        public string SelectBrowser
            {
            get;
            set;
            }
        [JsonProperty]
        public string SelectMode
            {
            get;
            set;
            }
        [JsonProperty]
        public string WagerAmount
            {
            get;
            set;
            }
        [JsonProperty]
        public string BalanceTarget
            {
            get;
            set;
            }
        [JsonProperty]
        public string BalanceLimit
            {
            get;
            set;
            }
        [JsonProperty]
        public string StopLoss
            {
            get;
            set;
            }
        [JsonProperty]
        public string BetSizeOption
            {
            get;
            set;
            }
        [JsonProperty]
        public string BetSize
            {
            get;
            set;
            }
        [JsonProperty]
        public string MaxBetSize
            {
            get;
            set;
            }
        }
    }