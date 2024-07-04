sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/salesorder/test/integration/FirstJourney',
		'ns/salesorder/test/integration/pages/SalesOrderList',
		'ns/salesorder/test/integration/pages/SalesOrderObjectPage',
		'ns/salesorder/test/integration/pages/CustomersObjectPage'
    ],
    function(JourneyRunner, opaJourney, SalesOrderList, SalesOrderObjectPage, CustomersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/salesorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSalesOrderList: SalesOrderList,
					onTheSalesOrderObjectPage: SalesOrderObjectPage,
					onTheCustomersObjectPage: CustomersObjectPage
                }
            },
            opaJourney.run
        );
    }
);