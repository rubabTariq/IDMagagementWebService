<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="IdentityManagementWebService.Pages.Signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignIn</title>
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

       

            <!-- /#sidebar-wrapper -->
            <div class="graphs">
                <div class="xs">
                    <h3 style="padding-top: 2%; padding-left: 2%;">
                        <span class="glyphicon glyphicon-lock" style="display: inline;"></span>
                        Sign In   
                    </h3>

                    <table runat="server" style="background-color: white;margin-left: 10%;">
                        <tr>
                            <td>
                                <div style="width: 500px; margin-left: 100px; margin-top: 0px; padding-right: 100px; background-color: white; align-content: center; text-align: left;"
                                    id="main">
                                    &nbsp;<!-- <fieldset>
       <!-- <legend id="heading">Create A Free Account</legend>-->
                                    <label id="title_create" style="font-size: x-large; color: #1565c0; font-weight: bold; border-color: #1565c0;">Enter Account Information</label>
                                    <br />
                                    <br />
                                    <label id="email_signup" for="emailsignup" style="font-weight: bold;">Your Email Adress</label>
                                    <br />
                                    <input id="emailsignup" name="emailsignup" runat="server" type="email" style="font-weight: bold;" required="required" />
                                    <label id="Email_err" runat="server"></label>
                                    <br />
                                    <label id="name_signup" for="u_name_signup" style="font-weight: bold;">Choose a User Name</label>
                                    <br />
                                    <input id="u_name_signup" name="u_name_signup" runat="server"  maxlength="20" type="text" pattern="[A-Za-z]*" required="required" />
                                    <label id="nam_err" runat="server" style="font-weight: bold;"></label>
                                    <br />
                                    <label id="password_signup" for="u_password_signup" style="font-weight: bold;">Password</label>
                                    <br />
                                    <input id="u_password_signup" name="u_password_signup" runat="server" maxlength="20" type="password" minlength="5" required="required" />
                                    <label id="showpasswordmessage"></label>
                                    <br />                                   
                                    <br />
                                    <button id="createaccount_signup" type="submit" style="border: groove; color: white; font-weight: bold; background-color: #1565c0; border-color: #1565c0;">Sign In</button>
                                   
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
            $("#createaccount_signup").on('click', function () {
                var email = $("#emailsignup").val();
                var username = $("#u_name_signup").val();
                var password = $("#u_password_signup").val();
                if (email != '' && username != '' && password != '')
                {
                    PageMethods.SigninAccount(email,  username,  password, function (result) {
                        if (result == true) {
                          
                            window.location.href = "/Pages/Identities.aspx";
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
