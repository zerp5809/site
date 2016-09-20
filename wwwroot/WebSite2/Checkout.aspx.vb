Imports System.Net
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient


Partial Class Checkout
    Inherits System.Web.UI.Page
    Dim strCartID As String
    Dim CookieBack As HttpCookie
    Dim strConnectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("OnlineStoreConnectionString").ConnectionString
    Dim drr As SqlDataReader
        
    Dim firstName As String
    Dim lastName As String
    Dim CompanyName As String
    Dim Address As String
    Dim Address2 As String
    Dim City As String
    Dim ZipCode As String
    Dim State As String
    Dim Email As String
    Dim Phone As String
    Dim cFirstName As String
    Dim cLastName As String
    Dim CreditCard As String
    Dim CVV As String
    Dim Year As String
    Dim curYear As String
    Dim Expire As String
    Dim Expire2 As String
    Dim today As String
    Dim approved As Boolean
    Dim orderTotal As Double
    Dim strSQLStatement3 As String
    Dim cmdSQL2 As SqlCommand
    Dim conn3 As New SqlConnection(strConnectionString)
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        For i As Integer = 0 To 10
            ddlYear.Items.Add(System.DateTime.Now.AddYears(i).Year)
        Next
        
        '*** get CartID
        Dim drCart As SqlDataReader
        Dim dr As SqlDataReader
        CookieBack = HttpContext.Current.Request.Cookies("CartID")
        strCartID = CookieBack.Value
        SqlDSCart1.SelectCommand = "Select * From Cart Where CartID = '" & strCartID & "'"
        Dim strSQLStatement As String
        Dim strSQLStatement2 As String
        
        Dim conn As New SqlConnection(strConnectionString)
        Dim conn2 As New SqlConnection(strConnectionString)
        Dim conn3 As New SqlConnection(strConnectionString)
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
        orderTotal = totalTax + dr.Item("total")

    End Sub


    Protected Sub btnCheckout_Click(sender As Object, e As EventArgs) Handles btnCheckout.Click
        Try
            firstName = tbFirstName.Text
            lastName = tbLastName.Text
            CompanyName = tbCompanyname.Text
            Address = tbAddress.Text
            Address2 = tbAddress.Text
            City = tbCity.Text
            ZipCode = tbZipCode.Text
            State = ddlState.Text
            Email = tbEmail.Text
            Phone = tbPhone.Text
            cFirstName = tbCFirstName.Text
            cLastName = tbCLastName.Text
            CreditCard = tbCreditCard.Text
            CVV = tbCVV.Text
            Year = ddlYear.SelectedItem.Text.Substring(2)

            Expire = ddlMonth.SelectedItem.Text & Year
            Expire2 = Year & ddlMonth.SelectedItem.Text
            test.Text = Expire
            strSQLStatement3 = "Insert into CustomerInformation (FirstName, LastName, CompanyName, Address, Address2, City, ZipCode, State, Email, Phone, cartid) Values ('" & firstName & "', '" & lastName & "', '" & CompanyName & "', '" & Address & "', '" & Address2 & "', '" & City & "', '" & ZipCode & "', '" & State & "', '" & Email & "', '" & Phone & "', '" & strCartID & "')"
            conn3.Open()
            cmdSQL2 = New SqlCommand(strSQLStatement3, conn3)
            cmdSQL2.ExecuteNonQuery()
        Catch cx As ArgumentOutOfRangeException
        End Try
        today = Format(Date.Today, "yyMM")

        If Convert.ToInt32(Expire2) > Convert.ToInt32(today) Then


            ' test server
            Dim post_url As String = "https://test.authorize.net/gateway/transact.dll"

            ' name/value pairs
            Dim post_values As New Dictionary(Of String, String)
            post_values.Add("x_login", "2q4y6KVpmMSB")  ' your login ID
            post_values.Add("x_tran_key", "6JZr862853jPqA7J")  ' your transaction key
            post_values.Add("x_delim_data", "TRUE")
            post_values.Add("x_delim_char", ",")
            post_values.Add("x_relay_response", "FALSE")
            post_values.Add("x_type", "AUTH_CAPTURE")
            post_values.Add("x_method", "CC")
            post_values.Add("x_card_num", CreditCard)
            post_values.Add("x_exp_date", Expire)
            post_values.Add("x_amount", orderTotal)
            post_values.Add("x_description", "Sample Transaction")
            post_values.Add("x_first_name", cFirstName)
            post_values.Add("x_last_name", cLastName)
            post_values.Add("x_address", tbAddress.Text)
            post_values.Add("x_state", State)
            post_values.Add("x_zip", ZipCode)
            post_values.Add("x_email", Email)

            ' converts them to the proper format "x_login=username&x_tran_key=a1B2c3D4"
            Dim post_string As String = ""
            For Each field As KeyValuePair(Of String, String) In post_values
                post_string &= field.Key & "=" & HttpUtility.UrlEncode(field.Value) & "&"
            Next
            post_string = Left(post_string, Len(post_string) - 1)

            ' create an HttpWebRequest object to communicate with Authorize.net
            Dim objRequest As HttpWebRequest = CType(WebRequest.Create(post_url), HttpWebRequest)
            objRequest.Method = "POST"
            objRequest.ContentLength = post_string.Length
            objRequest.ContentType = "application/x-www-form-urlencoded"

            ' send the data in a stream
            Dim myWriter As StreamWriter = Nothing
            myWriter = New StreamWriter(objRequest.GetRequestStream())
            myWriter.Write(post_string)
            myWriter.Close()

            ' create an HttpWebRequest object to process the returned values in a stream and convert it into a string
            Dim objResponse As HttpWebResponse = CType(objRequest.GetResponse(), HttpWebResponse)
            Dim responseStream As New StreamReader(objResponse.GetResponseStream())
            Dim post_response As String = responseStream.ReadToEnd()
            responseStream.Close()

            ' break the response string into an array
            Dim response_array As Array = Split(post_response, post_values("x_delim_char"), -1)

            ' the results are output to the screen in the form of an html numbered list.
            'Response.Write("<OL>")
            'For Each value In response_array
            '    Response.Write("<LI>" & value & "&nbsp;</LI>" & vbCrLf)
            '    'resultSpan.InnerHtml += "<LI>" & value & "&nbsp;</LI>" & vbCrLf
            'Next
            'Response.Write("</OL>")
            approved = True
        Else
            ExpiryValidator.Text = "This Credit Card has expired"
            approved = False
        End If
        'Response.AddHeader("REFRESH", "10;URL=reciept.aspx")
        If approved Then
            Response.Redirect("reciept.aspx")
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
End Class

