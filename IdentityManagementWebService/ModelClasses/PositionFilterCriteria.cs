using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdentityManagementWebService.ModelClasses
    {
    public class PositionFilterCriteria
        {
        private string positionlabel;

        public string PositionLabel
            {
            get
                {
                return positionlabel;
                }
            set
                {
                positionlabel = value;
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
        private string status;

        public string Status
            {
            get
                {
                return status;
                }
            set
                {
                status = value;
                }
            }
        }
    }