using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using IdentityManagementWebService.ModelClasses;
using Newtonsoft.Json;

namespace IdentityManagementWebService.Pages
    {
    public partial class DashBoard : System.Web.UI.Page
        {
        private static int count;

        internal static int Count
            {
            get
                {
                return count;
                }
            set
                {
                count = value;
                }
            }

        protected void Page_Load (object sender, EventArgs e)
            {
            Response response=AmazonDynamoDBIdentityTable.Instance.GetAllDataInDynamoDb();
             List<IdentityDataModel> Identities = response.IdentityDataModel;
            if ( null != Identities )
                {
                CreateHTMLTable(Identities);
                Count = Identities.Count;
                countDiv.InnerText = (Identities.Count).ToString();
                }            
        }
        private void CreateHTMLTable (List<IdentityDataModel> Identities)
            {
            int tasknumber = 0;
            foreach ( IdentityDataModel Identity in Identities )
                {
                IdentityDataModel identity = Identity;
                identity = AmazonDynamoDBIdentityTable.Instance.ConvertToTitleCase(identity);
                var tr = new HtmlTableRow();
                tr.ID = identity.Email;
                tasknumber++;
                HtmlTableCell taskNumber = new HtmlTableCell();
                taskNumber.InnerText = tasknumber.ToString();
                taskNumber.Attributes.Add("class", "tablecolumn");
                tr.Cells.Add(taskNumber);
                HtmlTableCell currentDate = new HtmlTableCell();
                currentDate.InnerText = identity.CurrentDate;
                currentDate.Attributes.Add("class", "tablecolumn");
                tr.Cells.Add(currentDate);
                HtmlTableCell name = new HtmlTableCell();
                name.InnerText = identity.FirstName + " " + identity.LastName;
                name.Attributes.Add("class", "tablecolumn");
                tr.Cells.Add(name);
                HtmlTableCell email = new HtmlTableCell();
                email.InnerText = identity.Email;
                email.Attributes.Add("class", "tablecolumn");
                tr.Cells.Add(email);

                HtmlTableCell websiteCount = new HtmlTableCell();
                websiteCount.InnerText = identity.WebsiteDataModel.Count.ToString();
                websiteCount.Attributes.Add("class", "tablecolumn");
                tr.Cells.Add(websiteCount);

                HtmlTableCell country = new HtmlTableCell();
                country.InnerText = identity.CountryOfResidence;
                country.Attributes.Add("class", "tablecolumn");
                tr.Cells.Add(country);
                HtmlTableCell status = new HtmlTableCell();
                status.InnerText = "Active";
                status.Attributes.Add("class", "tablecolumn");
                //status.Attributes.CssStyle.Add("background-color", "#06d995");
                //status.Attributes.CssStyle.Add("color", "#ffffff");
                tr.Cells.Add(status);

                HtmlAnchor _edit = new HtmlAnchor();
                _edit.HRef = "/AddIdentity.aspx?email=" + email.InnerText;
                _edit.Attributes.CssStyle.Add("margin-left", "0px");
                HtmlImage editimage = new HtmlImage();
                editimage.Attributes.Add("src", "../Images/edit.png");
                editimage.Attributes.CssStyle.Add("width", "15px");
                _edit.Controls.Add(editimage);
                _edit.Attributes.Add("id", "edit" + email.InnerText);
                HtmlAnchor _delete = new HtmlAnchor();
                _delete.HRef = "#";
                _delete.Attributes.CssStyle.Add("margin-left", "22px");
                HtmlImage deleteimage = new HtmlImage();
                deleteimage.Attributes.Add("src", "../Images/delete.png");
                deleteimage.Attributes.CssStyle.Add("width", "30px");
                _delete.Attributes.Add("onclick", "deleteIdentity('" + email.InnerText + "')");
                _delete.Attributes.Add("id", "delete" + email.InnerText);
                _delete.Controls.Add(deleteimage);

                HtmlGenericControl copyBasicData = new HtmlGenericControl("input");
                copyBasicData.Attributes.Add("type", "button");
                copyBasicData.Attributes.Add("class", "btn btn-click");
                copyBasicData.Attributes.Add("value", "Copy Data");
                copyBasicData.Attributes.CssStyle.Add("width", "auto");
                copyBasicData.Attributes.CssStyle.Add("background-color", "#06d995");
                copyBasicData.Attributes.CssStyle.Add("color", "#ffffff");
                copyBasicData.Attributes.CssStyle.Add(" margin-left", "10px");
                copyBasicData.Attributes.Add("onclick", "copyPersonalData('" + identity.Email + "')");
                copyBasicData.Attributes.Add("id", "taskSchedule" + identity.Email);

                HtmlGenericControl copyDataButton = new HtmlGenericControl("input");
                copyDataButton.Attributes.Add("type", "button");
                copyDataButton.Attributes.Add("class", "btn btn-click");
                copyDataButton.Attributes.Add("value", "Copy All");
                copyDataButton.Attributes.CssStyle.Add("width", "auto");
                copyDataButton.Attributes.CssStyle.Add("background-color", "#1565c0");
                copyDataButton.Attributes.CssStyle.Add("color", "#ffffff");
                copyDataButton.Attributes.CssStyle.Add(" margin-left", "10px");
                copyDataButton.Attributes.Add("onclick", "copyCompletePersonalData('" + identity.Email + "')");
                copyDataButton.Attributes.Add("id", "copyData" + identity.Email);

                HtmlGenericControl showTasksButton = new HtmlGenericControl("input");
                showTasksButton.Attributes.Add("type", "button");
                showTasksButton.Attributes.Add("class", "btn btn-click");
                showTasksButton.Attributes.Add("value", "Show Tasks");
                showTasksButton.Attributes.CssStyle.Add("width", "auto");
                showTasksButton.Attributes.CssStyle.Add("background-color", "#050500");
                showTasksButton.Attributes.CssStyle.Add("color", "#ffffff");
                showTasksButton.Attributes.CssStyle.Add(" margin-left", "10px");
                showTasksButton.Attributes.Add("onclick", "ShowTasks('" + identity.Email + "')");
                showTasksButton.Attributes.Add("id", "showTasks" + identity.Email);

                HtmlTableCell actioncell = new HtmlTableCell();
                actioncell.Controls.Add(_edit);
                actioncell.Controls.Add(_delete);
                actioncell.Controls.Add(copyBasicData);
                actioncell.Controls.Add(copyDataButton);
                actioncell.Controls.Add(showTasksButton);
                actioncell.Attributes.Add("class", "tablecolumn");
                tr.Cells.Add(actioncell);

                identities.Rows.Add(tr);
                }
            }
        [System.Web.Services.WebMethod]
        public static bool deleteidentity (string email)
            {
            //find idenenty from azure table through email and delete it. 
            Response response=AmazonDynamoDBIdentityTable.Instance.DeleteDataInDynamoDb(email.ToLower());
            return response.Statusvalue;
            }
        [System.Web.Services.WebMethod]
        public static Response CopyIdentityContent (string email)
            {
            Response response = AmazonDynamoDBIdentityTable.Instance.GetDataInDynamoDb(email.ToLower());
            return response;
            }
        [System.Web.Services.WebMethod]
        public static Response SearchIdentities (IdentitiesFilterCriteria FilterCriteria)
            {
            Response response = AmazonDynamoDBIdentityTable.Instance.DynamoDbSearchIdentities(FilterCriteria);
            return response;
            }
            
        }
    }