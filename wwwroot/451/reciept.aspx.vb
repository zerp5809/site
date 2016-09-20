Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.IO

Partial Class reciept
    Inherits System.Web.UI.Page
    Dim strSQLStatment3 As String
    Private Property cmdSQL2 As SqlCommand
    
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim strCartID As String
        Dim CookieBack As HttpCookie
        Dim strConnectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("OnlineStoreConnectionString").ConnectionString
        '*** get CartID
        Dim drCart As SqlDataReader
        Dim dr As SqlDataReader
        Dim drr As SqlDataReader
        CookieBack = HttpContext.Current.Request.Cookies("CartID")
        strCartID = CookieBack.Value
        SqlDSCart1.SelectCommand = "Select * From Cart Where CartID = '" & strCartID & "'"
        Dim strSQLStatement As String
        Dim strSQLStatement2 As String
        Dim conn As New SqlConnection(strConnectionString)
        Dim conn2 As New SqlConnection(strConnectionString)
        Dim conn3 As New SqlConnection(strConnectionString)
        Dim conn4 As New SqlConnection(strConnectionString)
        Dim cmdSQL3 As SqlCommand
        Dim cmdSQL As SqlCommand
        conn.Open()
        strSQLStatement = "SELECT * FROM Cart WHERE CartID = '" & strCartID & "'"
        cmdSQL = New SqlCommand(strSQLStatement, conn)
        drCart = cmdSQL.ExecuteReader()
        Dim taxRate = 0.0875
        Dim totalTax As Decimal

        If drCart.Read() Then

        Else
            lblSubtotal.Text = "$0.00"
        End If
        strSQLStatement2 = "Select sum(quantity * productPrice) as total FROM Cart where cartid= '" & strCartID & "'"
        conn2.Open()
        cmdSQL = New SqlCommand(strSQLStatement2, conn2)
        dr = cmdSQL.ExecuteReader()
        If dr.Read Then
            Try
                lblSubtotal.Text = FormatCurrency(dr.Item("total"))
                totalTax = dr.Item("total") * taxRate
                lblTax.Text = FormatCurrency(totalTax)
                lblTotal.Text = FormatCurrency(totalTax + dr.Item("total"))
            Catch cx As InvalidCastException
                lblSubtotal.Text = "$0.00"
                lblTax.Text = "$0.00"
                lblTotal.Text = "$0.00"
            End Try
        End If
        conn.Close()
        conn2.Close()


        strSQLStatement2 = "SELECT * FROM [CustomerInformation] where cartid = '" & strCartID & "'"

        cmdSQL2 = New SqlCommand(strSQLStatement2, conn3)

        strSQLStatment3 = "Delete from Cart where CartID = '" & strCartID & "'"
        cmdSQL3 = New SqlCommand(strSQLStatment3, conn4)
        conn3.Open()
        drr = cmdSQL2.ExecuteReader()
        lblDate.Text = "Order Date: " & Date.Today
        If drr.Read Then
            lblOrderID.Text = "Order ID: " & strCartID
            lblName.Text = "Name On Order: " & drr.Item("FirstName") & " " & drr.Item("LastName")
            lblCompanyName.Text = "Company Name: " & drr.Item("CompanyName")
            lblAddress.Text = "Address On Order: " & drr.Item("Address") & " " & drr.Item("Address2")
            lblPhone.Text = "Phone On Order: " & drr.Item("Phone")
            strSQLStatement2 = "DELETE From [CustomerInformation] Where cartid = '" & strCartID & "'"
            'email customer
            Dim smtpClient As SmtpClient = New SmtpClient()
            Dim MyMail As MailMessage = New MailMessage()
            Dim fromAddress As MailAddress = New MailAddress("sdyang.cis451@gmail.com")
            Dim toAddress As MailAddress = New MailAddress(drr.Item("Email"))
            'Dim toAddress1 As MailAddress = New MailAddress("")
            'Dim toAddress2 As MailAddress = New MailAddress("")
            MyMail.From = fromAddress
            MyMail.To.Add(toAddress)
            MyMail.Subject = "Order Receipt" + " - Message sent"
            Using sw As New StringWriter()
                Using hw As New HtmlTextWriter(sw)
                    gvCart.RenderControl(hw)
                    Dim sr As New StringReader(sw.ToString())
                    MyMail.Body = "Thank you for your order. <br /> Here is your order information: <br /><br> " & lblName.Text & "<br />" & lblAddress.Text & "<br /> " & lblPhone.Text & sw.ToString() & "<br /> Subtotal: " & lblSubtotal.Text & "<br /> Taxes: " & FormatCurrency(totalTax) & "<br /> Grand Total: " & lblTotal.Text
                    MyMail.IsBodyHtml = True
                    Dim SMTP As New SmtpClient("smtp.gmail.com")
                    SMTP.EnableSsl = True
                    SMTP.Credentials = New System.Net.NetworkCredential("sdyang.cis451@gmail.com", "cis4512015")
                    SMTP.Port = 587
                    SMTP.Send(MyMail)
                End Using
            End Using
            cmdSQL2 = New SqlCommand(strSQLStatement2, conn3)
            conn4.Open()
            cmdSQL3.ExecuteNonQuery()
            conn3.Close()
            conn3.Open()
            cmdSQL2.ExecuteNonQuery()
            conn3.Close()
            conn4.Close()
        End If
    End Sub
    Dim linetotal As Double
    Protected Function CalculateSubTotal(ByVal Quantity As Integer, ByVal ProductPrice As Double) As Decimal
        'Dim subtotal As Double

        linetotal = Quantity * ProductPrice
        Return linetotal
        'subtotal += linetotal
        'Return subtotal
    End Function
    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Confirms that an HtmlForm control is rendered for the specified ASP.NET
        '     server control at run time. 

    End Sub
End Class
