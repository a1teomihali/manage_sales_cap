using SalesOrderService as service from '../../srv/salesorder-service';
using {salemanagement as sm} from '../../db/schema';

annotate sm.Customers with @(ValueList: {
    Label         : 'Customers',
    $Type         : 'Common.ValueListType',
    CollectionPath: 'Customers',
    Parameters    : [
        {
            $Type            : 'Common.ValueListParameterInOut',
            LocalDataProperty: Customer.ID,
            ValueListProperty: 'CustomerID'
        },
        {
            $Type            : 'Common.ValueListParameterDisplayOnly',
            ValueListProperty: 'CustomerName'
        }
    ]
});

annotate service.SalesOrder with @(
    UI.SelectionFields           : [
        SalesOrderDate,
        DeliveryAddress
    ],

    UI.HeaderInfo                : {
        TypeName      : 'Sales Order',
        TypeNamePlural: 'Sales Orders',
        Title         : {Value: ID},
        Description   : {Value: SalesOrderNote}
    },

    UI.LineItem                  : [
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
            Label: 'Total Amount',
            Value: TotalAmount
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
            Label: 'Sales Order Note',
            Value: SalesOrderNote
        }
    ],

    UI.Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'CustomerData',
            Label : 'Customer Data',
            Target: 'Customer/@UI.LineItem#CustomerData'
        }
    ],

    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Sales Order ID',
                Value: ID
            },
            {
                $Type: 'UI.DataField',
                Label: 'Sales Order Date',
                Value: SalesOrderDate
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
                $Type: 'UI.DataField',
                Label: 'Total Amount',
                Value: TotalAmount
            },
            {
                $Type: 'UI.DataField',
                Label: 'Criticality',
                Value: Criticality
            },
            {
                $Type: 'UI.DataField',
                Label: 'Total Tax',
                Value: TotalTax
            },
            {
                $Type: 'UI.DataField',
                Label: 'Sales Order Note',
                Value: SalesOrderNote
            }
        ],
    }
);

annotate service.Customers with @(UI.LineItem #CustomerData: [
    {
        $Type: 'UI.DataField',
        Label: '{i18n>Customer ID}',
        Value: ID
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>Customer Name}',
        Value: CustomerName
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>Customer Email}',
        Value: CustomerEmail
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>Customer Phone Number}',
        Value: CustomerPhone
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>Customer Address}',
        Value: CustomerAddress
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>Sales Order ID}',
        Value: salesOrder_ID
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
};

annotate service.SalesOrder with {
    ID @Common.Label: '{i18n>Sales Order ID}'
};
