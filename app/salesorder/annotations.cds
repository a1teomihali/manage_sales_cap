using SalesOrderService as service from '../../srv/salesorder-service';
using from '../../db/schema';

annotate service.SalesOrder with @(
    UI.SelectionFields         : [
        SalesOrderDate,
        DeliveryAddress
    ],

    UI.HeaderInfo              : {
        TypeName      : 'Sales Order',
        TypeNamePlural: 'Sales Orders',
        Title         : {Value: ID},
        Description   : {Value: SalesOrderNote}
    },

    UI.LineItem                : [
        {
            $Type            : 'UI.DataField',
            Label            : 'Sales Order ID',
            Value            : ID,
            Criticality      : Criticality,
            ![@UI.Importance]: #High
        },
        {
            $Type: 'UI.DataField',
            Label: 'Sales Order Date',
            Value: SalesOrderDate
        },
        {
            $Type: 'UI.DataField',
            Label: 'Delivery Address',
            Value: DeliveryAddress
        },
        {
            $Type: 'UI.DataField',
            Label: 'Customer ID',
            Value: Customer.ID,
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Label: 'Total Amount',
            Value: TotalAmount
        },
        {
            $Type: 'UI.DataField',
            Label: 'Amount Currency',
            Value: AmountCurrency
        },
        {
            $Type            : 'UI.DataField',
            Label            : 'Criticality',
            Value            : Criticality,
            Criticality      : Criticality,
            ![@UI.Importance]: #High
        },
        {
            $Type: 'UI.DataField',
            Label: 'Total Tax',
            Value: TotalTax
        },
        {
            $Type: 'UI.DataField',
            Label: 'Tax Currency',
            Value: TaxCurrency
        },
        {
            $Type: 'UI.DataField',
            Label: 'Sales Order Note',
            Value: SalesOrderNote
        },
        {
            $Type: 'UI.DataField',
            Label: 'created At',
            Value: createdAt,
            ![@UI.Hidden]

        },
        {
            $Type: 'UI.DataField',
            Label: 'created By',
            Value: createdBy,
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Label: 'modified At',
            Value: modifiedAt,
            ![@UI.Hidden]

        },
        {
            $Type: 'UI.DataField',
            Label: 'modified By',
            Value: modifiedBy,
            ![@UI.Hidden]
        }
    ],

    UI.Facets                  : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'OrderDetails',
            Label : 'Order Details',
            Target: '@UI.FieldGroup#OrderDetails'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'CustomerDetails',
            Label : 'Customer Details',
            Target: 'Customer/@UI.LineItem#CustomerDetails'
        }
    ],

    UI.FieldGroup #OrderDetails: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Sales Order ID',
                Value: ID
            },
            {
                $Type            : 'UI.DataField',
                Label            : 'Sales Order Date',
                Value            : SalesOrderDate,
                ![@UI.Importance]: #High
            },
            {
                $Type: 'UI.DataField',
                Label: 'Customer ID',
                Value: Customer.ID,
                ![@UI.Hidden]
            },
            {
                $Type: 'UI.DataField',
                Label: 'Delivery Address',
                Value: DeliveryAddress
            },
            {
                $Type            : 'UI.DataField',
                Label            : 'Total Amount',
                Value            : TotalAmount,
                Criticality      : Criticality,
                ![@UI.Importance]: #High
            },
            {
                $Type            : 'UI.DataField',
                Label            : 'Amount Currency',
                Value            : AmountCurrency,
                ![@UI.Importance]: #Medium
            },
            {
                $Type      : 'UI.DataField',
                Label      : 'Criticality',
                Value      : Criticality,
                Criticality: Criticality
            },
            {
                $Type            : 'UI.DataField',
                Label            : 'Total Tax',
                Value            : TotalTax,
                ![@UI.Importance]: #High
            },
            {
                $Type            : 'UI.DataField',
                Label            : 'Tax Currency',
                Value            : TaxCurrency,
                ![@UI.Importance]: #Medium
            },
            {
                $Type: 'UI.DataField',
                Label: 'Sales Order Note',
                Value: SalesOrderNote
            }
        ]
    }
);

annotate service.Customers with @(UI.LineItem #CustomerDetails: [
    {
        $Type: 'UI.DataField',
        Label: '{i18n>Customer ID}',
        Value: ID
    },
    {
        $Type            : 'UI.DataField',
        Label            : '{i18n>Customer Full Name}',
        Value            : CustomerName,
        ![@UI.Importance]: #High
    },
    {
        $Type            : 'UI.DataField',
        Label            : '{i18n>Customer Email}',
        Value            : CustomerEmail,
        ![@UI.Importance]: #High
    },
    {
        $Type            : 'UI.DataField',
        Label            : '{i18n>Customer Phone Number}',
        Value            : CustomerPhone,
        ![@UI.Importance]: #High
    },
    {
        $Type            : 'UI.DataField',
        Label            : '{i18n>Customer Address}',
        Value            : CustomerAddress,
        ![@UI.Importance]: #High
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>Sales Order ID}',
        Value: salesOrder_ID
    },
    {
        $Type: 'UI.DataField',
        Label: 'created At',
        Value: createdAt,
        ![@UI.Hidden]

    },
    {
        $Type: 'UI.DataField',
        Label: 'created By',
        Value: createdBy,
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Label: 'modified At',
        Value: modifiedAt,
        ![@UI.Hidden]

    },
    {
        $Type: 'UI.DataField',
        Label: 'modified By',
        Value: modifiedBy,
        ![@UI.Hidden]
    }
]);

annotate service.Customers with @(ValueList: {
    $Type         : 'Common.ValueListType',
    CollectionPath: 'Customers',
    Parameters    : [
        {
            $Type            : 'Common.ValueListParameterInOut',
            LocalDataProperty: Customer.CustomerID,
            ValueListProperty: 'CustomerID',
        },
        {
            $Type            : 'Common.ValueListParameterDisplayOnly',
            ValueListProperty: 'CustomerName',
        },
        {
            $Type            : 'Common.ValueListParameterDisplayOnly',
            ValueListProperty: 'CustomerAddress',
        },
        {
            $Type            : 'Common.ValueListParameterDisplayOnly',
            ValueListProperty: 'CustomerEmail',
        },
        {
            $Type            : 'Common.ValueListParameterDisplayOnly',
            ValueListProperty: 'CustomerPhone',
        },
    ],
});

annotate service.Customers with {
    ID @Common.Label: '{i18n>Customer ID}'
       @UI.HiddenFilter
};

annotate service.SalesOrder with {
    ID @Common.Label: '{i18n>Sales Order ID}'
       @UI.HiddenFilter
};

annotate service.SalesOrder with {
    DeliveryAddress @UI.MultiLineText: true
};
