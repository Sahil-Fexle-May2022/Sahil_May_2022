public with sharing class ProcessPurchaseOrder{
    public  ProcessPurchaseOrder(){
        PurchaseOrder order1 = new CustomerPurchaseOrder();
        PurchaseOrder order2 = new EmployeePurchaseOrder ();
        PurchaseOrder order3 = new SellerPurchaseOrder();
        // Customer Order 
        processOrder(order1);
        // Employee Order 
        processOrder(order2);
        //Seller Order
        ProcessOrder(order3);
    }
    public void processOrder (PurchaseOrder order){
        System.debug('Check discount ::' + order.discount());
    }            
}