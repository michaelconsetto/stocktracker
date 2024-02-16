using { Currency, managed } from '@sap/cds/common';
namespace consetto.stocktracker; 

entity Stocks : managed { 
  key StockUUID : UUID;
  ticker : String(4);
  title  : localized String(80);
  descr  : localized String(300);
  wkn    : String(6) @assert.format: '\d\d\d\d\d\d';
  isin   : String(12);
}

entity Portfolios : managed {
  key PortfolioUUID : UUID;
  title             : localized String(80);
  transaction      : Association to many Transactions;
}

entity Transactions: managed {
   key TransactionUUID: UUID;
   time               : Timestamp;
   stock              : Association to Stocks;
   price              : Decimal(12,4);
   currency           : Currency;
   quanity            : Decimal(12,4);
   totalprice         : Decimal(12,4);
   portfolio          : Association to Portfolios;
}