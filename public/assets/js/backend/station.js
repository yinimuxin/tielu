define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'station/index' + location.search,
                    add_url: 'station/add',
                    edit_url: 'station/edit',
                    del_url: 'station/del',
                    multi_url: 'station/multi',
                    import_url: 'station/import',
                    table: 'station',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'name', title: __('Sid'), operate: 'LIKE'},
                        {field: 'fromarea.name', title: __('Station_start')},
                        {field: 'toarea.name', title: __('Station_end')},
                        {field: 'time_start', title: __('Time_start'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'time_end', title: __('Time_end'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'ying_remain', title: __('硬座剩余')},
                        {field: 'ruan_remain', title: __('硬卧剩余数')},
                        {field: 'id', title: __('中间站'), formatter: Controller.api.formatter.fan},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            },
            formatter: {
                fan: function (value, row, index) {
                    //这里手动构造URL
                    url = "station_relation?station_id=" + value;

                    //方式一,直接返回class带有addtabsit的链接,这可以方便自定义显示内容
                    return '<a href="' + url + '" class="label label-success addtabsit" title="' + __("Search %s", value) + '">' + '中间站' + '</a>';

                    //方式二,直接调用Table.api.formatter.addtabs
                    return Table.api.formatter.addtabs(value, row, index, url);
                },
            }
        }
    };
    return Controller;
});