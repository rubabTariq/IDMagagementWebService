<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Position.aspx.cs" Inherits="IdentityManagementWebService.Pages.Position" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Bootstrap Core css -->
    <link href="../css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <!-- Custom css -->
    <link href="../css/style.css" rel='stylesheet' type='text/css' />
    <link href="../css/font-awesome.css" rel="stylesheet">
    <!----webfonts--->
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <!-- /#wrapper -->
    <!-- Nav css -->
    <link href="../css/custom.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/simple-sidebar.css" type="text/css" rel="stylesheet">
    <link href="../css/identitiesstyle.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="UsersIdentities" runat="server">
        <asp:ScriptManager ID="ScriptManager1"
            EnablePageMethods="true"
            EnablePartialRendering="true" runat="server" />
        <div class="navbar-header" style="margin-right: auto">
            <a class="mainheading" href="index.html">Control Interface</a>
        </div>
        <div id="wrapper" class="toggled">
            <!-- Navigation -->
            <nav class="nav top1 navbar navbar-default navbar-static-top" role="navigation" style="background-color: #1565c0; border-color: #1565c0;">

                <div class="navbar-header" style="margin-right: auto">
                    <a href="#menu-toggle" id="menu-toggle" class="navbar-brand" style="margin-left: auto">
                        <div class="togglemenu"></div>
                        <div class="togglemenu"></div>
                        <div class="togglemenu"></div>
                    </a>
                </div>
                <!-- /.navbar-header -->
                <%--<ul class="nav navbar-nav navbar-right">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle avatar" data-toggle="dropdown">
                            <asp:Label Style="width: 70px" ID="username" runat="server" Text="Menu" /></a>
                        <ul class="dropdown-menu">
                            <li class="m_2">
                                <strong>Account</strong>
                            </li>

                            <li class="m_2"><a href="home1.aspx"><i class="fa fa-lock"></i>Logout</a></li>
                        </ul>
                    </li>
                </ul>--%>
            </nav>
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li>
                        <a id="TaskSchedule" href="TaskSchedule.aspx">
                            <span class="glyphicon glyphicon-tasks" style="display: inline"></span>
                            Task Schedule
                        </a>
                    </li>
                    <li>
                        <a id="Identities" href="Identities.aspx">
                            <span class="glyphicon glyphicon-user" style="display: inline;"></span>
                            Identities
                          <div id="countDiv" runat="server" style="display: inline; font-weight: bold; margin-left: 100px"></div>
                        </a>
                    </li>
                    <li>
                        <a href="Affiliate.aspx">
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px" />
                            Affiliate
                        </a>
                    </li>
                    <li>
                        <a href="Position.aspx">
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px" />
                            Position
                        </a>
                    </li>
                    <li>
                        <a href="Signup.aspx">
                            <span class="glyphicon glyphicon-lock" style="display: inline;"></span>
                            Access Control
                        </a>
                    </li>
                </ul>
            </div>

            <!-- /#sidebar-wrapper -->
            <div class="graphs">
                <div class="xs">

                    <h3 style="padding-top: 2%; padding-left: 2%;">
                        <span class="glyphicon glyphicon-user" style="display: inline;"></span>
                        Position     
                      <a style="color: cornflowerblue; display: inline; font-size: large; background-color: #1565c0; color: white;" href="/AddPosition.aspx">Add Position</a>
                    </h3>
                    <div class="col-md-8 inbox_right" style="width: 1000px; height: 600px;">
                        <div class="mailbox-content" style="height: 450px; width: 1640px;">

                            <table id="position" class="tableidentities" runat="server" style="border-collapse: collapse; width: auto">
                                <tbody>
                                    <tr class="tablerow">
                                        <th class="tablecol">Sr.no</th>
                                        <th class="tablecol">Identities</th>
                                        <th class="tablecol" style="width: 10%;">PLV</th>
                                        <th class="tablecol" style="width: 15%;">Position</th>
                                        <th class="tablecol" style="width: 15%;">Website</th>
                                        <th class="tablecol" style="width: 15%;">Starting</th>
                                        <th class="tablecol" style="width: 15%;">Ending</th>
                                        <th class="tablecol" style="width: 15%;">Cycles</th>
                                        <th class="tablecol" style="width: 15%;">Time</th>
                                        <th class="tablecol" style="width: 15%;">Status</th>
                                        <th class="tablecol" style="width: 100%;">Action</th>
                                    </tr>
                                    <tr class="tablerow">
                                        <th class="tablecol"></th>
                                        <th class="tablecol"></th>
                                        <th class="tablecol"></th>
                                        <th class="tablecol">
                                            <input id="searchposition" type="text" style="width: 145px; font-size: 12px;" placeholder="Search Position" onsearch="searchIdentities()" />
                                        </th>
                                        <th class="tablecol">
                                            <input id="searchwebsite" type="search" placeholder="Search Website" style="width: 145px; font-size: 12px;" onsearch="searchIdentities()" />
                                        </th>
                                        <th class="tablecol"></th>
                                        <th class="tablecol"></th>
                                        <th class="tablecol"></th>
                                        <th class="tablecol"></th>
                                        <th class="tablecol">
                                            <input id="searchstatus" type="search" placeholder="Search Status" style="width: 145px; font-size: 12px;" onsearch="searchIdentities()" />
                                        </th>
                                        <th class="tablecol"></th>
                                    </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>


            </div>
        </div>
    </form>
    <div class="copy_layout">
        <p>Copyright © 2018 . All Rights Reserved | Design by <a href="home1.aspx" target="_blank"></a></p>
    </div>
    <textarea id="dummy" style="display: none"></textarea>
    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="../script/metisMenu.min.js"></script>
    <script src="../script/custom.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../script/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script>
        window.onload = function () {
            navHighlight();
        };
        function navHighlight() {
            var url = location.href.split('/');
            loc = url[url.length - 1];
            elementid = loc.substring(loc, loc.indexOf('.'));
            document.getElementById(elementid).className = "active";
        }

        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
        function searchIdentities() {
            var position = $("#searchposition").val();
            var website = $("#searchwebsite").val();
            var status = $("#searchstatus").val();
            var FilterCriteria = {
                
                Position: position,
                Website: website,
                Status:status,
            };
            if ("" == FilterCriteria.Position && "" == FilterCriteria.Website && "" == FilterCriteria.Status) {
                window.location.reload();
                return false;
            }
            PageMethods.SearchIdentities(FilterCriteria, function (result) {
                if (result.Statusvalue == true) {
                    var countofRows = $("#position")[0].rows.length;
                    for (var i = countofRows - 1; i != 1; i--) {
                        document.getElementById("position").deleteRow(i);
                    }

                    var table = document.getElementById("position");
                    var rowcount = 2;
                    var srnumber = 1;
                    for (var j = 0; j < result.AffiliateDataModel.length; j++) {

                        if (null != result.AffiliateDataModel[j]) {
                            var row = table.insertRow(rowcount);
                            row.id = result.AffiliateDataModel[j].Name;
                            var value = result.AffiliateDataModel[j].Name;
                            var cell1 = row.insertCell(0);
                            cell1.innerHTML = srnumber;
                            cell1.className = "tablecolumn";
                            var cell2 = row.insertCell(1);
                            cell2.innerHTML = result.AffiliateDataModel[j].CurrentDate;
                            cell2.className = "tablecolumn";
                            var cell3 = row.insertCell(2);
                            cell3.innerHTML = result.AffiliateDataModel[j].Name;
                            cell3.className = "tablecolumn";
                            var cell6 = row.insertCell(3);
                            cell6.innerHTML = result.AffiliateDataModel[j].Identities.length;
                            cell6.className = "tablecolumn";

                            //Edit link
                            var btneditimg = document.createElement('img');
                            btneditimg.src = "../Images/edit.png";
                            btneditimg.style.width = "15px";
                            var btneditlink = document.createElement('a');
                            btneditlink.href = "/AddIdentity.aspx?email=" + result.AffiliateDataModel[j].Email;
                            btneditlink.style.marginLeft = "0px";
                            btneditlink.appendChild(btneditimg);
                            btneditlink.id = "edit" + result.AffiliateDataModel[j].FirstName;
                            //Delete Link
                            var btndeleteimg = document.createElement('img');
                            btndeleteimg.src = "../Images/delete.png";
                            btndeleteimg.style.width = "30px";
                            var btndeletelink = document.createElement('a');
                            btndeletelink.style.marginLeft = "22px";
                            btndeletelink.appendChild(btndeleteimg);
                            btndeletelink.id = "delete" + result.AffiliateDataModel[j].FirstName;

                            btndeletelink.onclick = function () { deleteIdentity(value); };

                            var copyBasicData = document.createElement('input');
                            copyBasicData.type = "button";
                            copyBasicData.className = "btn btn-click";
                            copyBasicData.value = "Copy Data";
                            copyBasicData.style.width = "auto";
                            copyBasicData.style.backgroundColor = "#06d995";
                            copyBasicData.style.color = "#ffffff";
                            copyBasicData.style.marginLeft = "10px";
                            copyBasicData.onclick = function () { copyPersonalData(value) };
                            copyBasicData.id = "taskSchedule" + result.AffiliateDataModel[j].FirstName;

                            var cell7 = row.insertCell(4);
                            cell7.className = "tablecolumn";
                            cell7.appendChild(btneditlink);
                            cell7.appendChild(btndeletelink);
                            cell7.appendChild(copyBasicData);
                            srnumber++;
                        }
                    }
                }
                else {
                    window.location.reload();
                    return false;
                }

            });
        }
        function GetCurrentDate() {
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!
            var yyyy = today.getFullYear();

            if (dd < 10) {
                dd = '0' + dd
            }

            if (mm < 10) {
                mm = '0' + mm
            }

            today = mm + '/' + dd + '/' + yyyy;
            return today;
        }

    </script>
</body>
</html>

