<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskSchedule.aspx.cs" Inherits="IdentityManagementWebService.Pages.TaskSchedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TaskSchedule</title>
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
    <!-- Time slider -->
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
                        <a id="Schedule" href="/Pages/TaskSchedule.aspx" class="active">
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
                        <span class="glyphicon glyphicon-tasks" style="display: inline"></span>
                        Tasks    
                        <a style="color: cornflowerblue; display: inline; font-size: large; background-color: #1565c0; color: white;" href="/AddTask.aspx">Add task</a>
                    </h3>
                    <div class="col-md-8 inbox_right" style="width: 2000px; height: 600px;">
                        <div class="mailbox-content" style="height: 700px; overflow: auto; width: 1600px;">

                            <table id="taskSchedule" class="tableTaskSchedule" runat="server" style="border-collapse: collapse; width: auto">
                                <tbody>
                                    <tr class="tablerow">
                                        <th class="tablecol">Task#</th>
                                        <th class="tablecol" style="width: 10%;">Task Name</th>
                                        <th class="tablecol" style="width: 10%;">Task</th>
                                        <th class="tablecol">Website</th>
                                        <th class="tablecol">Identities</th>
                                        <th class="tablecol">Cycle Time
                                        <%--<img src="../Images/sliderimage.png" alt="User logo" style="display: inline; width: 100px">--%>
                                            <input type="range" name="tickmarks" value="50" min="0" max="100" data-show-value="true" style="display: inline; width: 100px"/>
                                        </th>
                                        <th class="tablecol" style="width: 10%;">Finished Cycle
                                          <%--  <img src="../Images/sliderimage.png" alt="User logo" style="display: inline; width: 100px">--%>
                                            <input type="range" name="points" id="finishedtime" value="50" min="0" max="100" data-show-value="true" style="display: inline; width: 100px"/>
                                        </th>
                                        <th class="tablecol">Status</th>
                                        <th class="tablecol" style="width: 100%;">Action</th>
                                    </tr>
                                    <tr class="tablerow">
                                        <th class="tablecol"></th>
                                        <th class="tablecol">
                                            <input id="taskname" type="search" placeholder="Search Task Name" style="width: 145px; font-size: 12px;" onsearch="searchIdentities()" /></th>
                                        <th class="tablecol">
                                            <input id="task" type="search" placeholder="Search Task" style="width: 145px; font-size: 12px;" onsearch="searchIdentities()" /></th>
                                        <th class="tablecol">
                                            <input id="website" type="search" placeholder="Search Website" style="width: 200px; font-size: 12px;" onsearch="searchIdentities()" /></th>
                                        <th class="tablecol"></th>
                                        <th class="tablecol"></th>
                                        <th class="tablecol"></th>
                                        <th class="tablecol"></th>
                                        <th class="tablecol"></th>
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
            function autoHide() {  //hide after 5 seconds
                setTimeout(function () { document.getlementById('ShowMessage').style.display = 'none'; }, 5000);
            }
            window.onload = function () {
                navHighlight();
            };
            function navHighlight() {
                var url = location.href.split('/');
                loc = url[url.length - 1];
                elementid = loc.substring(loc, loc.indexOf('.'));
                if (null != elementid)
                    document.getElementById(elementid).className = "active";
            }

            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
            function deleteTask(taskname) {
                var txt;
                if (confirm("Are you sure to delete this Task " + taskname + " ?")) {
                    txt = "Yes";
                    PageMethods.deleteTask(taskname, function (result) {
                        if (result == true) {
                            $("#" + taskname)[0].remove();
                            window.location.reload();
                        }

                    });
                }
                else {
                    txt = "No";
                }


            }
            function SetTask(taskName, email) {
                if ($("#toggle" + taskName).val() == "Continue") {
                    $("#toggle" + taskName).val("Pause");
                }
                else {
                    $("#toggle" + taskName).val("Continue");
                }

            }
            function searchIdentities() {
                var taskname = $("#taskname").val();
                var task = $("#task").val();
                var website = $("#website").val();
                var TaskCriteria = {
                    TaskName: taskname,
                    Task: task,
                    Website: website,
                };
                if ("" == TaskCriteria.TaskName && "" == TaskCriteria.Task && "" == TaskCriteria.Website) {
                    window.location.reload();
                    return false;
                }
                PageMethods.SearchIdentities(TaskCriteria, function (result) {
                    if (result.Statusvalue == true) {
                        var countofRows = $("#taskSchedule")[0].rows.length;
                        for (var i = countofRows - 1; i != 1; i--) {
                            document.getElementById("taskSchedule").deleteRow(i);
                        }

                        var table = document.getElementById("taskSchedule");

                        var rowcount = 2;
                        var srnumber = 1;
                        for (var j = 0; j < result.IdentityTaskData.length; j++) {

                            if (null != result.IdentityTaskData[j]) {
                                var value = result.IdentityTaskData[j].TaskName;
                                var row = table.insertRow(rowcount);
                                row.id = result.IdentityTaskData[j].TaskName;
                                var cell1 = row.insertCell(0);
                                cell1.innerHTML = srnumber;
                                cell1.className = "tablecolumn";
                                var cell2 = row.insertCell(1);
                                cell2.innerHTML = result.IdentityTaskData[j].TaskName;
                                cell2.className = "tablecolumn";
                                var cell3 = row.insertCell(2);
                                cell3.innerHTML = result.IdentityTaskData[j].SelectTask;
                                cell3.className = "tablecolumn";
                                var cell4 = row.insertCell(3);
                                cell4.innerHTML = result.IdentityTaskData[j].TaskWebsite;
                                cell4.className = "tablecolumn";
                                var cell4 = row.insertCell(4);
                                cell4.innerHTML = result.IdentityTaskData[j].SelectedIdentities.length;
                                cell4.className = "tablecolumn";
                                var cell5 = row.insertCell(5);
                                cell5.innerHTML = "time";
                                cell5.className = "tablecolumn";
                                var cell6 = row.insertCell(6);
                                cell6.innerHTML = "time";
                                cell6.className = "tablecolumn";
                                var cell7 = row.insertCell(7);
                                cell7.innerHTML = "Active";
                                cell7.className = "tablecolumn";

                                //Edit link
                                var btneditimg = document.createElement('img');
                                btneditimg.src = "../Images/edit.png";
                                btneditimg.style.width = "15px";
                                var btneditlink = document.createElement('a');
                                btneditlink.href = "/AddTask.aspx?taskname=" + result.IdentityTaskData[j].TaskName;
                                btneditlink.style.marginLeft = "0px";
                                btneditlink.appendChild(btneditimg);
                                btneditlink.id = "edit" + result.IdentityTaskData[j].TaskName;
                                //Delete Link
                                var btndeleteimg = document.createElement('img');
                                btndeleteimg.src = "../Images/delete.png";
                                btndeleteimg.style.width = "40px";
                                var btndeletelink = document.createElement('a');
                                btndeletelink.style.marginLeft = "22px";
                                btndeletelink.appendChild(btndeleteimg);
                                btndeletelink.id = "delete" + result.IdentityTaskData[j].TaskName;
                                btndeletelink.onclick = function () { deleteTask(value) };

                                var copyBasicData = document.createElement('input');
                                copyBasicData.type = "button";
                                copyBasicData.className = "btn btn-click";
                                copyBasicData.value = "Continue";
                                copyBasicData.style.width = "auto";
                                copyBasicData.style.backgroundColor = "#61d461";
                                copyBasicData.style.color = "#ffffff";
                                copyBasicData.style.marginLeft = "10px";
                                copyBasicData.onclick = function () { SetTask(value, "") };
                                copyBasicData.id = "toggle" + result.IdentityTaskData[j].TaskName;


                                var copyDataButton = document.createElement("input");
                                copyDataButton.type = "button";
                                copyDataButton.className = "btn btn-click";
                                copyDataButton.value = "Stop";
                                copyDataButton.style.width = "auto";
                                copyDataButton.style.backgroundColor = "#f74444";
                                copyDataButton.style.color = "#ffffff";
                                copyDataButton.style.marginLeft = "20px";
                                copyDataButton.onclick = function () { StopTask(value, "") };
                                copyDataButton.id = "stop" + result.IdentityTaskData[j].TaskName;


                                var cell8 = row.insertCell(8);
                                cell8.className = "tablecolumn";
                                cell8.appendChild(btneditlink);
                                cell8.appendChild(btndeletelink);
                                cell8.appendChild(copyBasicData);
                                cell8.appendChild(copyDataButton);
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
        </script>

    </form>
</body>
</html>

