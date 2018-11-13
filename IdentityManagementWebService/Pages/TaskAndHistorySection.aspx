﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskAndHistorySection.aspx.cs" Inherits="IdentityManagementWebService.Pages.TaskAndHistorySection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Running Position</title>
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
    <form id="contact_form" runat="server" method="post" style="overflow:scroll">
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
                    <a href="#" style="color: white">Super Admin</a>
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
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px" />
                            Position
                        </a>
                    </li>

                </ul>
            </div>
            <!-- /#sidebar-wrapper -->
            <div class="graphs">
                <div class="xs">
                    <div class="mailbox-content" style="background-color: #e5ebee;overflow:auto" >


                        <fieldset>
                            <div class="col-md-6">
                                <%--  Add line --%>
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
                                    <legend>Running Position
                                    </legend>
                                    <!-- Text input-->
                                    <tr>
                                        <!-- Text input-->
                                        <td>
                                           
                                                <label class="labelText" for="positionlabel" style="display: inline">
                                                    Position Label:
                                                </label>
                                                <div class="input-group" runat="server" id="runpositionlabel" style="display: inline">
                                                </div>
                                           
                                        </td>
                                        <td>
                                                <label class="labelText" for="runningtime" style="display: inline">Total Running Time: </label>
                                                <div class="input-group" id="totalruntime" runat="server" style="display: inline">
                                                </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- Text input-->
                                        <td>
                                                <label class="labelText" for="opentime" style="display: inline">Opened: </label>
                                                    <div class="input-group" id="openpositiontime" runat="server" style="display: inline">
                                                    </div>
                                        </td>
                                        <td>
                                                <label class="labelText" for="starttime" style="display: inline">Started: </label>
                                                    <div class="input-group" id="startedpositiontime" runat="server" style="display: inline">
                                                    </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                                <label class="labelText" for="intervaltime" style="display: inline">Interval Time: </label>
                                                    <div class="input-group" id="intervalpositiontime" runat="server" style="display: inline">
                                                    </div>
                                        </td>
                                        <td>
                                                <label class="labelText" for="intervaltime" style="display: inline">Identities: </label>
                                                    <div class="input-group" id="positionidentities" runat="server" style="display: inline">
                                                    </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                                <label class="labelText" for="cycle" style="display: inline">Cycle Progress: </label>
                                                    <div class="input-group" id="cycleprogress" runat="server">
                                                    </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    
                                </table>
                                <input id="addnewtaskbutton" type="button" class="btn btn btn-click" onclick="AddNewTask()" style="width: 130px;" value="Add New Task" />
                                            <input id="PLVHistory" class="btn btn-click" style="width: 200px;" value="PLV and Description History" type="button" />
                                        
                                <legend style="padding-top: 10px;">Task
                                </legend>
                                <div style="overflow-y: auto; max-height: 200px;background-color:white">
                                    <div id="TaskContainer" runat="server" class="box-body">
                                    </div>
                                </div>
                                <legend style="padding-top: 10px;">IDENTITIES
                                </legend>
                                <div style="overflow-y:scroll; height:150%; width:150%;">
                                <table id="taskIdentities" runat="server" name="taskIdentities" style="border-collapse: collapse; background: none; background-color: white;">
                                    <tbody>
                                        <tr class="tablerow">
                                            <th class="tablecolu">
                                                <input type="checkbox" onchange="checkAll(this,'selectall')" name="chk[]" />
                                            </th>
                                            <th class="tablecolu">Affiliates</th>
                                            <th class="tablecolu">Name</th>
                                            <th class="tablecolu">Email</th>
                                            <th class="tablecolu">Country of Residence</th>
                                            <th class="tablecolu">Total</th>
                                            <th class="tablecolu">Action</th>
                                        </tr>
                                    </tbody>

                                </table>
                                    </div>
                            </div>
                            <div class="col-md-6 WebsiteList">
                                <table style="float: right; padding-top: 8%; margin-right: auto; display: inline; visibility: visible;">
                                    <tbody style="background-color: transparent;">
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                        <tr style="float: right;">
                                            <td style="width: 10px">

                                                <input id="pauseContinuePositionButton"  type="button" class="btn btn btn-click" style="width: 130px;" value="Continue Position" />
                                            </td>
                                            <td style="width: 10px">
                                                <input id="StopPosition" class="btn btn-click" style="width: 130px;" value="Stop Position" type="button" />
                                            </td>
                                            <td style="width: 10px">

                                                <input id="RestartPosition" class="btn btn-click" style="width: 150px;" value="Restart Position" type="button" />

                                            </td>
                                            <td style="width: 10px">

                                                <input id="EditPosition" class="btn btn-click" style="width: 150px;" value="Edit Position" type="button" />

                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="width: 10px" colspan="1">
                                                <label class="labelText" for="note" style="display: inline">
                                                    Special Notes
                                                    :</label>
                                                <input type="text" id="notes" runat="server" name="note" style="width: 100%; height: 200px;" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table style="float: right; padding-top: 8%; margin-right: auto; display: inline; visibility: visible;">
                                    <tbody style="background-color: transparent;">
                                        <tr>
                                            <!-- Text input-->
                                            <td style="width: 50%">
                                                <div class="form-group" style="display: inline">
                                                    <label class="labelText" for="totalplvlabel" style="display: inline">
                                                        Total PLV
                                                    </label>
                                                    <div class="input-group" runat="server" id="totalplv" style="width: 100px">
                                                    </div>
                                                </div>
                                            </td>
                                            <td style="width: 50%">
                                                <div class="form-group" style="display: inline">
                                                    <label class="labelText" for="avgplvform" style="display: inline">Average PLV</label>
                                                    <div class="input-group" id="avgplv" runat="server" style="width: 100px">
                                                    </div>
                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <!-- Text input-->
                                            <td style="width: 50%">
                                                <div class="form-group">
                                                    <label class="labelText" for="current" style="display: inline">Current PLV</label>
                                                    <div>
                                                        <div class="input-group" id="currentplv" runat="server" style="width: 100px">
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td style="width: 50%">

                                                <input id="AddNewPLVColumn" type="button" class="btn btn btn-click" style="width: 200px;" value="Add New PLV Column" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 50%">
                                                <div class="form-group">
                                                    <label class="labelText" for="currentavg" style="display: inline">Current Average</label>
                                                    <div>
                                                        <div class="input-group" id="currentavgplv" runat="server" style="width: 150px">
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>

                             <!-- Modal content -->
                        <div id="addNewTask" class="modal">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 style="color: white">Website</h3>
                                    <span class="close">&times;</span>

                                </div>
                                <div class="modal-body">
                                    <table style="height: 350px;">
                                        <tr>
                                            <th style="display: none"></th>
                                            <th style="display: none"></th>
                                        </tr>
                                        <tbody style="background-color: white;">
                                            <tr>
                                                <div class="input-group">
                                                    <label class="labelText">
                                                        Website Label
                                               <p style="display: inline; color: red">*</p>
                                                        :</label>
                                                    <input id="websiteLabel" placeholder="Google" type="text" class="newwebsite" size="20" required="required" />
                                                </div>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="input-group">
                                                        <label class="labelText">
                                                            Website
                                        <p style="display: inline; color: red">*</p>
                                                            :</label>
                                                        <input id="websiteName" placeholder="www.example.com" type="url" class="newwebsite" size="20" required="required"
                                                            pattern="www.[A-Za-z0-9]*.[A-Za-z]*" title="www is required" />
                                                        <%--[http://|https://]--%>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="input-group">
                                                        <label class="labelText" for="username">
                                                            Username
                                        <p style="display: inline; color: red">*</p>
                                                            :</label>
                                                        <input id="username" name="username" placeholder="JohnSmith" type="text" class="newwebsite"
                                                            required="required" maxlength="20" title="Only alphabets and numbers are allowed" pattern="[A-Za-z0-9]*" />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    <div class="input-group">
                                                        <label class="labelText">Password:</label>
                                                        <input id="password" placeholder="*****" type="text" class="newwebsite" maxlength="20" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="input-group">
                                                        <label class="labelText">Account Number:</label>
                                                        <input id="websiteAccountNumber" placeholder="BBBBAAAAAAAAAAAAAAAA" type="text" class="newwebsite" maxlength="25"
                                                            title="Only Alphabets and numbers are allowed" pattern="[A-Za-z0-9]*" />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="input-group">
                                                        <label class="labelText">PIN:</label>
                                                        <input id="websitePIN" placeholder="123456" type="text" class="newwebsite" minlength="5" maxlength="20"
                                                            title="Only numbers are allowed" pattern="[0-9]*" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="input-group">
                                                        <label class="labelText">Security Question:</label>
                                                        <input id="websitequestion" placeholder="What is your favourite Place" type="text" class="newwebsite" minlength="5" maxlength="40"
                                                            title="Only Alphabets,numbers and Question mark are allowed" pattern="[A-Za-z0-9?]*" />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="input-group">
                                                        <label class="labelText">Security Answer:</label>
                                                        <input id="websiteAnswer" placeholder="London" type="text" class="newwebsite" minlength="5" maxlength="40"
                                                            title="Only Alphabets and numbers are allowed" pattern="[A-Za-z0-9]*" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="input-group">
                                                        <label class="labelText">Notes:</label>
                                                        <input id="notes" placeholder="write note" type="text" class="newnote" minlength="5"
                                                            title="Only Alphabets and numbers are allowed" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <div class="input-group">
                                        <input class="btn btn-click" type="button" onclick="SubmitWebsiteData()" value="Done" style="margin-left: 50%; margin-right: 50%;" />
                                    </div>
                                </div>
                            </div>
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
        var count = 3;
        var selectedGames = [];
        $(window).on("load", function () {
            var urlParams = new URLSearchParams(location.search);
            getPositionLabel = urlParams.get('positionlabel');
            if (null != getPositionLabel) {
                count = $("#task")[0].rows.length;
                for (var i = 0; i < document.getElementById("addcountry").childElementCount; i++) {
                    selectedCountries.push(document.getElementById("addcountry").children[i].id);
                }
                var checkboxes = document.getElementsByTagName('input');
                var j = 1;
                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].type == 'checkbox' && checkboxes[i].checked == true) {
                        if (undefined != $("#taskIdentities")[0].rows[j] && "" != $("#taskIdentities")[0].rows[j].id) {
                            if (!selectedIdentities.includes($("#taskIdentities")[0].rows[j].id)) {
                                selectedIdentities.push($("#taskIdentities")[0].rows[j].id);
                                j++;
                            }
                        }
                    }
                }
            }
        });
        function AddNewTask() {
            $("#addNewTask")[0].style.display = "block";
            $("#buttonAddNewWebsite").disabled = true;
        }
        var span = document.getElementsByClassName("close")[0];
        span.onclick = function () {
            $("#addNewTask")[0].style.display = "none";
        }
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == $("#addNewTask")[0]) {
                $("#addNewTask")[0].style.display = "none";
            }
        }
        $("#addtask").on("click", function () {
            count++;
            var row = '<tr><td>' + count + '</td><td><input type="text" id="step' + count + '" style="width: 80%;height: 10%;"/></tr>';

            $("#task").append(row);

        });
        var identitytable = $('#taskIdentities'),
        iter = 0,
        columnvalue = 5;
        $('#AddNewPLVColumn').click(function () {
            identitytable.find('tr').each(function () {
                var trow = $(this);
                if(trow.index() === 0)
                {
                    trow.find('th').eq(columnvalue).before('<th class="tablecolu"><a id="PLVLink' + iter + '" onclick="Remove(PLVLink' + iter + ',' + columnvalue + ')">PLV' + iter + '<span class="glyphicon glyphicon-minus-sign"></span></a></th>');
                }
                else
                {
                    var id = trow.attr('id') + iter;
                    trow.find('td').eq(columnvalue).before('<td class="tablecolumn"><input id="PLV' + iter + '" type="text" onchange="calculate('+iter+')" name="cb' + iter + '" style="width:50px;" pattern="[0-9]*"/></td>');
                }
            });
            iter += 1;
            columnvalue += 1;
        });
        function calculate(val) {
            var total = 0;
                if ($('#PLV'+val).val() != '') {
                    total += parseInt($('#PLV'+val).val());
            }
            $('#total'+val).html(total);
        }
        function Remove(val,colval)
        {
            identitytable.find('tr').each(function () {
                var trow = $(this);
                if (trow.index() === 0) {
                    trow.find('th').eq(colval).remove();
                }
                else {
                    var id = trow.attr('id') + iter;
                    trow.find('td').eq(columnvalue).before('<td class="tablecolumn"><input id="PLV' + iter + '" type="text" onchange="calculate(' + iter + ')" name="cb' + iter + '" style="width:50px;" pattern="[0-9]*"/></td>');
                }
            });
        }
        function startTime() {
            var today = new Date();
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            m = checkTime(m);
            s = checkTime(s);
            document.getElementById('txt').innerHTML =
            h + ":" + m + ":" + s;
            var t = setTimeout(startTime, 500);
        }
        function checkTime(i) {
            if (i < 10) { i = "0" + i };  // add zero in front of numbers < 10
            return i;
        }
        var selectedCountries = [];
        $("#country").on("change", function () {
            var selectedcountry = $("#country").find(":selected").text();
            var flag = true;
            for (var i = 0; i < document.getElementById("addcountry").childElementCount; i++) {
                if (selectedcountry == document.getElementById("addcountry").children[i].id) {
                    flag = false;
                    break;
                }
            }
            if (true == flag) {
                var iDiv = document.createElement('div');
                iDiv.id = selectedcountry;
                iDiv.className = 'form-control';
                iDiv.style.height = 'auto';
                iDiv.innerHTML = selectedcountry + '&nbsp<button class="glyphicon glyphicon-remove" style="display:inline;background-color:white" onclick="deleteCountry(\'' + iDiv.id + '\')" />';
                $("#addcountry").append(iDiv)
                selectedCountries.push(selectedcountry);
            }

        });
        function UpdateSelectedIdentitesList(selectedIdentites) {
            selectedIdentities.push(selectedIdentites);
        }
        function deleteCountry(selectedcountryid) {
            document.getElementById("addcountry").removeChild(document.getElementById(selectedcountryid));
            selectedCountries.pop(selectedcountryid);
        }

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
                        var taskidentity = result.d.PositionData;
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
        function Draft() {
            Save("Start Scheduled");
        }
        function Send() {
            Save("Active");
        }
        function Save(status) {
            var positionlabel = $("#positionlabel")[0].value;
            if (positionlabel == null || positionlabel == '' || positionlabel == undefined)//|| !websiteName.match(re))
            {
                $("#error_message")[0].style.visibility = 'visible';
                $("#success_message")[0].style.visibility = 'hidden';
                $("#error_message").text("Error: Fill all mandatory(*) fields in correct format");
            }
            else {
                var tasklist = [];
                for (var i = 1; i <= count ; i++) {
                    var id = "#step" + i;
                    var value = $(id)[0].value;
                    tasklist.push(value);
                }

                var PositionData = {
                    PositionLabel: $("#positionlabel")[0].value,
                    PositionWebsite: $("#selectwebsite").find(":selected").text(),
                    SelectSelection: $("#selectselection").find(":selected").text(),
                    StartTime: $("#starttime").val(),
                    EndTime: $("#endtime").val(),
                    StartDate: $("#startdate").val(),
                    EndDate: $("#enddate").val(),
                    SelectTasks: tasklist,
                    Note: $("#notes").val(),
                    Status: status,
                    SelectCountries: selectedCountries,
                    SelectedIdentities: selectedIdentities,
                };
                updateIdentityTask(PositionData);
                //var identityData = { title, firstName, last_Name, email, phone, address, date, country, zip, city, state, language, currency, birthCountry };
                //PageMethods.Send(identityData);
            }
        }
        function updateIdentityTask(PositionData) {
            $.ajax({
                type: "POST",
                url: "AddPosition.aspx/Send",
                data: JSON.stringify({ PositionData: PositionData }),//'{"Title":"' + identityData.Title + '","City":"' + identityData.City+ '"}',
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
                        window.location.href = '/Pages/Position.aspx';
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
                window.location.href = '/Pages/Position.aspx';
                return false;
            }
            catch (err) {
                alert("Error: " + err);
            }
        }
        $("#starttaskButton").off().on("click", Send);
        $("#draftButton").off().on("click", Draft);
        $("#cancelButton").off().on("click", Cancel);
    </script>
</body>
</html>



