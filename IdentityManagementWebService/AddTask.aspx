<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTask.aspx.cs" Inherits="IdentityManagementWebService.AddTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Task</title>
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
    <!-- Custom css for AddIdentity form -->
    <link href="../css/addidentitystyle.css" type="text/css" rel="stylesheet" />
    <link href="../css/identitiesstyle.css" type="text/css" rel="stylesheet">
</head>
<body style="overflow: hidden;">
    <form id="contact_form" runat="server" method="post">
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
                <%-- <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle avatar" data-toggle="dropdown">
                            <asp:Label Style="width: 70px" ID="_username" runat="server" Text="Menu" /></a>
                        <ul class="dropdown-menu">
                            <li class="m_2" <%--class="dropdown-menu-header text-center"-->
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
                        <a id="TaskSchedule" href="/Pages/TaskSchedule.aspx" class="active">
                            <span class="glyphicon glyphicon-tasks" style="display: inline"></span>
                            Task Schedule
                            <div id="taskcount" runat="server" style="display: inline; font-weight: bold; margin-left: 50px"></div>
                        </a>
                    </li>
                    <li>
                        <a id="Identities" href="/Pages/Identities.aspx">
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
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px"/>
                            Position
                        </a>
                    </li>
                    <li>
                        <a id="accesscontrol" href="/Pages/Signup.aspx">
                            <span class="glyphicon glyphicon-lock" style="display: inline;"></span>
                            Access Control
                        </a>
                    </li>
                </ul>
            </div>
            <!-- /#sidebar-wrapper -->
            <div class="graphs">
                <div class="xs">
                    <div class="mailbox-content" style="background-color: #e5ebee;">


                        <fieldset>
                            <div class="col-md-6">
                                <%--  Add line --%>
                                <div style="border-right: 1px solid lightgray; display: inline;"></div>
                                <%--  Dialog for adding website --%>
                                <%--<div id="options" style="float: right; background-color: white; padding-top: 10px; margin-right: auto; width: 250px; display: inline; visibility: visible; margin-left: 50px;">
                                <div class="input-group">
                                    <label class="labelText" for="nextsesion">
                                        Take Next Session
                                        :</label>
                                    <select id="nextsesion" runat="server" name="nextsesion" class="form-control" style="border: 1px solid black;">
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select>
                                </div>
                            </div>--%>
                                <!-- Form Name -->
                                <table style="background: none; background-color: white;">
                                    <legend>ADD TASK
                                    </legend>
                                    <!-- Text input-->
                                    <tr>
                                        <!-- Text input-->
                                        <td>
                                            <div class="form-group">
                                                <label class="labelText" for="task_name">
                                                    Task Name
                                                <p style="display: inline; color: red">*</p>
                                                </label>
                                                <div>
                                                    <div class="input-group">
                                                        <input id="task_name" runat="server" name="task_name" placeholder="Task Label" class="form-control" type="text"
                                                            required="required" maxlength="20" minlength="3" title="only alphabets allowed" pattern="[A-Za-z0-9]*" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="labelText" for="selectwebsite">Select Website</label>
                                                <div>
                                                    <div class="input-group">
                                                        <select id="selectwebsite" runat="server" name="selectwebsite" class="form-control" style="border: 1px solid black;">
                                                            <option disabled="disabled">Select a website</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <!-- Text input-->
                                        <td>
                                            <div class="form-group">
                                                <label class="labelText" for="selecttask">Select Task</label>
                                                <div>
                                                    <div class="input-group">
                                                        <select id="selecttask" runat="server" name="selecttask" class="form-control" style="border: 1px solid black;" onchange="EnableFields()">
                                                            <option disabled="disabled">Choose task type</option>
                                                            <option value="Playing game(s)">Playing Game(S)</option>
                                                            <%-- <option value="Uploading file(s)">Uploading File(S)</option>
                                                        <option value="Registering account(s)">Registering Account(S)</option>--%>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="labelText" for="section">
                                                    Section
                                                </label>
                                                <div>
                                                    <div class="input-group">
                                                        <input id="section" runat="server" name="section" placeholder="Task Label" class="form-control" type="text"
                                                            maxlength="20" minlength="3" title="only alphabets allowed" pattern="[A-Za-z]*" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label class="labelText" for="selectbrowser">Browser</label>
                                                <div>
                                                    <div class="input-group">
                                                        <select id="selectbrowser" runat="server" name="selectbrowser" class="form-control" style="border: 1px solid black;">
                                                            <option disabled="disabled">Choose browser</option>
                                                            <option value="Chrome">Chrome</option>
                                                            <option value="Firefox">Firefox</option>
                                                            <option value="Random">Random</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="labelText" for="selectmode">Starting Mode</label>
                                                <div>
                                                    <div class="input-group">
                                                        <select id="selectmode" runat="server" name="selectmode" class="form-control" style="border: 1px solid black;">
                                                            <option disabled="disabled">Choose mode</option>
                                                            <option value="Simultaneous start">Simultaneous start</option>
                                                            <option value="Scheduled simultaneous start">Scheduled simultaneous start</option>
                                                            <option value="Random times">Random times</option>
                                                            <option value="Intervals">Intervals</option>
                                                            <option value="Intervals with random times">Intervals with random times</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <table name="WAGERING" style="background: none; background-color: white;">
                                    <legend style="padding-top: 10px;">WAGERING
                                    </legend>
                                    <!-- Text input-->
                                    <tr>
                                        <!-- Text input-->
                                        <td>
                                            <div class="form-group">
                                                <label class="labelText" for="wageramount">
                                                    Wager Amount
                                                <p style="display: inline; color: red">*</p>
                                                </label>
                                                <div class="input-group">
                                                    <input id="wageramount" runat="server" name="wageramount" placeholder="Task Label" class="form-control" type="text"
                                                        value="4000" required="required" maxlength="50" minlength="1" title="only alphabets allowed" pattern="[0-9]*" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="labelText" for="balancetarget">Balance Target</label>
                                                <div class="input-group">
                                                    <input id="balancetarget" runat="server" name="balancetarget" class="form-control" type="text" value=""
                                                        required="required" maxlength="50" minlength="1" title="only alphabets allowed" pattern="[0-9]*" />
                                                </div>
                                            </div>
                                        </td>
                                        <!-- Text input-->
                                        <td>
                                            <div class="form-group">
                                                <label class="labelText" for="balancelimit">Balance Limit</label>
                                                <div class="input-group">
                                                    <input id="balancelimit" runat="server" name="balancelimit" class="form-control" type="text"
                                                        maxlength="50" minlength="1" title="only alphabets allowed" pattern="[0-9]*" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="labelText" for="stoploss">
                                                    Stop/Loss
                                                </label>
                                                <div>
                                                    <div class="input-group">
                                                        <input id="stoploss" runat="server" name="stoploss" class="form-control" type="text"
                                                            maxlength="50" minlength="1" title="only alphabets allowed" pattern="[0-9]*" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label class="labelText" for="betsizeoption">Select Bet Size</label>
                                                <div>
                                                    <div class="input-group">
                                                        <div>
                                                            <select id="betsizeoption" runat="server" name="betsizeoption" class="form-control" placeholder="Bet Size" style="border: 1px solid black;" onchange="DisableTextField()">
                                                                <option value="" disabled="disabled">Select Bet Size</option>
                                                                <option value="Fixed">Fixed</option>
                                                                <option value="Random">Random</option>
                                                            </select>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div>
                                                    <div class="input-group">
                                                        <div>
                                                            <input id="betsize" runat="server" name="betsize" class="form-control" type="text" value="" placeholder="min"
                                                                required="required" maxlength="50" minlength="1" title="only alphabets allowed" pattern="[0-9]*" style="width: 120px" />
                                                            <br />
                                                            <br />
                                                            <input id="maxbetsize" runat="server" name="maxbetsize" class="form-control" type="text" value="" style="width: 120px; visibility: hidden"
                                                                placeholder="max" required="required" maxlength="50" minlength="1" title="only alphabets allowed" pattern="[0-9]*" />

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <legend style="padding-top: 10px;">IDENTITIES SELECTION
                                         <p style="display: inline; color: red">*</p>
                                </legend>
                                <table id="taskIdentities" runat="server" name="taskIdentities" style="border-collapse: collapse; background: none; background-color: white;">
                                    <tbody>
                                        <tr class="tablerow">
                                            <th class="tablecolu">
                                                <input type="checkbox" onchange="checkAll(this,'selectall')" name="chk[]" />
                                            </th>
                                            <th class="tablecolu">Name</th>
                                            <th class="tablecolu">User Name</th>
                                            <th class="tablecolu">Country of Residence</th>
                                            <th class="tablecolu">(assigned) Game</th>
                                            <th class="tablecolu">Action</th>
                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                            <div class="col-md-6 WebsiteList">
                                <table style="float: right; padding-top: 8%; margin-right: auto; display: inline; visibility: visible;">
                                    <tbody style="background-color: white;">
                                        <tr>
                                            <td>
                                                <div id="selectgamesoption">
                                                    <label class="labelText" for="selectgames" style="display: inline">
                                                        Games
                                                    :</label>
                                                    <select id="selectgames" runat="server" name="selectgames" class="form-control" style="border: 1px solid black; width: 50%; display: inline;">
                                                        <option disabled="disabled">Select Game</option>
                                                        <option>Game1</option>
                                                        <option>Game2</option>
                                                        <option>Game3</option>
                                                        <option>Game4</option>
                                                    </select>
                                                    <input type="button" id="addGameButton" class="btn btn btn-click" style="width: 28%;" onclick="AddGame()" value="Add Game" />
                                                </div>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div id="gamesContainer" style="float: right; margin-top: 100px; border: 1px solid black; height: 210px; width: 250px; visibility: hidden; overflow: auto"
                                                    runat="server">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="float: right; margin-top: 200px">
                                            <div class="form-group">
                                                <td style="width: 10px">

                                                    <input id="draftButton" type="button" class="btn btn btn-click" style="width: 130px;" value="Save As Layout" />
                                                </td>
                                                <td style="width: 10px">
                                                    <input id="starttaskButton" class="btn btn-click" style="width: 130px;" value="Start Task" type="button" />
                                                </td>
                                                <td style="width: 10px">

                                                    <input id="cancelButton" class="btn btn-click" value="Cancel" type="button" />

                                                </td>
                                            </div>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- Success message -->

                            <!-- Button -->

                        </fieldset>
                        <div class="alert alert-success" role="alert" id="success_message" style="visibility: hidden; margin-top: 0px; margin-left: 13%; margin-right: 50%; padding: 5px;">Success &nbsp<i class="glyphicon glyphicon-thumbs-up"></i>&nbsp Information is added successfully</div>
                        <div class="alert alert-danger" role="alert" id="error_message" style="visibility: hidden; margin-top: 0px; margin-left: 13%; margin-right: 50%; padding: 5px;">Error &nbsp<i class="glyphicon glyphicon-warning-sign"></i>&nbsp Fill all mandatory(*) fields in correct format</div>

                    </div>
                </div>
            </div>
            <div class="copy_layout">
                <p>Copyright © 2018 . All Rights Reserved | Design by <a href="home1.aspx" target="_blank"></a></p>
            </div>
        </div>
    </form>
    <input id="hiddenselectedIdentities" type="hidden" runat="server" />
    <input id="hiddenselectedGames" type="hidden" runat="server" />

    <!-- /.container -->


    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="../script/metisMenu.min.js"></script>
    <script src="../script/custom.js"></script>
    <!-- jQuery -->
    <script src="../script/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../script/bootstrap.min.js"></script>
    <script type="text/javascript" language="javascript">
        var selectedIdentities = [];
        var selectedGames = [];
        $(window).on("load", function () {
            var urlParams = new URLSearchParams(location.search);
            getEmail = urlParams.get('taskname');
            if (null != getEmail) {
                SetArrayValues();
                EnableFields();
                DisableTextField();
            }
        });
        function SetArrayValues() {
            var tempselectedgame = [];
            tempselectedgame = document.getElementById('hiddenselectedGames').value;
            if (tempselectedgame != null && tempselectedgame != "" && tempselectedgame != undefined
                 && !(selectedGames.includes(tempselectedgame))) {
                selectedGames = tempselectedgame.split(',');
                //selectedGames.push(tempselectedgames);
            }
            var tempselectedidentities = [];
            tempselectedidentities = document.getElementById('hiddenselectedIdentities').value;
            if (tempselectedidentities != null && tempselectedidentities != "" && tempselectedidentities != undefined
                && !(selectedIdentities.includes(tempselectedidentities))) {
                selectedIdentities = tempselectedidentities.split(',');
                //selectedIdentities.push(tempselectedidentities);
            }
        }
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
        function DisableTextField() {
            if ($("#betsizeoption").val() == "Fixed") {
                document.getElementById("betsize").style.visibility = "visible";
                document.getElementById("maxbetsize").style.visibility = "hidden";
            }
            else {
                document.getElementById("betsize").style.visibility = "visible";
                document.getElementById("maxbetsize").style.visibility = "visible";
            }

        }
        function checkAll(ele, email) {
            var checkboxes = document.getElementsByTagName('input');
            if (ele.checked) {
                if ("selectall" == email) {
                    var j = 1;
                    for (var i = 0; i < checkboxes.length; i++) {
                        if (checkboxes[i].type == 'checkbox') {
                            checkboxes[i].checked = true;
                            if (undefined != $("#taskIdentities")[0].rows[j] && "" != $("#taskIdentities")[0].rows[j].id) {
                                if (!selectedIdentities.includes($("#taskIdentities")[0].rows[j].id)) {
                                    selectedIdentities.push($("#taskIdentities")[0].rows[j].id);
                                    j++;
                                }
                            }
                        }
                    }
                }
                else {
                    for (var j = 1; j < $("#taskIdentities")[0].rows.length; j++) {
                        if (email == $("#taskIdentities")[0].rows[j].id) {
                            if (!selectedIdentities.includes($("#taskIdentities")[0].rows[j].id)) {
                                selectedIdentities.push($("#taskIdentities")[0].rows[j].id);
                                break;
                            }
                        }

                    }
                }
            }
            else {
                if ("selectall" == email) {
                    var j = 1;
                    for (var i = 0; i < checkboxes.length; i++) {
                        if (checkboxes[i].type == 'checkbox') {
                            checkboxes[i].checked = false;
                            if (undefined != $("#taskIdentities")[0].rows[j] && "" != $("#taskIdentities")[0].rows[j].id) {
                                selectedIdentities.pop($("#taskIdentities")[0].rows[j].id);
                                j++;
                            }
                        }
                    }
                }
                else {
                    for (var j = 1; j < $("#taskIdentities")[0].rows.length; j++) {
                        if (email == $("#taskIdentities")[0].rows[j].id) {
                            selectedIdentities.pop($("#taskIdentities")[0].rows[j].id);
                            break;
                        }

                    }
                }
            }
        }
        var tempselectedGames = [];
        function EnableFields() {

            var option = $("#selecttask").find(":selected").text();
            if (option != "Playing Game(S)") {
                $("#wageramount").attr("disabled", "disabled")
                $("#balancetarget").attr("disabled", "disabled")
                $("#balancelimit").attr("disabled", "disabled")
                $("#stoploss").attr("disabled", "disabled")
                $("#betsizeoption").attr("disabled", "disabled")
                $("#betsize").attr("disabled", "disabled")
                $("#maxbetsize").attr("disabled", "disabled")
                $("#addGameButton").attr("disabled", "disabled");
                $("#wageramount").val("");
                $("#gamesContainer").val("");
                tempselectedGames = selectedGames;
                selectedGames = [];
            }
            else {
                $("#wageramount").removeAttr('disabled');
                $("#balancetarget").removeAttr('disabled');
                $("#balancelimit").removeAttr('disabled');
                $("#stoploss").removeAttr('disabled');
                $("#betsizeoption").removeAttr('disabled');
                $("#betsize").removeAttr('disabled');
                $("#maxbetsize").removeAttr('disabled');
                $("#addGameButton").removeAttr('disabled');
                $("#wageramount").val("4000");
                selectedGames = tempselectedGames;

            }
        }
        function editCustomTaskValue(email) {
            EnableFields();
            DisableTextField();
            $.ajax({
                type: "POST",
                url: "AddTask.aspx/editCustomTaskValue",
                data: '{"email":"' + email + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    if (result.d.Statusvalue == true) {
                        var taskidentity = result.d.IdentityTaskData;
                        //$("#task_name").val(taskidentity[0].TaskName);
                        //$("#selectwebsite").val(taskidentity[0].TaskWebsite);
                        //$("#selecttask").val(taskidentity[0].SelectTask);
                        //$("#section").val(taskidentity[0].Section);
                        //$("#selectbrowser").val(taskidentity[0].SelectBrowser);
                        //$("#selectmode").val(taskidentity[0].SelectMode);
                        $("#wageramount").val(taskidentity[0].WagerAmount);
                        $("#balancetarget").val(taskidentity[0].BalanceLimit);
                        $("#balancelimit").val(taskidentity[0].BalanceTarget);
                        $("#stoploss").val(taskidentity[0].StopLoss);
                        $("#betsizeoption").val(taskidentity[0].BetSizeOption);
                        $("#betsize").val(taskidentity[0].BetSize);
                        $("#maxbetsize").val(taskidentity[0].MaxBetSize);
                        for (var j = 1; j < $("#taskIdentities")[0].rows.length; j++) {
                            var row = $("#taskIdentities tr")[j];
                            //for ( i<taskidentity[0].SelectedIdentities.length; i++)
                            //{
                            //    if (row.id == taskidentity[0].SelectedIdentities[i])
                            if (row.id == taskidentity[0].Email) {
                                $("#taskIdentities tr td input")[0].checked = true;
                                if (!selectedIdentities.includes(taskidentity[0].Email))
                                    selectedIdentities.push(taskidentity[0].Email);
                            }

                            // }
                        }

                        for (var i = 0; i < taskidentity[0].SelectedGames.length; i++) {
                            $("#gamesContainer")[0].innerText += taskidentity[0].SelectedGames[i];
                            $("#gamesContainer")[0].innerHTML += "<br />";
                            selectedGames.push(taskidentity[0].SelectedGames[i]);
                        }
                        $("#gamesContainer")[0].style.visibility = "visible";
                    }
                    else {
                        $("#error_message").text("Identity information not exist");
                        $("#error_message")[0].style.visibility = 'visible';
                        $("#success_message")[0].style.visibility = 'hidden';

                    }
                },
                error: function (result) {
                    $("#error_message").text('Server error occured due to unknown cause, please try again');
                    $("#error_message")[0].style.visibility = 'visible';
                    $("#success_message")[0].style.visibility = 'hidden';

                }
            });

        }
        function deleteCustomTaskValue(email) {
            EnableFields();
            DisableTextField();
            var txt;
            if (confirm("Are you sure to delete custom values of " + email + " ?")) {
                txt = "Yes";
                PageMethods.deleteCustomTaskValue(email, function (result) {
                    if (result == true) {
                        //$("#" + email)[0].remove();
                    }
                    else {
                        $("#error_message").text('identity information not exist');
                        $("#error_message")[0].style.visibility = 'visible';
                        $("#success_message")[0].style.visibility = 'hidden';
                    }

                });
            }
            else {
                txt = "No";
            }
        }
        function AddGame() {
            var select = $("#selectgames").find(":selected").text();
            if (!selectedGames.includes(select)) {
                $("#gamesContainer")[0].innerText += select;
                $("#gamesContainer")[0].innerHTML += "<br />";
                $("#gamesContainer")[0].style.visibility = "visible";
                selectedGames.push(select);
            }

        }
        function Send() {
            var tname = $("#task_name")[0].value;
            var selecttask = $("#selecttask").find(":selected").text();
            var wagerAmount = $("#wageramount")[0].value;
            var betsize = $("#betsize")[0].value;
            var maxbetsize = $("#maxbetsize")[0].value;
            if (tname == null || tname == '' || tname == undefined && (selecttask == "Playing game(s)" && wagerAmount == null || wagerAmount == '' || wagerAmount == undefined)
                    || selectedIdentities == null || selectedIdentities == '' || selectedIdentities == undefined)//|| !websiteName.match(re))
            {
                $("#error_message")[0].style.visibility = 'visible';
                $("#success_message")[0].style.visibility = 'hidden';
                $("#error_message").text("Error: Fill all mandatory(*) fields in correct format");
            }
            else {

                var IdentityTaskData = {
                    TaskName: $("#task_name")[0].value,
                    TaskWebsite: $("#selectwebsite").find(":selected").text(),
                    SelectTask: $("#selecttask").find(":selected").text(),
                    Section: $("#section").val(),
                    SelectBrowser: $("#selectbrowser").find(":selected").text(),
                    SelectMode: $("#selectmode").find(":selected").text(),
                    WagerAmount: $("#wageramount").val(),
                    BalanceTarget: $("#balancetarget").val(),
                    BalanceLimit: $("#balancelimit").val(),
                    StopLoss: $("#stoploss").val(),
                    BetSizeOption: $("#betsizeoption").find(":selected").text(),
                    BetSize: $("#betsize").val(),
                    MaxBetSize: $("#maxbetsize").val(),
                    SelectedGames: selectedGames,
                    SelectedIdentities: selectedIdentities,
                };
                var isValid = CheckIdentityTaskFormValidation(IdentityTaskData);
                if (isValid == true) {
                    updateIdentityTask(IdentityTaskData);
                }
                //var identityData = { title, firstName, last_Name, email, phone, address, date, country, zip, city, state, language, currency, birthCountry };
                //PageMethods.Send(identityData);
            }
        }
        function updateIdentityTask(IdentityTaskData) {
            $.ajax({
                type: "POST",
                url: "AddTask.aspx/Send",
                data: JSON.stringify({ IdentityTaskData: IdentityTaskData }),//'{"Title":"' + identityData.Title + '","City":"' + identityData.City+ '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true,
                success: function (result) {
                    if (result.d.Statusvalue == false) {
                        $("#error_message").text("Error: " + result.d.ResponseMessage);
                        $("#error_message")[0].style.visibility = 'visible';
                        $("#success_message")[0].style.visibility = 'hidden';
                        return false;
                    }
                    else if (result.d.Statusvalue == true) {
                        window.location.href = '/Pages/TaskSchedule.aspx';
                        return false;
                    }

                },
                error: function (result) {
                    $("#error_message").text('Server error occured due to unknown cause, please try again');
                    $("#error_message")[0].style.visibility = "visible";
                    $("#success_message")[0].style.visibility = "hidden";
                    return false;
                }
            });
        }
        function Cancel() {
            try {
                window.location.href = '/Pages/TaskSchedule.aspx';
                return false;
            }
            catch (err) {
                alert("Error: " + err);
            }
        }
        function CheckIdentityTaskFormValidation(IdentityData) {
            var check = false;
            var message = "";
            var taskname = new RegExp(document.getElementById("task_name").pattern);
            var numberfields = /^[0-9]+$/;
            var wagerAmount = new RegExp(document.getElementById("wageramount").pattern);
            if ("" == IdentityData.TaskName || !taskname.test(IdentityData.TaskName)) {
                message = "Invalid TaskName"
                check = true;
            }
            if ([] == IdentityData.SelectedIdentities) {
                message = "Please select at least one Identity"
                check = true;
            }
            if ("" != IdentityData.StopLoss && !IdentityData.StopLoss.match(numberfields)) {
                message = "Invalid value of Stop/Loss"
                check = true;
            }
            if ("" != IdentityData.WagerAmount && !IdentityData.WagerAmount.match(numberfields)) {
                message = "Invalid value of Wager Amount"
                check = true;
            }
            if ("" != IdentityData.BalanceLimit && !IdentityData.BalanceLimit.match(numberfields)) {
                message = "Invalid value of Balance Limit"
                check = true;
            }
            if ("" != IdentityData.BalanceTarget && !IdentityData.BalanceTarget.match(numberfields)) {
                message = "Invalid value of Balance Target"
                check = true;
            }
            if ("" != IdentityData.BetSize && !IdentityData.BetSize.match(numberfields)) {
                message = "Invalid value of BetSize"
                check = true;
            }
            if (check == true) {
                $("#error_message").text("Error: " + message);
                $("#error_message")[0].style.visibility = 'visible';
                $("#success_message")[0].style.visibility = 'hidden';

                return false;
            }
            return true;
        }
        $("#starttaskButton").off().on("click", Send);
        $("#draftButton").off().on("click", Send);
        $("#cancelButton").off().on("click", Cancel);
    </script>
</body>
</html>

