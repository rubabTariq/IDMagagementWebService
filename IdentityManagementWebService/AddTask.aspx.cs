using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using IdentityManagementWebService.ModelClasses;
using IdentityManagementWebService.Pages;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System.Collections.ObjectModel;

namespace IdentityManagementWebService
    {
    public partial class AddTask : System.Web.UI.Page
        {
        private static string getTaskName = null;
        private static IdentityTaskData identityTaskData = null;
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
            getTaskName = Request.QueryString["taskname"];
            Response response = AmazonDynamoDBIdentityTable.Instance.GetAllDataInDynamoDb();
            List<IdentityDataModel> Identities = response.IdentityDataModel;
          
            if ( null != Identities )
                {
                foreach ( IdentityDataModel Identity in Identities )
                    {
                    IdentityDataModel identity = Identity;
                    identity = AmazonDynamoDBIdentityTable.Instance.ConvertToTitleCase(identity);
                    var tr = new HtmlTableRow();
                    tr.ID = identity.Email;
                    HtmlTableCell checkbox = new HtmlTableCell();
                    HtmlGenericControl element = new HtmlGenericControl("input");
                    element.Attributes.Add("type", "checkbox");
                    element.Attributes.Add("name", "chkbox[]");
                    element.Attributes.Add("runat", "server");
                    element.Attributes.Add("id", identity.Email + "checkbox");
                    element.Attributes.Add("onchange", "checkAll(this,'" + identity.Email + "')");
                    checkbox.Controls.Add(element);
                    checkbox.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(checkbox);


                    HtmlTableCell name = new HtmlTableCell();
                    name.InnerText = identity.FirstName + " "+identity.LastName;
                    name.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(name);
                    HtmlTableCell email = new HtmlTableCell();
                    email.InnerText = identity.Email;
                    email.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(email);
                    HtmlTableCell country = new HtmlTableCell();
                    country.InnerText = identity.CountryOfResidence;
                    country.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(country);
                    HtmlTableCell assignedGame = new HtmlTableCell();
                    assignedGame.InnerText = "";
                    assignedGame.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(assignedGame);

                    HtmlAnchor _edit = new HtmlAnchor();
                    _edit.HRef = "#";
                    _edit.Attributes.CssStyle.Add("margin-left", "0px");
                    HtmlImage editimage = new HtmlImage();
                    editimage.Attributes.Add("src", "../Images/edit.png");
                    editimage.Attributes.CssStyle.Add("width", "15px");
                    _edit.Controls.Add(editimage);
                    _edit.Attributes.Add("onclick", "editCustomTaskValue('" + email.InnerText + "')");
                    _edit.Attributes.Add("id", "edit" + email.InnerText);
                    HtmlAnchor _delete = new HtmlAnchor();
                    _delete.HRef = "#";
                    _delete.Attributes.CssStyle.Add("margin-left", "30%");
                    HtmlImage deleteimage = new HtmlImage();
                    deleteimage.Attributes.Add("src", "../Images/delete.png");
                    deleteimage.Attributes.CssStyle.Add("width", "30px");
                    _delete.Attributes.Add("onclick", "deleteCustomTaskValue('" + email.InnerText + "')");
                    _delete.Attributes.Add("id", "delete" + email.InnerText);
                    _delete.Controls.Add(deleteimage);
                    HtmlTableCell actioncell = new HtmlTableCell();
                    actioncell.Controls.Add(_edit);
                    actioncell.Controls.Add(_delete);
                    actioncell.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(actioncell);

                    taskIdentities.Rows.Add(tr);
                    foreach ( WebsiteDataModel website in identity.WebsiteDataModel )
                        {
                        var item = selectwebsite.Items.FindByText(website.WebsiteName);
                        if ( null == item )
                            selectwebsite.Items.Add(website.WebsiteName);
                        }

                    }

                if ( null != getTaskName )
                    {
                    response = AmazonDynamoDBTaskTable.Instance.GetDataInDynamoDb(getTaskName.ToLower());
                    if ( null != (response.IdentityTaskData) )
                        {

                        identityTaskData = response.IdentityTaskData.FirstOrDefault();
                        identityTaskData = AmazonDynamoDBTaskTable.Instance.ConvertToTitleCase(identityTaskData);
                        //find identity from azure table and render content in fields.
                        ListItem selectedtask = selecttask.Items.FindByText(identityTaskData.SelectTask);
                        selectedtask.Selected = true;
                        task_name.Value = identityTaskData.TaskName;
                        section.Value = identityTaskData.Section;
                        wageramount.Value = identityTaskData.WagerAmount;
                        balancetarget.Value = identityTaskData.BalanceTarget;
                        balancelimit.Value = identityTaskData.BalanceLimit;
                        stoploss.Value = identityTaskData.StopLoss;
                        ListItem Selectedwebsite = selectwebsite.Items.FindByText(identityTaskData.TaskWebsite);
                        if ( null == Selectedwebsite )
                            {
                            selectwebsite.Items.Add(identityTaskData.TaskWebsite);
                            Selectedwebsite = selectwebsite.Items.FindByText(identityTaskData.TaskWebsite);
                            }

                        Selectedwebsite.Selected = true;
                        ListItem selectedBrowser = selectbrowser.Items.FindByText(identityTaskData.SelectBrowser);
                        selectedBrowser.Selected = true;
                        ListItem selectedMode = selectmode.Items.FindByText(identityTaskData.SelectMode);
                        selectedMode.Selected = true;
                        ListItem selectedBetSizeOption = betsizeoption.Items.FindByText(identityTaskData.BetSizeOption);
                        selectedBetSizeOption.Selected = true;
                        betsize.Value = identityTaskData.BetSize;
                        maxbetsize.Value = identityTaskData.MaxBetSize;
                        List<string> selectedIdentities = new List<string>();
                        int i = 0;
                        for ( var j = 1; j < taskIdentities.Rows.Count; j++ )
                            {
                            foreach ( var identityEmail in identityTaskData.SelectedIdentities )
                                {
                                var row = taskIdentities.Rows[j];
                                if ( row.ID == identityEmail )
                                    {
                                    var htmlcontrol = row.Cells[0];
                                    //foreach ( HtmlTableCell item in row.Cells )
                                    //    {
                                        HtmlControl object1 = (HtmlControl) row.Cells[0].Controls[0];
                                        if ( null != object1 )
                                            {
                                            object1.Attributes.Add("checked", "checked");
                                            if ( !(selectedIdentities.Contains(identityEmail)) )
                                                {
                                                selectedIdentities.Add(identityEmail);
                                                i++;
                                                break;
                                                }
                                            }
                                        //}
                                    }
                                }//foreach 2nd
                            }
                        foreach ( var identity in identityTaskData.SelectedGames )
                            {
                            if ( identity != null && !(gamesContainer.InnerHtml.Contains(identity)))
                                {
                                gamesContainer.InnerHtml += identity;
                                gamesContainer.InnerHtml += "<br />";
                                gamesContainer.Style["visibility"] = "visible";
                                }
                            }
                        hiddenselectedIdentities.Value = string.Join(",", identityTaskData.SelectedIdentities);
                        hiddenselectedGames.Value = string.Join(",", identityTaskData.SelectedGames);
                        }
                    Count = Identities.Count;

                    //taskcount.InnerText = (response.IdentityTaskData.Count).ToString();
                    }
                    countDiv.InnerText = DashBoard.Count.ToString();

                    }
                }
        [System.Web.Services.WebMethod]
        public static Response Send (IdentityTaskData IdentityTaskData)
            {
            Response status;
            IdentityTaskData = AmazonDynamoDBTaskTable.Instance.ConvertToLowerCase(IdentityTaskData);
            status = AmazonDynamoDBTaskTable.Instance.SaveDataInDynamoDb(IdentityTaskData);
            return status;
            }
        [System.Web.Services.WebMethod]
        public static Response deleteCustomTaskValue (string email)
            {
            //find idenenty from azure table through email and delete it. 
            Response response = AmazonDynamoDBTaskTable.Instance.deleteCustomTaskDataInDynamoDb(email.ToLower());
            return response;
            }
        [System.Web.Services.WebMethod]
        public static Response editCustomTaskValue (string email)
            {
            //find idenenty from azure table through email and edit it. 
            Response response = AmazonDynamoDBTaskTable.Instance.editCustomTaskDataInDynamoDb(email.ToLower());
            return response;
            }
        }
    }
