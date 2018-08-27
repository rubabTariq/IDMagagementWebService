<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddIdentity.aspx.cs" Inherits="IdentityManagementWebService.AddIdentity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
</head>
<body>
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
                    <%-- <li class="sidebar-brand">
                    <a href="#">
                        Start Bootstrap
                    </a>
                </li>--%>
                    <li>
                        <a href="#">
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
                        <a href="#">
                            <img src="../Images/TaskSchedule.png" alt="User logo" style="display: inline; width: 10px" />
                            Statistics
                        </a>
                    </li>
                    <li>
                        <a href="#">
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


                        <fieldset>
                            <table style="float: right;">
                                <tbody style="background-color: #e5ebee">
                                    <tr>
                                        <td>
                                            <div style="float: right;">
                                                <input id="buttonAddNewWebsite" class="btn btn-click" type="button" onclick="AddNewWebsite()" value="Add New Website *"
                                                    style="margin-right: 50px; align-items: center; width: 200px" />

                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div id="websiteContainer" style="float: right; margin-top: 100px; border: 1px solid black; height: 210px; width: 250px; visibility: hidden; overflow: auto"
                                                runat="server">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr style="float: right; margin-top: 200px">
                                        <div class="form-group">
                                            <td style="width: 10px">

                                                <button id="draftButton" class="btn btn btn-click">Draft <span class="glyphicon glyphicon-pencil"></span></button>
                                            </td>
                                            <td style="width: 10px">

                                                <button id="submitButton" class="btn btn btn-click">
                                                    Send
                                         <span class="glyphicon glyphicon-send"></span>
                                                </button>


                                            </td>
                                            <td style="width: 10px">

                                                <button id="cancelButton" class="btn btn-click">Cancel</button>

                                            </td>

                                        </div>
                                    </tr>
                                </tbody>
                            </table>
                            <%--  Add line --%>
                            <div style="padding: 1px 10px 1px 10px; border-right: 1px solid lightgray; height: 550px; display: inline; float: right; margin-right: 20px;"></div>
                            <%--  Dialog for adding website --%>
                            <div id="addNewWebsite" style="float: right; margin-right: auto; border: 1px solid black; height: 550px; width: 250px; display: inline; visibility: hidden; margin-left: 50px;">
                                <div class="input-group">
                                    <label class="labelText">
                                        Website
                                        <p style="display: inline; color: red">*</p>
                                        :</label>
                                    <input id="websiteName" placeholder="www.example.com" type="url" class="newwebsite" size="20" required="required"
                                        pattern="[http://|https://]www.[A-Za-z0-9]*.[A-Za-z]*" title="http:// or https:// is required" />
                                </div>
                                <div class="input-group">
                                    <label class="labelText" for="username">
                                        Username
                                        <p style="display: inline; color: red">*</p>
                                        :</label>
                                    <input id="username" name="username" placeholder="JohnSmith" type="text" class="newwebsite"
                                        required="required" maxlength="20" title="Only Alphabets and numbers are allowed" pattern="[A-Za-z0-9]*" />
                                </div>
                                <div class="input-group">
                                    <label class="labelText">Password:</label>
                                    <input id="password" placeholder="*****" type="password" class="newwebsite" maxlength="20" />
                                </div>
                                <div class="input-group">
                                    <label class="labelText">Account Number:</label>
                                    <input id="websiteAccountNumber" placeholder="BBBBAAAAAAAAAAAAAAAA" type="text" class="newwebsite" maxlength="25"
                                        title="Only Alphabets and numbers are allowed" pattern="[A-Za-z0-9]*" />
                                </div>
                                <div class="input-group">
                                    <label class="labelText">PIN:</label>
                                    <input id="websitePIN" placeholder="123456" type="text" class="newwebsite" minlength="5" maxlength="20"
                                        title="Only numbers are allowed" pattern="[0-9]*" />
                                </div>
                                <div class="input-group">
                                    <label class="labelText">Security Question:</label>
                                    <input id="websitequestion" placeholder="What is your favourite Place" type="text" class="newwebsite" minlength="5" maxlength="20"
                                        title="Only Alphabets,numbers and Question mark are allowed" pattern="[A-Za-z0-9?]*" />
                                </div>
                                <div class="input-group">
                                    <label class="labelText">Security Answer:</label>
                                    <input id="websiteAnswer" placeholder="London" type="text" class="newwebsite" minlength="5" maxlength="20"
                                        title="Only Alphabets and numbers are allowed" pattern="[A-Za-z0-9]*" />
                                </div>
                                <div class="input-group">
                                    <input class="btn btn-click" type="button" onclick="SubmitWebsiteData()" value="Done" style="margin-left: 80px; margin-right: 500px" />
                                </div>
                            </div>
                            <!-- Form Name -->
                            <table style="background: none; background-color: white; height: 550px;">
                                <legend>
                                    <img src="../Images/user.jpg" alt="User logo" style="display: inline;">
                                    Edit User/Identity

                                </legend>
                                <!-- Text input-->
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="title">Title</label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                                    <select id="title" runat="server" name="title" class="form-control" style="border: 1px solid black;">
                                                        <option disabled="disabled">Select a title</option>
                                                        <option>Mr</option>
                                                        <option>Miss</option>
                                                        <option>Mrs</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <!-- Text input-->
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="first_name">
                                                First Name
                                                <p style="display: inline; color: red">*</p>
                                            </label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                    <input id="first_name" runat="server" name="first_name" placeholder="First Name" class="form-control" type="text"
                                                        required="required" maxlength="20" minlength="3" title="only alphabets allowed" pattern="[A-Za-z]*" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <!-- Text input-->
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="last_name">
                                                Last Name
                                                <p style="display: inline; color: red">*</p>
                                            </label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                    <input id="last_name" runat="server" name="last_name" placeholder="Last Name" class="form-control" type="text"
                                                        required="required" maxlength="20" minlength="3" title="only alphabets allowed" pattern="[A-Za-z]*" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <!-- Text input-->
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="email">
                                                Email
                                                <p style="display: inline; color: red">*</p>
                                            </label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                                    <input id="email" runat="server" name="email" placeholder="xyz@email.com" class="form-control" type="email"
                                                        required="required" minlength="7" maxlength="25" title="Invalid email" pattern="[A-Za-z0-9]{3,25}@[A-Za-z]{3,10}.[A-Za-z]*" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>

                                    <!-- Text input-->
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="phone">Phone #</label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                    <input id="phone" runat="server" name="phone" placeholder="xxxx-xxx-xxxxx" class="form-control" type="tel"
                                                        title="Invalid phone number" pattern="[0-9]{4}-[0-9]{3}-[0-9]{5}" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <!-- Text input-->
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="address">Address</label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                                    <input id="address" runat="server" name="address" placeholder="Address" class="form-control" type="text"
                                                        minlength="7" maxlength="25" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <!-- Text input-->
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="date">Date of Birth</label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    <input id="date" runat="server" name="date" value="01/01/2018" class="form-control" type="date" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <!-- Select Basic -->
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="country">Country of Residence</label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                                                    <select id="country" runat="server" name="country" class="form-control" data-placeholder="Choose Country...">
                                                        <option disabled="disabled">Select a country..</option>
                                                        <option value="United States">United States</option>
                                                        <option value="United Kingdom">United Kingdom</option>
                                                        <option value="Afghanistan">Afghanistan</option>
                                                        <option value="Albania">Albania</option>
                                                        <option value="Algeria">Algeria</option>
                                                        <option value="American Samoa">American Samoa</option>
                                                        <option value="Andorra">Andorra</option>
                                                        <option value="Angola">Angola</option>
                                                        <option value="Anguilla">Anguilla</option>
                                                        <option value="Antarctica">Antarctica</option>
                                                        <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                                                        <option value="Argentina">Argentina</option>
                                                        <option value="Armenia">Armenia</option>
                                                        <option value="Aruba">Aruba</option>
                                                        <option value="Australia">Australia</option>
                                                        <option value="Austria">Austria</option>
                                                        <option value="Azerbaijan">Azerbaijan</option>
                                                        <option value="Bahamas">Bahamas</option>
                                                        <option value="Bahrain">Bahrain</option>
                                                        <option value="Bangladesh">Bangladesh</option>
                                                        <option value="Barbados">Barbados</option>
                                                        <option value="Belarus">Belarus</option>
                                                        <option value="Belgium">Belgium</option>
                                                        <option value="Belize">Belize</option>
                                                        <option value="Benin">Benin</option>
                                                        <option value="Bermuda">Bermuda</option>
                                                        <option value="Bhutan">Bhutan</option>
                                                        <option value="Bolivia">Bolivia</option>
                                                        <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                                        <option value="Botswana">Botswana</option>
                                                        <option value="Bouvet Island">Bouvet Island</option>
                                                        <option value="Brazil">Brazil</option>
                                                        <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
                                                        <option value="Brunei Darussalam">Brunei Darussalam</option>
                                                        <option value="Bulgaria">Bulgaria</option>
                                                        <option value="Burkina Faso">Burkina Faso</option>
                                                        <option value="Burundi">Burundi</option>
                                                        <option value="Cambodia">Cambodia</option>
                                                        <option value="Cameroon">Cameroon</option>
                                                        <option value="Canada">Canada</option>
                                                        <option value="Cape Verde">Cape Verde</option>
                                                        <option value="Cayman Islands">Cayman Islands</option>
                                                        <option value="Central African Republic">Central African Republic</option>
                                                        <option value="Chad">Chad</option>
                                                        <option value="Chile">Chile</option>
                                                        <option value="China">China</option>
                                                        <option value="Christmas Island">Christmas Island</option>
                                                        <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                                                        <option value="Colombia">Colombia</option>
                                                        <option value="Comoros">Comoros</option>
                                                        <option value="Congo">Congo</option>
                                                        <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option>
                                                        <option value="Cook Islands">Cook Islands</option>
                                                        <option value="Costa Rica">Costa Rica</option>
                                                        <option value="Cote D'ivoire">Cote D'ivoire</option>
                                                        <option value="Croatia">Croatia</option>
                                                        <option value="Cuba">Cuba</option>
                                                        <option value="Cyprus">Cyprus</option>
                                                        <option value="Czech Republic">Czech Republic</option>
                                                        <option value="Denmark">Denmark</option>
                                                        <option value="Djibouti">Djibouti</option>
                                                        <option value="Dominica">Dominica</option>
                                                        <option value="Dominican Republic">Dominican Republic</option>
                                                        <option value="Ecuador">Ecuador</option>
                                                        <option value="Egypt">Egypt</option>
                                                        <option value="El Salvador">El Salvador</option>
                                                        <option value="Equatorial Guinea">Equatorial Guinea</option>
                                                        <option value="Eritrea">Eritrea</option>
                                                        <option value="Estonia">Estonia</option>
                                                        <option value="Ethiopia">Ethiopia</option>
                                                        <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
                                                        <option value="Faroe Islands">Faroe Islands</option>
                                                        <option value="Fiji">Fiji</option>
                                                        <option value="Finland">Finland</option>
                                                        <option value="France">France</option>
                                                        <option value="French Guiana">French Guiana</option>
                                                        <option value="French Polynesia">French Polynesia</option>
                                                        <option value="French Southern Territories">French Southern Territories</option>
                                                        <option value="Gabon">Gabon</option>
                                                        <option value="Gambia">Gambia</option>
                                                        <option value="Georgia">Georgia</option>
                                                        <option value="Germany">Germany</option>
                                                        <option value="Ghana">Ghana</option>
                                                        <option value="Gibraltar">Gibraltar</option>
                                                        <option value="Greece">Greece</option>
                                                        <option value="Greenland">Greenland</option>
                                                        <option value="Grenada">Grenada</option>
                                                        <option value="Guadeloupe">Guadeloupe</option>
                                                        <option value="Guam">Guam</option>
                                                        <option value="Guatemala">Guatemala</option>
                                                        <option value="Guinea">Guinea</option>
                                                        <option value="Guinea-bissau">Guinea-bissau</option>
                                                        <option value="Guyana">Guyana</option>
                                                        <option value="Haiti">Haiti</option>
                                                        <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option>
                                                        <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
                                                        <option value="Honduras">Honduras</option>
                                                        <option value="Hong Kong">Hong Kong</option>
                                                        <option value="Hungary">Hungary</option>
                                                        <option value="Iceland">Iceland</option>
                                                        <option value="India">India</option>
                                                        <option value="Indonesia">Indonesia</option>
                                                        <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
                                                        <option value="Iraq">Iraq</option>
                                                        <option value="Ireland">Ireland</option>
                                                        <option value="Israel">Israel</option>
                                                        <option value="Italy">Italy</option>
                                                        <option value="Jamaica">Jamaica</option>
                                                        <option value="Japan">Japan</option>
                                                        <option value="Jordan">Jordan</option>
                                                        <option value="Kazakhstan">Kazakhstan</option>
                                                        <option value="Kenya">Kenya</option>
                                                        <option value="Kiribati">Kiribati</option>
                                                        <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option>
                                                        <option value="Korea, Republic of">Korea, Republic of</option>
                                                        <option value="Kuwait">Kuwait</option>
                                                        <option value="Kyrgyzstan">Kyrgyzstan</option>
                                                        <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
                                                        <option value="Latvia">Latvia</option>
                                                        <option value="Lebanon">Lebanon</option>
                                                        <option value="Lesotho">Lesotho</option>
                                                        <option value="Liberia">Liberia</option>
                                                        <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
                                                        <option value="Liechtenstein">Liechtenstein</option>
                                                        <option value="Lithuania">Lithuania</option>
                                                        <option value="Luxembourg">Luxembourg</option>
                                                        <option value="Macao">Macao</option>
                                                        <option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option>
                                                        <option value="Madagascar">Madagascar</option>
                                                        <option value="Malawi">Malawi</option>
                                                        <option value="Malaysia">Malaysia</option>
                                                        <option value="Maldives">Maldives</option>
                                                        <option value="Mali">Mali</option>
                                                        <option value="Malta">Malta</option>
                                                        <option value="Marshall Islands">Marshall Islands</option>
                                                        <option value="Martinique">Martinique</option>
                                                        <option value="Mauritania">Mauritania</option>
                                                        <option value="Mauritius">Mauritius</option>
                                                        <option value="Mayotte">Mayotte</option>
                                                        <option value="Mexico">Mexico</option>
                                                        <option value="Micronesia, Federated States of">Micronesia, Federated States of</option>
                                                        <option value="Moldova, Republic of">Moldova, Republic of</option>
                                                        <option value="Monaco">Monaco</option>
                                                        <option value="Mongolia">Mongolia</option>
                                                        <option value="Montserrat">Montserrat</option>
                                                        <option value="Morocco">Morocco</option>
                                                        <option value="Mozambique">Mozambique</option>
                                                        <option value="Myanmar">Myanmar</option>
                                                        <option value="Namibia">Namibia</option>
                                                        <option value="Nauru">Nauru</option>
                                                        <option value="Nepal">Nepal</option>
                                                        <option value="Netherlands">Netherlands</option>
                                                        <option value="Netherlands Antilles">Netherlands Antilles</option>
                                                        <option value="New Caledonia">New Caledonia</option>
                                                        <option value="New Zealand">New Zealand</option>
                                                        <option value="Nicaragua">Nicaragua</option>
                                                        <option value="Niger">Niger</option>
                                                        <option value="Nigeria">Nigeria</option>
                                                        <option value="Niue">Niue</option>
                                                        <option value="Norfolk Island">Norfolk Island</option>
                                                        <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                                                        <option value="Norway">Norway</option>
                                                        <option value="Oman">Oman</option>
                                                        <option value="Pakistan">Pakistan</option>
                                                        <option value="Palau">Palau</option>
                                                        <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
                                                        <option value="Panama">Panama</option>
                                                        <option value="Papua New Guinea">Papua New Guinea</option>
                                                        <option value="Paraguay">Paraguay</option>
                                                        <option value="Peru">Peru</option>
                                                        <option value="Philippines">Philippines</option>
                                                        <option value="Pitcairn">Pitcairn</option>
                                                        <option value="Poland">Poland</option>
                                                        <option value="Portugal">Portugal</option>
                                                        <option value="Puerto Rico">Puerto Rico</option>
                                                        <option value="Qatar">Qatar</option>
                                                        <option value="Reunion">Reunion</option>
                                                        <option value="Romania">Romania</option>
                                                        <option value="Russian Federation">Russian Federation</option>
                                                        <option value="Rwanda">Rwanda</option>
                                                        <option value="Saint Helena">Saint Helena</option>
                                                        <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                                                        <option value="Saint Lucia">Saint Lucia</option>
                                                        <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
                                                        <option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
                                                        <option value="Samoa">Samoa</option>
                                                        <option value="San Marino">San Marino</option>
                                                        <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                                                        <option value="Saudi Arabia">Saudi Arabia</option>
                                                        <option value="Senegal">Senegal</option>
                                                        <option value="Serbia and Montenegro">Serbia and Montenegro</option>
                                                        <option value="Seychelles">Seychelles</option>
                                                        <option value="Sierra Leone">Sierra Leone</option>
                                                        <option value="Singapore">Singapore</option>
                                                        <option value="Slovakia">Slovakia</option>
                                                        <option value="Slovenia">Slovenia</option>
                                                        <option value="Solomon Islands">Solomon Islands</option>
                                                        <option value="Somalia">Somalia</option>
                                                        <option value="South Africa">South Africa</option>
                                                        <option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option>
                                                        <option value="Spain">Spain</option>
                                                        <option value="Sri Lanka">Sri Lanka</option>
                                                        <option value="Sudan">Sudan</option>
                                                        <option value="Suriname">Suriname</option>
                                                        <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                                                        <option value="Swaziland">Swaziland</option>
                                                        <option value="Sweden">Sweden</option>
                                                        <option value="Switzerland">Switzerland</option>
                                                        <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                                                        <option value="Taiwan, Province of China">Taiwan, Province of China</option>
                                                        <option value="Tajikistan">Tajikistan</option>
                                                        <option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
                                                        <option value="Thailand">Thailand</option>
                                                        <option value="Timor-leste">Timor-leste</option>
                                                        <option value="Togo">Togo</option>
                                                        <option value="Tokelau">Tokelau</option>
                                                        <option value="Tonga">Tonga</option>
                                                        <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                                        <option value="Tunisia">Tunisia</option>
                                                        <option value="Turkey">Turkey</option>
                                                        <option value="Turkmenistan">Turkmenistan</option>
                                                        <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                                        <option value="Tuvalu">Tuvalu</option>
                                                        <option value="Uganda">Uganda</option>
                                                        <option value="Ukraine">Ukraine</option>
                                                        <option value="United Arab Emirates">United Arab Emirates</option>
                                                        <option value="United Kingdom">United Kingdom</option>
                                                        <option value="United States">United States</option>
                                                        <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
                                                        <option value="Uruguay">Uruguay</option>
                                                        <option value="Uzbekistan">Uzbekistan</option>
                                                        <option value="Vanuatu">Vanuatu</option>
                                                        <option value="Venezuela">Venezuela</option>
                                                        <option value="Viet Nam">Viet Nam</option>
                                                        <option value="Virgin Islands, British">Virgin Islands, British</option>
                                                        <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                                                        <option value="Wallis and Futuna">Wallis and Futuna</option>
                                                        <option value="Western Sahara">Western Sahara</option>
                                                        <option value="Yemen">Yemen</option>
                                                        <option value="Zambia">Zambia</option>
                                                        <option value="Zimbabwe">Zimbabwe</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <!-- Text input-->
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="zip">Zip Code</label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                                    <input id="zip" runat="server" name="zip" placeholder="Zip Code" class="form-control" type="text" data-bv-integer-message="true"
                                                        pattern="[0-9]*" maxlength="10" minlength="3" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="city">City</label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                                    <input id="city" runat="server" name="city" placeholder="city" class="form-control" type="text"
                                                        minlength="3" maxlength="15" pattern="[A-Za-z ]*" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <!-- Select Basic -->
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="state">State</label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                                    <select id="state" runat="server" name-="state" class="form-control selectpicker">
                                                        <option disabled="disabled">Select a state..</option>
                                                        <option>Alabama</option>
                                                        <option>Alaska</option>
                                                        <option>Arizona</option>
                                                        <option>Arkansas</option>
                                                        <option>California</option>
                                                        <option>Colorado</option>
                                                        <option>Connecticut</option>
                                                        <option>Delaware</option>
                                                        <option>District of Columbia</option>
                                                        <option>Florida</option>
                                                        <option>Georgia</option>
                                                        <option>Hawaii</option>
                                                        <option>daho</option>
                                                        <option>Illinois</option>
                                                        <option>Indiana</option>
                                                        <option>Iowa</option>
                                                        <option>Kansas</option>
                                                        <option>Kentucky</option>
                                                        <option>Louisiana</option>
                                                        <option>Maine</option>
                                                        <option>Maryland</option>
                                                        <option>Mass</option>
                                                        <option>Michigan</option>
                                                        <option>Minnesota</option>
                                                        <option>Mississippi</option>
                                                        <option>Missouri</option>
                                                        <option>Montana</option>
                                                        <option>Nebraska</option>
                                                        <option>Nevada</option>
                                                        <option>New Hampshire</option>
                                                        <option>New Jersey</option>
                                                        <option>New Mexico</option>
                                                        <option>New York</option>
                                                        <option>North Carolina</option>
                                                        <option>North Dakota</option>
                                                        <option>Ohio</option>
                                                        <option>Oklahoma</option>
                                                        <option>Oregon</option>
                                                        <option>Pennsylvania</option>
                                                        <option>Rhode Island</option>
                                                        <option>South Carolina</option>
                                                        <option>South Dakota</option>
                                                        <option>Tennessee</option>
                                                        <option>Texas</option>
                                                        <option>Uttah</option>
                                                        <option>Vermont</option>
                                                        <option>Virginia</option>
                                                        <option>Washington</option>
                                                        <option>West Virginia</option>
                                                        <option>Wisconsin</option>
                                                        <option>Wyoming</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <!-- Text input-->
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="langauge">Main Language</label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                                    <select id="language" runat="server" name="language" class="form-control selectpicker" data-placeholder="Choose a Language...">
                                                        <option disabled="disabled">Choose a language...</option>
                                                        <option value="AF">Afrikanns</option>
                                                        <option value="SQ">Albanian</option>
                                                        <option value="AR">Arabic</option>
                                                        <option value="HY">Armenian</option>
                                                        <option value="EU">Basque</option>
                                                        <option value="BN">Bengali</option>
                                                        <option value="BG">Bulgarian</option>
                                                        <option value="CA">Catalan</option>
                                                        <option value="KM">Cambodian</option>
                                                        <option value="ZH">Chinese (Mandarin)</option>
                                                        <option value="HR">Croation</option>
                                                        <option value="CS">Czech</option>
                                                        <option value="DA">Danish</option>
                                                        <option value="NL">Dutch</option>
                                                        <option value="EN">English</option>
                                                        <option value="ET">Estonian</option>
                                                        <option value="FJ">Fiji</option>
                                                        <option value="FI">Finnish</option>
                                                        <option value="FR">French</option>
                                                        <option value="KA">Georgian</option>
                                                        <option value="DE">German</option>
                                                        <option value="EL">Greek</option>
                                                        <option value="GU">Gujarati</option>
                                                        <option value="HE">Hebrew</option>
                                                        <option value="HI">Hindi</option>
                                                        <option value="HU">Hungarian</option>
                                                        <option value="IS">Icelandic</option>
                                                        <option value="ID">Indonesian</option>
                                                        <option value="GA">Irish</option>
                                                        <option value="IT">Italian</option>
                                                        <option value="JA">Japanese</option>
                                                        <option value="JW">Javanese</option>
                                                        <option value="KO">Korean</option>
                                                        <option value="LA">Latin</option>
                                                        <option value="LV">Latvian</option>
                                                        <option value="LT">Lithuanian</option>
                                                        <option value="MK">Macedonian</option>
                                                        <option value="MS">Malay</option>
                                                        <option value="ML">Malayalam</option>
                                                        <option value="MT">Maltese</option>
                                                        <option value="MI">Maori</option>
                                                        <option value="MR">Marathi</option>
                                                        <option value="MN">Mongolian</option>
                                                        <option value="NE">Nepali</option>
                                                        <option value="NO">Norwegian</option>
                                                        <option value="FA">Persian</option>
                                                        <option value="PL">Polish</option>
                                                        <option value="PT">Portuguese</option>
                                                        <option value="PA">Punjabi</option>
                                                        <option value="QU">Quechua</option>
                                                        <option value="RO">Romanian</option>
                                                        <option value="RU">Russian</option>
                                                        <option value="SM">Samoan</option>
                                                        <option value="SR">Serbian</option>
                                                        <option value="SK">Slovak</option>
                                                        <option value="SL">Slovenian</option>
                                                        <option value="ES">Spanish</option>
                                                        <option value="SW">Swahili</option>
                                                        <option value="SV">Swedish </option>
                                                        <option value="TA">Tamil</option>
                                                        <option value="TT">Tatar</option>
                                                        <option value="TE">Telugu</option>
                                                        <option value="TH">Thai</option>
                                                        <option value="BO">Tibetan</option>
                                                        <option value="TO">Tonga</option>
                                                        <option value="TR">Turkish</option>
                                                        <option value="UK">Ukranian</option>
                                                        <option value="UR">Urdu</option>
                                                        <option value="UZ">Uzbek</option>
                                                        <option value="VI">Vietnamese</option>
                                                        <option value="CY">Welsh</option>
                                                        <option value="XH">Xhosa</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="labelText" for="currency">Main Currency</label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-euro"></i></span>
                                                    <select id="currency" runat="server" name="currency" class="form-control selectpicker">
                                                        <option disabled="disabled">Select currency..</option>
                                                        <option value="USD">United States Dollars</option>
                                                        <option value="EUR">Euro</option>
                                                        <option value="GBP">United Kingdom Pounds</option>
                                                        <option value="DZD">Algeria Dinars</option>
                                                        <option value="ARP">Argentina Pesos</option>
                                                        <option value="AUD">Australia Dollars</option>
                                                        <option value="ATS">Austria Schillings</option>
                                                        <option value="BSD">Bahamas Dollars</option>
                                                        <option value="BBD">Barbados Dollars</option>
                                                        <option value="BEF">Belgium Francs</option>
                                                        <option value="BMD">Bermuda Dollars</option>
                                                        <option value="BRR">Brazil Real</option>
                                                        <option value="BGL">Bulgaria Lev</option>
                                                        <option value="CAD">Canada Dollars</option>
                                                        <option value="CLP">Chile Pesos</option>
                                                        <option value="CNY">China Yuan Renmimbi</option>
                                                        <option value="CYP">Cyprus Pounds</option>
                                                        <option value="CSK">Czech Republic Koruna</option>
                                                        <option value="DKK">Denmark Kroner</option>
                                                        <option value="NLG">Dutch Guilders</option>
                                                        <option value="XCD">Eastern Caribbean Dollars</option>
                                                        <option value="EGP">Egypt Pounds</option>
                                                        <option value="FJD">Fiji Dollars</option>
                                                        <option value="FIM">Finland Markka</option>
                                                        <option value="FRF">France Francs</option>
                                                        <option value="DEM">Germany Deutsche Marks</option>
                                                        <option value="XAU">Gold Ounces</option>
                                                        <option value="GRD">Greece Drachmas</option>
                                                        <option value="HKD">Hong Kong Dollars</option>
                                                        <option value="HUF">Hungary Forint</option>
                                                        <option value="ISK">Iceland Krona</option>
                                                        <option value="INR">India Rupees</option>
                                                        <option value="IDR">Indonesia Rupiah</option>
                                                        <option value="IEP">Ireland Punt</option>
                                                        <option value="ILS">Israel New Shekels</option>
                                                        <option value="ITL">Italy Lira</option>
                                                        <option value="JMD">Jamaica Dollars</option>
                                                        <option value="JPY">Japan Yen</option>
                                                        <option value="JOD">Jordan Dinar</option>
                                                        <option value="KRW">Korea (South) Won</option>
                                                        <option value="LBP">Lebanon Pounds</option>
                                                        <option value="LUF">Luxembourg Francs</option>
                                                        <option value="MYR">Malaysia Ringgit</option>
                                                        <option value="MXP">Mexico Pesos</option>
                                                        <option value="NLG">Netherlands Guilders</option>
                                                        <option value="NZD">New Zealand Dollars</option>
                                                        <option value="NOK">Norway Kroner</option>
                                                        <option value="PKR">Pakistan Rupees</option>
                                                        <option value="XPD">Palladium Ounces</option>
                                                        <option value="PHP">Philippines Pesos</option>
                                                        <option value="XPT">Platinum Ounces</option>
                                                        <option value="PLZ">Poland Zloty</option>
                                                        <option value="PTE">Portugal Escudo</option>
                                                        <option value="ROL">Romania Leu</option>
                                                        <option value="RUR">Russia Rubles</option>
                                                        <option value="SAR">Saudi Arabia Riyal</option>
                                                        <option value="XAG">Silver Ounces</option>
                                                        <option value="SGD">Singapore Dollars</option>
                                                        <option value="SKK">Slovakia Koruna</option>
                                                        <option value="ZAR">South Africa Rand</option>
                                                        <option value="KRW">South Korea Won</option>
                                                        <option value="ESP">Spain Pesetas</option>
                                                        <option value="XDR">Special Drawing Right (IMF)</option>
                                                        <option value="SDD">Sudan Dinar</option>
                                                        <option value="SEK">Sweden Krona</option>
                                                        <option value="CHF">Switzerland Francs</option>
                                                        <option value="TWD">Taiwan Dollars</option>
                                                        <option value="THB">Thailand Baht</option>
                                                        <option value="TTD">Trinidad and Tobago Dollars</option>
                                                        <option value="TRL">Turkey Lira</option>
                                                        <option value="VEB">Venezuela Bolivar</option>
                                                        <option value="ZMK">Zambia Kwacha</option>
                                                        <option value="EUR">Euro</option>
                                                        <option value="XCD">Eastern Caribbean Dollars</option>
                                                        <option value="XDR">Special Drawing Right (IMF)</option>
                                                        <option value="XAG">Silver Ounces</option>
                                                        <option value="XAU">Gold Ounces</option>
                                                        <option value="XPD">Palladium Ounces</option>
                                                        <option value="XPT">Platinum Ounces</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <!-- radio checks -->
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="gender">Gender</label>
                                            <div>

                                                <label style="display: inline;">
                                                    <input id="male" runat="server" type="radio" class="gender" name="gender" value="Male" checked="true" />
                                                    Male
                                                </label>

                                                <label style="display: inline; margin-left: 20px">
                                                    <input id="female" runat="server" type="radio" class="gender" name="gender" value="Female" />
                                                    Female
                                                </label>

                                            </div>
                                        </div>
                                    </td>
                                    <!-- Text area -->
                                    <td>
                                        <div class="form-group">
                                            <label class="labelText" for="birthcountry">Country of Birth</label>
                                            <div>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                                                    <input class="form-control" runat="server" type="text" id="birthcountry" name="birthcountry" placeholder="enter birth country name.."
                                                        minlength="3" maxlength="25" pattern="[A-Za-z ]*" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <!-- Success message -->

                            <!-- Button -->

                        </fieldset>
                        <div class="alert alert-success" role="alert" id="success_message" style="visibility: hidden; margin-top: 0px; margin-right: 1000px; padding: 5px;">Success &nbsp<i class="glyphicon glyphicon-thumbs-up"></i>&nbsp Information is added successfully</div>
                        <div class="alert alert-danger" role="alert" id="error_message" style="visibility: hidden; margin-top: 0px; margin-right: 1000px; padding: 5px;">Error &nbsp<i class="glyphicon glyphicon-warning-sign"></i>&nbsp Fill all mandatory(*) fields in correct format</div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="copy_layout">
        <p>Copyright © 2018 . All Rights Reserved | Design by <a href="home1.aspx" target="_blank"></a></p>
    </div>
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
        var getEmail = null;
        $(window).on("load", function () {
            var urlParams = new URLSearchParams(location.search);
            getEmail = urlParams.get('email');
            var divarray = document.getElementById("websiteContainer").getElementsByTagName("div");
            if (null != getEmail && (divarray != undefined || divarray != null)) {
                for (var i = 0; i < divarray.length; i++) {
                    var savedwebsite = {
                        WebsiteName: divarray[i].children[1].innerText,
                        UserName: divarray[i].children[4].innerText,
                        UserPassword: divarray[i].children[7].innerText,
                        WebsiteAccountNumber: divarray[i].children[10].innerText,
                        PIN: divarray[i].children[13].innerText,
                        SecurityQuestion: divarray[i].children[16].innerText,
                        SecurityAnswer: divarray[i].children[19].innerText,
                    };
                    websites.push(savedwebsite);
                }
            }
        });

        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
        function AddNewWebsite() {
            var element = $("#addNewWebsite")[0];
            if (element.style.visibility === 'hidden') {
                element.style.visibility = 'visible';
                $("#buttonAddNewWebsite").disabled = true;
            }

        }
        var websites = [];
        var _websiteName, _username, _userPassword, _securityQuestion, _securityAnswer, _websiteAccountNumber, _pin = null;
        function SubmitWebsiteData() {
            var websitename = $("#websiteName")[0].value;
            var username = $("#username")[0].value;
            var re = new RegExp(/^((?:(?:(?:\w[\.\-\+]?)*)\w)+)((?:(?:(?:\w[\.\-\+]?){0,62})\w)+)\.(\w{2,6})$/);
            if (websitename == null || websitename == '' || websitename == undefined || username == null || username == '' || username == undefined)//|| !websiteName.match(re))
            {
                $("#error_message")[0].style.visibility = 'visible';
                $("#success_message")[0].style.visibility = 'hidden';
            }
            else {
                $("#buttonAddNewWebsite")[0].disabled = false;
                $("#addNewWebsite")[0].style.visibility = 'hidden';
                $(".newwebsite")[0].value = null;
                $("#error_message")[0].style.visibility = 'hidden';
                $("#success_message")[0].style.visibility = 'visible';

                _websiteName = websitename;
                _username = $("#username")[0].value;
                _userPassword = $("#password")[0].value;
                _websiteAccountNumber = $("#websiteAccountNumber")[0].value;
                _pin = $("#websitePIN")[0].value;
                _securityQuestion = $("#websitequestion")[0].value;
                _securityAnswer = $("#websiteAnswer")[0].value;

                var website = {
                    WebsiteName: websitename,
                    UserName: $("#username")[0].value,
                    UserPassword: $("#password")[0].value,
                    WebsiteAccountNumber: $("#websiteAccountNumber")[0].value,
                    PIN: $("#websitePIN")[0].value,
                    SecurityQuestion: $("#websitequestion")[0].value,
                    SecurityAnswer: $("#websiteAnswer")[0].value,
                };
                var isValidWebsiteInfo = CheckWebsiteFormValidation(website, websites)
                if (isValidWebsiteInfo == true) {
                    $("#websiteContainer").append("<div id=\"" + _username + "\" style=\"border:solid;Background-color:white;height:auto;word-wrap: break-word;\">" +
                                       "<label class=\"labelText\" style=\"display:inline\">Website:</label>" +
                                    "<p type=\"text\" class=\"AddWebsiteName\"  readonly=\"readonly\" style=\"border:none;background:none;display:inline\"></p><br />" +
                                       "<label class=\"labelText\" style=\"display:inline\">ID:</label>" +
                                     "<p type=\"text\" class=\"Addusername\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\"></p><br />" +
                                      "<label class=\"labelText\" style=\"display:inline\">Password:</label>" +
                                     "<p type=\"text\" class=\"AddPassword\"    readonly=\"readonly\" style=\"border:none;background:none;display:inline\"></p><br />" +
                                       "<label class=\"labelText\" style=\"display:inline\">Account Number:</label>" +
                                     "<p type=\"text\" class=\"AddWebsiteAccountNumber\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\"></p><br />" +
                                       "<label class=\"labelText\" style=\"display:inline\">PIN:</label>" +
                                     "<p type=\"text\" class=\"AddWebsitePIN\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\"></p><br />" +
                                       "<label class=\"labelText\" style=\"display:inline\">Security Question:</label>" +
                                     "<p type=\"text\" class=\"AddWebsitequestion\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\"></p><br />" +
                                       "<label class=\"labelText\" style=\"display:inline\">Security Answer:</label>" +
                                     "<p type=\"text\" class=\"AddWebsiteAnswer\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\"></p><br />" +
                                     "</div><br />");

                    $("#" + _username + " .AddWebsiteName").text(_websiteName);
                    $("#" + _username + " .Addusername").text(_username);
                    $("#" + _username + " .AddPassword").text(_userPassword);
                    $("#" + _username + " .AddWebsiteAccountNumber").text(_websiteAccountNumber);
                    $("#" + _username + " .AddWebsitePIN").text(_pin);
                    $("#" + _username + " .AddWebsitequestion").text(_securityQuestion);
                    $("#" + _username + " .AddWebsiteAnswer").text(_securityAnswer);
                    $("#websiteContainer")[0].style.visibility = 'visible';


                    websites.push(website);
                }
                // PageMethods.AddWebsite(_websiteName, _username, _userPassword, _websiteAccountNumber, _pin, _securityQuestion, _securityAnswer);
            }


        }
        function UpdateWebsiteList(websitearray) {
            websites.push(websitearray);
        }
        function editIdentity() {

            PageMethods.editidentity($('#email').innerHTML);
        }
        function deleteIdentity() {

            PageMethods.deleteidentity($('#email').innerHTML);
        }
        function Send() {
            var fname = $("#first_name")[0].value;
            var lname = $("#last_name")[0].value;
            var _email = $("#email")[0].value;
            var _webname = $("#" + _username + " .AddWebsiteName").text();
            if (getEmail == null && (fname == null || fname == '' || fname == undefined || lname == null || lname == '' || lname == undefined
                    || _email == null || _email == '' || _email == undefined || _webname == null || _webname == '' || _webname == undefined))//|| !websiteName.match(re))
            {
                $("#error_message")[0].style.visibility = 'visible';
                $("#success_message")[0].style.visibility = 'hidden';
            }
            else {
                var IdentityData = {
                    Title: $("#title").find(":selected").text(),
                    FirstName: $("#first_name").val(),
                    LastName: $("#last_name").val(),
                    Email: $("#email").val(),
                    Phone: $("#phone").val(),
                    Address: $("#address").val(),
                    DateOfBirth: $("#date").val(),
                    CountryOfResidence: $("#country").find(":selected").text(),
                    ZipCode: $("#zip").val(),
                    City: $("#city").val(),
                    State: $("#state").find(":selected").text(),
                    Language: $("#language").find(":selected").text(),
                    Currency: $("#currency").find(":selected").text(),
                    CountryOfBirth: $("#birthcountry").val(),
                    Gender: $('input[name=gender]:checked').val(),
                    WebsiteDataModel: websites,
                };
                var isValid = CheckIdentityFormValidation(IdentityData);
                if (isValid == true) {
                    updateIdentity(IdentityData);
                }
                //var identityData = { title, firstName, last_Name, email, phone, address, date, country, zip, city, state, language, currency, birthCountry };
                //PageMethods.Send(identityData);
            }
        }
        function updateIdentity(IdentityData) {
            $.ajax({
                type: "POST",
                url: "AddIdentity.aspx/Send",
                data: JSON.stringify({ IdentityData: IdentityData }),//'{"Title":"' + identityData.Title + '","City":"' + identityData.City+ '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    if (result.d.Statusvalue == false) {
                        $("#error_message")[0].style.visibility = 'visible';
                        $("#success_message")[0].style.visibility = 'hidden';
                        $("#error_message").text("Error: " + result.d.ResponseMessage);
                    }
                    else if (result.d.Statusvalue == true)
                        window.location.href = "/Pages/Identities.aspx";
                },
                error: function (result) {
                    $("#error_message")[0].style.visibility = 'visible';
                    $("#success_message")[0].style.visibility = 'hidden';
                    $("#error_message").text('Server error occured due to unknown cause, please try again');
                }
            });
        }
        function Draft() {
            if (null != $("#first_name") && null != $("#last_name") && null != $("#email") && null != $("#websiteName")) {
                var title = $("#title").find(":selected").text();
                var firstName = $("#first_name").val();
                var last_Name = $("#last_name").val();
                var email = $("#email").val();
                var phone = $("#phone").val();
                var address = $("#address").val();
                var date = $("#date").val();
                var country = $("#country").find(":selected").text();
                var zip = $("#zip").val();
                var city = $("#city").val();
                var state = $("#state").find(":selected").text();
                var language = $("#language").find(":selected").text();
                var currency = $("#currency").find(":selected").text();
                var birthCountry = $("#birthcountry").val();

                PageMethods.Draft(title, firstName, last_Name, email, phone, address, date, country, zip, city, state, language, currency, birthCountry);
            }
        }
        function Cancel() {
            window.location.href = "/Pages/Identities.aspx";
        }
        function CheckIdentityFormValidation(IdentityData) {
            var check = false;
            var message = "";
            var emailPattern = new RegExp(document.getElementById("email").pattern);
            var textfieldPattern = new RegExp("[A-Za-z]*");
            var phonepattern = new RegExp(document.getElementById("phone").pattern);
            var zipcodePattern = new RegExp("[0-9]*");
            if (!emailPattern.test(IdentityData.Email)) {
                message = "Invalid Email"
                check = true;
            }
            if (!phonepattern.test(IdentityData.Phone)) {
                message = "Invalid Phone Number"
                check = true;
            }
            if (!textfieldPattern.test(IdentityData.FirstName)) {
                message = "Invalid First Name"
                check = true;
            }
            if (!textfieldPattern.test(IdentityData.LastName)) {
                message = "Invalid Last Name"
                check = true;
            }
            if (!textfieldPattern.test(IdentityData.CountryOfBirth)) {
                message = "Invalid Country Of Birth Name"
                check = true;
            }
            if (!zipcodePattern.test(IdentityData.ZipCode)) {
                message = "Invalid ZipCode"
                check = true;
            }
            if (check == true) {
                $("#error_message")[0].style.visibility = 'visible';
                $("#success_message")[0].style.visibility = 'hidden';
                $("#error_message").text("Error: " + message);
                return false;
            }
            return true;
        }
        function CheckWebsiteFormValidation(website, websites) {
            var check = false;
            var message = "";
            var websitePattern = new RegExp(document.getElementById("websiteName").pattern);
            var textfieldPattern = new RegExp("[A-Za-z0-9]*");
            var userpattern = new RegExp("[A-Za-z0-9]*");
            var pinPattern = new RegExp("[0-9]*");
            var questionPattern = new RegExp("[A-Za-z?]*");
            if (!websitePattern.test(website.WebsiteName)) {
                message = "Invalid Website Name"
                check = true;
            }
            if (!userpattern.test(website.UserName)) {
                message = "Invalid User Name"
                check = true;
            }
            if (!textfieldPattern.test(website.WebsiteAccountNumber)) {
                message = "Invalid Account Number"
                check = true;
            }
            if (!pinPattern.test(website.PIN)) {
                message = "Invalid PIN"
                check = true;
            }
            if (!questionPattern.test(website.SecurityQuestion)) {
                message = "Invalid Security Question"
                check = true;
            }
            if (!questionPattern.test(website.SecurityAnswer)) {
                message = "Invalid Security Answer"
                check = true;
            }
            for (var i = 0; i < websites.length; i++) {
                if (websites[i].WebsiteName == website.WebsiteName) {
                    message = "\"" + websites[i].WebsiteName + "\" is already exist in the list"
                    check = true;
                    break;
                }
            }
            if (check == true) {
                $("#error_message")[0].style.visibility = 'visible';
                $("#success_message")[0].style.visibility = 'hidden';
                $("#error_message").text("Error: " + message);
                return false;
            }
            return true;
        }
        $("#submitButton").off().on("click", Send);
        $("#draftButton").off().on("click", Draft);
        $("#cancelButton").off().on("click", Cancel);

    </script>
</body>
</html>

