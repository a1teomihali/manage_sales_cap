const cds = require("@sap/cds");

module.exports = cds.service.impl(async function () {
    const { SalesOrder } = this.entities;

    // Set criticality after a READ operation on SalesOrder
    this.after('READ', SalesOrder, data => {
        const sales = Array.isArray(data) ? data : [data];

        sales.forEach(sale => {
            if (sale.TotalAmount < 20000) {
                sale.Criticality = 3;
            } else if (sale.TotalAmount >= 20000 && sale.TotalAmount <= 50000) {
                sale.Criticality = 2;
            } else {
                sale.Criticality = 1;
            }
        });
    });
});
