define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'user_relation/index' + location.search,
                    add_url: 'user_relation/add',
                    del_url: 'user_relation/del',
                    multi_url: 'user_relation/multi',
                    import_url: 'user_relation/import',
                    table: 'user_relation',
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
                        {field: 'station.name', title: __('Station_id')},
                        {field: 'relations.day', title: __('发车时间'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime2},
                        {field: 'userinfo.username', title: __('User_id')},
                        {field: 'settype', title: __('Settype'), formatter: Table.api.formatter.status, searchList: {2: __('硬座'), 1: __('硬卧')}},
                        {field: 'setnumber', title: __('Setnumber')},
                        {field: 'money', title: __('Money')},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.status, searchList: {0: __('未使用'), 1: __('已使用'), 2: __('已退票')}},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
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
            }
        }
    };
    return Controller;
});