using { Currency, managed } from '@sap/cds/common';
namespace consetto.stocktracker; 

entity Stocks : managed { 
  key ID : Integer;
  ticker : String(4);
  title  : localized String(111);
  descr  : localized String(1111);
  price  : Decimal(9,2);
  currency : Currency;
}

