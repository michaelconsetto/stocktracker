using {consetto.stocktracker as my} from '../db/schema';

service PortfolioService @(requires: 'authenticated-user') {
    entity PortfolioStoks as
        projection on my.Portfolios {
            PortfolioUUID,
            transaction.stock.isin as ISIN,
            @Aggregation.default: #avg
            transaction.price      as price,
            @Aggregation.default: #sum
            transaction.totalprice
        }
}