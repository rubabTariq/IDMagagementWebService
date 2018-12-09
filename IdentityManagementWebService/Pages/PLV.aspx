<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PLV.aspx.cs" Inherits="IdentityManagementWebService.Pages.PLV" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PLV</title>
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
            <a class="mainheading" href="#">Control Interface</a>
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
                 <li class="dropdown">
                        <a href="#" class="dropdown-toggle avatar" data-toggle="dropdown" style="color:white">
                               <span class="glyphicon glyphicon-user" style="color:white;display: inline;"></span>
                            <asp:Label Style="color:white;width: 70px" ID="username" runat="server" Text="Super Admin" /></a>
                        <ul class="dropdown-menu">
                            <li ><a href="Signin.aspx?logout=logout"><i class="fa fa-lock"></i>Logout</a></li>
                        </ul>
                    </li>
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
                        <a href="PLV.aspx">
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px" />
                            PLV
                        </a>
                    </li> 
                </ul>
            </div>

            <!-- /#sidebar-wrapper -->
            <div class="graphs">
                <div class="xs">

                    <h3 style="padding-top: 2%; padding-left: 2%;">
                        <span class="glyphicon glyphicon-user" style="display: inline;"></span>
                        PLV    
                    </h3>
                    <div class="mailbox-content" style="height: 450px; width: 1640px;">
                    <div class="col-md-6" style="width: 1000px; height: 600px;">
                            <table id="plv" class="tableidentities" runat="server" style="border-collapse: collapse;width:auto;display: inline;">

                                <tbody>
                                    <tr class="tablerow">
                                        <th class="tablecol" style="width: 1%;">Sr.no</th>
                                        <th class="tablecol" style="width: 2%;">Country</th>
                                        <th class="tablecol" style="width: 5%;">Affiliate</th>
                                        <th class="tablecol" style="width: 5%;">Identity</th>
                                        <th class="tablecol" style="width: 5%;">PLV</th>
                                    </tr>
                                    <tr class="tablerow">
                                        <th class="tablecol"></th>
                                        <th class="tablecol">
                                             <input id="searchCountry" type="search" style="width: 145px; font-size: 12px;" placeholder="Search Country" onsearch="searchIdentities()" />
                                        </th>
                                        <th class="tablecol">
                                           <input id="searchAffiliate" type="search" style="width: 145px; font-size: 12px;" placeholder="Search Affiliate" onsearch="searchIdentities()" />
                                        </th>
                                        <th class="tablecol">
                                          <input id="searchIdentity" type="search" style="width: 145px; font-size: 12px;" placeholder="Search Identity" onsearch="searchIdentities()" />
                                        </th>
                                        <th class="tablecol"></th>  
                                    </tr>
                                </tbody>

                            </table>
                            </div>
                          <div class="col-md-6 WebsiteList">
                              <table id="plvposition" class="tableidentities" runat="server" style="border-collapse: collapse;width:auto; float:right;display: inline;">
                                <tbody>
                                    <tr class="tablerow">
                                        <th class="tablecol" style="width: 1%;">Sr.no</th>
                                        <th class="tablecol" style="width: 5%;">Website</th>
                                        <th class="tablecol" style="width: 5%;">Total PLV</th>
                                        <th class="tablecol" style="width: 5%;">Positions</th>
                                    </tr>
                                    <tr class="tablerow">
                                        <th class="tablecol"></th>
                                        <th class="tablecol">
                                          <input id="searchWebsite" type="search" style="width: 145px; font-size: 12px;" placeholder="Search Website" onsearch="searchPositions()" />
                                        </th>
                                        <th class="tablecol"></th>
                                        <th class="tablecol"></th>   
                                    </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>
                    <div class="clearfix"></div>
              


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
            var Country = $("#searchCountry").val();
            var Affiliate = $("#searchAffiliate").val();
            var Email = $("#searchIdentity").val();
         //   var Website = $("#searchWebsite").val();
            
            var IdentitiesFilterCriteria = {
                
                CountryofResidence: Country,
                Affiliate: Affiliate,
                Email: Email,
            };
            if ("" == IdentitiesFilterCriteria.CountryofResidence && "" == IdentitiesFilterCriteria.Affiliate && "" == IdentitiesFilterCriteria.Email) {
                window.location.reload();
                return false;
            }
            PageMethods.SearchIdentities(IdentitiesFilterCriteria, function (result) {
                if (result.Statusvalue == true) {
                    var countofRows = $("#plv")[0].rows.length;
                    for (var i = countofRows - 1; i != 1; i--) {
                        document.getElementById("plv").deleteRow(i);
                    }

                    var table = document.getElementById("plv");
                    var rowcount = 2;
                    var srnumber = 1;
                    for (var j = 0; j < result.IdentityDataModel.length; j++) {

                        if (null != result.IdentityDataModel[j]) {
                            var row = table.insertRow(rowcount);
                            row.id = result.IdentityDataModel[j].PositionLabel;
                            var value = result.IdentityDataModel[j].PositionLabel;
                            var cell1 = row.insertCell(0);
                            cell1.innerHTML = srnumber;
                            cell1.className = "tablecolumn";
                            var cell2 = row.insertCell(1);
                            cell2.innerHTML = result.IdentityDataModel[j].CountryOfResidence;
                            cell2.className = "tablecolumn";
                            var cell4 = row.insertCell(2);
                            cell4.innerHTML = result.IdentityDataModel[j].Affiliate;
                            cell4.className = "tablecolumn";
                            var cell5 = row.insertCell(3);
                            cell5.innerHTML = result.IdentityDataModel[j].Email;
                            cell5.className = "tablecolumn";
                            var cell6 = row.insertCell(4);
                            cell6.innerHTML = result.IdentityDataModel[j].PLV;
                            cell6.className = "tablecolumn";  
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
        function searchPositions() {
            
            var Website = $("#searchWebsite").val();

            var PositionFilterCriteria = {

                Website: Website,
            };
            if ("" == PositionFilterCriteria.Website) {
                window.location.reload();
                return false;
            }
            PageMethods.SearchPositions(PositionFilterCriteria, function (result) {
                if (result.Statusvalue == true) {
                    var countofRows = $("#plvposition")[0].rows.length;
                    for (var i = countofRows - 1; i != 1; i--) {
                        document.getElementById("plvposition").deleteRow(i);
                    }

                    var table = document.getElementById("plvposition");
                    var rowcount = 2;
                    var srnumber = 1;
                    for (var j = 0; j < result.PositionData.length; j++) {

                        if (null != result.PositionData[j]) {
                            var row = table.insertRow(rowcount);
                            row.id = result.PositionData[j].PositionLabel;
                            var cell1 = row.insertCell(0);
                            cell1.innerHTML = srnumber;
                            cell1.className = "tablecolumn";
                            var cell2 = row.insertCell(1);
                            cell2.innerHTML = result.PositionData[j].PositionWebsite;
                            cell2.className = "tablecolumn";
                            var cell3 = row.insertCell(2);
                            cell3.innerHTML = result.PositionData[j].TotalPLV;
                            cell3.className = "tablecolumn";
                            var count = 0;
                            for ( var k=0; k< result.PositionData.length; k++ )
                            {
                                if (result.PositionData[j].PositionWebsite === result.PositionData[k].PositionWebsite)
                                    count++;
                            }
                            var cell4 = row.insertCell(3);
                            cell4.innerHTML = count;
                            cell4.className = "tablecolumn";
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
        function SetPosition(positionName, email) {
            if ($("#toggle" + positionName).val() == "Continue") {
                $("#toggle" + positionName).val("Pause");
            }
            else {
                $("#toggle" + positionName).val("Continue");
            }

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


