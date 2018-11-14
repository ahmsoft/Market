Imports System.Net
Imports System.Net.Mail
Partial Class SignInUp
    Inherits System.Web.UI.Page
    Protected Sub btnArival_Click(sender As Object, e As EventArgs) Handles btnArival.Click
        Dim db = New LinqDBClassesDataContext
        Dim Users = From m In db.Users
                    Select m Where m.Email = txtUsernameE.Text And m.Password = txtPassword.Text
        For Each m In Users
            If m.Supervisor = 1 Then
                'System.Web.Security.Roles.CreateRole("Admin")
                System.Web.Security.FormsAuthentication.RedirectFromLoginPage(m.Username.ToString() + " 1", chk.Checked)
            End If
        Next
        Dim UserMarket = From m In db.UserMarkets
                         Select m Where m.Email = txtUsernameE.Text And m.Password = txtPassword.Text
        For Each m In UserMarket
            'System.Web.Security.Roles.CreateRole("Client")
            System.Web.Security.FormsAuthentication.RedirectFromLoginPage(m.Email.ToString() + " 0", chk.Checked)
        Next

    End Sub
    Protected Sub btnSignup_Click(sender As Object, e As EventArgs) Handles btnSignup.Click
        Try
            Try
                Dim db = New LinqDBClassesDataContext
                Dim qry = From m In db.UserMarkets
                          Select m Where m.Email = txtEmail.Text
                For Each p In qry
                    Exit Sub
                Next
                Dim q = New UserMarket
                Dim ActiveCode As String
                Dim ActivationCode As New Random
                q.NameAndFamily = txtNameAndFamily.Text
                q.Email = txtEmail.Text
                q.Password = txtPass.Text
                q.ActiveCode = ActivationCode.Next(100000000, 999999999)
                ActiveCode = q.ActiveCode
                q.Active = False
                db.UserMarkets.InsertOnSubmit(q)
                db.SubmitChanges()

                Try
                    Dim mail As New MailMessage
                    mail.From = New MailAddress("info@ariyasoft.com")
                    mail.To.Add(New MailAddress(txtEmail.Text))
                    mail.Subject = "فعال سازی حساب آریا مارکت"
                    mail.Body = "<div style='background-color: #f5f5f5;width: 100%;margin: 0;padding: 10px 0 10px 0;direction: rtl;font-family: Tahoma;'><img style='display:block;margin:auto;' src='http://www.ariyasoft.com/Lamonte/images/logo.png' /><div style='background-color:#ffffff;width:600px;margin:auto;border-radius:15px 15px 8px 8px;border: 1px solid rgb(85, 125, 161);'><div style='background-color:rgb(85, 125, 161); width:600px;height:60px;margin:auto;border-radius:8px 8px 0px 0px;'><span style='color: #ffffff;margin:0;padding: 20px 20px;display: block;font-size: 20px;font-weight: bold;font-family: Tahoma;'>به آریا مارکت خوش آمدید</span></div><h4 style='padding:5px 5px 5px 5px;'>با عرض سلام و احترام</h4><p style='text-align: justify;padding:15px 15px 15px 15px;'>ضمن تشکر و قدردانی از انتخاب شما، لطفا جهت فعال سازی حساب آریا مارکت خود روی لینک <a href='http://www.market.ariyasoft.com/UserVerification/" + q.ActiveCode + "'>فعالسازی</a> کلیک نمایید و یا آدرس لینک زیر را در نوار آدرس خود کپی و سپس کلید Enter را فشار دهید.<br /><br /><span style='direction:ltr;'>آدرس فعال سازی حساب شما: </span><a style='text-align:left;display:block;margin:auto;' href='http://www.market.ariyasoft.com/UserVerification/" + q.ActiveCode + "'>http://www.market.ariyasoft.com/UserVerification/" + q.ActiveCode + "</a><br/><br/>ضمنا نام کاربری و رمز عبور شما جهت خرید از آریا مارکت به قرار زیر است:<br/>نام کاربری:" + q.Email + "<br/>رمز عبور:" + q.Password + "<br/></p><img style='display:block;margin:auto;width:150px;' src='http://www.ariyasoft.com/Uploads/logo-ahmsoft.png' /></div></div>"
                    mail.IsBodyHtml = True
                    Dim smtp As New SmtpClient
                    smtp.Host = "javid.dnswebhost.com "
                    smtp.Port = 25
                    'smtp.EnableSsl = False
                    smtp.UseDefaultCredentials = False
                    smtp.Credentials = New NetworkCredential("info@ariyasoft.com", "00000110AHMSoft")
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network
                    smtp.Send(mail)
                Catch ex As Exception
                    Try
                        'Response.Write(ex.Message)
                        Dim mail As New MailMessage
                        mail.From = New MailAddress("info@ariyasoft.com")
                        mail.To.Add(New MailAddress(txtEmail.Text))
                        mail.Subject = "فعال سازی حساب آریا مارکت"
                        mail.Body = "<div style='background-color: #f5f5f5;width: 100%;margin: 0;padding: 10px 0 10px 0;direction: rtl;font-family: Tahoma;'><img style='display:block;margin:auto;' src='http://www.ariyasoft.com/Lamonte/images/logo.png' /><div style='background-color:#ffffff;width:600px;margin:auto;border-radius:15px 15px 8px 8px;border: 1px solid rgb(85, 125, 161);'><div style='background-color:rgb(85, 125, 161); width:600px;height:60px;margin:auto;border-radius:8px 8px 0px 0px;'><span style='color: #ffffff;margin:0;padding: 20px 20px;display: block;font-size: 20px;font-weight: bold;font-family: Tahoma;'>به آریا مارکت خوش آمدید</span></div><h4 style='padding:5px 5px 5px 5px;'>با عرض سلام و احترام</h4><p style='text-align: justify;padding:15px 15px 15px 15px;'>ضمن تشکر و قدردانی از انتخاب شما، لطفا جهت فعال سازی حساب آریا مارکت خود روی لینک <a href='http://www.market.ariyasoft.com/UserVerification/" + q.ActiveCode + "'>فعالسازی</a> کلیک نمایید و یا آدرس لینک زیر را در نوار آدرس خود کپی و سپس کلید Enter را فشار دهید.<br /><br /><span style='direction:ltr;'>آدرس فعال سازی حساب شما: </span><a style='text-align:left;display:block;margin:auto;' href='http://www.market.ariyasoft.com/UserVerification/" + q.ActiveCode + "'>http://www.market.ariyasoft.com/UserVerification/" + q.ActiveCode + "</a><br/><br/>ضمنا نام کاربری و رمز عبور شما جهت خرید از آریا مارکت به قرار زیر است:<br/>نام کاربری:" + q.Email + "<br/>رمز عبور:" + q.Password + "<br/></p><img style='display:block;margin:auto;width:150px;' src='http://www.ariyasoft.com/Uploads/logo-ahmsoft.png' /></div></div>"
                        mail.IsBodyHtml = True
                        Dim smtp As New SmtpClient
                        smtp.Host = "javid.dnswebhost.com "
                        smtp.Port = 26
                        'smtp.EnableSsl = False
                        smtp.UseDefaultCredentials = False
                        smtp.Credentials = New NetworkCredential("info@ariyasoft.com", "00000110AHMSoft")
                        smtp.DeliveryMethod = SmtpDeliveryMethod.Network
                        smtp.Send(mail)
                    Catch ex1 As Exception
                        'Response.Write(ex1.Message)
                        Try
                            Response.Write(ex.Message)
                            Dim mail As New MailMessage
                            mail.From = New MailAddress("info@ariyasoft.com")
                            mail.To.Add(New MailAddress(txtEmail.Text))
                            mail.Subject = "فعال سازی حساب آریا مارکت"
                            mail.Body = "<div style='background-color: #f5f5f5;width: 100%;margin: 0;padding: 10px 0 10px 0;direction: rtl;font-family: Tahoma;'><img style='display:block;margin:auto;' src='http://www.ariyasoft.com/Lamonte/images/logo.png' /><div style='background-color:#ffffff;width:600px;margin:auto;border-radius:15px 15px 8px 8px;border: 1px solid rgb(85, 125, 161);'><div style='background-color:rgb(85, 125, 161); width:600px;height:60px;margin:auto;border-radius:8px 8px 0px 0px;'><span style='color: #ffffff;margin:0;padding: 20px 20px;display: block;font-size: 20px;font-weight: bold;font-family: Tahoma;'>به آریا مارکت خوش آمدید</span></div><h4 style='padding:5px 5px 5px 5px;'>با عرض سلام و احترام</h4><p style='text-align: justify;padding:15px 15px 15px 15px;'>ضمن تشکر و قدردانی از انتخاب شما، لطفا جهت فعال سازی حساب آریا مارکت خود روی لینک <a href='http://www.market.ariyasoft.com/UserVerification/" + q.ActiveCode + "'>فعالسازی</a> کلیک نمایید و یا آدرس لینک زیر را در نوار آدرس خود کپی و سپس کلید Enter را فشار دهید.<br /><br /><span style='direction:ltr;'>آدرس فعال سازی حساب شما: </span><a style='text-align:left;display:block;margin:auto;' href='http://www.market.ariyasoft.com/UserVerification/" + q.ActiveCode + "'>http://www.market.ariyasoft.com/UserVerification/" + q.ActiveCode + "</a><br/><br/>ضمنا نام کاربری و رمز عبور شما جهت خرید از آریا مارکت به قرار زیر است:<br/>نام کاربری:" + q.Email + "<br/>رمز عبور:" + q.Password + "<br/></p><img style='display:block;margin:auto;width:150px;' src='http://www.ariyasoft.com/Uploads/logo-ahmsoft.png' /></div></div>"
                            mail.IsBodyHtml = True
                            Dim smtp As New SmtpClient
                            smtp.Host = "javid.dnswebhost.com "
                            smtp.Port = 465
                            'smtp.EnableSsl = True
                            smtp.UseDefaultCredentials = False
                            smtp.Credentials = New NetworkCredential("info@ariyasoft.com", "00000110AHMSoft")
                            smtp.DeliveryMethod = SmtpDeliveryMethod.Network
                            smtp.Send(mail)
                        Catch ex2 As Exception
                            Response.Write(ex2.Message)
                            lblSignupErrorLog.CssClass = "label-danger"
                            lblSignupErrorLog.Text = "مشکل ارسال ایمیل فعال سازی از سمت سرور. لطفا با پشتیبانی تماس بگیرید."
                            lblSignupErrorLog.Visible = True
                        End Try
                    End Try
                End Try

                lblSignupSuccessLog.CssClass = "label-success"
                lblSignupSuccessLog.Text = "ثبت نام شما با موفقیت انجام شد. لطفا ایمیل خود را چک نمایید و بر روی لینک فعالسازی حساب خود کلیک نمایید."
                lblSignupSuccessLog.Visible = True
                '------------------------------------------------------
            Catch ex As Exception
                Response.Write(ex.Message)
                lblSignupErrorLog.CssClass = "label-danger"
                lblSignupErrorLog.Text += "ثبت نام ناموفق"
                lblSignupErrorLog.Visible = True
            End Try
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub txtEmail_TextChanged(sender As Object, e As EventArgs) Handles txtEmail.TextChanged
        Dim db = New LinqDBClassesDataContext
        Dim qry = From m In db.UserMarkets
                  Select m Where m.Email <> txtEmail.Text
        For Each p In qry
            txtEmail.Style.Value = "color:black;"
        Next
        qry = From m In db.UserMarkets
              Select m Where m.Email = txtEmail.Text
        For Each p In qry
            Dim OldEmail As String
            OldEmail = txtEmail.Text
            txtEmail.Style.Value = "color:red;"
            txtEmail.Text = "ایمیل وارد شده قبلا ثبت شده است."
            Beep()
        Next
    End Sub
End Class
