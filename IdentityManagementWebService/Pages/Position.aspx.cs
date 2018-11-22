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
    public partial class Position : System.Web.UI.Page
        {
  private string getPositionLabel = null;
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
            Response response = AmazonDynamoDBPositionTable.Instance.GetAllDataInDynamoDb();
            getPositionLabel = Request.QueryString["positionlabel"];
            if ( null != getPositionLabel )
                {
                foreach ( var item in response.PositionData )
                    {
                    foreach ( var identity in item.SelectedIdentities )
                        {

                        if ( identity == getPositionLabel )
                            {
                            PositionFilterCriteria taskCriteria = new PositionFilterCriteria();
                            taskCriteria.PositionLabel = item.PositionLabel;
                            response = AmazonDynamoDBPositionTable.Instance.DynamoDbSearchTasks(taskCriteria);
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
            List<PositionData> Positions = response.PositionData;
            if ( null != Positions )
                {
                int tasknumber = 0;
                foreach ( PositionData Position in Positions )
                    {
                    PositionData m_position = AmazonDynamoDBPositionTable.Instance.ConvertToTitleCase(Position);
                    var tr = new HtmlTableRow();
                    tr.ID = m_position.PositionLabel;
                    tasknumber++;
                    HtmlTableCell taskNumber = new HtmlTableCell();
                    taskNumber.InnerText = tasknumber.ToString();
                    taskNumber.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(taskNumber);
                    HtmlTableCell selectedIdentities = new HtmlTableCell();
                    selectedIdentities.InnerText = m_position.SelectedIdentities.Count.ToString();
                    selectedIdentities.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(selectedIdentities);
                    HtmlTableCell selectedtask = new HtmlTableCell();
                    selectedtask.InnerText = "";
                    selectedtask.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(selectedtask);
                    HtmlTableCell positionLabel = new HtmlTableCell();
                    positionLabel.InnerText = m_position.PositionLabel;
                    positionLabel.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(positionLabel);
                    HtmlTableCell positionWebsite = new HtmlTableCell();
                    positionWebsite.InnerText = m_position.PositionWebsite;
                    positionWebsite.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(positionWebsite);
                    HtmlTableCell startDate = new HtmlTableCell();
                    startDate.InnerText = m_position.StartDate;
                    startDate.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(startDate);
                    HtmlTableCell endDate = new HtmlTableCell();
                    endDate.InnerText = m_position.EndDate;
                    endDate.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(endDate);
                    HtmlTableCell cycle = new HtmlTableCell();
                    cycle.InnerText = "";
                    cycle.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(cycle);
                    HtmlTableCell totalDateTime = new HtmlTableCell();
                    totalDateTime.InnerText = m_position.TotalDateTime;
                    totalDateTime.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(totalDateTime);
                    HtmlTableCell status = new HtmlTableCell();
                    status.InnerText = m_position.Status;
                    status.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(status);


                    HtmlAnchor _edit = new HtmlAnchor();
                    _edit.HRef = "/Pages/TaskAndHistorySection.aspx?positionlabel=" + m_position.PositionLabel;
                    _edit.Attributes.CssStyle.Add("margin-left", "5px");
                    HtmlImage editimage = new HtmlImage();
                    editimage.Attributes.Add("src", "../Images/edit.png");
                    editimage.Attributes.CssStyle.Add("width", "20px");
                    _edit.Controls.Add(editimage);
                    _edit.Attributes.Add("id", "edit" + m_position.PositionLabel);

                    HtmlAnchor runningPosition = new HtmlAnchor();
                    runningPosition.HRef = "/Pages/TaskAndHistorySection.aspx?positionlabel=" + m_position.PositionLabel;
                    runningPosition.Attributes.CssStyle.Add("margin-left", "5px");
                    HtmlImage runningPositionimage = new HtmlImage();
                    runningPositionimage.Attributes.Add("src", "../Images/runningposition.png");
                    runningPositionimage.Attributes.CssStyle.Add("width", "25px");
                    runningPosition.Controls.Add(runningPositionimage);
                    runningPosition.Attributes.Add("id", "edit" + m_position.PositionLabel);

                    HtmlGenericControl toggleButton = new HtmlGenericControl("input");
                    toggleButton.Attributes.Add("type", "button");
                    toggleButton.Attributes.Add("class", "btn btn-click");
                    toggleButton.Attributes.Add("value", "Continue");
                    toggleButton.Attributes.CssStyle.Add("width", "auto");
                    toggleButton.Attributes.CssStyle.Add("background-color", "#61d461");
                    toggleButton.Attributes.CssStyle.Add("color", "#ffffff");
                    toggleButton.Attributes.CssStyle.Add(" margin-left", "10px");
                    toggleButton.Attributes.Add("onclick", "SetPosition('" + m_position.PositionLabel + "','')");
                    toggleButton.Attributes.Add("id", "toggle" + m_position.PositionLabel);

      


                    HtmlTableCell actioncell = new HtmlTableCell();
                    actioncell.Controls.Add(_edit);
                    //actioncell.Controls.Add(runningPosition);
                    actioncell.Controls.Add(toggleButton);
                    actioncell.Attributes.Add("class", "tablecolumn");
                    tr.Cells.Add(actioncell);

                    position.Rows.Add(tr);
                    }
                Count = Positions.Count;
                //taskcount.InnerText = (Identities.Count).ToString();
                countDiv.InnerText = DashBoard.Count.ToString();
                }
            }

        [System.Web.Services.WebMethod]
        public static Response SearchIdentities (PositionFilterCriteria PositionFilterCriteria)
            {
            Response response = AmazonDynamoDBPositionTable.Instance.DynamoDbSearchTasks(PositionFilterCriteria);
            return response;
            }

        }
    }
