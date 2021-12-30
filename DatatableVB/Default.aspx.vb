Imports System.Web.Services

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    <WebMethod()> Public Shared Function GetData() As String
        'return Json(new { draw=draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = lst });
        Return "{draw=0, recordsFiltered = 0, recordsTotal = 0, data=[]}"
    End Function

End Class