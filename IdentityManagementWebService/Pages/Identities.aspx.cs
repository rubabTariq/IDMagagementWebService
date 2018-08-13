using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace IdentityManagementWebService.Pages
    {
    public partial class DashBoard : System.Web.UI.Page
        {
        string[] list = { "Fatima", "fatima@gmail.com", "Pakistan", "abc" };

        protected void Page_Load (object sender, EventArgs e)
            {
            var tr = new HtmlTableRow();
            foreach ( var l in list )
                {
                HtmlTableCell name = new HtmlTableCell();
                name.InnerText = l;
                name.Attributes.Add("class", "tablecolumn");
                tr.Cells.Add(name);
                }
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
            countDiv.InnerText = (identities.Rows.Count-1).ToString();
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