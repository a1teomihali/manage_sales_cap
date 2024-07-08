sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'cm/managecustomers/test/integration/FirstJourney',
		'cm/managecustomers/test/integration/pages/CustomersList',
		'cm/managecustomers/test/integration/pages/CustomersObjectPage'
    ],
    function(JourneyRunner, opaJourney, CustomersList, CustomersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('cm/managecustomers') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCustomersList: CustomersList,
					onTheCustomersObjectPage: CustomersObjectPage
                }
            },
            opaJourney.run
        );
    }
);