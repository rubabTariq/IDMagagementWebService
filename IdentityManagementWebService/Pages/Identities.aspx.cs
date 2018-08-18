using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using IdentityManagementWebService.ModelClasses;

namespace IdentityManagementWebService.Pages
    {
    public partial class DashBoard : System.Web.UI.Page
        {
        string[] list = { "Fatima", "fatima@gmail.com", "Pakistan", "abc" };

        protected void Page_Load (object sender, EventArgs e)
            {
            IList <IdentityDataModel> _identities = null;//IdentityDataModel.GetInstance.GetIdentities();
            if ( null != _identities && 0 < _identities.Count )
                {


                foreach ( var identity in _identities )
                    {
                    var tr = new HtmlTableRow();
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
                    _edit.HRef = "AddIdentity.aspx";
                    _edit.Attributes.CssStyle.Add("margin-left", "0px");
                    _edit.InnerHtml = edit.InnerHtml;
                    HtmlAnchor _delete = new HtmlAnchor();
                    _delete.HRef = "AddIdentity.aspx";
                    _delete.Attributes.CssStyle.Add("margin-left", "22px");
                    _delete.InnerHtml = delete.InnerHtml;
                    HtmlTableCell actioncell = new HtmlTableCell();
                    actioncell.Controls.Add(_edit);
                    actioncell.Controls.Add(_delete);
                    actioncell.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(actioncell);

                    identities.Rows.Add(tr);
                    }
                countDiv.InnerText = (identities.Rows.Count - 1).ToString();
                }
            }
        [System.Web.Services.WebMethod]
        public static string editidentity (string email)
            {
            return "";
            }
        [System.Web.Services.WebMethod]
        public static string deleteidentity (string email)
            {
            return "";
            }
        }
    }