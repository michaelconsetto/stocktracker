using { consetto.stocktracker as my } from '../db/schema';
service AdminService @(requires:'authenticated-user') { 
  entity Stocks as projection on my.Stocks;
  entity Transactions as projection on my.Transactions;
  entity Portfolios as projection on my.Portfolios;

}