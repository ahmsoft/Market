<%@ Application Language="VB" %>
<script RunAt="server">
    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
        Application("visToday") = 0
        Dim db = New LinqDBClassesDataContext
        Dim Vis = From m In db.Visitors
                  Select m

        For Each m In Vis
            Application("vis") = m.AllVisitor
        Next
        RegisterRoutes(Routing.RouteTable.Routes)
    End Sub
    Sub RegisterRoutes(routes As Routing.RouteCollection)
        routes.MapPageRoute("", "PostView/{Action}/{Title}", "~/PostView.aspx")
        routes.MapPageRoute("", "Order", "~/OrderSite.aspx")
        routes.MapPageRoute("", "SearchResult/{Title}", "~/SearchResult.aspx")
        routes.MapPageRoute("", "FAQ", "~/FAQView.aspx")
        routes.MapPageRoute("", "Contact", "~/ContactView.aspx")
        routes.MapPageRoute("", "Home", "~/Index.aspx")
        routes.MapPageRoute("", "Posts", "~/Default.aspx")
        routes.MapPageRoute("", "About", "~/About.aspx")
        routes.MapPageRoute("", "Biography", "~/Biography.aspx")
        routes.MapPageRoute("", "News", "~/ShowNews.aspx")
        routes.MapPageRoute("", "Products", "~/Products.aspx")
        routes.MapPageRoute("", "Login", "~/SignInUp.aspx")
        routes.MapPageRoute("", "SignIn", "~/SignIn.aspx")
        routes.MapPageRoute("", "Error", "~/ErrorPage.aspx")

        routes.MapPageRoute("", "Market", "~/Index.aspx")
        routes.MapPageRoute("", "Buying", "~/Customer/Buying.aspx")
        routes.MapPageRoute("", "Products/{CatName}/{IDCat}", "~/Products.aspx")
        routes.MapPageRoute("", "Products/{CatName}/{ProductName}/{ProductID}", "~/ProductView.aspx")
        routes.MapPageRoute("", "UserVerification/{ActivationCode}", "~/UserVerification.aspx")
        routes.MapPageRoute("", "Login", "~/SignInUp.aspx")

        routes.MapPageRoute("", "AP", "~/Admin/AdminPanel.aspx")
        routes.MapPageRoute("", "Exit", "~/Admin/ProgressLogout.aspx")
        routes.MapPageRoute("", "UM", "~/Admin/Upload.aspx")
        routes.MapPageRoute("", "PM", "~/Admin/MessageManagement.aspx")
        routes.MapPageRoute("", "NPM", "~/Admin/NewsManagement.aspx")
        routes.MapPageRoute("", "AM", "~/Admin/AboutManagement.aspx")
        routes.MapPageRoute("", "DPM", "~/Admin/DynamicPageManagement.aspx")
        routes.MapPageRoute("", "FAQM", "~/Admin/FAQManagement.aspx")
    End Sub
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        Application.Lock()
        Application("OnlineUsers") = Convert.ToInt64(Application("OnlineUsers")) + 1
        Application.UnLock()
        ' Code that runs when a new session is started
        Dim counter1 As Int64
        counter1 = Convert.ToInt64(Application("visToday")) + 1
        Application("visToday") = counter1
        Dim counter As Int64
        counter = Convert.ToInt64(Application("Vis")) + 1
        Application("Vis") = counter
        Try
            Dim db = New LinqDBClassesDataContext
            Dim q = New Visitor
            q.AllVisitor = Application("Vis")
            q.Today = Application("visToday")
            db.Visitors.InsertOnSubmit(q)
            db.SubmitChanges()

        Catch ex As Exception
        End Try
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
        Application.Lock()
        Application("OnlineUsers") = Convert.ToInt64(Application("OnlineUsers")) - 1
        Application.UnLock()
    End Sub

</script>
