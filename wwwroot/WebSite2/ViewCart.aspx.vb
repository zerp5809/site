Imports System.Data
Imports System.Data.SqlClient

Partial Class ViewCart
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        '*** get CartID
        Dim drCart As SqlDataReader
        Dim dr As SqlDataReader
        Dim strCartID As String
        Dim CookieBack As HttpCookie
        Dim strConnectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("OnlineStoreConnectionString").ConnectionString

        CookieBack = HttpContext.Current.Request.Cookies("CartID")
        strCartID = CookieBack.Value
        SqlDSCart1.SelectCommand = "Select * From Cart Where CartID = '" & strCartID & "'"
        SqlDSCart2.SelectCommand = "Select * From Cart Where CartID = '" & strCartID & "'"
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
                lblTotal.Text = FormatCurrency(dr.Item("total"))
            Catch cx As InvalidCastException
                lblSubtotal.Text = "$0.00"
                lblTotal.Text = "$0.00"
            End Try
        End If
    End Sub
    Protected Sub emptyCart_Click(sender As Object, e As EventArgs) Handles emptyCart.Click
        Dim strCartID As String
        Dim CookieBack As HttpCookie
        CookieBack = HttpContext.Current.Request.Cookies("CartID")
        strCartID = CookieBack.Value
        SqlDSCart1.SelectCommand = "Select * From Cart Where (CartID = '" & strCartID & "')"
        Dim strSQLStatement As String
        Dim strConnectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("OnlineStoreConnectionString").ConnectionString
        Dim conn As New SqlConnection(strConnectionString)
        Dim cmdSQL As SqlCommand
        conn.Open()
        strSQLStatement = "DELETE FROM [Cart] WHERE (CartID = '" & strCartID & "')"
        cmdSQL = New SqlCommand(strSQLStatement, conn)
        cmdSQL.ExecuteNonQuery()
        conn.Close()
        Response.Redirect("ViewCart.aspx")
    End Sub

    Dim linetotal As Double
    Protected Function CalculateSubTotal(ByVal Quantity As Integer, ByVal ProductPrice As Double) As Decimal
        'Dim subtotal As Double

        linetotal = Quantity * ProductPrice
        Return linetotal
        'subtotal += linetotal
        'Return subtotal
    End Function

    Protected Sub refresh(sender As Object, e As GridViewUpdatedEventArgs) Handles gvCart.RowUpdated
        Response.Redirect("ViewCart.aspx")
    End Sub

   Protected Sub lvCart_OnItemCommand(ByVal sender As Object, ByVal e As ListViewCommandEventArgs)
        If e.CommandName = "cmdUpdate" Then
            ' get cartid from cookies, productno, and quantity
            Dim strCartID As String
            Dim CookieBack As HttpCookie
            CookieBack = HttpContext.Current.Request.Cookies("CartID")
            strCartID = CookieBack.Value
            Dim strProductNo As String = e.CommandArgument
            Dim tbQuantity As TextBox = CType(e.Item.FindControl("tbQuantity"), TextBox)
            Dim strSQL As String = "Update Cart set Quantity = '" & CInt(tbQuantity.Text) & "' where ProductNo = '" & strProductNo & "' and CartID = '" & strCartID & "'"
            ' update
            Dim strConn As String = "Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30"
            Dim connCart As SqlConnection
            Dim cmdCart As SqlCommand
            Dim drCart As SqlDataReader
            connCart = New SqlConnection(strConn)
            cmdCart = New SqlCommand(strSQL, connCart)
            connCart.Open()
            If tbQuantity.Text >= 1 Then
                drCart = cmdCart.ExecuteReader(CommandBehavior.CloseConnection)
                SqlDSCart1.DataBind()
                lvCart.DataBind()
            End If
        ElseIf e.CommandName = "cmdDelete" Then
            Dim strCartID As String
            Dim CookieBack As HttpCookie
            CookieBack = HttpContext.Current.Request.Cookies("CartID")
            strCartID = CookieBack.Value
            Dim strProductNo As String = e.CommandArgument
            Dim strSQL As String = "Delete From Cart where ProductNo = '" & strProductNo & "' and CartID = '" & strCartID & "'"
            Dim strConn As String = "Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30"
            Dim connCart As SqlConnection
            Dim cmdCart As SqlCommand
            Dim drCart As SqlDataReader
            connCart = New SqlConnection(strConn)
            cmdCart = New SqlCommand(strSQL, connCart)
            connCart.Open()
            drCart = cmdCart.ExecuteReader(CommandBehavior.CloseConnection)
            SqlDSCart1.DataBind()
            lvCart.DataBind()
        End If
        Response.Redirect("ViewCart.aspx")
    End Sub

    Protected Sub DataPager1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataPager1.PreRender
        Dim total_pages As Integer
        Dim current_page As Integer
        'sqlDSCart.SelectCommand = "Select * from cart"
        lvCart.DataBind()
        total_pages = DataPager1.TotalRowCount / DataPager1.PageSize
        current_page = DataPager1.StartRowIndex / DataPager1.PageSize + 1
        If DataPager1.TotalRowCount Mod DataPager1.PageSize <> 0 Then
            total_pages = total_pages + 1
        End If
        If CInt(lvCart.Items.Count) <> 0 Then
            Dim lbl As Label = lvCart.FindControl("lblPage")
            lbl.Text = "Page " + CStr(current_page) + " of " + CStr(total_pages) + " (Total items: " + CStr(DataPager1.TotalRowCount) + ")"
        End If
        If CInt(lvCart.Items.Count) = 0 Then
            DataPager1.Visible = False
            show_next.Visible = False
            show_prev.Visible = False
        End If
    End Sub

    Protected Sub show_prev_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles show_prev.Click
        Dim pagesize As Integer = DataPager1.PageSize
        Dim current_page As Integer = DataPager1.StartRowIndex / DataPager1.PageSize + 1
        Dim total_pages As Integer = DataPager1.TotalRowCount / DataPager1.PageSize
        Dim last As Integer = total_pages \ 2
        last = last * 2
        Do While current_page < last
            last = last - 2
        Loop
        If last < 2 Then
            last = 0
        Else
            last = last - 2
        End If
        DataPager1.SetPageProperties(last * pagesize, pagesize, True)
    End Sub

    Protected Sub show_next_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles show_next.Click
        Dim last As Integer = 2
        Dim pagesize As Integer = DataPager1.PageSize
        Dim current_page As Integer = DataPager1.StartRowIndex / DataPager1.PageSize + 1
        Dim total_pages As Integer = DataPager1.TotalRowCount / DataPager1.PageSize
        Do While current_page > last
            last = last + 2
        Loop
        If last > total_pages Then
            last = total_pages
        End If
        DataPager1.SetPageProperties(last * pagesize, pagesize, True)
    End Sub


    Protected Sub btnCheckout_Click(sender As Object, e As EventArgs) Handles btnCheckout.Click
        Response.Redirect("Checkout.aspx")
    End Sub

    Protected Sub SqlDSCart1_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDSCart1.Updated
        Response.Redirect("ViewCart.aspx")
    End Sub

    Protected Sub SqlDSCart1_Deleted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDSCart1.Deleted
        Response.Redirect("ViewCart.aspx")
    End Sub
End Class
