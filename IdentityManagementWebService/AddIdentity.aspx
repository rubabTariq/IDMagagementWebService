<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddIdentity.aspx.cs" Inherits="IdentityManagementWebService.AddIdentity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Custom css for AddIdentity form -->
    <link href="../css/addidentitystyle.css" type="text/css" rel="stylesheet" />
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
                                <table style="background: none; background-color: white; height: 550px;">
                                    <legend>
                                        <img src="../Images/user.jpg" alt="User logo" style="display: inline;">
                                        Edit User/Identity
                                        <span id="setstatus" runat="server" class="label label-success" style="float: right"></span>
                                    </legend>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                    <!-- Text input-->
                                    <tr>
                                        <td colspan="2">
                                            <div class="form-group" style="display: inline">
                                                <label class="username" for="user_name">
                                                    Username
                                               <p style="display: inline; color: red">*</p>
                                                </label>
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                        <input id="uname" runat="server" name="user_name" placeholder="JohnSmith" class="form-control" type="text" style="width: 470%;"
                                                            required="required" maxlength="20" minlength="3" title="only alphabets allowed" pattern="[A-Za-z!@#$%^&*()_-]*" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td colspan="2">
                                            <div class="form-group">
                                                <label class="labelText" for="email">
                                                    Email
                                                <p style="display: inline; color: red">*</p>
                                                </label>
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                                        <input id="email" runat="server" name="email" placeholder="xyz@email.com" class="form-control" type="email" style="width: 470%;"
                                                            required="required" minlength="7" maxlength="25" title="Invalid email" pattern="[A-Za-z0-9]{3,25}@[A-Za-z]{3,10}.[A-Za-z]*" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="form-group">
                                                <label class="labelText" for="title">
                                                    Title
                                            <p style="display: inline; color: red">*</p>
                                                </label>
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
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label class="labelText" for="first_name">
                                                    First Name
                                                <p style="display: inline; color: red">*</p>
                                                </label>
                                                <div class="input-group">
                                                    <!-- Text input-->
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                    <input id="first_name" runat="server" name="first_name" placeholder="First Name" class="form-control" type="text"
                                                        required="required" maxlength="20" minlength="3" title="only alphabets allowed" pattern="[A-Za-z]*" />
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label class="labelText" for="middle_name">
                                                    Middle Name
                                                </label>
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                        <input id="middlename" runat="server" name="middle_name" placeholder="Middle Name" class="form-control" type="text"
                                                            required="required" maxlength="20" minlength="3" title="only alphabets allowed" pattern="[A-Za-z0-9]*" />
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
                                        <td colspan="2">
                                            <div class="form-group">
                                                <label class="labelText" for="date">Date of Birth</label>
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                        <input id="dateob" runat="server" name="date" value="" class="form-control" type="text" style="width: 470%;" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>

                                        <!-- Text input-->
                                        <td colspan="2">
                                            <div class="form-group">
                                                <label class="labelText" for="phone">Phone #</label>
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                        <input id="phone" runat="server" name="phone" placeholder="xxxx-xxx-xxxxx" class="form-control" type="tel" style="width: 470%;"
                                                            title="Invalid phone number" pattern="[0-9]*" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <!-- Text input-->
                                    </tr>
                                    <!-- Text input-->
                                    <tr>
                                        <td colspan="2">
                                            <div class="form-group">
                                                <label class="labelText" for="address">Street</label>
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                                        <input id="address" runat="server" name="address" placeholder="Address" class="form-control" type="text" style="width: 470%;"
                                                            minlength="7" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td colspan="2">
                                            <div class="form-group">
                                                <label class="labelText" for="address">House No</label>
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                                        <input id="Text1" runat="server" name="address" placeholder="Address" class="form-control" type="text" style="width: 470%;"
                                                            minlength="7" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div class="form-group">
                                                <label class="labelText" for="city">City</label>
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                                        <input id="city" runat="server" name="city" placeholder="city" class="form-control" type="text" style="width: 470%;"
                                                            minlength="3" maxlength="15" pattern="[A-Za-z]*" title="only alphabets allowed" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td colspan="2">
                                            <div class="form-group">
                                                <label class="labelText" for="zip">Post Code</label>
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                                        <input id="zip" runat="server" name="zip" placeholder="Zip Code" class="form-control" type="text" data-bv-integer-message="true" style="width: 470%;"
                                                            title="only numbers allowed" pattern="[0-9]*" maxlength="10" minlength="3" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- Select Basic -->
                                        <td colspan="2">
                                            <div class="form-group">
                                                <label class="labelText" for="country">Country of Residence</label>
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                                                        <select id="country" runat="server" name="country" class="form-control" data-placeholder="Choose Country..." style="width: 470%;">
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
                                        <td colspan="2">
                                            <div class="form-group">
                                                <label class="labelText" for="state">State</label>
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                                        <input id="state" runat="server" name="state" placeholder="Enter a state.." type="text" class="form-control" style="width: 470%;"
                                                            minlength="3" maxlength="15" title="Only alphabets allowed" pattern="[A-Za-z]*" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">

                                            <div class="form-group" style="display: inline; width: 470%;">
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
                                        <td colspan="2">
                                            <div class="form-group">
                                                <label class="labelText" for="affiliate">Affiliate</label>
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                                                        <select id="selectaffiliate" runat="server" name="affiliate" class="form-control" data-placeholder="Choose Option..." style="width: 470%;">
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                        </td>
                                    </tr>
                                    <tr>

                                        <!-- Select Basic -->

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
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <!-- radio checks -->

                                        <!-- Text area -->
                                        <td colspan="2">
                                            <div class="form-group">
                                                <label class="labelText" for="birthcountry">Country of Birth</label>
                                                <div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                                                        <input class="form-control" runat="server" type="text" id="birthcountry" name="birthcountry" placeholder="enter birth country name.." style="width: 200px;"
                                                            minlength="3" maxlength="25" pattern="[A-Za-z ]*" title="only alphabets allowed" />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="4">
                                            <button id="submitButton" class="btn btn btn-click" style="margin: 0px 10px; float: right">
                                                Save
                                         <span class="glyphicon glyphicon-send"></span>
                                            </button>
                                            <button id="cancelButton" class="btn btn-click" style="margin: 0px 10px; float: right; background-color: lightgrey; color: black">Cancel</button>
                                            <button id="draftButton" class="btn btn btn-click" style="margin: 0px 10px; float: right; width: 130px; background-color: lightgrey; color: black">
                                                Put On Hold
                                     <span class="glyphicon glyphicon-pencil"></span>
                                            </button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-md-6 WebsiteList">
                                <div>
                                    <a href="javascript:void(0)" id="buttonAddNewWebsite" onclick="AddNewWebsite()" data-toggle="modal" data-target="#website_modal" title="" style="margin-left: 20%; padding: 0px 20% 1%; font-size: 62px; width: 100%; color: #ccc; background: #ecf0f5; border: 3px dotted #ccc;" data-original-title="Add New Website"><span class="glyphicon glyphicon-plus"></span></a>
                                </div>
                                <input type="text" name="search" id="websiteSearch" placeholder="Search Websites" onchange="searchWebsite()" class="form-control" style="margin-bottom: 12px; margin-top: 2%; margin-left: 20%; background-color: white !important;" />
                                <i id="refreshicon" class="fa fa-refresh fa-spin" style="font-size: 24px; visibility: hidden"></i>
                                <div class="website-box col-md-9 ">
                                    <%--  <div class="box box-solid">--%>
                                    <%--                                        <div class="box-header with-border">
                                            <div class="pull-right">
                                                <button data-toggle="modal" data-target="#website_modal" data-website="{&quot;id&quot;:&quot;19&quot;,&quot;user_id&quot;:&quot;55&quot;,&quot;website_id&quot;:&quot;5&quot;,&quot;username&quot;:&quot;f&quot;,&quot;email&quot;:null,&quot;password&quot;:&quot;f&quot;,&quot;account_number&quot;:&quot;&quot;,&quot;pin&quot;:&quot;&quot;,&quot;security_que&quot;:&quot;&quot;,&quot;security_ans&quot;:&quot;&quot;,&quot;notes&quot;:&quot;&quot;,&quot;amount&quot;:&quot;0&quot;,&quot;is_manual&quot;:&quot;0&quot;,&quot;created_at&quot;:&quot;0000-00-00 00:00:00&quot;,&quot;updated_at&quot;:&quot;2018-10-14 05:03:31&quot;,&quot;url&quot;:&quot;https:\/\/www.slotsheaven.com\/&quot;,&quot;website_name&quot;:&quot;Slots Heaven&quot;,&quot;website_status&quot;:&quot;1&quot;}" class="btn btn-default" style="padding: 2px 6px;"><i class="fa fa-edit"></i></button>
                                                <button class="btn btn-default" data-toggle="modal" data-target="#delete_website_modal" data-id="19" data-action="http://wtshub.com/ciadmin/users/userWebsiteDelete/19" data-original-title="Delete" style="padding: 2px 6px;"><i class="fa fa-trash"></i></button>
                                            </div>

                                        </div>--%>
                                    <div id="websiteContainer" runat="server" class="box-body">
                                    </div>
                                    <%--</div>--%>
                                </div>
                            </div>
                        </div>
                        <%--  Dialog for adding website --%>

                        <!-- Modal content -->
                        <div id="addNewWebsite" class="modal">
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
                        <div class="alert alert-success" role="alert" id="success_message" style="visibility: hidden; display: inline; margin-top: 0px; margin-right: 1000px; padding: 5px;">Success &nbsp<i class="glyphicon glyphicon-thumbs-up"></i>&nbsp Information is added successfully</div>
                        <div class="alert alert-danger" role="alert" id="error_message" style="visibility: hidden; margin-top: 0px; margin-right: 1000px; padding: 5px;">Error &nbsp<i class="glyphicon glyphicon-warning-sign"></i>&nbsp Fill all mandatory(*) fields in correct format</div>
                    </div>
                </div> 
            </div>
             <div class="copy_layout">
                    <p>Copyright © 2018 . All Rights Reserved | Design by <a href="home1.aspx" target="_blank"></a></p>
                </div>
        </div>
    </form>

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script type="text/javascript" language="javascript">
        $("#dateob").daterangepicker({
            locale: {
                format: 'DD.MM.YYYY'
            },
            "singleDatePicker": true,
            "showDropdowns": true,
            autoUpdateInput: false,
            locale: {
                cancelLabel: 'Clear'
            },
        });
        $("#dateob").on('apply.daterangepicker', function (ev, picker) {
            $("#dateob").val(picker.startDate.format('DD.MM.YYYY'));
        });
        var getEmail = null;
        $(window).on("load", function () {
            var urlParams = new URLSearchParams(location.search);
            getEmail = urlParams.get('email');
            var divarray = $("#websiteContainer div") // document.getElementById("websiteContainer").getElementsByTagName("div");
            if (null != getEmail && (divarray != undefined || divarray != null)) {
                for (var i = 0; i < divarray.length; i++) {
                    var savedwebsite = {
                        WebsiteName: $(divarray[i]).find("p.AddWebsiteName")[0].innerText,
                        UserName: $(divarray[i]).find("p.Addusername")[0].innerText,
                        UserPassword: $(divarray[i]).find("p.AddPassword")[0].innerText,
                        WebsiteAccountNumber: $(divarray[i]).find("p.AddWebsiteAccountNumber")[0].innerText,
                        PIN: $(divarray[i]).find("p.AddWebsitePIN")[0].innerText,
                        SecurityQuestion: $(divarray[i]).find("p.AddWebsitequestion")[0].innerText,
                        SecurityAnswer: $(divarray[i]).find("p.AddWebsiteAnswer")[0].innerText,
                        Notes: $(divarray[i]).find("p.AddNotes")[0].innerText,
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
            $("#addNewWebsite")[0].style.display = "block";
            $("#buttonAddNewWebsite").disabled = true;
        }
        var span = document.getElementsByClassName("close")[0];
        span.onclick = function () {
            $("#addNewWebsite")[0].style.display = "none";
        }
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == $("#addNewWebsite")[0]) {
                $("#addNewWebsite")[0].style.display = "none";
            }
        }
        var websites = [];
        var _websiteName, _username, _userPassword, _securityQuestion, _securityAnswer, _websiteAccountNumber, _pin, _notes = null;
        function SubmitWebsiteData() {
            var Appenddiv = true;
            var websitename = $("#websiteName")[0].value;
            var websitelabel = $("#websiteLabel")[0].value;
            var username = $("#username")[0].value;
            var re = new RegExp(/^((?:(?:(?:\w[\.\-\+]?)*)\w)+)((?:(?:(?:\w[\.\-\+]?){0,62})\w)+)\.(\w{2,6})$/);
            if (websitelabel == null || websitelabel == '' || websitelabel == undefined || websitename == null || websitename == '' || websitename == undefined || username == null || username == '' || username == undefined)//|| !websiteName.match(re))
            {
                $("#error_message")[0].style.visibility = 'visible';
                $("#success_message")[0].style.visibility = 'hidden';
                var markup = '<i class="glyphicon glyphicon-warning-sign"></i>';
                var parser = new DOMParser()
                var el = parser.parseFromString(markup, "text/xml");
                $("#error_message").innerHTML = el.firstChild;
                $("#error_message").text("Error: Fill all mandatory(*) fields in correct format");

            }
            else {
                $("#buttonAddNewWebsite")[0].disabled = false;
                $("#addNewWebsite")[0].style.display = "none";
                $(".newwebsite")[0].value = null;
                $("#error_message")[0].style.visibility = 'hidden';
                $("#success_message")[0].style.visibility = 'visible';

                _websiteName = websitename;
                _websiteLabel = websitelabel;
                _username = $("#username")[0].value;
                _userPassword = $("#password")[0].value;
                _websiteAccountNumber = $("#websiteAccountNumber")[0].value;
                _pin = $("#websitePIN")[0].value;
                _securityQuestion = $("#websitequestion")[0].value;
                _securityAnswer = $("#websiteAnswer")[0].value;
                _notes = $("#notes")[0].value;

                var website = {
                    WebsiteName: websitename,
                    WebsiteLabel: websitelabel,
                    UserName: $("#username")[0].value,
                    UserPassword: $("#password")[0].value,
                    WebsiteAccountNumber: $("#websiteAccountNumber")[0].value,
                    PIN: $("#websitePIN")[0].value,
                    SecurityQuestion: $("#websitequestion")[0].value,
                    SecurityAnswer: $("#websiteAnswer")[0].value,
                    Notes: $("#notes")[0].value,
                };
                var isValidWebsiteInfo = CheckWebsiteFormValidation(website, websites)
                for (var i = 0; i < websites.length; i++) {
                    for (var j = 0; j < $("#websiteContainer div").length - 1; j++) {
                        if (websites[i].UserName == website.UserName || websites[i].WebsiteName == website.WebsiteName) {
                            if ($("#" + websites[i].UserName).length) {
                                $("#" + websites[i].UserName + " .AddWebsiteName")[0].innerText = websitename;
                                $("#" + websites[i].UserName + " .Addusername")[0].innerText = $("#username").val();
                                $("#" + websites[i].UserName + " .AddPassword")[0].innerText = $("#password").val();
                                $("#" + websites[i].UserName + " .AddWebsiteAccountNumber")[0].innerText = $("#websiteAccountNumber").val();
                                $("#" + websites[i].UserName + " .AddWebsitePIN")[0].innerText = $("#websitePIN").val();
                                $("#" + websites[i].UserName + " .AddWebsitequestion")[0].innerText = $("#websitequestion").val();
                                $("#" + websites[i].UserName + " .AddWebsiteAnswer")[0].innerText = $("#websiteAnswer").val();
                                $("#" + websites[i].UserName + " .AddNotes")[0].innerText = $("#notes")[0].val();
                                Appenddiv = false;
                            }
                        }
                    }
                }
                if (isValidWebsiteInfo == true) {
                    if (Appenddiv == true) {
                        $("#websiteContainer").append("<div id=\"" + _username + "\" style=\"border:solid;Background-color:white;height:auto;word-wrap: break-word;\">" +
                                        "<div style=\"\"><button class=\"btn btn-default\" type=\"button\" onclick=\"EditWebsite('" + _username + "','" + $("#email")[0].value + "')\" style=\"margin-left: 75%;display:inline;\" ><span class=\"glyphicon glyphicon-edit\"></span></button><button class=\"btn btn-default\" type=\"button\" onclick=\"DeleteWebsite('" + _username + "','" + $("#email")[0].value + "')\" style=\"display:inline;\"><span class=\"glyphicon glyphicon-trash\"></span></button></div><br />" +
                                        "<label class=\"labelText\" style=\"display:inline\">Website Label:</label>" +
                                        "<p type=\"text\" class=\"AddWebsiteLabel\"  readonly=\"readonly\" style=\"border:none;background:none;display:inline\"></p><br />" +
                                        "<label class=\"labelText\" style=\"display:inline\">Website Name:</label>" +
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
                                         "<label class=\"labelText\" style=\"display:inline\">Notes:</label>" +
                                         "<p type=\"text\" class=\"AddNotes\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\"></p><br />" +
                                         +"</div>");
                        $("#" + _username + " .AddWebsiteLabel").text(_websiteLabel);
                        $("#" + _username + " .AddWebsiteName").text(_websiteName);
                        $("#" + _username + " .Addusername").text(_username);
                        $("#" + _username + " .AddPassword").text(_userPassword);
                        $("#" + _username + " .AddWebsiteAccountNumber").text(_websiteAccountNumber);
                        $("#" + _username + " .AddWebsitePIN").text(_pin);
                        $("#" + _username + " .AddWebsitequestion").text(_securityQuestion);
                        $("#" + _username + " .AddWebsiteAnswer").text(_securityAnswer);
                        $("#" + _username + " .AddNotes").text(_notes);
                        $("#websiteContainer")[0].style.visibility = 'visible';

                    }
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
        function Draft() {
            Save("OnHold");
        }
        function Send() {
            Save("Active");
        }
        function Save(status) {
            var fname = $("#first_name")[0].value;
            var lname = $("#last_name")[0].value;
            var _email = $("#email")[0].value;
            var uname = $("#uname")[0].value;
            var _webname = $("#" + _username + " .AddWebsiteName").text();
            if (getEmail == null && (fname == null || fname == '' || fname == undefined || lname == null || lname == '' || lname == undefined
                    || _email == null || _email == '' || _email == undefined))//_webname == null || _webname == '' || _webname == undefined|| !websiteName.match(re))
            {
                $("#error_message")[0].style.visibility = 'visible';
                $("#success_message")[0].style.visibility = 'hidden';
                $("#error_message").text("Error: Fill all mandatory(*) fields in correct format");
            }
            else {
                var IdentityData = {
                    Title: $("#title").find(":selected").text(),
                    FirstName: $("#first_name").val(),
                    LastName: $("#last_name").val(),
                    MiddleName: $("#middlename").val(),
                    UserName: $("#uname").val(),
                    Email: $("#email").val(),
                    Phone: $("#phone").val(),
                    Address: $("#address").val(),
                    DateOfBirth: $("#dateob").val(),
                    CountryOfResidence: $("#country").find(":selected").text(),
                    ZipCode: $("#zip").val(),
                    City: $("#city").val(),
                    Affiliate: $("#selectaffiliate").val(),
                    State: $("#state").val(),
                    Language: $("#language").find(":selected").text(),
                    Currency: $("#currency").find(":selected").text(),
                    CountryOfBirth: $("#birthcountry").val(),
                    Gender: $('input[name=gender]:checked').val(),
                    Status: status,
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
                        $("#error_message").text("Error: " + result.d.ResponseMessage);
                        $("#error_message")[0].style.visibility = 'visible';
                        $("#success_message")[0].style.visibility = 'hidden';

                    }
                    else if (result.d.Statusvalue == true)
                        window.location.href = "/Pages/Identities.aspx";
                },
                error: function (result) {
                    $("#error_message").text('Server error occured due to unknown cause, please try again');
                    $("#error_message")[0].style.visibility = 'visible';
                    $("#success_message")[0].style.visibility = 'hidden';

                }
            });
        }
        function Cancel() {
            window.location.href = "/Pages/Identities.aspx";
        }
        function CheckIdentityFormValidation(IdentityData) {
            var check = false;
            var message = "";
            var emailPattern = new RegExp(document.getElementById("email").pattern);
            var textfieldPattern = /^[A-Za-z]+$/;
            var phonepattern = new RegExp(document.getElementById("phone").pattern);
            var zipcodePattern = /^[0-9]+$/
            if ("" == IdentityData.Email || !emailPattern.test(IdentityData.Email)) {
                message = "Invalid Email"
                check = true;
            }
            if ("" != IdentityData.Phone && !phonepattern.test(IdentityData.Phone)) {
                message = "Invalid Phone Number"
                check = true;
            }
            if ("" != IdentityData.FirstName && !IdentityData.FirstName.match(textfieldPattern)) {
                message = "Invalid First Name"
                check = true;
            }
            if ("" != IdentityData.LastName && !IdentityData.LastName.match(textfieldPattern)) {
                message = "Invalid Last Name"
                check = true;
            }
            if ("" != IdentityData.CountryOfBirth && !IdentityData.CountryOfBirth.match(textfieldPattern)) {
                message = "Invalid Country Of Birth Name"
                check = true;
            }
            if ("" != IdentityData.ZipCode && !IdentityData.ZipCode.match(zipcodePattern)) {
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
            var textfieldPattern = /^[A-Za-z0-9]+$/;
            var userpattern = /^[A-Za-z0-9]+$/;
            var pinPattern = /^[0-9]+$/;
            var questionPattern = /^[A-Za-z?]+$/;
            if ("" == website.WebsiteName || !websitePattern.test(website.WebsiteName)) {
                message = "Invalid Website Name"
                check = true;
            }
            if ("" == website.WebsiteLabel) {
                message = "Fill field of Website Label"
                check = true;
            }
            if ("" == website.UserName || !website.UserName.match(userpattern)) {
                message = "Invalid User Name"
                check = true;
            }
            if ("" != website.WebsiteAccountNumber && !website.WebsiteAccountNumber.match(textfieldPattern)) {
                message = "Invalid Account Number"
                check = true;
            }
            if ("" != website.PIN && !website.PIN.match(pinPattern)) {
                message = "Invalid PIN"
                check = true;
            }
            //if ("" != website.SecurityQuestion && !website.SecurityQuestion.match(questionPattern)) {
            //    message = "Invalid Security Question"
            //    check = true;
            //}
            //if ("" != website.SecurityAnswer && !website.SecurityAnswer.match(questionPattern)) {
            //    message = "Invalid Security Answer"
            //    check = true;
            //}
            if (check == true) {
                $("#error_message")[0].style.visibility = 'visible';
                $("#success_message")[0].style.visibility = 'hidden';
                $("#error_message").text("Error: " + message);
                return false;
            }
            return true;
        }
        function EditWebsite(username, email) {
            AddNewWebsite(false);
            $("#websiteName").val($("#" + username + " .AddWebsiteName")[0].innerText);
            $("#username").val($("#" + username + " .Addusername")[0].innerText);
            $("#password").val($("#" + username + " .AddPassword")[0].innerText);
            $("#websiteAccountNumber").val($("#" + username + " .AddWebsiteAccountNumber")[0].innerText);
            $("#websitePIN").val($("#" + username + " .AddWebsitePIN")[0].innerText);
            $("#websitequestion").val($("#" + username + " .AddWebsitequestion")[0].innerText);
            $("#websiteAnswer").val($("#" + username + " .AddWebsiteAnswer")[0].innerText);
            $("#notes").val($("#" + username + " .AddNotes")[0].innerText);
            //PageMethods.EditWebsite(websitename, email, function (result) {
            //    if (result.d.Statusvalue == true) {
            //        var website = result.d.IdentityDataModel.WebsiteDataModel;
            //        for (var i = 0; i < website.length; i++) {
            //            if (websitename == website[i].WebsiteName) {
            //                AddNewWebsite();
            //                $("#websiteName")[0].val(website[i].WebsiteName);
            //                $("#username")[0].val(website[i].UserName);
            //                $("#password")[0].val(website[i].UserPassword);
            //                $("#websiteAccountNumber")[0].val(website[i].WebsiteAccountNumber);
            //                $("#websitePIN")[0].val(website[i].PIN);
            //                $("#websitequestion")[0].val(website[i].SecurityQuestion);
            //                $("#websiteAnswer")[0].val(website[i].SecurityAnswer);
            //            }
            //        }
            //    }
            //    else {
            //        $("#error_message").text('website information not exist');
            //        $("#error_message")[0].style.visibility = 'visible';
            //        $("#success_message")[0].style.visibility = 'hidden';
            //    }

            //});


        }
        function DeleteWebsite(websiteusername, email) {
            $('#' + websiteusername).remove();
            for (var i = 0; i < websites.length; i++) {
                if (websiteusername == websites[i].UserName) {
                    websites.pop(websites[i].website);
                }

            }

            if ($("#websiteContainer div").length == 0) {
                $("#websiteContainer")[0].style.visibility = 'hidden';
            }
            //PageMethods.EditWebsite(websitename, email, function (result) {
            //    if (result.d.Statusvalue == true) {
            //        var websiteusername = result.d.IdentityDataModel.UserName;
            //        $('#' + websiteusername).remove();
            //    }
            //    else {
            //        $("#error_message").text('website information not exist');
            //        $("#error_message")[0].style.visibility = 'visible';
            //        $("#success_message")[0].style.visibility = 'hidden';
            //    }

            //});
        }

        document.getElementById("contact_form").onkeypress = function (e) {
            var key = e.charCode || e.keyCode || 0;
            if (key == 13) {
                $("#websiteSearch").blur();
                e.preventDefault();
            }
        }
        function searchWebsite() {
            $("#refreshicon")[0].style.visibility = 'visible';
            var websitename = $("#websiteSearch").val();
            var email = $("#email").val();
            var FilterCriteria = {
                WebsiteName: websitename,
                Email: email
            };
            if ("" == FilterCriteria.WebsiteName || "" == FilterCriteria.Email) {
                window.location.reload();
                return false;
            }
            $("#websiteContainer").html("");
            PageMethods.SearchIdentitiesWebsite(FilterCriteria, function (website) {
                if (website.length > 0 && website != null) {
                    for (var i = 0; i < website.length; i++) {
                        $("#websiteContainer").append("<div id=\"" + website[i].UserName + "\" style=\"border:solid;Background-color:white;height:auto;word-wrap: break-word;\">" +
                                     "<div><button class=\"btn btn-default\" type=\"button\" onclick=\"EditWebsite('" + website[i].UserName + "','" + FilterCriteria.Email + "')\" style=\"margin-left: 75%;display:inline;\" ><span class=\"glyphicon glyphicon-edit\"></span></button><button class=\"btn btn-default\" type=\"button\" onclick=\"DeleteWebsite('" + website[i].UserName + "','" + FilterCriteria.Email + "')\" style=\"display:inline;\"><span class=\"glyphicon glyphicon-trash\"></span></button></div><br />" +
                                   "<label class=\"labelText\" style=\"display:inline\">Website:</label>" +
                                               "<p type=\"text\" class=\"AddWebsiteName\"  readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website[i].WebsiteName + "</p><br />" +
                                                  "<label class=\"labelText\" style=\"display:inline\">ID:</label>" +
                                                "<p type=\"text\" class=\"Addusername\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website[i].UserName + "</p><br />" +
                                                 "<label class=\"labelText\" style=\"display:inline\">Password:</label>" +
                                                "<p type=\"text\" class=\"AddPassword\"    readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website[i].UserPassword + "</p><br />" +
                                                  "<label class=\"labelText\" style=\"display:inline\">Account Number:</label>" +
                                                "<p type=\"text\" class=\"AddWebsiteAccountNumber\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website[i].WebsiteAccountNumber + "</p><br />" +
                                                  "<label class=\"labelText\" style=\"display:inline\">PIN:</label>" +
                                                "<p type=\"text\" class=\"AddWebsitePIN\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website[i].PIN + "</p><br />" +
                                                  "<label class=\"labelText\" style=\"display:inline\">Security Question:</label>" +
                                                "<p type=\"text\" class=\"AddWebsitequestion\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website[i].SecurityQuestion + "</p><br />" +
                                                  "<label class=\"labelText\" style=\"display:inline\">Security Answer:</label>" +
                                                "<p type=\"text\" class=\"AddWebsiteAnswer\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website[i].SecurityAnswer + "</p><br />" +
                                                  "<label class=\"labelText\" style=\"display:inline\">Notes:</label>" +
                                                "<p type=\"text\" class=\"AddNotes\"   readonly=\"readonly\" style=\"border:none;background:none;display:inline\">" + website[i].Notes + "</p><br />" +
                                                 "</div>");
                    }

                }
                else {
                    $("#error_message").text("Search Result not found");
                    $("#error_message")[0].style.visibility = 'visible';
                    $("#success_message")[0].style.visibility = 'hidden';
                }
            });
            $("#refreshicon")[0].style.visibility = 'hidden';
        }

        $("#submitButton").off().on("click", Send);
        $("#draftButton").off().on("click", Draft);
        $("#cancelButton").off().on("click", Cancel);

    </script>
</body>
</html>

