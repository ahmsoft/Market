<%@ Page Title="" Language="VB" MasterPageFile="~/MainStore.master" AutoEventWireup="false" CodeFile="SignInUp.aspx.vb" Inherits="SignInUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="w3_login">
        <h3>ورود/ ثبت نام</h3>
        <div class="w3_login_module">
            <div class="module form-module">
                <div class="toggle">
                    <i class="fa fa-times fa-pencil"></i>
                    <div class="tooltip">مرا کلیک کن</div>
                </div>
                <div class="form">
                    <h2>وارد حساب کاربری خود شوید</h2>
                    <asp:TextBox ID="txtUsernameE" onKeyup="Ariv(event);" runat="server" ValidationGroup="Login" type="text" name="Username" placeholder="نام کاربری" required=" " />
                    <asp:TextBox ID="txtPassword" onKeyup="Ariv(event);" runat="server" ValidationGroup="Login" type="password" name="Password" placeholder="رمز عبور" required=" " />
                    <asp:CheckBox runat="server" onKeyup="Ariv(event);" ID="chk" CssClass="checkbox-inline" Style="color: rgba(0,0,0,0.7); margin-bottom: 15px;" Text="مرا به خاطر بسپار" type="checkbox" />
                    <asp:Button ID="btnArival" onKeyup="Ariv(event);" runat="server" OnClientClick="SignInValidation();" ValidationGroup="Login" value="ورود" Text="ورود" />
                </div>
                <div class="form">
                    <h2>ایجاد یک حساب کاربری</h2>
                    <asp:TextBox ID="txtNameAndFamily" onKeyup="Signupp(event);" runat="server" ValidationGroup="signup" type="text" name="Name" placeholder="نام و نام خانوادگی" />
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                        <asp:TextBox ID="txtEmail" onKeyup="Signupp(event);" runat="server" ValidationGroup="signup" type="email" name="Email" placeholder="ایمیل" AutoPostBack="True" />
                    </ContentTemplate>
            </asp:UpdatePanel>

                    <asp:TextBox ID="txtPass" onKeyup="Signupp(event);" runat="server" ValidationGroup="signup" type="password" name="Password" placeholder="رمز عبور" />
                    <asp:TextBox ID="txtRPass" onKeyup="Signupp(event);" runat="server" ValidationGroup="signup" type="password" name="Password" placeholder="تکرار رمز عبور" ControlToValidate="txtRPass" />
                    <%--                        <asp:TextBox ID="txtPhone" runat="server" ValidationGroup="signup" type="text" name="Phone" placeholder="تلفن" />--%>
                    <asp:Button ID="btnSignup" onKeyup="Signupp(event);" runat="server" OnClientClick="SignUpValidation();" ValidationGroup="signup" value="ثبت نام" Text="ثبت نام" />
                </div>
                <div class="cta"><a href="#">رمز عبور خود را فراموش کرده اید؟</a></div>
            </div>
            <center>
            <asp:Label ID="lblSignupSuccessLog" runat="server" CssClass="label-success" Visible="false" />
                <br/>
            <asp:Label ID="lblSignupErrorLog" runat="server" CssClass="label-danger" Visible="false" />
            </center>
        </div>
        <script>
            function Ariv(event) {
                if (event.keyCode == 13) {
                    $("#ContentPlaceHolder1_btnArival").click();
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
                document.getElementById("ContentPlaceHolder1_txtUsername").required = false;
                document.getElementById("ContentPlaceHolder1_txtPassword").required = false;
            }
            function SignInValidation() {
                document.getElementById("ContentPlaceHolder1_txtNameAndFamily").required = false;
                document.getElementById("ContentPlaceHolder1_txtUsername").required = true;
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

