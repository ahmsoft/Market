﻿
Partial Class Buying
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            Dim lblUserStatus As Label = Master.FindControl("lblUserStatus")
            If HttpContext.Current.User.Identity.IsAuthenticated Then
                Dim db = New LinqDBClassesDataContext
                Dim qry = From m In db.UserMarkets
                          Select m Where m.Email = HttpContext.Current.User.Identity.Name.ToString.Substring(0, HttpContext.Current.User.Identity.Name.ToString.Length - 2)
                For Each q In qry
                    lblUserStatus.Text = "<ul class='dropdown-menu drp-mnu' style='width:300px;'><li style='border: 1px;color: rgb(155, 255, 155);border-color: rgb(245, 245, 245);background-color: rgb(112, 112, 112);border-style: solid;border-radius: 7px 7px 0px 0px;font-size: large;margin-top: -21px;padding: 10px;'><img src='/AdminComponents/bower_components/Ionicons/png/512/android-social-user.png' width=10px /> " + q.NameAndFamily + "</li><li></li><li><a href='#'>اطلاعات پروفایل</a></li><li><a href='Logout'>خروج از حساب کاربری</a></li></ul>"
                    Exit Try
                Next
            Else

                lblUserStatus.Text = "<ul class='dropdown-menu drp-mnu'><li><a href='Login'>ورود</a></li><li><a href='Login'>ثبت نام</a></li></ul>"
                Exit Try
            End If
            'lblUserStatus.Text = "<li>حساب " + q.NameAndFamily + "</li><li></li><li><a href='#'>اطلاعات پروفایل</a></li><li><a href='Logout'>خروج از حساب کاربری</a></li>"

        Catch ex As Exception
            Response.Redirect(ex.Message)
        End Try
        Try
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.UserMarkets
                      Select m Where m.Email = HttpContext.Current.User.Identity.Name.ToString.Substring(0, HttpContext.Current.User.Identity.Name.ToString.Length - 2)
            For Each q In qry
                txtAddress.Text = q.Address
                txtEmail.Text = q.Email
                txtMobile.Text = q.Phone
                txtNameAndFamily.Text = q.NameAndFamily
            Next
        Catch ex As Exception
            Response.Redirect(ex.Message)
        End Try
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim db = New LinqDBClassesDataContext
        Dim User = New User
        Dim Factor = New Sale
        Dim rands As New Random
        Dim peygiricode As String
        Dim qry = From m In db.Users
                  Select m Where m.Username = HttpContext.Current.User.Identity.Name.ToString.Substring(0, HttpContext.Current.User.Identity.Name.ToString.Length - 2)
        For Each q In qry
            Factor.Username = q.Username
            Factor.Phone = q.Phone
            Factor.Email = q.Email
            Factor.PeygiriCode = rands.Next(1000000, 9999999)
            peygiricode = Factor.PeygiriCode
            'Factor.Address=txtAddress.Text
            'Factor.Map =txtMap.Text
            'Factor.DateAndTime = txtDateAndTime.Text
            db.Sales.InsertOnSubmit(Factor)
            db.SubmitChanges()
            Dim f() As String
            Dim t As Integer = 0
            For Each i In OrderItem.Value.Split(";")
                Dim SoldProduc = New SoldProduct
                t = 0
                f = i.Split("-")
                If i = "" Then
                    Exit For
                End If
                SoldProduc.IDS = Convert.ToInt32(Factor.IDS)
                SoldProduc.IDP = f(t)
                t += 2
                SoldProduc.Quantity = f(t)
                SoldProduc.TotalPrice = f(t - 1) * f(t)
                db.SoldProducts.InsertOnSubmit(SoldProduc)
                db.SubmitChanges()
                't += 3
            Next
            btnSave.Visible = False
            lblRequest.Text = " درخواست خرید شما با شماره پیگیری" + " " + peygiricode + Convert.ToString(Factor.IDS) + " " + " ارسال شد. لطفا منتظر تماس ما باشید."
            lblRequest.Visible = True
        Next
    End Sub
End Class