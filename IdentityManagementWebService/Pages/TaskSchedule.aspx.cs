using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using IdentityManagementWebService.ModelClasses;

namespace IdentityManagementWebService.Pages
    {
    public partial class TaskSchedule : System.Web.UI.Page
        {
        private string getEmail = null;
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
            Response response = AmazonDynamoDBTaskTable.Instance.GetAllDataInDynamoDb();
            getEmail = Request.QueryString["email"];
            if ( null != getEmail )
                {
                foreach ( var item in response.IdentityTaskData )
                    {
                    foreach ( var identity in item.SelectedIdentities )
                        {

                        if ( identity == getEmail )
                            {
                            TasksFilterCriteria taskCriteria = new TasksFilterCriteria();
                            taskCriteria.TaskName = item.TaskName;
                            response = AmazonDynamoDBTaskTable.Instance.DynamoDbSearchTasks(taskCriteria);
                            GenerateHTML(response);
                            }
                        }
                    }
                }
            else
                GenerateHTML(response);
            }
        private void GenerateHTML (Response response)
            {
            List<IdentityTaskData> Identities = response.IdentityTaskData;
            if ( null != Identities )
                {
                int tasknumber = 0;
                foreach ( IdentityTaskData Identity in Identities )
                    {
                    IdentityTaskData identity = AmazonDynamoDBTaskTable.Instance.ConvertToTitleCase(Identity);
                    var tr = new HtmlTableRow();
                    tr.ID = identity.TaskName;
                    tasknumber++;
                    HtmlTableCell taskNumber = new HtmlTableCell();
                    taskNumber.InnerText = tasknumber.ToString();
                    taskNumber.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(taskNumber);
                    HtmlTableCell taskname = new HtmlTableCell();
                    taskname.InnerText = identity.TaskName;
                    taskname.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(taskname);
                    HtmlTableCell selectedtask = new HtmlTableCell();
                    selectedtask.InnerText = identity.SelectTask;
                    selectedtask.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(selectedtask);
                    HtmlTableCell taskwebsite = new HtmlTableCell();
                    taskwebsite.InnerText = identity.TaskWebsite;
                    taskwebsite.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(taskwebsite);
                    HtmlTableCell taskidentities = new HtmlTableCell();
                    taskidentities.InnerText = identity.SelectedIdentities.Count.ToString();
                    taskidentities.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(taskidentities);
                    HtmlTableCell cycletime = new HtmlTableCell();
                    cycletime.InnerText = "time";
                    cycletime.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(cycletime);
                    HtmlTableCell finishedcycle = new HtmlTableCell();
                    finishedcycle.InnerText = "time";
                    finishedcycle.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(finishedcycle);
                    HtmlTableCell status = new HtmlTableCell();
                    status.InnerText = "Active";
                    status.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(status);

                    HtmlAnchor _edit = new HtmlAnchor();
                    _edit.HRef = "/AddTask.aspx?taskname=" + identity.TaskName;
                    _edit.Attributes.CssStyle.Add("margin-left", "5px");
                    HtmlImage editimage = new HtmlImage();
                    editimage.Attributes.Add("src", "../Images/edit.png");
                    editimage.Attributes.CssStyle.Add("width", "20px");
                    _edit.Controls.Add(editimage);
                    _edit.Attributes.Add("id", "edit" + identity.TaskName);
                    HtmlAnchor _delete = new HtmlAnchor();
                    _delete.HRef = "#";
                    _delete.Attributes.CssStyle.Add("margin-left", "10%");
                    HtmlImage deleteimage = new HtmlImage();
                    deleteimage.Attributes.Add("src", "../Images/delete.png");
                    deleteimage.Attributes.CssStyle.Add("width", "40px");
                    _delete.Attributes.Add("onclick", "deleteTask('" + identity.TaskName + "')");
                    _delete.Attributes.Add("id", "delete" + identity.TaskName);
                    _delete.Controls.Add(deleteimage);

                    HtmlGenericControl toggleButton = new HtmlGenericControl("input");
                    toggleButton.Attributes.Add("type", "button");
                    toggleButton.Attributes.Add("class", "btn btn-click");
                    toggleButton.Attributes.Add("value", "Continue");
                    toggleButton.Attributes.CssStyle.Add("width", "auto");
                    toggleButton.Attributes.CssStyle.Add("background-color", "#61d461");
                    toggleButton.Attributes.CssStyle.Add("color", "#ffffff");
                    toggleButton.Attributes.CssStyle.Add(" margin-left", "10px");
                    toggleButton.Attributes.Add("onclick", "SetTask('" + identity.TaskName + "','" + identity.Email + "')");
                    toggleButton.Attributes.Add("id", "toggle" + identity.TaskName);

                    HtmlGenericControl stopButton = new HtmlGenericControl("input");
                    stopButton.Attributes.Add("type", "button");
                    stopButton.Attributes.Add("class", "btn btn-click");
                    stopButton.Attributes.Add("value", "Stop");
                    stopButton.Attributes.CssStyle.Add("width", "auto");
                    stopButton.Attributes.CssStyle.Add("background-color", "#f74444");
                    stopButton.Attributes.CssStyle.Add("color", "#ffffff");
                    stopButton.Attributes.CssStyle.Add(" margin-left", "20px");
                    stopButton.Attributes.Add("onclick", "StopTask('" + identity.TaskName + "','" + identity.Email + "')");
                    stopButton.Attributes.Add("id", "stop" + identity.TaskName);


                    HtmlTableCell actioncell = new HtmlTableCell();
                    actioncell.Controls.Add(_edit);
                    actioncell.Controls.Add(_delete);
                    actioncell.Controls.Add(toggleButton);
                    actioncell.Controls.Add(stopButton);
                    actioncell.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(actioncell);

                    taskSchedule.Rows.Add(tr);
                    }
                Count = Identities.Count;
                //taskcount.InnerText = (Identities.Count).ToString();
                countDiv.InnerText = DashBoard.Count.ToString();
                }
            }
        [System.Web.Services.WebMethod]
        public static bool deleteTask (string taskname)
            {
            //find idenenty from azure table through email and delete it. 
            Response response = AmazonDynamoDBTaskTable.Instance.DeleteDataInDynamoDb(taskname.ToLower());
            return response.Statusvalue;
            }
        [System.Web.Services.WebMethod]
        public static Response SearchIdentities (TasksFilterCriteria taskCriteria)
            {
            Response response = AmazonDynamoDBTaskTable.Instance.DynamoDbSearchTasks(taskCriteria);
            return response;
            }

        }
    }
