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
        protected void Page_Load (object sender, EventArgs e)
            {
            Response response=AmazonDynamoDBTable.Instance.GetAllDataInDynamoDb();
             List<IdentityDataModel> Identities = response.IdentityDataModel;
            if ( null != Identities )
                {
                foreach ( IdentityDataModel identity in Identities )
                    {
                    var tr = new HtmlTableRow();
                    tr.ID = identity.Email;
                    HtmlTableCell name = new HtmlTableCell();
                    name.InnerText = identity.FirstName;
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
                    HtmlTableCell status = new HtmlTableCell();
                    status.InnerText = "Active";
                    status.Attributes.Add("class", "tablecolumn");
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
                    HtmlTableCell actioncell = new HtmlTableCell();
                    actioncell.Controls.Add(_edit);
                    actioncell.Controls.Add(_delete);
                    actioncell.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(actioncell);

                    identities.Rows.Add(tr);
                    }
                }
            countDiv.InnerText = (Identities.Count).ToString();
            
        }
        [System.Web.Services.WebMethod]
        public static bool deleteidentity (string email)
            {
            //find idenenty from azure table through email and delete it. 
            return true;
            }
        }
    }