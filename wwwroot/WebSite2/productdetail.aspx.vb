Imports System.Data
Imports System.Data.SqlClient

Partial Class productdetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim drProduct As SqlDataReader
        Dim strSQLStatement As String
        Dim cmdProduct As SqlCommand
        Dim strConnectionString As String = ConfigurationManager.ConnectionStrings("OnlineStoreConnectionString").ConnectionString
        strSQLStatement = "SELECT * FROM Product WHERE ProductID = " & CInt(Request.QueryString("ProductID"))
        Dim connProduct As New SqlConnection(strConnectionString)
        cmdProduct = New SqlCommand(strSQLStatement, connProduct)
        connProduct.Open()
        drProduct = cmdProduct.ExecuteReader()
        If drProduct.Read() Then
            lblProductName.Text = drProduct.Item("ProductName")
            lblPrice.Text = drProduct.Item("ProductPrice")
            lblNo.Text = drProduct.Item("ProductNo")
            imgProductDetail.ImageUrl = "image/product/" + Trim(drProduct.Item("ProductNo")) + ".jpg"
        End If
    End Sub

    Protected Sub btnAddToCart_Click(sender As Object, e As EventArgs) Handles btnAddToCart.Click
        '*** get CartID
        Dim lineTotal As Double
        Dim strCartID As String
        If HttpContext.Current.Request.Cookies("CartID") Is Nothing Then
            strCartID = GetRandomCartIDUsingGUID(10)
            Dim CookieTo As New HttpCookie("CartID", strCartID)
            HttpContext.Current.Response.AppendCookie(CookieTo)
            ' create expiration session variable
            'Session("cartlife") = "Y"
        Else
            Dim CookieBack As HttpCookie
            CookieBack = HttpContext.Current.Request.Cookies("CartID")
            strCartID = CookieBack.Value
        End If
        ' get other cart info
        Dim drProduct As SqlDataReader
        Dim strSQLStatement As String
        Dim cmdSQL As SqlCommand
        Dim strConnectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("OnlineStoreConnectionString").ConnectionString
        ' *** get product price
        strSQLStatement = "SELECT * FROM Product WHERE ProductNo = '" & LblNo.Text & "'"
        Dim conn As New SqlConnection(strConnectionString)
        cmdSQL = New SqlCommand(strSQLStatement, conn)
        conn.Open()
        drProduct = cmdSQL.ExecuteReader()
        Dim decPrice As Decimal
        If drProduct.Read() Then
            decPrice = drProduct.Item("ProductPrice")
        End If
        conn.Close()
        ' check if this product already exits in the cart
        Dim drCart As SqlDataReader
        Dim strSQLStatement2 As String
        Dim strSQLStatement3 As String
        Dim strSQLStatement4 As String
        Dim cmdSQL2 As SqlCommand
        Dim cmdSQL3 As SqlCommand
        Dim cmdSQL4 As SqlCommand
        strSQLStatement2 = "SELECT * FROM Cart WHERE CartID = '" & strCartID & "' and ProductNo = '" & Trim(LblNo.Text) & "'"
        'Response.Write(strSQLStatement2)
        Dim conn2 As New SqlConnection(strConnectionString)
        Dim conn3 As New SqlConnection(strConnectionString)
        cmdSQL4 = New SqlCommand(strSQLStatement2, conn2)

        conn2.Open()
        drCart = cmdSQL4.ExecuteReader()
        'Dim cartQty As Int32
        'Dim cartPrice As Decimal
        If drCart.Read() Then
            conn.Close()
            If tbQuantity.Text >= 1 Then
                Dim intQuantityNew As Integer = drCart.Item("Quantity") + CInt(tbQuantity.Text)
                'lineTotal = drCart.Item("Quantity") * drCart.Item("ProductPrice")
                conn2.Close()
                conn2.Open()
                strSQLStatement4 = "UPDATE [Cart] SET [Quantity] = '" & intQuantityNew & "' WHERE ([CartID] = '" & strCartID & "' AND [ProductNo] = '" & Trim(LblNo.Text) & "')"
                cmdSQL2 = New SqlCommand(strSQLStatement4, conn2)
                cmdSQL2.ExecuteNonQuery()
                conn2.Close()
            Else

            End If

        Else
            If tbQuantity.Text >= 1 Then
                conn3.Open()
                strSQLStatement3 = "INSERT INTO Cart (CartID, ProductNo, ProductName, ProductPrice, Quantity) VALUES('" & strCartID & "', '" & Trim(LblNo.Text) & "', '" & Trim(lblProductName.Text) & "'," & decPrice & " , " & CInt(tbQuantity.Text) & ")"
                cmdSQL3 = New SqlCommand(strSQLStatement3, conn3)
                cmdSQL3.ExecuteNonQuery()
                'lineTotal = drCart.Item("Quantity") * drCart.Item("ProductPrice")
                conn2.Close()
                conn3.Close()
            End If
        End If
        '*** Add up total price
        'strSQLStatement = "UPDATE [Cart] SET [lineTotal] =  '" & lineTotal & "' WHERE ([CartID] = '" & strCartID & "' AND [productNo] = '" & Trim(LblNo.Text) & "')"
        'cmdSQL = New SqlCommand(strSQLStatement, conn)
        'conn.Open()
        'drCart = cmdSQL.ExecuteReader(CommandBehavior.CloseConnection)
        'conn.Close()
        Response.Redirect("ViewCart.aspx")
        'MsgBox("finally")
    End Sub
    
    Private Function GetRandomCartIDUsingGUID(p1 As Integer) As String
        Dim random As New Random()
        Dim charOutput As Char() = New Char(p1 - 1) {}
        For i As Integer = 0 To p1 - 1
            Dim selector As Integer = random.[Next](65, 101)
            If selector > 90 Then
                selector -= 43
            End If
            charOutput(i) = Convert.ToChar(selector)
        Next
        Return New String(charOutput)
    End Function



  
End Class
