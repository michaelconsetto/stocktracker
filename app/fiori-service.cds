using AdminService as service from '../srv/admin-service';

annotate service.Portfolio with @odata.draft.enabled;
annotate service.Portfolio with @Common.SemanticKey: [PortfolioUUID];

annotate service.Portfolio with @(

    Capabilities.InsertRestrictions.Insertable: true,

    // Object Page Section

    UI.LineItem                               : [

    {
        $Type            : 'UI.DataField',
        Label            : 'Title 1',
        Value            : title,
        ![@UI.Importance]: #High

    }]

);
