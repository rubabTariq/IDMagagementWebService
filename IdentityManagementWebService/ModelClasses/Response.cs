using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Amazon.DynamoDBv2.DocumentModel;

namespace IdentityManagementWebService.ModelClasses
    {
    public class Response
        {
        public Response (bool statusvalue, string responseMessage)
            {
            Statusvalue = statusvalue;
            ResponseMessage = responseMessage;
            }
        public Response (bool statusvalue, string responseMessage, List<IdentityDataModel> identity)
            {
            Statusvalue = statusvalue;
            ResponseMessage = responseMessage;
            IdentityDataModel = identity;
            }
        public Response (bool statusvalue, string responseMessage, List<IdentityTaskData> identity)
            {
            Statusvalue = statusvalue;
            ResponseMessage = responseMessage;
            IdentityTaskData = identity;
            }
        private List<IdentityDataModel> identityDataModel;

        public List<IdentityDataModel> IdentityDataModel
            {
            get
                {
                return identityDataModel;
                }
            set
                {
                identityDataModel = value;
                }
            }
        private List<IdentityTaskData> identityTaskData;

        public List<IdentityTaskData> IdentityTaskData
            {
            get
                {
                return identityTaskData;
                }
            set
                {
                identityTaskData = value;
                }
            }

        private bool statusvalue;

        public bool Statusvalue
            {
            get
                {
                return statusvalue;
                }

            set
                {
                statusvalue = value;
                }
            }
        private string responseMessage;

        public string ResponseMessage
            {
            get
                {
                return responseMessage;
                }
            set
                {
                responseMessage = value;
                }
            }


        }
    }