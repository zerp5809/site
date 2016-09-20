Imports System.Data
Imports System.Data.SqlClient

Partial Class Category
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Request.QueryString("MainCatID") <> "" Then
            lblMainCategoryName.Text = Request.QueryString("MainCatName")
            SqlDSSubCategory.SelectCommand = "Select * From Category Where Parent = " & Request.QueryString("MainCatID")
        End If
        If Request.QueryString("SubCatID") <> "" Then
            SqlDSProductList.SelectCommand = "Select * From Product Where CategoryID = " & CInt(Request.QueryString("SubCatID"))
            dlProductList.DataBind()
        End If
        If Request.QueryString("SearchValue") <> "" Then
            SqlDSProductList.SelectCommand = "Select * From Product Where ProductName like '%" & Request.QueryString("SearchValue") & "%'"
            dlProductList.Databind()
        End If
    End Sub
End Class
