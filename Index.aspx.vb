Imports System.Data.SqlClient
Imports System.Data
Partial Class _Index
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
            lblMenuCat.Text = ""
            lblMenuCat.CssClass = "nav navbar-nav nav_1"
            Dim db1 = New LinqDBClassesDataContext
            Dim qry = From m In db1.Categories
                      Select m Order By
                                   m.CatName
            For Each q In qry
                lblMenuCat.Text += "<li><a title='" + q.Description.ToString + "' href='/Products/" + q.CatName.Replace(" ", "-").ToString + "/" + q.IDCat.ToString + "'>" + q.CatName.ToString + "</a></li>"

            Next

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
End Class
