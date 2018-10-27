using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IdentityManagementWebService.ModelClasses;
using IdentityManagementWebService.Pages;
using Newtonsoft.Json;

namespace IdentityManagementWebService
    {
    public partial class AddAffiliate : System.Web.UI.Page
        {
        private static string getName = null;
        private static AffiliateDataModel identity = null;
        protected void Page_Load (object sender, EventArgs e)
            {
            getName = Request.QueryString["name"];
            if ( null != getName )
                {
                Response response = AmazonDynamoDBAffiliateTable.Instance.GetDataInDynamoDb(getName.ToLower());
                identity = response.AffiliateDataModel.FirstOrDefault();
                identity = AmazonDynamoDBAffiliateTable.Instance.ConvertToTitleCase(identity);
                name.Value = identity.Name;
                }
            countDiv.InnerText = DashBoard.Count.ToString();
            }
        [System.Web.Services.WebMethod]
        public static Response Send (AffiliateDataModel IdentityData)
            {
            Response status;
            IdentityData = AmazonDynamoDBAffiliateTable.Instance.SetEmptyValuestoNull(IdentityData);
            IdentityData = AmazonDynamoDBAffiliateTable.Instance.ConvertToLowerCase(IdentityData);
            IdentityData.CurrentDate = System.DateTime.Now.Date.ToString("dd.MM.yyy");
            if ( null == getName )
                {
                status = AmazonDynamoDBAffiliateTable.Instance.SaveDataInDynamoDb(IdentityData);
                }
            else
                {
                status = AmazonDynamoDBAffiliateTable.Instance.UpdateDataInDynamoDb(IdentityData);
                }
            return status;
            }
        }
    }