using AdminService from '../../srv/admin-service';

// annotate  AdminService.Stocks with @odata.draft.enabled;
// annotate AdminService.Stocks with @Common.SemanticKey: [StockUUID];

annotate AdminService.Portfolio with @odata.draft.enabled;

annotate AdminService.Portfolio @(Capabilities : {
    Insertable : true,
    Deletable  : true,
    Updatable  : true
});

// annotate AdminService.Portfolio.texts with {
//     PortfolioUUID           @UI.Hidden;
//     title              @mandatory;
// }

// annotate AdminService.Portfolio with @(UI : {
//     UpdateHidden        : false,
//     DeleteHidden        : false,
//     CreateHidden        : false,
//     Identification      : [
//         {Value : title}
//     ],
//     HeaderInfo          : {
//         $Type          : 'UI.HeaderInfoType',
//         TypeName       : 'Project',
//         TypeNamePlural : 'Projects',
//         Title          : {
//             $Type : 'UI.DataField',
//             Value : title
//         },
//         Description    : {
//             $Type : 'UI.DataField',
//             Value : title
//         }
//     },
//     SelectionFields     : [
//         title,
       
//     ],
//     LineItem            : [
//         {
//             $Type : 'UI.DataField',
//             Value : title
//         }
        
//     ],
//     HeaderFacets        : [{
//         $Type  : 'UI.ReferenceFacet',
//         Target : '@UI.FieldGroup#Detail'
//     }],
//     Facets              : [
//         {
//             $Type  : 'UI.ReferenceFacet',
//             ID     : 'ProjectsDetails',
//             Target : '@UI.FieldGroup#Details',
//             Label  : 'Details'
//         }
        
//     ],
//     DataPoint #ProjName : {
//         Value : title,
//         Title : 'Portfolio Title'
//     }

   
// });
