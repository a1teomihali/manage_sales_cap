using SalesOrderService as service from '../../srv/salesorder-service';
using from '../../db/schema';

annotate service.Customers with @(
    UI.SelectionFields           : [
        CustomerName,
        CustomerAddress
    ],

    UI.HeaderInfo                : {
        TypeName      : 'Customer Data',
        TypeNamePlural: 'Customers Data',
        Title         : {Value: CustomerName},
        Description   : {Value: ID}
    },

    UI.LineItem                  : [
        {
            $Type      : 'UI.DataField',
            Criticality: #Information,
            Value      : ID
        },
        {
            $Type: 'UI.DataField',
            Value: CustomerName
        },
        {
            $Type: 'UI.DataField',
            Value: CustomerAddress
        },
        {
            $Type: 'UI.DataField',
            Value: CustomerEmail
        },
        {
            $Type: 'UI.DataField',
            Value: CustomerPhone
        },
        {
            $Type: 'UI.DataField',
            Value: salesOrder_ID,
            ![@UI.Hidden]
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

    UI.Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet',
            Label : 'Customer Information',
            Target: '@UI.FieldGroup#GeneratedGroup'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'OrderInformation',
            Label : 'Order Information',
            Target: '@UI.FieldGroup#OrderData'
        }
    ],

    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID
            },
            {
                $Type: 'UI.DataField',
                Value: salesOrder_ID
            },
            {
                $Type: 'UI.DataField',
                Value: CustomerName
            },
            {
                $Type: 'UI.DataField',
                Value: CustomerAddress
            },
            {
                $Type: 'UI.DataField',
                Value: CustomerEmail
            },
            {
                $Type: 'UI.DataField',
                Value: CustomerPhone
            }
        ]
    },

    UI.FieldGroup #OrderData     : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: salesOrder.ID,
                ![@UI.Hidden]
            },
            {
                $Type: 'UI.DataField',
                Label: 'Sales Order Date',
                Value: salesOrder.SalesOrderDate
            },
            {
                $Type: 'UI.DataField',
                Label: 'Delivery Address',
                Value: salesOrder.DeliveryAddress
            },
            {
                $Type: 'UI.DataField',
                Label: 'Total Amount',
                Value: salesOrder.TotalAmount
            },
            {
                $Type: 'UI.DataField',
                Label: 'Amount Currency',
                Value: salesOrder.AmountCurrency
            },
            {
                $Type: 'UI.DataField',
                Label: 'Total Tax',
                Value: salesOrder.TotalTax
            },
            {
                $Type: 'UI.DataField',
                Label: 'Tax Currency',
                Value: salesOrder.TaxCurrency
            }
        ]
    }
);


annotate service.Customers with {
    salesOrder @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'SalesOrder',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: salesOrder_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'SalesOrderDate',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'DeliveryAddress',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'TotalAmount',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'TotalTax',
            },
        ],
    }
};
