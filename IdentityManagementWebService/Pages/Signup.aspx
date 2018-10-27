<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="IdentityManagementWebService.Pages.Signup" %>

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
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <!-- Custom css -->
    <link href="../css/style.css" rel='stylesheet' type='text/css' />
    <link href="../css/font-awesome.css" rel="stylesheet" />
    <!----webfonts--->
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />
    <!-- /#wrapper -->
    <!-- Nav css -->
    <link href="../css/custom.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="../css/simple-sidebar.css" type="text/css" rel="stylesheet" />
    <link href="../css/identitiesstyle.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager2"
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
                            <span class="glyphicon glyphicon-tasks" style="display:inline"></span>
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
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px"/>
                            Affiliate
                        </a>
                    </li>
                    <li>
                        <a id="accesscontrol" href="Signup.aspx" class="active">
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
                        <span class="glyphicon glyphicon-lock" style="display: inline;"></span>
                        Access Control    
                    </h3>

                    <table runat="server" style="background-color: white;margin-left: 10%;">
                        <tr>
                            <td>
                                <div style="width: 500px; margin-left: 100px; margin-top: 0px; padding-right: 100px; background-color: white; align-content: center; text-align: left;"
                                    id="main">
                                    &nbsp;<!-- <fieldset>
       <!-- <legend id="heading">Create A Free Account</legend>-->
                                    <label id="title_create" style="font-size: x-large; color: #1565c0; font-weight: bold; border-color: #1565c0;">Edit Account</label>
                                    <br />
                                    <br />
                                    <label id="email_signup" for="emailsignup" style="font-weight: bold;">Your Email Adress</label>
                                    <br />
                                    <input id="emailsignup" name="emailsignup" runat="server" type="email" style="font-weight: bold;" required="required" />
                                    <label id="Email_err" runat="server"></label>
                                    <br />
                                    <label id="newemail_signup" for="newemailsignup" style="font-weight: bold;">New Email Adress</label>
                                    <br />
                                    <input id="newemailsignup" name="newemailsignup" runat="server" type="email" style="font-weight: bold;" required="required" />
                                    <label id="newEmail_err" runat="server"></label>
                                    <br />
                                    <label id="name_signup" for="u_name_signup" style="font-weight: bold;">Choose a User Name</label>
                                    <br />
                                    <input id="u_name_signup" name="u_name_signup" runat="server"  maxlength="20" type="text" pattern="[A-Za-z]*" required="required" />
                                    <label id="nam_err" runat="server" style="font-weight: bold;"></label>
                                    <br />
                                    <label id="password_signup" for="u_password_signup" style="font-weight: bold;">Existing Password</label>
                                    <br />
                                    <input id="u_password_signup" name="u_password_signup" runat="server" maxlength="20" type="password" minlength="5" required="required" />
                                    <label id="showpasswordmessage"></label>
                                    <br />


                                    <div id="con_pasPanel_signup">
                                        <label id="Cnpassword_signup0" for="newpassword" style="font-weight: bold;">New Password"</label>
                                        <br />
                                        <input id="newpassword" name="newpassword" type="password" maxlength="20" minlength="5" required="required" />
                                        <label id="showconfirmpassword" style="color:red;font-weight:bold"></label>
                                    </div>
                                    <br />
                                    <button id="createaccount_signup" type="submit" style="border: groove; color: white; font-weight: bold; background-color: #1565c0; border-color: #1565c0;">Edit Account</button>
                                   
                                   <label id="checkAccount" style="color:red;font-weight:bold"></label>
                                     <br />
                                    <br />
                                </div>

                            </td>
                        </tr>
                    </table>
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
            $('#newpassword').on('input', function (e) {
                if ($('#newpassword').val() == $("#u_password_signup").val())
                {
                    $("#showconfirmpassword").text("Enter new Password");
      
                }
                else
                {
                    $("#showconfirmpassword").text("");
                }
                    
            });
            $("#createaccount_signup").on('click', function () {
                var email = $("#emailsignup").val();
                var newemail = $("#newemailsignup").val();
                var username = $("#u_name_signup").val();
                var password = $("#u_password_signup").val();
                var newPass= $("#newpassword").val();
                if (email != '' && username != '' && password != newPass && password != '' && newPass != '' && password.length>4 && newPass.length>4)
                {
                    PageMethods.EditAccount(email,newemail, username, newPass, password, function (result) {
                        if (result == true) {
                            alert("Account Updated Successfully");
                            $("#checkAccount").text("");
                            location.reload();
                        }
                        else {
                            $("#checkAccount").text("Incorrect Email or Password");
                            alert("Incorrect Email or Password");
                        }

                    });
                    
                }

         
            });

            $("#form1").submit(function (e) {
                e.preventDefault();
            });
        </script>

    </form>
</body>
</html>
