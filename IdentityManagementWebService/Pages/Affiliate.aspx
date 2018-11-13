<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Affiliate.aspx.cs" Inherits="IdentityManagementWebService.Pages.Affiliate" %>

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
                 <div class="navbar-header" style="margin-left: auto">
                  <a  href="#" style="color:white">Super Admin</a>
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
                            <span class="glyphicon glyphicon-tasks" style="display: inline"></span>
                            Affiliate
                        </a>
                    </li>
                     <li>
                        <a href="Position.aspx">
                            <span class="glyphicon glyphicon-tasks" style="display: inline"></span>
                            Position
                        </a>
                    </li>
                </ul>
            </div>

            <!-- /#sidebar-wrapper -->
            <div class="graphs">
                <div class="xs">

                    <h3 style="padding-top: 2%; padding-left: 2%;">
                        <span class="glyphicon glyphicon-user" style="display: inline;"></span>
                        Affiliates     
                      <a style="color: cornflowerblue; display: inline; font-size: large; background-color: #1565c0; color: white;" href="/AddAffiliate.aspx">Add Affiliate</a>
                    </h3>
                    <div class="col-md-8 inbox_right" style="width: 1000px; height: 600px;">
                        <div class="mailbox-content" style="height: 450px; width: 1640px;">

                            <table id="affiliates" class="tableidentities" runat="server" style="border-collapse: collapse; width: auto">
                                <tbody>
                                    <tr class="tablerow">
                                        <th class="tablecol">Sr.no</th>
                                        <th class="tablecol">Date</th>
                                        <th class="tablecol" style="width: 10%;">Name</th>
                                        <th class="tablecol" style="width: 15%;">Identities</th>
                                        <th class="tablecol" style="width: 100%;">Action</th>
                                    </tr>
                                    <tr class="tablerow">
                                        <th class="tablecol"></th>
                                        <th class="tablecol">
                                            <div id="date" name="pickdate" style="width: 145px; font-size: 12px;">
                                                <input id="searchdate" type="text" placeholder="Search Date" onchange="searchIdentities()" />
                                            </div>
                                        </th>
                                        <th class="tablecol">
                                            <input id="searchname" type="search" placeholder="Search Name" style="width: 145px; font-size: 12px;" onsearch="searchIdentities()" />
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
            $("#date").daterangepicker({
                locale: {
                    format: 'DD.MM.YYYY'
                },
                "singleDatePicker": true,
                "showDropdowns": true,
                autoUpdateInput: false,
                locale: {
                    cancelLabel: 'Clear'
                },
            });
            $("#date").on('apply.daterangepicker', function (ev, picker) {
                $("#searchdate").val(picker.startDate.format('DD.MM.YYYY'));
                $("#searchdate").trigger('change');
            });
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
            function deleteIdentity(email) {
                var txt;
                if (confirm("Are you sure to delete this Identity " + email + " ?")) {
                    txt = "Yes";
                    PageMethods.deleteidentity(email, function (result) {
                        if (result == true) {
                            //var rownumber = document.getElementById(email).getElementsByTagName("tr")[0].rowIndex;
                            //document.getElementById("identities").deleteRow(rownumber);
                            window.location.reload();
                        }

                    });
                }
                else {
                    txt = "No";
                }


            }
            function copyPersonalData(name) {
                // Create a dummy input to copy the string array inside it

                var identiyPersonalData,fname, identities, date;
                var check = false;
                $.ajax({
                    type: "POST",
                    url: "Affiliate.aspx/CopyIdentityContent",
                    data: '{"name":"' + name + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (result) {
                        if (result.d.Statusvalue == true) {
                            check = true;
                            fname = result.d.AffiliateDataModel[0].Name;
                            identities = result.d.AffiliateDataModel[0].Identities;
                            date = result.d.AffiliateDataModel[0].CurrentDate;
                            identiyPersonalData = JSON.stringify(result.d.AffiliateDataModel);
                        }
                    },
                    error: function (result) {
                        $("#error_message").text('Server error occured due to unknown cause, please try again');
                        $("#error_message")[0].style.visibility = 'visible';
                        $("#success_message")[0].style.visibility = 'hidden';
                        check = false;
                    }
                });
                if (check == true) {
                    var dummy = document.getElementById("dummy");
                    document.getElementById("dummy").style.display = "block";
                    // Output the array into it
                    dummy.innerHTML = fname + "\n" + identities + "\n" + date;
                    // Select it
                    dummy.select();

                    // Copy its contents
                    document.execCommand("copy");
                    document.getElementById("dummy").style.display = "none";
                }
            }
            function searchIdentities() {
                var date = $("#searchdate").val();
                var name = $("#searchname").val();
                var FilterCriteria = {
                    Date: date,
                    FirstName: name,
                };
                if ("" == FilterCriteria.FirstName && "" == FilterCriteria.Date) {
                    window.location.reload();
                    return false;
                }
                PageMethods.SearchIdentities(FilterCriteria, function (result) {
                    if (result.Statusvalue == true) {
                        var countofRows = $("#affiliates")[0].rows.length;
                        for (var i = countofRows - 1; i != 1; i--) {
                            document.getElementById("affiliates").deleteRow(i);
                        }

                        var table = document.getElementById("affiliates");
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

