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
    public partial class TaskAndHistorySection : System.Web.UI.Page
        {
        private static string getPositionLabel = null;
        private static PositionData identityPositionData = null;
        protected void Page_Load (object sender, EventArgs e)
            {
            getPositionLabel = Request.QueryString["positionlabel"];
            Response response = AmazonDynamoDBIdentityTable.Instance.GetAllDataInDynamoDb();
            List<IdentityDataModel> Identities = response.IdentityDataModel;
            int colunumber = 0;
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

                    HtmlTableCell total = new HtmlTableCell();
                    total.ID = "total"+ colunumber;
                    total.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(total);

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
                    colunumber++;
                    }

                if ( null != getPositionLabel )
                    {
                    response = AmazonDynamoDBPositionTable.Instance.GetDataInDynamoDb(getPositionLabel.ToLower());
                    if ( null != (response.PositionData) )
                        {

                        identityPositionData = response.PositionData.FirstOrDefault();
                        identityPositionData = AmazonDynamoDBPositionTable.Instance.ConvertToTitleCase(identityPositionData);
                        //find identity from azure table and render content in fields.
                        runpositionlabel.InnerHtml = identityPositionData.PositionLabel;
                        totalruntime.InnerHtml = identityPositionData.TotalDateTime;
                        openpositiontime.InnerHtml = identityPositionData.StartDate + " "+ identityPositionData.StartTime;
                        startedpositiontime.InnerHtml = identityPositionData.StartDate + " " + identityPositionData.StartTime;
                        intervalpositiontime.InnerHtml = identityPositionData.StartDate + " " + identityPositionData.StartTime;
                        positionidentities.InnerHtml = (string) identityPositionData.SelectedIdentities.Count.ToString();
                        List<string> selectedIdentities = new List<string>();
                        int i = 0;
                        for ( var j = 1; j < taskIdentities.Rows.Count; j++ )
                            {
                            foreach ( var identityEmail in identityPositionData.SelectedIdentities )
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
                        }
                    }
                countDiv.InnerText = DashBoard.Count.ToString();

                }
            }

        }
    }