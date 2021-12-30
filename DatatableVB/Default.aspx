<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="DatatableVB._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1>TEST table</h1>

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
        $(document).ready(function () {
            $("#table_id").DataTable({
                "processing": true,
                "serverSide": true,
                "ajax": {
                    "url": "WebService1.asmx/GetData",
                    "type": "POST",
                    "datatype": "json",
                },
                "pageLength": 10,
                "filter": true,
                "responsivePriority": 1,
                "data": null,
                "columns": [
                { "data": "Id", "name": "Id", "autoWidth": true },
                { "data": "Nombre", "name": "Nombre", "autoWidth": true },
                { "data": "Edad", "name": "Edad", "autoWidth": true }
            ]
            });
        });
    </script>
</asp:Content>
