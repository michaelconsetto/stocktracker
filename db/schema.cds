using { Currency, managed } from '@sap/cds/common';
namespace consetto.stocktracker; 

entity Stocks : managed { 
  key StockUUID : UUID;
  ticker : String(4);
  title  : localized String(80);
  descr  : localized String(300);
  wkn    : String(6);
  ISIN   : String(12);
}

entity Portfolios : managed {
  key PortfolioUUID : UUID;
  title             : localized String(80);
}

entity Transactions: managed {
   key TransactionUUID: UUID;
   time               : Timestamp;
   stock              : Association to Stocks;
   price              : Decimal(12,4);
   currency           : Currency;
   quanity            : Decimal(12,4);
   portfolio          : Association to Portfolios;
}