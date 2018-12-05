<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskAndHistorySection.aspx.cs" Inherits="IdentityManagementWebService.Pages.TaskAndHistorySection" %>

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
                                    <div id="TaskContainer" runat="server" class="box-body" style="margin-left: 1%;">
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
                                                <textarea type="text" id="notes" runat="server" name="note" style="width: 100%; height: 200px;background-color:white;resize: none;" ></textarea>
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
                                                    <div class="input-group" runat="server" id="totalplv" style="width: 100px">0
                                                    </div>
                                                </div>
                                            </td>
                                            <td style="width: 50%">
                                                <div class="form-group" style="display: inline">
                                                    <label class="labelText" for="avgplvform" style="display: inline">Average PLV</label>
                                                    <div class="input-group" id="avgplv" runat="server" style="width: 100px">0
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
                                                <div class="form-group">
                                                    <label class="labelText" for="currentavg" style="display: inline">Current Average</label>
                                                    <div>
                                                        <div class="input-group" id="currentavgplv" runat="server" style="width: 150px">
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td style="width: 50%">

                                                <input id="AddNewPLVColumn" type="button" class="btn btn btn-click" style="width: 200px;" value="Add New PLV Column" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                             <!-- Modal content -->
                        <div id="addNewTask" class="modal">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 style="color: white">Add Task</h3>
                                    <span class="close">&times;</span>

                                </div>
                                <div class="modal-body">
                                    <div style="overflow-y:auto;max-height:200px;">
                                <table name="task" runat="server" id="task" style="background: none; background-color: white;">
                                    
                                    <!-- Text input-->
                                    <tr>
                                        <td>1.</td>
                                        <td>
                                            <input type="text" id="step1" runat="server" style="width: 80%;height: 10%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2.</td>
                                        <td>
                                            <input type="text" id="step2" runat="server" style="width: 80%;height: 10%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3.</td>
                                        <td style="width: 80%;height: 10%;">
                                            <input type="text" id="step3" runat="server" style="width: 80%;height: 10%;" />
                                             <button id="addtask" type="button" class="glyphicon glyphicon-plus"></button>
                                        </td>
                                    </tr>
                                   
                                </table>

                                    </div>
                                     <div class="modal-footer">
                                    <div class="input-group">
                                        <input class="btn btn-click" type="button" onclick="SubmitTaskData()" value="Done" style="margin-left: 50%; margin-right: 50%;" />
                                    </div>
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
        var tasklist = [];
      
        var count = 3;
        var selectedGames = [];
        $(window).on("load", function () {
            var urlParams = new URLSearchParams(location.search);
            getPositionLabel = urlParams.get('positionlabel');
            if (null != getPositionLabel) {
                count = $("#task")[0].rows.length;
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
           
            var para = $("#TaskContainer div p");
            var paradiv = $("#TaskContainer div");
            for (var j = 0; j <= paradiv.length - 1 ; j++) {
                var tasksteps = [];
                for (var i = 0; i <= para.length - 1 ; i++) {
                    tasksteps.push(para[i].innerHTML);
                }
                tasklist.push(tasksteps);
            }
        });
      
        function AddNewTask() {
            $("#addNewTask")[0].style.display = "block";
            $("#addnewtaskbutton").disabled = true;
            count = 3;
            $("#task").find("tr:gt(2)").remove();
            $("#step1").val('');
            $("#step2").val('');
            $("#step3").val('');
          
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
            count++
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
                    while ($('#PLVLink' + iter).length != 0)
                    {
                        iter += 1;
                      
                    }
                    var rownum = trow.index()+1;
                    trow.find('th').eq(columnvalue).before('<th id="PLVLink' + iter + '" class="tablecolu"><a onclick="Remove(\'PLVLink' + iter + '\',\'tdPLV' + iter + '\',' + columnvalue + ',' + rownum + ')">PLV' + iter + '<span class="glyphicon glyphicon-minus-sign"></span></a></th>');
                }
                else
                {
                    var id = trow.attr('id') + iter;
                    var rownum = trow.index();
                    trow.find('td').eq(columnvalue).before('<td id="tdPLV' + iter + '" class="tablecolumn"><input id="PLV' + rownum + columnvalue + '" type="text" onchange="calculate(' + columnvalue + ',' + rownum + ')" name="cb' + iter + '" style="width:50px;" pattern="[0-9]*"/></td>');
                }
            });
            iter += 1;
            columnvalue += 1;
           
        });
        var fixPLVtotalValue = parseInt($("#totalplv")[0].innerHTML);
        function calculate(val,rowval) {
            var total = 0;
            var countplvcolumn = 0;
            for (var i = 5; i < columnvalue; i++) {
                if ($('#PLV' + rowval + i).val() != '') {
                    total += parseInt($('#PLV' + rowval + i).val());
                    countplvcolumn++;
                }
            }
            rowval -= 1;
            $('#total' + rowval).html(total);
            var totalplv=0;
            for(var j=0;j<$("#taskIdentities")[0].rows.length-1;j++)
            {
                if($('#total' + j).html()!='')
                    totalplv+=parseInt($('#total' + j).html());
            }
            var totalplvvalue = 0;
            totalplvvalue = fixPLVtotalValue;
            totalplvvalue += totalplv;
            $("#totalplv")[0].innerHTML = totalplvvalue;
            if (totalplvvalue > 0)
                $("#avgplv")[0].innerHTML = totalplvvalue / countplvcolumn;
            else
                $("#avgplv")[0].innerHTML = totalplvvalue;
            $("#currentplv")[0].innerHTML = totalplv;
            if (totalplv > 0)
                $("#currentavgplv")[0].innerHTML = totalplv / countplvcolumn;
            else
                $("#currentavgplv")[0].innerHTML = totalplv;
        }
        function Remove(val, tdval, colval, rowval)
        {
            for (var j = 0; j < $("#taskIdentities")[0].rows.length; j++) {
                var id = 'PLV' + j + colval;
                $('#' + id).val('');
                calculate(colval, j);
            }
           
            identitytable.find('tr').each(function () {
                var trow = $(this);
                if (trow.index() === 0) {
                    $('#' + val).remove();
                }
                else {
                    $('#' + tdval).remove();
                }
            });

            iter -= 1;
            columnvalue -= 1;

             
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
       
        var totaltasks = [];
        var tasklistdiv = 0;
        function SubmitTaskData()
        {
            var totaltasksteps = [];
            var tasklist = 1;
            tasklistdiv += 1;
            $("#TaskContainer").append("<div id=\"tasklistdiv" + tasklistdiv + "\" style=\"border:solid;Background-color:white;width:auto;height:auto;word-wrap: break-word;\">Task" + tasklistdiv+
                "<div style=\"display:inline;\"><button class=\"btn btn-default\" type=\"button\" onclick=\"DeleteWebsite('tasklistdiv" + tasklistdiv + "')\" style=\"display:inline;float:right;\"><span class=\"glyphicon glyphicon-trash\"></span></button></div><br /></div>")
            totaltasksteps.push('tasklistdiv' + tasklistdiv);
            for (var i = 1; i <= count; i++)
                {
                    $("#tasklistdiv" + tasklistdiv).append("<p type=\"text\" id=\"tasklist" + tasklistdiv+ tasklist + "\"  readonly=\"readonly\" style=\"border:none;background:none;display:inline\"></p><br />")
                    $("#tasklist" + tasklistdiv + tasklist).text($("#step" + tasklist)[0].value);
                    totaltasksteps.push($("#step" + tasklist)[0].value);
                    tasklist += 1;
                  
                }
          
                $("#TaskContainer")[0].style.visibility = 'visible';
                $("#addNewTask")[0].style.display = "none";
                $("#addnewtaskbutton").disabled = false;
                totaltasks.push(totaltasksteps);
            
        }
        //function EditWebsite(divId, countdiv) {
        //    $("#addNewTask")[0].style.display = "block";
        //    $("#addnewtaskbutton").disabled = true;
        //    count = 3;
        //    $("#task").find("tr:gt(2)").remove();
        //    $("#step1").val('');
        //    $("#step2").val('');
        //    $("#step3").val('');
        //    var elementtext=$("#" + divId).find("p");
        //    for (var i = 1; i <= countdiv; i++)
        //    {
        //        var text = elementtext[i-1].innerText;
        //        if (countdiv > 3 && i>3)
        //        {
        //            var row = '<tr><td>' + i + '</td><td><input type="text" id="step' + i + '" style="width: 80%;height: 10%;"/></tr>';
        //            $("#task").append(row);
        //            $("#step" + i).val(text);
        //        }
        //        else
        //            $("#step" + i).val(text);
               
        //    }
        //}
        function DeleteWebsite(divId) {
            $('#' + divId).remove();
            for (var i = 0; i < totaltasks.length; i++) {
                if (divId == (totaltasks[i])[0]) {
                    totaltasks.pop([i]);
                }

            }
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
        function restartPosition() {
            
        }
        function stopPosition() {
            PositionButton("Stop");
        }
        function PauseContinuePositionButton() {
           PositionButton("Continue");
        }
        function editPosition() {
            var positionlabel = $("#runpositionlabel")[0].innerText;
            window.location.href = '/AddPosition.aspx?positionlabel=' + positionlabel;
            return false;
        }
        function PositionButton(status) {
            var positionlabel = $("#runpositionlabel")[0].innerHTML;
            if (positionlabel == null || positionlabel == '' || positionlabel == undefined)//|| !websiteName.match(re))
            {
                $("#error_message")[0].style.visibility = 'visible';
                $("#success_message")[0].style.visibility = 'hidden';
                $("#error_message").text("Error: Fill all mandatory(*) fields in correct format");
            }
            else {
               
                for (var j = 1; j <= totaltasks.length ; j++)
                {
                    var tasksteps = [];
                    for (var i = 1; i <= count ; i++) {
                        var id = "#step" + i;
                        var value = $(id)[0].value;
                        tasksteps.push(value);
                    }
                    tasklist.push(tasksteps);
                }

                var PositionData = {
                    PositionLabel: $("#runpositionlabel")[0].innerHTML,
                    TotalRunTime: $("#totalruntime")[0].innerHTML,
                    OpenPositionTime: $("#openpositiontime")[0].innerHTML,
                    StartPositionTime: $("#startedpositiontime")[0].innerHTML,
                    IntervalPositionTime: $("#intervalpositiontime")[0].innerHTML,
                    PositionIdentitiesCount: $("#positionidentities")[0].innerHTML,
                    CycleProgress: $("#cycleprogress")[0].innerHTML,
                    TasksList: tasklist,
                    Note: $("#notes").val(),
                    TotalPLV: $("#totalplv")[0].innerHTML,
                    AveragePLV: $("#avgplv")[0].innerHTML,
                    CurrentPLV: $("#currentplv")[0].innerHTML,
                    CurrentAveragePLV: $("#currentavgplv")[0].innerHTML,
                    SelectedIdentities: selectedIdentities,
                    Status: status
                };
                updateIdentityTask(PositionData);
                //var identityData = { title, firstName, last_Name, email, phone, address, date, country, zip, city, state, language, currency, birthCountry };
                //PageMethods.Send(identityData);
            }
        }
        function updateIdentityTask(PositionData) {
            $.ajax({
                type: "POST",
                url: "TaskAndHistorySection.aspx/Send",
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
        //function stopPosition() {
        //    try {
        //        window.location.href = '/Pages/Position.aspx';
        //        return false;
        //    }
        //    catch (err) {
        //        alert("Error: " + err);
        //    }
        //}
        $("#EditPosition").off().on("click", editPosition);
        $("#RestartPosition").off().on("click", restartPosition);
        $("#StopPosition").off().on("click", stopPosition);
        $("#pauseContinuePositionButton").off().on("click", PauseContinuePositionButton);
    </script>
</body>
</html>



