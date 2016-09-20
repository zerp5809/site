
Partial Class Category
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'On Error Resume Next
        If Request.QueryString("MainCatID") <> "" Then
            lblMainCategoryName.Text = Request.QueryString("MainCatName")
            SqlDSSubCategory.SelectCommand = "Select * From Category Where Parent = " & CInt(Request.QueryString("MainCatID"))
            'dlSubCategory.DataBind()
        End If
        If Request.QueryString("SubCatID") <> "" Then
            SqlDSProductList.SelectCommand = "Select * From Product Where CategoryID = " & CInt(Request.QueryString("SubCatID"))
            dlProductList.DataBind()
        End If

    End Sub
End Class
