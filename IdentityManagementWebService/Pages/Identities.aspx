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
    <style type="text/css">
        .Background {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .lbl {
            font-size: 16px;
            font-style: italic;
            font-weight: bold;
        }

        .Popup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 500px;
            height: 350px;
        }
    </style>
    <style>
        .togglemenu {
            width: 30px;
            height: 4px;
            background-color: white;
            margin-top: 5px;
        }

        .mainheading {
            color: white;
            float: left;
            height: 50px;
            padding: 15px 15px;
            font-size: 30px;
            line-height: 50px;
        }

        .tablecolumn {
            width: 250px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .tablerow {
            border: 1px solid #ddd;
        }

        .tablecol {
            font-weight: Bold;
            width: 23%;
            border: 1px solid #ddd;
            text-align: left;
        }

        .active {
            background-color: lightgray;
        }
    </style>
</head>
<body>
    <form id="UsersIdentities" runat="server">
        <asp:ScriptManager ID="ScriptManager1"
            EnablePageMethods="true"
            EnablePartialRendering="true" runat="server" />
        <div class="navbar-header" style="margin-right: auto">
            <a class="mainheading" href="index.html">Control Interface</a>
        </div>
        <div id="wrapper">
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
                <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle avatar" data-toggle="dropdown">
                            <asp:Label Style="width: 70px" ID="username" runat="server" Text="Menu" /></a>
                        <ul class="dropdown-menu">
                            <li class="m_2" <%--class="dropdown-menu-header text-center"--%>>
                                <strong>Account</strong>
                            </li>

                            <li class="m_2"><a href="home1.aspx"><i class="fa fa-lock"></i>Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <%-- <li class="sidebar-brand">
                    <a href="#">
                        Start Bootstrap
                    </a>
                </li>--%>
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
                        <a href="#">
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px">
                            Task Archives
                        </a>
                    </li>
                </ul>
            </div>

            <!-- /#sidebar-wrapper -->
            <div class="graphs">
                <div class="xs">

                    <h3>
                        <img src="../Images/user.jpg" alt="User logo" style="display: inline;">
                        Users\Identities     
                        <a style="color: cornflowerblue; display: inline; font-size: medium" href="/AddIdentity.aspx">Add Identites</a>
                    </h3>
                    <div class="col-md-8 inbox_right" style="width: 1000px; height: 600px;">
                        <div class="mailbox-content" style="height: 450px;">

                            <table id="identities" class="tableidentities" runat="server" style="border-collapse: collapse; width: auto">
                                <tbody>
                                    <tr class="tablerow">
                                        <td class="tablecol">Name (first and last name)</td>
                                        <td class="tablecol">Email</td>
                                        <td class="tablecol">Country of Residence</td>
                                        <td class="tablecol">Status</td>
                                        <td class="tablecol">Action</td>
                                    </tr>
                                    <tr>
                                        <td id="name" class="tablecolumn">Rubab</td>
                                        <td id="email" class="tablecolumn">rubab@gmail.com</td>
                                        <td id="country" class="tablecolumn">Pakistan</td>
                                        <td id="status" class="tablecolumn">Active</td>
                                        <td id="action" class="tablecolumn" runat="server">
                                            <a id="edit" runat="server" onclick="editIdentity()" href="/AddIdentity.aspx" style="margin-left: 0px;">
                                                <img src="../Images/edit.png" style="width: 15px" /></a>
                                            <a id="delete" runat="server" onclick="deleteIdentity()" href="/AddIdentity.aspx" style="margin-left: 22px;">
                                                <img src="../Images/delete.png" style="width: 30px" />
                                            </a>

                                        </td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="copy_layout">
                    <p>Copyright © 2016 . All Rights Reserved | Design by <a href="home1.aspx" target="_blank"></a></p>
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

            function editIdentity() {

                PageMethods.editidentity(document.getElementById('email').innerHTML);
            }
            function deleteIdentity() {

                PageMethods.deleteidentity(document.getElementById('email').innerHTML);
            }
        </script>

    </form>
</body>
</html>

