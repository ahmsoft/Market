
Partial Class Buying
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.Users
                      Select m Where m.Username = HttpContext.Current.User.Identity.Name.ToString.Substring(0, HttpContext.Current.User.Identity.Name.ToString.Length - 2)
            For Each q In qry
                txtAddress.Text = q.Address
                txtEmail.Text = q.Email
                txtMobile.Text = q.Phone
                txtNameAndFamily.Text = q.Name + " " + q.Family
            Next
        Catch ex As Exception
            Response.Redirect(ex.Message)
        End Try
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim db = New LinqDBClassesDataContext
        Dim User = New User
        Dim Factor = New Sale
        Dim qry = From m In db.Users
                  Select m Where m.Username = HttpContext.Current.User.Identity.Name.ToString.Substring(0, HttpContext.Current.User.Identity.Name.ToString.Length - 2)
        For Each q In qry
            Factor.Username = q.Username
            Factor.Phone = q.Phone
            Factor.Email = q.Email
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
        Next
    End Sub
End Class