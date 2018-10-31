<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAffiliate.aspx.cs" Inherits="IdentityManagementWebService.AddAffiliate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Affiliate</title>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Bootstrap Core css -->
    <link href="../css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom css -->
    <link href="../css/style.css" rel='stylesheet' type='text/css' />
    <!----webfonts--->
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />
    <!-- Template for Navigation css -->
    <link href="../css/custom.css" rel="stylesheet" />
    <!-- Custom styles for sidebar template -->
    <link href="../css/simple-sidebar.css" type="text/css" rel="stylesheet" />
    <!-- Styles for glyphicon -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <!-- Custom css for AddIdentity form -->
    <link href="../css/addidentitystyle.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form  id="contact_form" runat="server">
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
            </nav>
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <%-- <li class="sidebar-brand">
                    <a href="#">
                        Start Bootstrap
                    </a>
                </li>--%>
                    <li>
                        <a href="/Pages/TaskSchedule.aspx">
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px" />
                            Task Schedule
                        </a>
                    </li>
                    <li>
                        <a id="Identities" href="/Pages/Identities.aspx">
                            <img src="../Images/user.jpg" alt="User logo" style="display: inline; width: 10px" />
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
                        <a href="Position.aspx">
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px"/>
                            Position
                        </a>
                    </li>
                    <li>
                        <a href="/Pages/Signup.aspx">
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px" />
                            Access Control
                        </a>
                    </li>
                </ul>
            </div>

            <!-- /#sidebar-wrapper -->
            <div class="graphs">
                <div class="xs">
                    <div class="mailbox-content" style="background-color: #e5ebee">
                        <div class="row">
                            <!-- Form Name -->
                            <div class="col-md-6">
		  			<div class="box box-default "> 
						<div class="box-header with-border">
						    <i class="fa fa-cube"></i>
						    <h3 class="box-title">Add Affiliate</h3>
						</div>
						<div class="boxbody">
							<div class="row">
		              			<div class="col-md-6">
									<div class="form-group has-feedback">
							            <label class="mandatory" for="fname">Name</label>   
							  <input id="name" runat="server" name="fname" placeholder="Affiliate Name" class="form-control" type="text"
                                   required="required" maxlength="20" minlength="3" title="only alphabets allowed" pattern="[A-Za-z0-9]*" />
							        </div>
		              			</div>
		              		</div>
						</div>
						<div class="box-footer">
			                <div class="pull-right">
			                		<div class="pull-right">
			                    	<button type="button" id="website_save_btn" name="Submit" onclick="Send()" class="btn btn-primary submit_button pull-right">Save</button>
			                  	</div>
			                  				                  	<div class="col-md-1 pull-right">
			                    	<a href="/Pages/Affiliate.aspx" class="btn btn-default pull-right">Cancel</a>
			                  	</div>
			                </div>
			            </div>
			            </div>
					</div>
                  </div>
                            </div>
                           
                        </div>
                        <%--  Dialog for adding website --%>


                        <!-- Success message -->
                        <div class="alert alert-success" role="alert" id="success_message" style="visibility: hidden; display: inline; margin-top: 0px; margin-right: 1000px; padding: 5px;">Success &nbsp<i class="glyphicon glyphicon-thumbs-up"></i>&nbsp Information is added successfully</div>
                        <div class="alert alert-danger" role="alert" id="error_message" style="visibility: hidden; margin-top: 0px; margin-right: 1000px; padding: 5px;">Error &nbsp<i class="glyphicon glyphicon-warning-sign"></i>&nbsp Fill all mandatory(*) fields in correct format</div>
                    </div>
                </div> 
             <div class="copy_layout">
                    <p>Copyright © 2018 . All Rights Reserved | Design by <a href="home1.aspx" target="_blank"></a></p>
             </div>
     </form>

    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="../script/metisMenu.min.js"></script>
    <script src="../script/custom.js"></script>
    <!-- jQuery -->
    <script src="../script/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../script/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


    <script type="text/javascript">

        function Send() {
            Save();
        }
        function Save() {
            var fname = $("#name")[0].value;
            if (fname == null || fname == '' || fname == undefined )//_webname == null || _webname == '' || _webname == undefined|| !websiteName.match(re))
            {
                $("#error_message")[0].style.visibility = 'visible';
                $("#success_message")[0].style.visibility = 'hidden';
                $("#error_message").text("Error: Fill all mandatory(*) fields in correct format");
            }
            else {
                var IdentityData = {
                    Name: $("#name").val(),
                };
                    updateIdentity(IdentityData);
            }
        }
        function updateIdentity(IdentityData) {
            $.ajax({
                type: "POST",
                url: "AddAffiliate.aspx/Send",
                data: JSON.stringify({ IdentityData: IdentityData }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    if (result.d.Statusvalue == false) {
                        $("#error_message").text("Error: " + result.d.ResponseMessage);
                        $("#error_message")[0].style.visibility = 'visible';
                        $("#success_message")[0].style.visibility = 'hidden';

                    }
                    else if (result.d.Statusvalue == true)
                        window.location.href = "/Pages/Affiliate.aspx";
                },
                error: function (result) {
                    $("#error_message").text('Server error occured due to unknown cause, please try again');
                    $("#error_message")[0].style.visibility = 'visible';
                    $("#success_message")[0].style.visibility = 'hidden';

                }
            });
        }


    </script>
</body>
</html>


