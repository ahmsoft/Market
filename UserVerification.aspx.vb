
Partial Class UserVerification
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            Dim Code As String = Page.RouteData.Values("ActivationCode").ToString()
            Dim status As Integer = 0
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.UserMarkets
                      Select m Where m.ActiveCode = Code
            For Each q In qry
                If q.Active = False Then
                    q.Active = True
                    status = 1 'lblSuccess.Text = " حساب با موفقیت فعال گردید. "
                Else
                    status = 2  'lblSuccess.CssClass = "label-warning"   &  lblSuccess.Text = " این حساب قبلا فعال گردیده. "
                End If
                'q.ActiveCode = "Actived"
            Next
            db.SubmitChanges()
            Select Case status
                Case 1
                    lblStatus.CssClass = "label-success"
                    lblStatus.Text = " حساب با موفقیت فعال گردید. "
                Case 2
                    lblStatus.CssClass = "label-warning"
                    lblStatus.Text = " این حساب قبلا فعال گردیده. "
                Case Else
                    lblStatus.CssClass = "label-danger"
                    lblStatus.Text = " لینک فعال سازی نامعتبر است. "
            End Select
            lblStatus.Visible = True
            Exit Try
            'Response.Write("Your Account Actived.")
        Catch ex As Exception
            lblStatus.CssClass = "label-danger"
            lblStatus.Text = " لینک فعال سازی نامعتبر است. "
            lblStatus.Visible = True
            Exit Try
        End Try
        'Response.Redirect("Login")
    End Sub
End Class
