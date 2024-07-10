namespace salemanagement;

using {
    cuid,
    managed
} from '@sap/cds/common';


entity SalesOrder : cuid, managed {
    //        @title: 'Sales Order ID'
    //    key SalesOrderNumber : String(10) @(Core.Computed: true);

    @title: 'Sales Order Date'
    SalesOrderDate  : Date        @mandatory;

    @title: 'Customer'
    Customer        : Composition of many Customers
                          on Customer.salesOrder = $self;

    @title: 'Delivery Address'
    DeliveryAddress : String(100) @mandatory;

    @title: 'Total Amount'
    TotalAmount     : Decimal     @mandatory;

    @title: 'Amount Currency'
    AmountCurrency  : String      @mandatory;

    @title: 'Total Tax'
    TotalTax        : Decimal     @mandatory;

    @title: 'Tax Currency'
    TaxCurrency     : String      @mandatory;

    @title: 'Sales Order Note'
    SalesOrderNote  : String(200);

    @title: 'Criticality'
    @UI.HiddenFilter
    Criticality     : Integer;
}

entity Customers : cuid, managed {
    //    key CustomerId      : String(10) @(Core.Computed: true);

    @title: 'Customer Full Name'
    CustomerName    : String(50)  @mandatory;

    @title: 'Customer Address'
    CustomerAddress : String(100) @mandatory;

    @title: 'Customer Email'
    CustomerEmail   : String(50)  @mandatory;

    @title: 'Customer Phone Number'
    CustomerPhone   : String(15)  @mandatory;

    @title: 'Sales Order ID'
    @UI.HiddenFilter
    salesOrder      : Association to SalesOrder;
}
