<%@ Page Title="" Language="VB" MasterPageFile="~/MainStore.master" AutoEventWireup="false" CodeFile="SignInUp.aspx.vb" Inherits="SignInUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="w3_login">
        <h3>ورود/ ثبت نام</h3>
        <center>
<br />
                <asp:Label style="margin:auto;font-size:12px;border-radius: 6px 6px 6px 6px;padding:8px 8px 8px 8px;" runat="server" CssClass="label-danger" id="lblStatus"  Visible="false"/>
             <%--   <br />
                <asp:Label style="margin:auto;font-size:12px;border-radius: 6px 6px 6px 6px;padding:8px 8px 8px 8px;" ID="lblSignupSuccessLog" runat="server" CssClass="label-success" Visible="false" />
                <br/>
            <asp:Label style="margin:auto;font-size:12px;border-radius: 6px 6px 6px 6px;padding:8px 8px 8px 8px;" ID="lblSignupErrorLog" runat="server" CssClass="label-danger" Visible="false" />--%>
            </center>
        <div class="w3_login_module">
            <div class="module form-module">
                <div class="toggle">
                    <i class="fa fa-times fa-pencil"></i>
                    <div class="tooltip">مرا کلیک کن</div>
                </div>
                <div class="form">
                    <h2>وارد حساب کاربری خود شوید</h2>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtUsernameE" ErrorMessage="ایمیل وارد نشده" ValidationGroup="Login" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionEmail" ControlToValidate="txtUsernameE" runat="server" ErrorMessage="آدرس ایمیل نادرست" ValidationGroup="Login" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[\w-\.]{1,}\@([\da-zA-Z-]{1,}\.){1,}[\da-zA-Z-]{2,6}$"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtUsernameE" onKeyup="SignInValidation();Ariv(event);" runat="server" ValidationGroup="Login" type="text" name="Username" placeholder="آدرس ایمیل" required=" " />
                    <asp:RequiredFieldValidator ID="RequiredFieldPassword" ControlToValidate="txtPassword" runat="server" ErrorMessage="رمز عبور وارد نشده" ValidationGroup="Login" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPassword" onKeyup="SignInValidation();Ariv(event);" runat="server" ValidationGroup="Login" type="password" name="Password" placeholder="رمز عبور" required=" " />
                    <asp:CheckBox runat="server" onKeyup="SignInValidation();Ariv(event);" ID="chk" CssClass="checkbox-inline" Style="color: rgba(0,0,0,0.7); margin-bottom: 15px;" Text="مرا به خاطر بسپار" type="checkbox" />
                    <asp:Button ID="btnArival" onKeyup="SignInValidation();Ariv(event);" runat="server" OnClientClick="SignInValidation();" ValidationGroup="Login" value="ورود" Text="ورود" />
                </div>
                <div class="form">
                    <h2>ایجاد یک حساب کاربری</h2>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNameAndFamily" ControlToValidate="txtNameAndFamily" runat="server" ErrorMessage="نام و نام خانوادگی وارد نشده" ValidationGroup="signup" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionNameAndFamily" ControlToValidate="txtNameAndFamily" runat="server" ErrorMessage="نام و نام خانوادگی فارسی و صحیح وارد شود" ValidationGroup="signup" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\s*[ابپتثجچحخدذرزژئسشصضطظعغفق  کگلمنوهیآیيك\s]+\s*$"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtNameAndFamily" onKeyup="SignUpValidation();Signupp(event);" runat="server" ValidationGroup="signup" type="text" name="Name" placeholder="نام و نام خانوادگی" />
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtEmail" onKeyup="SignUpValidation();Signupp(event);" runat="server" ValidationGroup="signup" type="email" name="Email" placeholder="ایمیل" AutoPostBack="True" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Label runat="server" ID="PasswordStrength" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px; display: block;" CssClass="label-default" />
                    <asp:TextBox ID="txtPass" onkeyup="CheckPasswordStrength(this.value)" runat="server" ValidationGroup="signup" type="password" name="Password" placeholder="رمز عبور" ControlToValidate="txtPass" />
                    <asp:CompareValidator ID="CompareValidatorPass" runat="server" ErrorMessage="تکرار رمز عبور نادرست است" ControlToCompare="txtPass" ControlToValidate="txtRPass" ValidationGroup="signup" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true"></asp:CompareValidator>
                    <asp:TextBox ID="txtRPass" onKeyup="SignUpValidation();Signupp(event);" runat="server" ValidationGroup="signup" type="password" name="Password" placeholder="تکرار رمز عبور" />
                    <asp:CheckBox runat="server" onKeyup="SignUpValidation();Signupp(event);" ID="chkRole" CssClass="checkbox-inline" Style="color: rgba(0,0,0,0.7); margin-bottom: 15px;" ValidationGroup="signup" Text="قوانین سایت را مطالعه نموده و اعلام توافق می‌نمایم" type="checkbox" />
                    <asp:Button ID="btnSignup" onKeyup="SignUpValidation();Signupp(event);" runat="server" OnClientClick="SignUpValidation();" ValidationGroup="signup" value="ثبت نام" style="color:gray;background-color:rgb(65, 65, 0);" Text="ثبت نام" disabled />

                </div>
                <div class="cta"><a href="#">رمز عبور خود را فراموش کرده اید؟</a></div>
            </div>


        </div>

        <script>
            $('#ContentPlaceHolder1_chkRole').click(function () {
                // Switches the Icon
                if ($(this).is(':checked')) {
                    document.getElementById("ContentPlaceHolder1_btnSignup").disabled = false;
                    document.getElementById("ContentPlaceHolder1_btnSignup").style.color = "white";
                    document.getElementById("ContentPlaceHolder1_btnSignup").style.backgroundColor = "";
                    //alert("1");
                }
                else {
                    document.getElementById("ContentPlaceHolder1_btnSignup").disabled = true;
                    document.getElementById("ContentPlaceHolder1_btnSignup").style.color = "gray";
                    document.getElementById("ContentPlaceHolder1_btnSignup").style.backgroundColor = "rgb(65, 65, 0)";
                    //alert("0");
                }
                }
            );
            function Ariv(event) {
                if (event.keyCode == 13) {
                    $("#ContentPlaceHolder1_btnArival").click();
                    alert("");
                }
            }
            function Signupp(event) {
                if (event.keyCode == 13) {
                    $("#ContentPlaceHolder1_btnSignup").click();
                }
            }
            function SignUpValidation() {
                document.getElementById("ContentPlaceHolder1_txtNameAndFamily").required = true;
                document.getElementById("ContentPlaceHolder1_txtPass").required = true;
                document.getElementById("ContentPlaceHolder1_txtRPass").required = true;
                document.getElementById("ContentPlaceHolder1_txtEmail").required = true;
                //document.getElementById("txtPhone").required = true;
                document.getElementById("ContentPlaceHolder1_txtUsernameE").required = false;
                document.getElementById("ContentPlaceHolder1_txtPassword").required = false;
            }
            function SignInValidation() {
                document.getElementById("ContentPlaceHolder1_txtNameAndFamily").required = false;
                document.getElementById("ContentPlaceHolder1_txtUsernameE").required = true;
                document.getElementById("ContentPlaceHolder1_txtPassword").required = true;
                document.getElementById("ContentPlaceHolder1_txtRPass").required = false;
                document.getElementById("ContentPlaceHolder1_txtEmail").required = false;
                //document.getElementById("txtPhone").required = false;
            }
            //$(document).ready(function () {
            //    $("#ContentPlaceHolder1_txtEmail").click(function () {
            //        $(this).css("color","rgb(0, 0, 255)","important");
            //    });

            //});
        </script>
        <script type="text/javascript">
            function CheckPasswordStrength(password) {
                var password_strength = document.getElementById("ContentPlaceHolder1_PasswordStrength");

                //TextBox left blank.
                if (password.length == 0) {
                    password_strength.innerHTML = "";
                    password_strength.style.display = none;
                    return;
                }

                //Regular Expressions.
                var regex = new Array();
                regex.push("[A-Z]"); //Uppercase Alphabet.
                regex.push("[a-z]"); //Lowercase Alphabet.
                regex.push("[0-9]"); //Digit.
                regex.push("[$@$!%*#?&]"); //Special Character.
                regex.push("[ا-ی]"); //Persian Character.
                var passed = 0;

                //Validate for each Regular Expression.
                for (var i = 0; i < regex.length; i++) {
                    if (new RegExp(regex[i]).test(password) && password.length > 5) {
                        passed++;
                    }
                }

                //Validate for length of Password.
                if (password.length > 8) {
                    passed++;
                }

                //Display status.
                var color = "";
                var strength = "";
                switch (passed) {
                    case 0:
                    case 1:
                        // CssClass="label-danger label-default label-info label-primary label-success label-warning"
                        strength = " قدرت رمز عبور انتخابی ضعیف ";
                        //color = "red";
                        color = "label-danger";
                        break;
                    case 2:
                        strength = " قدرت رمز عبور انتخابی متوسط ";
                        //color = "darkorange";
                        color = "label-warning";
                        break;
                    case 3:
                        strength = " قدرت رمز عبور انتخابی مناسب ";
                        //color = "rgb(0, 255, 255)";
                        color = "label-info";
                        break;
                    case 4:
                        strength = " قدرت رمز عبور انتخابی خوب ";
                        //color = "green";
                        color = "label-success";
                        break;
                    case 5:
                        strength = " قدرت رمز عبور انتخابی ایمن ";
                        //color = "rgb(0, 77, 255)";
                        color = "label-primary";
                        break;
                    case 6:
                        strength = " قدرت رمز عبور انتخابی بسیار ایمن ";
                        //color = "darkgreen";
                        color = "label-success";
                        break;
                }
                password_strength.innerHTML = strength;
                //password_strength.style.color = color;
                password_strength.className = color;
                password_strength.style.display = block;
            }
        </script>

        <script>
            $('.toggle').click(function () {
                // Switches the Icon

                $(this).children('i').toggleClass('fa-pencil');
                // Switches the forms  
                $('.form').animate({
                    height: "toggle",
                    'padding-top': 'toggle',
                    'padding-bottom': 'toggle',
                    opacity: "toggle"
                }, "slow");
            });
        </script>
    </div>

</asp:Content>

