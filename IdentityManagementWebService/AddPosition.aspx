<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPosition.aspx.cs" Inherits="IdentityManagementWebService.AddPosition" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Open New Position</title>
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
                                    <legend>Open New Position
                                    </legend>
                                    <!-- Text input-->
                                    <tr>
                                        <!-- Text input-->
                                        <td>
                                            <div class="form-group">
                                                <label class="labelText" for="positionlabel">
                                                    Position Label
                                                <p style="display: inline; color: red">*</p>
                                                </label>
                                                <div>
                                                    <div class="input-group">
                                                        <input id="positionlabel" runat="server" name="positionlabel" placeholder="Label" class="form-control" type="text"
                                                            required="required" maxlength="20" minlength="3" title="only alphabets allowed" pattern="[A-Za-z0-9]*" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
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
                                                <label class="labelText" for="selectselection">Select Selection</label>
                                                <div>
                                                    <div class="input-group">
                                                        <select id="selectselection" runat="server" name="selectselection" class="form-control" style="border: 1px solid black;" onchange="EnableFields()">
                                                            <option disabled="disabled">Choose task type</option>
                                                            <option value="Playing game(s)">Playing Game(S)</option>
                                                            <%-- <option value="Uploading file(s)">Uploading File(S)</option>
                                                        <option value="Registering account(s)">Registering Account(S)</option>--%>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label class="labelText" for="startdate">
                                                    Starting Date
                                                </label>
                                                <div>
                                                    <div class="input-group">
                                                        <input id="startdate" runat="server" name="startdate" value="" class="form-control" type="date" style="width:180px;" />
                                                    </div>
                                                </div>
                                            </div>
                                             </td>
                                              <td>
                                             <div class="form-group">
                                                <label class="labelText" for="starttime">
                                                    Starting Time
                                                </label>
                                                <div>
                                                    <div class="input-group">
                                                        <input id="starttime" runat="server" name="starttime" value="" class="form-control" type="time" style="width:100px;" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                         <td>
                                               <div class="form-group">
                                                <label class="labelText" for="enddate">
                                                    Ending Date
                                                </label>
                                                <div>
                                                    <div class="input-group">
                                                        <input id="enddate" runat="server" name="enddate" class="form-control" type="date" style="width:180px;" />
                                                    </div>
                                                </div>
                                            </div>
                                             </td>
                                              <td>
                                            <div class="form-group">
                                                <label class="labelText" for="endtime">
                                                    Ending Time
                                                </label>
                                                <div>
                                                    <div class="input-group">
                                                        <input id="endtime" runat="server" name="endtime" class="form-control" type="time" style="width:100px;" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <legend style="padding-top: 10px;">Task
                                    </legend>
                                <div style="overflow-y:auto; max-height:200px;">
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
                                   
                                </table></div>
                                <legend style="padding-top: 10px;">Select Countries
                                    </legend>
                                 <div style="overflow-y:auto; max-height:100px;">
                                 <table style="background: none; background-color: white;">
                                   
                                    <tr>
                                        <td style="width:10%;height:100px;">
                                            <div class="form-group">
                                                <div>
                                                    <div class="input-group">
                                                        <select id="country" runat="server" name="countryname" class="form-control" data-placeholder="Choose Country..." >
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
                                        <td style="width:100%;height:10px;overflow:auto">
                                            <div class="form-group">
                                                <div>
                                                    <div class="input-group" id="addcountry" runat="server" style="background-color:white;display:inline;max-height:10px;overflow:auto">
                                              
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                  
                                </table>
                                     </div>
                                <legend style="padding-top: 10px;">IDENTITIES SELECTION
                                         <p style="display: inline; color: red">*</p>
                                </legend>
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
                                            <th class="tablecolu">Action</th>
                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                            <div class="col-md-6 WebsiteList">
                                <table style="float: right; padding-top: 8%; margin-right: auto; display: inline; visibility: visible;">
                                    <tbody style="background-color:transparent;">
                                        <tr style="float: right;">
                                            <div class="form-group">
                                                <td style="width: 10px">

                                                    <input id="draftButton" type="button" class="btn btn btn-click" style="width: 130px;" value="Save As Layout" />
                                                </td>
                                                <td style="width: 10px">
                                                    <input id="starttaskButton" class="btn btn-click" style="width: 130px;" value="Open Position" type="button" />
                                                </td>
                                                <td style="width: 10px">

                                                    <input id="cancelButton" class="btn btn-click" value="Cancel" type="button" />

                                                </td>
                                            </div>
                                        </tr>
                                        <tr>
                                            <td style="width: 50%;height: 50%;border: none;padding-top: 70px">
                                                 <label class="labelText" for="note" style="display: inline">
                                                        Special Notes
                                                    :</label>
                                                <input type="text" id="notes" runat="server" name="note" style="width: 100%;height: 200px;" />
                                            </td>
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
        var count=3;
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
        $("#addtask").on("click", function () {
            count++;
            var row = '<tr><td>' + count + '</td><td><input type="text" id="step' + count + '" style="width: 80%;height: 10%;"/></tr>';

            $("#task").append(row);

        });
        var selectedCountries = [];
        $("#country").on("change", function () {
            var selectedcountry = $("#country").find(":selected").text();
            var flag = true;
            for (var i = 0; i < document.getElementById("addcountry").childElementCount; i++)
            {
                if(selectedcountry==document.getElementById("addcountry").children[i].id)
                {
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
        function UpdateSelectedIdentitesList(selectedIdentites)
        {
            selectedIdentities.push(selectedIdentites);
        }
        function deleteCountry(selectedcountryid)
        {
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
            if (positionlabel == null || positionlabel == '' || positionlabel == undefined )//|| !websiteName.match(re))
            {
                $("#error_message")[0].style.visibility = 'visible';
                $("#success_message")[0].style.visibility = 'hidden';
                $("#error_message").text("Error: Fill all mandatory(*) fields in correct format");
            }
            else {
                var tasklist = [];
                for (var i = 1; i <=count ; i++)
                {
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
                    Status:status,
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


