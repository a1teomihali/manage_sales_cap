sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'ns.salesorder',
            componentId: 'SalesOrderList',
            contextPath: '/SalesOrder'
        },
        CustomPageDefinitions
    );
});