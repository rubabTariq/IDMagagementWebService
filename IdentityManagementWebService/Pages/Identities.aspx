<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Identities.aspx.cs" Inherits="IdentityManagementWebService.Pages.DashBoard" %>

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
                        <a href="#">
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px">
                            Task Schedule
                        </a>
                    </li>
                    <li>
                        <a id="Identities" href="Identities.aspx">
                            <img src="../Images/user.jpg" alt="User logo" style="display: inline; width: 10px">
                            Identities
                          <div id="countDiv" runat="server" style="display: inline; font-weight: bold; margin-left: 100px"></div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px">
                            Statistics
                        </a>
                    </li>
                    <li>
                        <a href="Signup.aspx">
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px">
                            Access Control
                        </a>
                    </li>
                </ul>
            </div>

            <!-- /#sidebar-wrapper -->
            <div class="graphs">
                <div class="xs">

                    <h3 style="padding-top: 2%;padding-left: 2%;">
                        <img src="../Images/user.jpg" alt="User logo" style="display: inline;">
                        Users\Identities     
                        <a style="color: cornflowerblue; display: inline; font-size: medium" href="/AddIdentity.aspx">Add Identites</a>
                    </h3>
                    <div class="col-md-8 inbox_right" style="width: 1000px; height: 600px;">
                        <div class="mailbox-content" style="height: 450px;">

                            <table id="identities" class="tableidentities" runat="server" style="border-collapse: collapse; width: auto">
                                <tbody>
                                    <tr class="tablerow">
                                        <td class="tablecol">Name</td>
                                        <td class="tablecol">Email</td>
                                        <td class="tablecol">Country of Residence</td>
                                        <td class="tablecol">Status</td>
                                        <td class="tablecol">Action</td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="copy_layout">
                    <p>Copyright © 2018 . All Rights Reserved | Design by <a href="home1.aspx" target="_blank"></a></p>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript -->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="../script/metisMenu.min.js"></script>
        <script src="../script/custom.js"></script>
        <!-- jQuery -->
        <script src="../script/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="../script/bootstrap.min.js"></script>
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
            function deleteIdentity(email) {
                var txt;
                if (confirm("Are you sure to delete this Identity " + email + " ?"))
                {
                    txt = "Yes";
                    PageMethods.deleteidentity(email, function (result) {
                        if(result==true)
                        {
                            var rownumber = document.getElementById(email).tabIndex;
                            document.getElementById("identities").deleteRow(rownumber);
                        }

                    });
                }
                else
                {
                    txt = "No";
                }
                
                
            }
        </script>

    </form>
</body>
</html>

