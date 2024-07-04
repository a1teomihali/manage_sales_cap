using {salemanagement as som} from '../db/schema';

service SalesOrderService @(path: 'service/salesorder') {

    annotate SalesOrder with @odata.draft.enabled;
    entity SalesOrder as projection on som.SalesOrder;

}
