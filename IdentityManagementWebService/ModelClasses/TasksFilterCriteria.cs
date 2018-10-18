using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityManagementWebService.ModelClasses
    {
    public class TasksFilterCriteria
        {
        private string tname;

        public string TaskName
            {
            get
                {
                return tname;
                }
            set
                {
                tname = value;
                }
            }

        private string task;

        public string Task
            {
            get
                {
                return task;
                }
            set
                {
                task = value;
                }
            }

        private string website;

        public string Website
            {
            get
                {
                return website;
                }
            set
                {
                website = value;
                }
            }
        private string state;

        public string State
            {
            get
                {
                return state;
                }
            set
                {
                state = value;
                }
            }
        }
    }