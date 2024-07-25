namespace salemanagement;

using {
    cuid,
    managed
} from '@sap/cds/common';


entity SalesOrder : cuid, managed {

    @title: 'Sales Order Date'
    SalesOrderDate  : Date       @mandatory;

    @title: 'Customer'
    Customer        : Composition of many Customers
                          on Customer.salesOrder = $self;

    @title: 'Delivery Address'
    DeliveryAddress : String(30) @mandatory;

    @title: 'Total Amount'
    TotalAmount     : Decimal    @mandatory;

    @title: 'Amount Currency'
    @UI.HiddenFilter
    AmountCurrency  : String(10) @mandatory;

    @title: 'Total Tax'
    TotalTax        : Decimal    @mandatory;

    @title: 'Tax Currency'
    @UI.HiddenFilter
    TaxCurrency     : String(10) @mandatory;

    @title: 'Sales Order Note'
    SalesOrderNote  : String(100);

    @title: 'Criticality'
    @UI.HiddenFilter
    Criticality     : Integer;
}

entity Customers : cuid, managed {

    @title: 'Customer Full Name'
    CustomerName    : String(30) @mandatory;

    @title: 'Customer Address'
    CustomerAddress : String(50) @mandatory;

    @title: 'Customer Email'
    CustomerEmail   : String(30) @mandatory;

    @title: 'Customer Phone Number'
    CustomerPhone   : String(15);

    @title: 'Sales Order ID'
    @UI.HiddenFilter
    salesOrder      : Association to SalesOrder;
}
