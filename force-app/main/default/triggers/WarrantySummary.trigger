trigger WarrantySummary on Case (before insert) {
    for (Case myCase: Trigger.new){
    String purchaseDate             = myCase.Product_Purchase_Date__c.format();
        String createdDate          = DateTime.now().format('dd/mm/yyyy');
        Integer warrantyDays        = myCase.Product_Total_Warranty_Days__c.intValue();
        Decimal warrantyPercentage  = ((myCase.Product_Purchase_Date__c.daysBetween(Date.today()) / myCase.Product_Total_Warranty_Days__c) * 100).setScale(2);
        Boolean hasExtendedWarranty = myCase.Product_Has_Extended_Warranty__c;
        
        myCase.Warranty_Summary__c  = 'Product purchased on ' + purchaseDate + ' '
                                    + 'and Case Created on ' + createdDate + '.\n'
                                    + 'Warranty is for ' + warrantyDays + ' days'
                                    + ' and is ' + warrantyPercentage + '% through its waranty Period.\n'
                                    + 'Have a nice day!';
    
    }

}