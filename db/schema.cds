using { Currency, managed } from '@sap/cds/common';
namespace consetto.stocktracker; 

entity Stock : managed { 
  key StockUUID : UUID;
  ticker : String(4);
  title  : localized String(80);
  descr  : localized String(300);
  price  : Decimal(12,4);
  currency : Currency;
  wkn    : String(6);
  ISIN   : String(12);
}

