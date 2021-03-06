Imports System.ComponentModel
Imports System.Web.Script.Services
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports Newtonsoft.Json



' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
<System.Web.Script.Services.ScriptService()>
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")>
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ToolboxItem(False)>
Public Class WebService1
    Inherits System.Web.Services.WebService

    Public Function getAllData() As List(Of Person)
        Dim allData = New List(Of Person)
        For i = 1 To 95
            allData.Add(New Person() With {
                .Id = i,
                .Nombre = "Nombre " + i.ToString(),
                .Edad = i + 17
                        })
        Next
        Return allData
    End Function
    <WebMethod(CacheDuration:=0)>
    <Script.Services.ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False, XmlSerializeString:=False)>
    Public Sub GetData()
        'HttpContext.Current.Request.Form.Keys.Count

        Dim draw = HttpContext.Current.Request.Form.GetValues("draw").FirstOrDefault()
        Dim test = HttpContext.Current.Request.Form.GetValues("userId").FirstOrDefault()
        Dim test2 = HttpContext.Current.Request.Form.GetValues("startDate").FirstOrDefault()
        Dim test3 = HttpContext.Current.Request.Form.GetValues("endDate").FirstOrDefault()
        Dim start = HttpContext.Current.Request.Form.GetValues("start").FirstOrDefault()
        Dim length = HttpContext.Current.Request.Form.GetValues("length").FirstOrDefault()

        Dim testSort = HttpContext.Current.Request.Form.GetValues("order[1]")
        Dim sortColumn = HttpContext.Current.Request.Form.GetValues("columns[" + HttpContext.Current.Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault()
        Dim sortColumnDir = HttpContext.Current.Request.Form.GetValues("order[0][dir]").FirstOrDefault()

        Dim searchValue = HttpContext.Current.Request.Form.GetValues("search[value]").FirstOrDefault()

        Dim pageSize = If(length <> Nothing, Convert.ToInt32(length), 0)
        Dim skip = If(start <> Nothing, Convert.ToInt32(start), 0)
        Dim recordsTotal = 0

        Dim allData = getAllData()

        If Not (String.IsNullOrEmpty(searchValue)) Then
            allData = allData.Where(Function(x As Person) x.Nombre.Contains(searchValue)).ToList()
        End If

        recordsTotal = allData.Count()

        Context.Response.Cache.SetExpires(DateTime.Now.AddHours(-1))

        Context.Response.ContentType = "application/json"

        Dim resultPaged = allData.Skip(skip).Take(pageSize)

        Dim datafiltered = resultPaged.Count()
        'return Json(new { draw=draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = lst });
        Dim result = Newtonsoft.Json.JsonConvert.SerializeObject(
            New With {.draw = draw, .recordsFiltered = recordsTotal, .recordsTotal = recordsTotal, .data = resultPaged}, Newtonsoft.Json.Formatting.None)
        Context.Response.Write(result)

        Context.Response.Flush()

        Context.Response.End()


        'Return "{draw=0, recordsFiltered = 0, recordsTotal = 0, data=[]}"
    End Sub

End Class