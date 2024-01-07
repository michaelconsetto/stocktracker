using { consetto.stocktracker as my } from '../db/schema';
service AdminService @(requires:'authenticated-user') { 
  entity Stocks as projection on my.Stocks;
}