<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-6">
            <h3>Billing Address</h3>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name: " CssClass="control-label">First Name:<span class="required">*</span></asp:Label>
                    </div>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="tbFirstName" ErrorMessage="First name is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name: " CssClass="control-label">Last Name:<span class="required">*</span></asp:Label>
                    </div>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbLastName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="tbLastName" ErrorMessage="Last name is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <asp:Label ID="lblCompanyName" runat="server" Text="Company Name: " CssClass="col-md-3 control-label">Company Name: </asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbCompanyname" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <asp:Label ID="lblAddress" runat="server" Text="Address: " CssClass="col-md-3 control-label">Address: <span class="required" >*</span></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbAddress" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="tbAddress" ErrorMessage="Address is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <asp:Label ID="lblAddress2" runat="server" Text="Address Line 2: " CssClass="col-md-3 control-label">Address Line 2: </asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbAddress2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <asp:Label ID="lblCity" runat="server" Text="City: " CssClass="col-md-3 control-label">City: <span class="required">*</span></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbCity" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="tbCity" ErrorMessage="City is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <asp:Label ID="lblZipCode" runat="server" Text="Zip Code: " CssClass="col-md-3 control-label">Zip Code: <span class="required">*</span></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbZipCode" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" ControlToValidate="tbZipCode" ErrorMessage="Zip code is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revZip" runat="server" ControlToValidate="tbZipCode" ErrorMessage="Not a valid Zip Code." ForeColor="red" ValidationExpression="^\d{5}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <div class="row">
                    <asp:Label ID="lblState" runat="server" Text="State: " CssClass="col-md-3 control-label">State: <span class="required">*</span></asp:Label>
                    <div class="col-md-9">
                        <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                            <asp:ListItem Value="CA">California</asp:ListItem>
                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
                            <asp:ListItem Value="FL">Florida</asp:ListItem>
                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                            <asp:ListItem Value="ME">Maine</asp:ListItem>
                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
                            <asp:ListItem Value="MT">Montana</asp:ListItem>
                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                            <asp:ListItem Value="NY">New York</asp:ListItem>
                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                            <asp:ListItem Value="TX">Texas</asp:ListItem>
                            <asp:ListItem Value="UT">Utah</asp:ListItem>
                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
                            <asp:ListItem Value="WA">Washington</asp:ListItem>
                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <asp:Label ID="lblEmail" runat="server" Text="Email: " CssClass="col-md-3 control-label">Email: <span class="required">*</span></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvshippingEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Email is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revshippingEmail" ControlToValidate="tbEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid Email" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <asp:Label ID="lblPhone" runat="server" Text="Phone: " CssClass="col-md-3 control-label">Phone: <span class="required">*</span></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbPhone" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="tbPHone" ErrorMessage="Phone is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPhone" ControlToValidate="tbPhone" ValidationExpression="(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" runat="server" ErrorMessage="Invalid Phone Number" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>


        </div>
        <div class="col-md-6">
            <div class="form-group">
                <div class="row">
                    <asp:Label ID="lblCFirstName" runat="server" Text="First Name: " CssClass="col-md-3 control-label">First Name: <span class="required">*</span></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbCFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvVFirstName" runat="server" ControlToValidate="tbCFirstName" ErrorMessage="First name is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <asp:Label ID="lblCLastName" runat="server" Text="Last Name: " CssClass="col-md-3 control-label">Last Name: <span class="required">*</span></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbCLastName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCLastName" runat="server" ControlToValidate="tbCLastName" ErrorMessage="Last name is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
             <div class="form-group">
                <div class="row">
                    <asp:Label ID="Label1" runat="server" Text="State: " CssClass="col-md-3 control-label">Credit Card Type: <span class="required">*</span></asp:Label>
                    <div class="col-md-9">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Visa">Visa</asp:ListItem>
                            <asp:ListItem Value="MasterCard">MasterCard</asp:ListItem>
                            <asp:ListItem Value="Discover">Discover</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <asp:Label ID="lblCreditCard" runat="server" Text="Credit Card Number: " CssClass="col-md-3 control-label">Credit Card Number: <span class="required">*</span></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbCreditCard" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCC1" runat="server" ControlToValidate="tbCreditCard" ErrorMessage="Not a valid credit card number." ForeColor="red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revCC" runat="server" ControlToValidate="tbCreditCard" ErrorMessage="Not a valid credit card number." ForeColor="red" ValidationExpression="^\d{16}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <asp:Label ID="lblCVV" runat="server" Text="CVV: " CssClass="col-md-3 control-label">CVV:<span class="required">*</span></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbCVV" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revCvv" ControlToValidate="tbCVV" ValidationExpression="^[0-9]{3}$" runat="server" ErrorMessage="Invalid Cvv number" ForeColor="red"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvCVV" runat="server" ControlToValidate="tbCVV" ErrorMessage="CVV is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <asp:Label ID="lblExpiry" runat="server" Text="Expiry Date: " CssClass="col-md-3 control-label">Expiry Date:<span class="required">*</span></asp:Label>
                    <div class="col-md-9">
                        <div class="row">
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control" Width="125px">
                                    <asp:ListItem>01</asp:ListItem>
                                    <asp:ListItem>02</asp:ListItem>
                                    <asp:ListItem>03</asp:ListItem>
                                    <asp:ListItem>04</asp:ListItem>
                                    <asp:ListItem>05</asp:ListItem>
                                    <asp:ListItem>06</asp:ListItem>
                                    <asp:ListItem>07</asp:ListItem>
                                    <asp:ListItem>08</asp:ListItem>
                                    <asp:ListItem>09</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                </asp:DropDownList>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" Width="125px"></asp:DropDownList>
                                </div>
                                
                            </div>
                        </div>
                        <asp:Label ID="ExpiryValidator" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                </div>
            </div>
        </div>


        <%--<div class="shiptobilling clearfix">
                <h3>Shipping Address</h3>
                <label class="checkbox">
                    <input type="checkbox" value="" onclick="jQuery('.shipping-address').toggle()">Ship to billing address?
					
                </label>
            </div>
            <div class="shipping-address">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="inputfirstname">First Name<span class="required">*</span></label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="First Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="inputfirstname">Last Name<span class="required">*</span></label>
                        <div class="col-md-9">
                            <input type="password" placeholder="Last Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="inputfirstname">Company Name</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="Company (optional)">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="inputfirstname">Address<span class="required">*</span></label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="Address">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="inputfirstname">Address 2</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="inputfirstname" placeholder="Address (optional)">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="inputfirstname">Town/City<span class="required">*</span></label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="Town/City">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="inputfirstname">Postcode<span class="required">*</span></label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="Postcode">
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-3 control-label" for="inputfirstname">Country<span class="required">*</span></label>
                        <div class="col-md-9">
                            <select>
                                <option value="">--- Please Select --- </option>
                                <option value="1">Afghanistan</option>
                                <option value="2">Albania</option>
                                <option value="3">Algeria</option>
                                <option value="4">American Samoa</option>
                                <option value="5">Andorra</option>
                                <option value="6">Angola</option>
                                <option value="7">Anguilla</option>
                                <option value="8">Antarctica</option>
                                <option value="9">Antigua and Barbuda</option>
                                <option value="10">Argentina</option>
                                <option value="11">Armenia</option>
                                <option value="12">Aruba</option>
                                <option value="13">Australia</option>
                                <option value="14">Austria</option>
                                <option value="15">Azerbaijan</option>
                                <option value="16">Bahamas</option>
                                <option value="17">Bahrain</option>
                                <option value="18">Bangladesh</option>
                                <option value="19">Barbados</option>
                                <option value="20">Belarus</option>
                                <option value="21">Belgium</option>
                                <option value="22">Belize</option>
                                <option value="23">Benin</option>
                                <option value="24">Bermuda</option>
                                <option value="25">Bhutan</option>
                                <option value="26">Bolivia</option>
                                <option value="27">Bosnia and Herzegowina</option>
                                <option value="28">Botswana</option>
                                <option value="29">Bouvet Island</option>
                                <option value="30">Brazil</option>
                                <option value="31">British Indian Ocean Territory</option>
                                <option value="32">Brunei Darussalam</option>
                                <option value="33">Bulgaria</option>
                                <option value="34">Burkina Faso</option>
                                <option value="35">Burundi</option>
                                <option value="36">Cambodia</option>
                                <option value="37">Cameroon</option>
                                <option value="38">Canada</option>
                                <option value="39">Cape Verde</option>
                                <option value="40">Cayman Islands</option>
                                <option value="41">Central African Republic</option>
                                <option value="42">Chad</option>
                                <option value="43">Chile</option>
                                <option value="44">China</option>
                                <option value="45">Christmas Island</option>
                                <option value="46">Cocos (Keeling) Islands</option>
                                <option value="47">Colombia</option>
                                <option value="48">Comoros</option>
                                <option value="49">Congo</option>
                                <option value="50">Cook Islands</option>
                                <option value="51">Costa Rica</option>
                                <option value="52">Cote D'Ivoire</option>
                                <option value="53">Croatia</option>
                                <option value="54">Cuba</option>
                                <option value="55">Cyprus</option>
                                <option value="56">Czech Republic</option>
                                <option value="237">Democratic Republic of Congo</option>
                                <option value="57">Denmark</option>
                                <option value="58">Djibouti</option>
                                <option value="59">Dominica</option>
                                <option value="60">Dominican Republic</option>
                                <option value="61">East Timor</option>
                                <option value="62">Ecuador</option>
                                <option value="63">Egypt</option>
                                <option value="64">El Salvador</option>
                                <option value="65">Equatorial Guinea</option>
                                <option value="66">Eritrea</option>
                                <option value="67">Estonia</option>
                                <option value="68">Ethiopia</option>
                                <option value="69">Falkland Islands (Malvinas)</option>
                                <option value="70">Faroe Islands</option>
                                <option value="71">Fiji</option>
                                <option value="72">Finland</option>
                                <option value="73">France</option>
                                <option value="74">France, Metropolitan</option>
                                <option value="75">French Guiana</option>
                                <option value="76">French Polynesia</option>
                                <option value="77">French Southern Territories</option>
                                <option value="78">Gabon</option>
                                <option value="79">Gambia</option>
                                <option value="80">Georgia</option>
                                <option value="81">Germany</option>
                                <option value="82">Ghana</option>
                                <option value="83">Gibraltar</option>
                                <option value="84">Greece</option>
                                <option value="85">Greenland</option>
                                <option value="86">Grenada</option>
                                <option value="87">Guadeloupe</option>
                                <option value="88">Guam</option>
                                <option value="89">Guatemala</option>
                                <option value="90">Guinea</option>
                                <option value="91">Guinea-bissau</option>
                                <option value="92">Guyana</option>
                                <option value="93">Haiti</option>
                                <option value="94">Heard and Mc Donald Islands</option>
                                <option value="95">Honduras</option>
                                <option value="96">Hong Kong</option>
                                <option value="97">Hungary</option>
                                <option value="98">Iceland</option>
                                <option value="99">India</option>
                                <option value="100">Indonesia</option>
                                <option value="101">Iran (Islamic Republic of)</option>
                                <option value="102">Iraq</option>
                                <option value="103">Ireland</option>
                                <option value="104">Israel</option>
                                <option value="105">Italy</option>
                                <option value="106">Jamaica</option>
                                <option value="107">Japan</option>
                                <option value="108">Jordan</option>
                                <option value="109">Kazakhstan</option>
                                <option value="110">Kenya</option>
                                <option value="111">Kiribati</option>
                                <option value="113">Korea, Republic of</option>
                                <option value="114">Kuwait</option>
                                <option value="115">Kyrgyzstan</option>
                                <option value="116">Lao People's Democratic Republic</option>
                                <option value="117">Latvia</option>
                                <option value="118">Lebanon</option>
                                <option value="119">Lesotho</option>
                                <option value="120">Liberia</option>
                                <option value="121">Libyan Arab Jamahiriya</option>
                                <option value="122">Liechtenstein</option>
                                <option value="123">Lithuania</option>
                                <option value="124">Luxembourg</option>
                                <option value="125">Macau</option>
                                <option value="126">Macedonia</option>
                                <option value="127">Madagascar</option>
                                <option value="128">Malawi</option>
                                <option value="129">Malaysia</option>
                                <option value="130">Maldives</option>
                                <option value="131">Mali</option>
                                <option value="132">Malta</option>
                                <option value="133">Marshall Islands</option>
                                <option value="134">Martinique</option>
                                <option value="135">Mauritania</option>
                                <option value="136">Mauritius</option>
                                <option value="137">Mayotte</option>
                                <option value="138">Mexico</option>
                                <option value="139">Micronesia, Federated States of</option>
                                <option value="140">Moldova, Republic of</option>
                                <option value="141">Monaco</option>
                                <option value="142">Mongolia</option>
                                <option value="143">Montserrat</option>
                                <option value="144">Morocco</option>
                                <option value="145">Mozambique</option>
                                <option value="146">Myanmar</option>
                                <option value="147">Namibia</option>
                                <option value="148">Nauru</option>
                                <option value="149">Nepal</option>
                                <option value="150">Netherlands</option>
                                <option value="151">Netherlands Antilles</option>
                                <option value="152">New Caledonia</option>
                                <option value="153">New Zealand</option>
                                <option value="154">Nicaragua</option>
                                <option value="155">Niger</option>
                                <option value="156">Nigeria</option>
                                <option value="157">Niue</option>
                                <option value="158">Norfolk Island</option>
                                <option value="112">North Korea</option>
                                <option value="159">Northern Mariana Islands</option>
                                <option value="160">Norway</option>
                                <option value="161">Oman</option>
                                <option value="162">Pakistan</option>
                                <option value="163">Palau</option>
                                <option value="164">Panama</option>
                                <option value="165">Papua New Guinea</option>
                                <option value="166">Paraguay</option>
                                <option value="167">Peru</option>
                                <option value="168">Philippines</option>
                                <option value="169">Pitcairn</option>
                                <option value="170">Poland</option>
                                <option value="171">Portugal</option>
                                <option value="172">Puerto Rico</option>
                                <option value="173">Qatar</option>
                                <option value="174">Reunion</option>
                                <option value="175">Romania</option>
                                <option value="176">Russian Federation</option>
                                <option value="177">Rwanda</option>
                                <option value="178">Saint Kitts and Nevis</option>
                                <option value="179">Saint Lucia</option>
                                <option value="180">Saint Vincent and the Grenadines</option>
                                <option value="181">Samoa</option>
                                <option value="182">San Marino</option>
                                <option value="183">Sao Tome and Principe</option>
                                <option value="184">Saudi Arabia</option>
                                <option value="185">Senegal</option>
                                <option value="186">Seychelles</option>
                                <option value="187">Sierra Leone</option>
                                <option value="188">Singapore</option>
                                <option value="189">Slovak Republic</option>
                                <option value="190">Slovenia</option>
                                <option value="191">Solomon Islands</option>
                                <option value="192">Somalia</option>
                                <option value="193">South Africa</option>
                                <option value="194">South Georgia &amp; South Sandwich Islands</option>
                                <option value="195">Spain</option>
                                <option value="196">Sri Lanka</option>
                                <option value="197">St. Helena</option>
                                <option value="198">St. Pierre and Miquelon</option>
                                <option value="199">Sudan</option>
                                <option value="200">Suriname</option>
                                <option value="201">Svalbard and Jan Mayen Islands</option>
                                <option value="202">Swaziland</option>
                                <option value="203">Sweden</option>
                                <option value="204">Switzerland</option>
                                <option value="205">Syrian Arab Republic</option>
                                <option value="206">Taiwan</option>
                                <option value="207">Tajikistan</option>
                                <option value="208">Tanzania, United Republic of</option>
                                <option value="209">Thailand</option>
                                <option value="210">Togo</option>
                                <option value="211">Tokelau</option>
                                <option value="212">Tonga</option>
                                <option value="213">Trinidad and Tobago</option>
                                <option value="214">Tunisia</option>
                                <option value="215">Turkey</option>
                                <option value="216">Turkmenistan</option>
                                <option value="217">Turks and Caicos Islands</option>
                                <option value="218">Tuvalu</option>
                                <option value="219">Uganda</option>
                                <option value="220">Ukraine</option>
                                <option value="221">United Arab Emirates</option>
                                <option selected="selected" value="222">United Kingdom</option>
                                <option value="223">United States</option>
                                <option value="224">United States Minor Outlying Islands</option>
                                <option value="225">Uruguay</option>
                                <option value="226">Uzbekistan</option>
                                <option value="227">Vanuatu</option>
                                <option value="228">Vatican City State (Holy See)</option>
                                <option value="229">Venezuela</option>
                                <option value="230">Viet Nam</option>
                                <option value="231">Virgin Islands (British)</option>
                                <option value="232">Virgin Islands (U.S.)</option>
                                <option value="233">Wallis and Futuna Islands</option>
                                <option value="234">Western Sahara</option>
                                <option value="235">Yemen</option>
                                <option value="236">Yugoslavia</option>
                                <option value="238">Zambia</option>
                                <option value="239">Zimbabwe</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" for="inputfirstname">County</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" placeholder="County">
                        </div>
                    </div>
                </form>
            </div>--%>
        <%-- <div class="order-notes">
                <p>Order Notes</p>
                <textarea rows="3" cols="10" class="form-control" placeholder="Notes about your order, e.g. special notes for delivery."></textarea>
            </div>--%>
    </div>
     <div class="cart-totals">
         <asp:SqlDataSource ID="SqlDSCart1" runat="server"
             ConnectionString='<%$ ConnectionStrings:OnlineStoreConnectionString %>'
             SelectCommand="">
         </asp:SqlDataSource>
         <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False"
             DataSourceID="SqlDSCart1" AllowPaging="True" PageSize="3" DataKeyNames="CartID,ProductNo"
             AutoGenerateDeleteButton="false" AutoGenerateEditButton="false"
             EmptyDataText="Your Cart is empty.">
             <Columns>
                 <asp:BoundField DataField="ProductNo" HeaderText="ProductNo" InsertVisible="False" ReadOnly="true"
                     SortExpression="ProductNo" />
                 <asp:BoundField DataField="ProductName" HeaderText="Product Name" InsertVisible="False" ReadOnly="true"
                     SortExpression="ProductName" />
                 <asp:BoundField DataField="Quantity" HeaderText="Quantity"
                     SortExpression="Quantity" />
                 <asp:BoundField DataField="ProductPrice" HeaderText="Price" SortExpression="ProductPrice" InsertVisible="False" ReadOnly="true" />
                 <asp:TemplateField HeaderText="Subtotal">
                     <ItemTemplate>
                         <asp:Label ID="TotalLabel1" runat="server" Text='<%#CalculateSubTotal(Eval("Quantity"), Eval("ProductPrice"))%>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
             </Columns>

         </asp:GridView>

    </div>
    <h3>Cart Totals</h3>
            <div class="cart-totals">
                <table class="table">
                    <tr>
                        <th>Cart Subtotal</th>
                        <td>
                            <asp:Label ID="lblSubtotal" runat="server" Text="$0.00"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>Tax</th>
                        <td>
                            <asp:Label ID="lblTax" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>Shipping</th>
                        <td>
                            <asp:Label ID="lblShipping" runat="server" Text="Shipping is Free."></asp:Label></td>
                    </tr>
                    <tr>
                        <th><span>Order Total</span></th>
                        <td>
                            <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                </table>
                
         <div class="row">
        <div "col-md-12">
            <p>
                <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="btn btn-primary" />
            </p>
        </div>
    </div>
    <asp:Label ID="test" runat="server" Text="Label"></asp:Label>
    </div>
</asp:Content>
