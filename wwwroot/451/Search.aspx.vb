
Partial Class _451_Search
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Request.QueryString("SubCatID") <> "" Then
            SqlDSProductList.SelectCommand = "Select * From Product Where CategoryID = " & CInt(Request.QueryString("SubCatID"))
            dlProductList.DataBind()
        End If
        If Request.QueryString("SearchValue") <> "" Then
            SqlDSProductList.SelectCommand = "Select * From Product Where ProductNo like '%" & Request.QueryString("SearchValue") & "%'"
            dlProductList.DataBind()
        End If
    End Sub
End Class
