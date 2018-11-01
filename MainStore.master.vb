Imports System.Web.HttpBrowserCapabilities
Imports System.Net
Imports System.Net.NetworkInformation
Partial Class MainStore
    Inherits System.Web.UI.MasterPage
    Public Function GetMachinName() As String
        ' To find IP address of a machine behind LAN you can use this code
        Dim strHostName As String = Dns.GetHostName()
        Dim ipEntry As IPHostEntry = Dns.GetHostEntry(strHostName)
        GetMachinName = Convert.ToString(ipEntry.HostName)
    End Function
    Public Function GetUser_IP() As String
        Dim VisitorsIPAddr As String = String.Empty
        If (HttpContext.Current.Request.ServerVariables("HTTP_X_FORWARDED_FOR") <> "") Then
            VisitorsIPAddr = HttpContext.Current.Request.ServerVariables("HTTP_X_FORWARDED_FOR").ToString()
        ElseIf (HttpContext.Current.Request.UserHostAddress.Length <> 0) Then
            VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress
        End If
        GetUser_IP = VisitorsIPAddr

    End Function
    Public Function GetMACAddress() As String
        Dim nics As NetworkInterface() = NetworkInterface.GetAllNetworkInterfaces()
        Dim sMacAddress As String = String.Empty
        Dim Adapter As NetworkInterface
        For Each Adapter In nics

            If sMacAddress = String.Empty Then ' only Then Return MAC Address From first card  

                Dim properties As IPInterfaceProperties = Adapter.GetIPProperties()
                sMacAddress = Adapter.GetPhysicalAddress().ToString()
            End If
        Next
        GetMACAddress = sMacAddress
    End Function
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


        Try
            Dim browser As HttpBrowserCapabilities = Request.Browser
            Dim db = New LinqDBClassesDataContext
            Dim q = New UsersOnlineDetail
            q.Browser = browser.Browser
            q.Platform = browser.Platform
            q.DateAndTime = Now.ToLocalTime
            q.IPAddress = GetUser_IP()
            q.MachinName = GetMACAddress()
            q.Page = Request.CurrentExecutionFilePath
            db.UsersOnlineDetails.InsertOnSubmit(q)
            db.SubmitChanges()
        Catch ex As Exception
            Response.Write(ex.Message)
            Dim db = New LinqDBClassesDataContext
            Dim UserTable As New FaultLog
            UserTable.PageName = System.IO.Path.GetFileName(Request.CurrentExecutionFilePath)
            UserTable.ErrorMessage = ex.Message
            db.FaultLogs.InsertOnSubmit(UserTable)
            db.SubmitChanges()
        End Try

    End Sub

End Class

