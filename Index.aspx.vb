Imports System.Data.SqlClient
Imports System.Data
Partial Class _Index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
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
