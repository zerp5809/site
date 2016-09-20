
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If tbSearch.Text <> "" Then
            Dim strSearchValue As String
            strSearchValue = "Category.aspx?SearchValue=" + Trim(tbSearch.Text)
            Response.Redirect(strSearchValue)
        End If
    End Sub
End Class

