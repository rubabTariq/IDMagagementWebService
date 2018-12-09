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
    public partial class PLV : System.Web.UI.Page
        {
        protected void Page_Load (object sender, EventArgs e)
            {
            Response responsePosition = AmazonDynamoDBPositionTable.Instance.GetAllDataInDynamoDb();
            Response responseIdentities = AmazonDynamoDBIdentityTable.Instance.GetAllDataInDynamoDb();
            GenerateHTML(responsePosition.PositionData, responseIdentities.IdentityDataModel);
            }
        private void GenerateHTML (List<PositionData> Positions, List<IdentityDataModel> Identity)
            {
            if ( null != Positions )
                {
                int srno = 0;
                foreach ( IdentityDataModel identity in Identity )
                    {
                    IdentityDataModel m_Identity = AmazonDynamoDBIdentityTable.Instance.ConvertToTitleCase(identity);
                    var tr = new HtmlTableRow();
                    tr.ID = m_Identity.Email;
                    srno++;
                    HtmlTableCell taskNumber = new HtmlTableCell();
                    taskNumber.InnerText = srno.ToString();
                    taskNumber.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(taskNumber);
                    HtmlTableCell country = new HtmlTableCell();
                    country.InnerText = m_Identity.CountryOfResidence;
                    country.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(country);
                    HtmlTableCell affiliate = new HtmlTableCell();
                    affiliate.InnerText = identity.Affiliate;
                    affiliate.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(affiliate);
                    HtmlTableCell email = new HtmlTableCell();
                    email.InnerText = m_Identity.Email;
                    email.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(email);
                    HtmlTableCell totalplv = new HtmlTableCell();
                    totalplv.InnerText = m_Identity.TotalPLV;
                    totalplv.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(totalplv);
                    
                    plv.Rows.Add(tr);
                    }
                int positionnumber = 0;
                foreach ( PositionData position in Positions )
                    {
                    PositionData m_position = AmazonDynamoDBPositionTable.Instance.ConvertToTitleCase(position);
                    var tr = new HtmlTableRow();
                    tr.ID = m_position.PositionLabel;
                    positionnumber++;
                    HtmlTableCell serialno = new HtmlTableCell();
                    serialno.InnerText = positionnumber.ToString();
                    serialno.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(serialno);
                    HtmlTableCell website = new HtmlTableCell();
                    website.InnerText = m_position.PositionWebsite;
                    website.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(website);
                    HtmlTableCell totalPLV = new HtmlTableCell();
                    totalPLV.InnerText = m_position.TotalPLV;
                    totalPLV.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(totalPLV);
                    int count = 0;
                    foreach ( var websiteposition in Positions )
                        {
                        if ( websiteposition.PositionWebsite.ToLower().Equals(position.PositionWebsite.ToLower()) )
                            count++;
                        }
                    HtmlTableCell positions = new HtmlTableCell();
                    positions.InnerText = count.ToString();
                    positions.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(positions);

                    plvposition.Rows.Add(tr);
                    }

                //taskcount.InnerText = (Identities.Count).ToString();
                countDiv.InnerText = DashBoard.Count.ToString();
                }
            }
        [System.Web.Services.WebMethod]
        public static Response SearchIdentities (IdentitiesFilterCriteria IdentitiesFilterCriteria)
            {
            Response response = AmazonDynamoDBIdentityTable.Instance.DynamoDbSearchPLVIdentities(IdentitiesFilterCriteria);
            return response;
            }
        [System.Web.Services.WebMethod]
        public static Response SearchPositions (PositionFilterCriteria PositionData)
            {
            Response response = AmazonDynamoDBPositionTable.Instance.DynamoDbSearchPositions(PositionData);
            return response;
            }

        }
    }