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
        Label            : 'Portfolio Name',
        Value            : title,
        ![@UI.Importance]: #High

    }]

);


annotate service.Stocks {
    // don't show UUID
    StockUUID  @UI.Hidden       @readonly   @mandatory  @UI.ExcludeFromNavigationContext;
    isin       @mandatory  @title: 'ISIN Text';
    wkn        @title: 'WKN';
    title      @title: 'title';
}

// Stock Annotation
annotate service.Stocks with @odata.draft.enabled;
annotate service.Stocks with @Common.SemanticKey: [StockUUID];

annotate service.Stocks with @(

    Capabilities.UpdateRestrictions           : {Updatable: true},
    Capabilities.InsertRestrictions.Insertable: true,

    UI                                        : {
        HeaderInfo: {
            TypeName      : 'Stock',
            TypeNamePlural: 'Stocks',
            Title         : {
                $Type: 'UI.DataField',
                Value: isin
            },
            Description   : {
                $Type: 'UI.DataField',
                Value: title
            }
        },
        // Object Page Section
        LineItem  : [

            {
                $Type            : 'UI.DataField',
                Label            : 'Symbol',
                Value            : ticker,
                ![@UI.Importance]: #High,

            },
            {
                $Type            : 'UI.DataField',
                Label            : 'Name',
                Value            : title,
                ![@UI.Importance]: #High
            },
            {
                $Type: 'UI.DataField',
                Label: 'ISIN',
                Value: isin

            },
            {
                $Type: 'UI.DataField',
                Label: 'WKN',
                Value: wkn

            },
        ],
    },


);
