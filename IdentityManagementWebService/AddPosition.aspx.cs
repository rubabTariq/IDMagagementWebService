using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using IdentityManagementWebService.ModelClasses;
using IdentityManagementWebService.Pages;


namespace IdentityManagementWebService
    {
    public partial class AddPosition : System.Web.UI.Page
        {
        private static string getPositionName = null;
        private static PositionData positionData = null;
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
            if(null!= Request.QueryString["positionlabel"] )
            getPositionName = (Request.QueryString["positionlabel"]).ToLower();
            Response response = AmazonDynamoDBIdentityTable.Instance.GetAllDataInDynamoDb();
            List<IdentityDataModel> Identities = response.IdentityDataModel;
            int itemnmber = 0;
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

                    HtmlTableCell affiliate = new HtmlTableCell();
                    affiliate.InnerText = identity.Affiliate;
                    affiliate.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(affiliate);
                    HtmlTableCell name = new HtmlTableCell();
                    name.InnerText = identity.FirstName + " " + identity.LastName;
                    name.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(name);
                    HtmlTableCell email = new HtmlTableCell();
                    email.InnerText = identity.Email;
                    email.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(email);
                    HtmlTableCell country = new HtmlTableCell();
                    country.ID = identity.CountryOfResidence+ itemnmber;
                    country.InnerText = identity.CountryOfResidence;
                    country.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(country);


                    //HtmlAnchor _edit = new HtmlAnchor();
                    //_edit.HRef = "#";
                    //_edit.Attributes.CssStyle.Add("margin-left", "0px");
                    //HtmlImage editimage = new HtmlImage();
                    //editimage.Attributes.Add("src", "../Images/edit.png");
                    //editimage.Attributes.CssStyle.Add("width", "15px");
                    //_edit.Controls.Add(editimage);
                    //_edit.Attributes.Add("onclick", "editCustomTaskValue('" + email.InnerText + "')");
                    //_edit.Attributes.Add("id", "edit" + email.InnerText);
                    //HtmlAnchor _delete = new HtmlAnchor();
                    //_delete.HRef = "#";
                    //_delete.Attributes.CssStyle.Add("margin-left", "30%");
                    //HtmlImage deleteimage = new HtmlImage();
                    //deleteimage.Attributes.Add("src", "../Images/delete.png");
                    //deleteimage.Attributes.CssStyle.Add("width", "30px");
                    //_delete.Attributes.Add("onclick", "deleteCustomTaskValue('" + email.InnerText + "')");
                    //_delete.Attributes.Add("id", "delete" + email.InnerText);
                    //_delete.Controls.Add(deleteimage);
                    //HtmlTableCell actioncell = new HtmlTableCell();
                    //actioncell.Controls.Add(_edit);
                    //actioncell.Controls.Add(_delete);
                    //actioncell.Attributes.Add("class", "tablecolumn");
                    //tr.Cells.Add(actioncell);

                    taskIdentities.Rows.Add(tr);
                    foreach ( WebsiteDataModel website in identity.WebsiteDataModel )
                        {
                        var item = selectwebsite.Items.FindByText(website.WebsiteName);
                        if ( null == item )
                            selectwebsite.Items.Add(website.WebsiteName);
                        }
                    itemnmber++;
                    }

                if ( null != getPositionName )
                    {
                    response = AmazonDynamoDBPositionTable.Instance.GetDataInDynamoDb(getPositionName);
                    if ( null != (response.PositionData) )
                        {

                        positionData = response.PositionData.FirstOrDefault();
                        positionData = AmazonDynamoDBPositionTable.Instance.ConvertToTitleCase(positionData);
                        //find identity from azure table and render content in fields.
                        positionlabel.Value = positionData.PositionLabel;
                        selectselection.Value = positionData.SelectSelection;
                        starttime.Value = positionData.StartTime;
                        endtime.Value = positionData.EndTime;
                        startdate.Value = positionData.StartDate;
                        enddate.Value = positionData.EndDate;
                        int tasknumber = 3;
                        for ( int j = 0; j < positionData.SelectTasks.Count; j++ )
                            {
                            if ( null != positionData.SelectTasks[j] && j == 0 )
                                step1.Value = positionData.SelectTasks[j];
                            if ( null != positionData.SelectTasks[j] && j == 1 )
                                step2.Value = positionData.SelectTasks[j];
                            if ( null != positionData.SelectTasks[j] && j == 2 )
                                step3.Value = positionData.SelectTasks[j];
                            if(j>2)
                                {
                                tasknumber++;
                                HtmlTableRow tRow = new HtmlTableRow();
                                HtmlTableCell tb1 = new HtmlTableCell();
                                tb1.InnerText = tasknumber.ToString()+ ".";
                                tRow.Controls.Add(tb1);
                                HtmlTableCell tb2 = new HtmlTableCell();
                                HtmlGenericControl inputelement = new HtmlGenericControl("input");
                                inputelement.Attributes.Add("type", "text");
                                inputelement.Attributes.Add("name", "step" + tasknumber);
                                inputelement.Attributes.Add("value", positionData.SelectTasks[j]);
                                inputelement.Attributes.Add("id", "step"+ tasknumber);
                                inputelement.Style.Add("width", "80%");
                                inputelement.Style.Add("height", "10%");
                                tb2.Style.Add("width", "80%");
                                tb2.Style.Add("height", "10%");
                                tb2.Controls.Add(inputelement);
                                tRow.Controls.Add(tb2);
                                task.Rows.Add(tRow);
                                }
                            }
                        for ( int j = 0; j < positionData.SelectCountries.Count; j++ )
                            {
                            HtmlGenericControl iDiv = new HtmlGenericControl("div");
                            iDiv.Attributes.Add("id", positionData.SelectCountries[j]);
                            iDiv.Attributes.Add("class","form-control");
                            iDiv.Attributes.CssStyle.Add("height","auto");
                            iDiv.InnerHtml = positionData.SelectCountries[j] + "&nbsp<button class=\"glyphicon glyphicon-remove\" style=\"display:inline;background-color:white\" onclick=\"deleteCountry(\'" + positionData.SelectCountries[j] + "\')\" />";
                            addcountry.Controls.Add(iDiv);
                            }
                        notes.Value = positionData.Note.ToString();
                        ListItem Selectedwebsite = selectwebsite.Items.FindByText(positionData.PositionWebsite);
                        if ( null == Selectedwebsite )
                            {
                            selectwebsite.Items.Add(positionData.PositionWebsite);
                            Selectedwebsite = selectwebsite.Items.FindByText(positionData.PositionWebsite);
                            }
                        Selectedwebsite.Selected = true;
                        List<string> selectedIdentities = new List<string>();
                        int i = 0;
                        for ( var j = 1; j < taskIdentities.Rows.Count; j++ )
                            {
                            foreach ( var positionEmail in positionData.SelectedIdentities )
                                {
                                var row = taskIdentities.Rows[j];
                                if ( row.ID == positionEmail )
                                    {
                                    var htmlcontrol = row.Cells[0];
                                    //foreach ( HtmlTableCell item in row.Cells )
                                    //    {
                                    HtmlControl object1 = (HtmlControl) row.Cells[0].Controls[0];
                                    if ( null != object1 )
                                        {
                                        object1.Attributes.Add("checked", "checked");
                                        if ( !(selectedIdentities.Contains(positionEmail)) )
                                            {
                                            selectedIdentities.Add(positionEmail);
                                            i++;
                                            break;
                                            }
                                        }
                                    //}
                                    }
                                }//foreach 2nd
                            }
                        }
                    Count = Identities.Count;
                    }
                countDiv.InnerText = DashBoard.Count.ToString();

                }
            }
        [System.Web.Services.WebMethod]
        public static Response Send (PositionData PositionData)
            {
            Response status;
            PositionData = AmazonDynamoDBPositionTable.Instance.ConvertToLowerCase(PositionData);
            if ( !string.IsNullOrEmpty(PositionData.StartTime) && !string.IsNullOrEmpty(PositionData.EndTime) && !string.IsNullOrEmpty(PositionData.StartDate) && !string.IsNullOrEmpty(PositionData.EndDate ))
                {
                string hours= (DateTime.Parse(PositionData.EndTime) - DateTime.Parse(PositionData.StartTime)).TotalHours + "h ";
                string minutes = (DateTime.Parse(PositionData.EndTime) - DateTime.Parse(PositionData.StartTime)).TotalMinutes + "m ";
                string seconds = (DateTime.Parse(PositionData.EndTime) - DateTime.Parse(PositionData.StartTime)).TotalSeconds + "s ";

                string totaltime = hours + minutes + seconds;
                string totaldate = (DateTime.Parse(PositionData.EndDate)- DateTime.Parse(PositionData.StartDate)).TotalDays + "d ";
                PositionData.TotalDateTime = totaldate + totaltime;
                }
            status = AmazonDynamoDBPositionTable.Instance.SaveDataInDynamoDb(PositionData);
            return status;
            }
        }
    }