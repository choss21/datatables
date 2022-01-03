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
                "responsivePriority": 1,
                "data": null,
                "columns": [
                    { "data": "Id", "name": "Id", "autoWidth": true },
                    { "data": "Nombre", "name": "Nombre", "autoWidth": true },
                    { "data": "Edad", "name": "Edad", "autoWidth": true },

                ],
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'excel',
                        text: 'Export excel',
                        className: 'exportExcel',
                        filename: 'Export excel',
                        action: newexportaction,
                        exportOptions: {
                            modifier: {
                                page: 'all'
                            }
                        }
                    }
                ]
            });

            

        });


        function refreshDatatable() {
            alert('click');
            if (dttable == undefined) return;
            dttable.ajax.reload();
        }

        function newexportaction(e, dt, button, config) {
            console.log('*************new exportaction*****************')
            var self = this;
            var oldStart = dt.settings()[0]._iDisplayStart;
            dt.one('preXhr', function (e, s, data) {
                // Just this once, load all data from the server...
                data.start = 0;
                data.length = 2147483647;
                dt.one('preDraw', function (e, settings) {
                    // Call the original action function
                    if (button[0].className.indexOf('buttons-copy') >= 0) {
                        $.fn.dataTable.ext.buttons.copyHtml5.action.call(self, e, dt, button, config);
                    } else if (button[0].className.indexOf('buttons-excel') >= 0) {
                        $.fn.dataTable.ext.buttons.excelHtml5.available(dt, config) ?
                            $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config) :
                            $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
                    } else if (button[0].className.indexOf('buttons-csv') >= 0) {
                        $.fn.dataTable.ext.buttons.csvHtml5.available(dt, config) ?
                            $.fn.dataTable.ext.buttons.csvHtml5.action.call(self, e, dt, button, config) :
                            $.fn.dataTable.ext.buttons.csvFlash.action.call(self, e, dt, button, config);
                    } else if (button[0].className.indexOf('buttons-pdf') >= 0) {
                        $.fn.dataTable.ext.buttons.pdfHtml5.available(dt, config) ?
                            $.fn.dataTable.ext.buttons.pdfHtml5.action.call(self, e, dt, button, config) :
                            $.fn.dataTable.ext.buttons.pdfFlash.action.call(self, e, dt, button, config);
                    } else if (button[0].className.indexOf('buttons-print') >= 0) {
                        $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
                    }
                    dt.one('preXhr', function (e, s, data) {
                        // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                        // Set the property to what it was before exporting.
                        settings._iDisplayStart = oldStart;
                        data.start = oldStart;
                    });
                    // Reload the grid with the original page. Otherwise, API functions like table.cell(this) don't work properly.
                    setTimeout(dt.ajax.reload, 0);
                    // Prevent rendering of the full data to the DOM
                    return false;
                });
            });
            // Requery the server with the new one-time export settings
            dt.ajax.reload();
        };

    </script>
</asp:Content>
