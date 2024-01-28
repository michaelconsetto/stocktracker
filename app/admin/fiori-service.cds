using AdminService as service from '../../srv/admin-service';

// Portfolio Annotation
annotate service.Portfolios with @odata.draft.enabled;
annotate service.Portfolios with @Common.SemanticKey: [PortfolioUUID];

annotate service.Portfolios with @(

    Capabilities.InsertRestrictions.Insertable: true,
    // Object Page Section
    UI.LineItem                               : [

    {
        $Type            : 'UI.DataField',
        Label            : 'Stock Name',
        Value            : title,
        ![@UI.Importance]: #High

    }]

);


// Stock Annotation

annotate service.Stocks {
    // don't show UUID
    StockUUID  @UI.Hidden  @readonly  @mandatory  @UI.ExcludeFromNavigationContext;
    ticker     @mandatory  @title: '{i18n>Ticker}';
    isin       @mandatory  @title: '{i18n>ISIN}';
    wkn        @title: '{i18n>WKN}';
    title      @title: '{i18n>Title}';
    descr      @title: '{i18n>Description}';

}


annotate service.Stocks with @odata.draft.enabled;
annotate service.Stocks with @Common.SemanticKey: [StockUUID];

annotate service.Stocks with @(

    Capabilities.UpdateRestrictions           : {Updatable: true},
    Capabilities.InsertRestrictions.Insertable: true,

    UI                                        : {
         // List Report Section
                LineItem              : {$value: [
            {
                $Type: 'UI.DataField',
                Value: ticker,
            },
            {
                $Type: 'UI.DataField',
                Value: isin,
            },
            {
                $Type: 'UI.DataField',
                Value: wkn,
            },
            {
                $Type: 'UI.DataField',
                Value: title,
            },
        ],

        },

        // Object Page Section
        HeaderInfo            : {
            TypeName      : '{i18n>Stock}',
            TypeNamePlural: '{i18n>Stocks}',
            Title         : {
                $Type: 'UI.DataField',
                Value: ticker
            },
            Description   : {
                $Type: 'UI.DataField',
                Value: title
            }
        },

        Facets                : [
            {
                $Type : 'UI.CollectionFacet',
                Label : 'General Information',
                ID    : 'Stock',
                Facets: [
                    { // Stock details
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'StockData',
                        Target: '@UI.FieldGroup#StockData',
                        Label : '{i18n>GeneralInformation}'
                    },
                    { // Detaoö information
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'PriceData',
                        Target: '@UI.FieldGroup#PriceData',
                        Label : '{i18n>Details}'
                    },
                    
                ]
            },
        ],
        FieldGroup #StockData: {Data: [
            {Value: isin},
            {Value: wkn},
        ]},
        
        FieldGroup #PriceData : {Data: [
            {
                $Type: 'UI.DataField',
                Value: descr
            },
           
        ]}
    },


);
