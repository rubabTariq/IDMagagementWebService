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
    public partial class Affiliate : System.Web.UI.Page
        {
        protected void Page_Load (object sender, EventArgs e)
            {
            Response response = AmazonDynamoDBAffiliateTable.Instance.GetAllDataInDynamoDb();
            List<AffiliateDataModel> Affiliates = response.AffiliateDataModel;
            if ( null != Affiliates )
                {
                CreateHTMLTable(Affiliates);
                countDiv.InnerText = DashBoard.Count.ToString();
                }
            }
        private void CreateHTMLTable (List<AffiliateDataModel> Affiliates)
            {
            Response response = AmazonDynamoDBIdentityTable.Instance.GetAllDataInDynamoDb();
            List<IdentityDataModel> Identities = response.IdentityDataModel;
            int tasknumber = 0;
            foreach ( AffiliateDataModel Identity in Affiliates )
                {
                AffiliateDataModel affiliate = Identity;
                affiliate = AmazonDynamoDBAffiliateTable.Instance.ConvertToTitleCase(affiliate);
                var tr = new HtmlTableRow();
                tr.ID = affiliate.Name;
                tasknumber++;
                HtmlTableCell taskNumber = new HtmlTableCell();
                taskNumber.InnerText = tasknumber.ToString();
                taskNumber.Attributes.Add("class", "tablecolumn");
                tr.Cells.Add(taskNumber);
                HtmlTableCell currentDate = new HtmlTableCell();
                currentDate.InnerText = affiliate.CurrentDate;
                currentDate.Attributes.Add("class", "tablecolumn");
                tr.Cells.Add(currentDate);
                HtmlTableCell name = new HtmlTableCell();
                name.InnerText = affiliate.Name;
                name.Attributes.Add("class", "tablecolumn");
                tr.Cells.Add(name);

                HtmlTableCell websiteCount = new HtmlTableCell();
                websiteCount.InnerText = affiliate.Identities.Count.ToString();
                websiteCount.Attributes.Add("class", "tablecolumn");
                tr.Cells.Add(websiteCount);

                HtmlAnchor _edit = new HtmlAnchor();
                _edit.HRef = "/AddAffiliate.aspx?name=" + name.InnerText;
                _edit.Attributes.CssStyle.Add("margin-left", "0px");
                HtmlImage editimage = new HtmlImage();
                editimage.Attributes.Add("src", "../Images/edit.png");
                editimage.Attributes.CssStyle.Add("width", "15px");
                _edit.Controls.Add(editimage);
                _edit.Attributes.Add("id", "edit" + name.InnerText);
                HtmlAnchor _delete = new HtmlAnchor();
                _delete.HRef = "#";
                _delete.Attributes.CssStyle.Add("margin-left", "22px");
                HtmlImage deleteimage = new HtmlImage();
                deleteimage.Attributes.Add("src", "../Images/delete.png");
                deleteimage.Attributes.CssStyle.Add("width", "30px");
                _delete.Attributes.Add("onclick", "deleteIdentity('" + name.InnerText + "')");
                _delete.Attributes.Add("id", "delete" + name.InnerText);
                _delete.Controls.Add(deleteimage);

                HtmlGenericControl copyBasicData = new HtmlGenericControl("input");
                copyBasicData.Attributes.Add("type", "button");
                copyBasicData.Attributes.Add("class", "btn btn-click");
                copyBasicData.Attributes.Add("value", "Copy Data");
                copyBasicData.Attributes.CssStyle.Add("width", "auto");
                copyBasicData.Attributes.CssStyle.Add("background-color", "#06d995");
                copyBasicData.Attributes.CssStyle.Add("color", "#ffffff");
                copyBasicData.Attributes.CssStyle.Add(" margin-left", "10px");
                copyBasicData.Attributes.Add("onclick", "copyPersonalData('" + affiliate.Name + "')");
                copyBasicData.Attributes.Add("id", "affiliate" + affiliate.Name);



                HtmlTableCell actioncell = new HtmlTableCell();
                actioncell.Controls.Add(_edit);
                actioncell.Controls.Add(_delete);
                actioncell.Controls.Add(copyBasicData);
                actioncell.Attributes.Add("class", "tablecolumn");
                tr.Cells.Add(actioncell);

                affiliates.Rows.Add(tr);
                }
            }
        [System.Web.Services.WebMethod]
        public static bool deleteidentity (string name)
            {
            //find idenenty from azure table through email and delete it. 
            Response response = AmazonDynamoDBAffiliateTable.Instance.DeleteDataInDynamoDb(name.ToLower());
            return response.Statusvalue;
            }
        [System.Web.Services.WebMethod]
        public static Response CopyIdentityContent (string name)
            {
            Response response = AmazonDynamoDBAffiliateTable.Instance.GetDataInDynamoDb(name.ToLower());
            return response;
            }
        [System.Web.Services.WebMethod]
        public static Response SearchIdentities (IdentitiesFilterCriteria FilterCriteria)
            {
            Response response = AmazonDynamoDBAffiliateTable.Instance.DynamoDbSearchAffiliates(FilterCriteria);
            return response;
            }
        }
    }