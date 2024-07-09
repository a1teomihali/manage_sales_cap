namespace salemanagement;

using {
    cuid,
    managed
} from '@sap/cds/common';


entity SalesOrder : cuid, managed {
    //        @title: 'Sales Order ID'
    //    key SalesOrderNumber : String(10) @(Core.Computed: true);

    @title: 'Sales Order Date'
    SalesOrderDate  : Date;

    @title: 'Customer'
    Customer        : Composition of many Customers
                          on Customer.salesOrder = $self;

    @title: 'Delivery Address'
    DeliveryAddress : String(100);

    @title: 'Total Amount'
    TotalAmount     : Decimal;

    
    @title: 'Total Tax'
    TotalTax        : Decimal;

    

    @title: 'Sales Order Note'
    SalesOrderNote  : String(200);

    @title: 'Criticality'
    @UI.HiddenFilter
    Criticality     : Integer;
}

entity Customers : cuid, managed {
    //    key CustomerId      : String(10) @(Core.Computed: true);

    @title: 'Customer Full Name'
    CustomerName    : String(50);

    @title: 'Customer Address'
    CustomerAddress : String(100);

    @title: 'Customer Email'
    CustomerEmail   : String(50);

    @title: 'Customer Phone Number'
    CustomerPhone   : String(15);

    @title: 'Sales Order ID'
    @UI.HiddenFilter
    salesOrder      : Association to SalesOrder;
}
