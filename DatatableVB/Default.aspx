<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="DatatableVB._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1>TEST table</h1>
    <input type="button" value="Refrescar" onclick="refreshDatatable()"/>
    <table id="table_id" class="display">
        <thead>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Edad</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

    <script>
        var dttable
        $(document).ready(function () {
            dttable = $("#table_id").DataTable({
                "processing": true,
                "serverSide": true,
                "ajax": {
                    "url": "WebService1.asmx/GetData",
                    "type": "POST",
                    "datatype": "json",
                    "data": {
                        "userId": 27,
                        "startDate": "10-01-2021",
                        "endDate":"01-02-2021"
                    }
                },
                "pageLength": 10,
                "filter": false,
                "responsivePriority": 1,
                "data": null,
                "columns": [
                { "data": "Id", "name": "Id", "autoWidth": true },
                { "data": "Nombre", "name": "Nombre", "autoWidth": true },
                { "data": "Edad", "name": "Edad", "autoWidth": true }
            ]
            });

            

        });


        function refreshDatatable() {
            alert('click');
            if (dttable == undefined) return;
            dttable.ajax.reload();
        }
    </script>
</asp:Content>
