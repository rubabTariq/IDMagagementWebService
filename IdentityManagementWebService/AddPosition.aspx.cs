using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using IdentityManagementWebService.ModelClasses;
using IdentityManagementWebService.Pages;
using PositionManagementWebService.ModelClasses;

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
            getPositionName = Request.QueryString["positionlabel"];
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

                    }

                if ( null != getPositionName )
                    {
                    response = AmazonDynamoDBPositionTable.Instance.GetDataInDynamoDb(getPositionName.ToLower());
                    if ( null != (response.PositionData) )
                        {

                        positionData = response.PositionData.FirstOrDefault();
                        positionData = AmazonDynamoDBPositionTable.Instance.ConvertToTitleCase(positionData);
                        //find identity from azure table and render content in fields.
                        positionlabel.Value = positionData.PositionLabel;
                        ListItem selectSelection = selectselection.Items.FindByText(positionData.SelectSelection);
                        selectSelection.Selected = true;
                        startendtime.Value = positionData.StartEndTime;
                        for ( int j = 0; j < positionData.SelectTasks.Count; j++ )
                            {
                            if ( null != positionData.SelectTasks[j] && j == 1 )
                                step1.Value = positionData.SelectTasks[j];
                            if ( null != positionData.SelectTasks[j] && j == 2 )
                                step2.Value = positionData.SelectTasks[j];
                            if ( null != positionData.SelectTasks[j] && j == 3 )
                                step3.Value = positionData.SelectTasks[j];
                            else
                                {
                                HtmlTableRow tRow = new HtmlTableRow();
                                HtmlTableCell tb1 = new HtmlTableCell();
                                tb1.InnerText = j.ToString()+ ".";
                                tRow.Controls.Add(tb1);
                                HtmlTableCell tb2 = new HtmlTableCell();
                                tb2.InnerText = positionData.SelectTasks[j];
                                tRow.Controls.Add(tb2);
                                task.Rows.Add(tRow);
                                }
                            }
                        for ( int j = 0; j < positionData.SelectCountries.Count; j++ )
                            {
                            HtmlGenericControl iDiv = new HtmlGenericControl("div");
                            iDiv.Attributes.Add("id", positionData.SelectCountries[j]);
                            iDiv.Attributes.Add("classname","form-control");
                            iDiv.Attributes.CssStyle.Add("height","auto");
                            iDiv.InnerHtml = positionData.SelectCountries[j] + "&nbsp<button class=\"glyphicon glyphicon-remove\" style=\"display:inline;background-color:white\" onclick=\"deleteCountry(\'' + iDiv.id + '\')\" />";
                            addcountry.InnerHtml += iDiv;
                                }
                        notes.Value = positionData.Note;
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
        public static Response Send (PositionData positionData)
            {
            Response status;
            positionData = AmazonDynamoDBPositionTable.Instance.ConvertToLowerCase(positionData);
            status = AmazonDynamoDBPositionTable.Instance.SaveDataInDynamoDb(positionData);
            return status;
            }
        }
    }