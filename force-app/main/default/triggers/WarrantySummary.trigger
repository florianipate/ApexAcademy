trigger WarrantySummary on Case (after insert) {
    for (Case myCase: Trigger.new){
        Date purchaseDate       = myCase.Product_Purchase_Date__c;
        DateTime createdDate    = myCase.CreatedDate;
        Integer warrantyDays    = myCase.Product_Total_Warranty_Days__c.intValue();
        Decimal warrantyPercentage = purchaseDate.daysBetween(Date.today()) / warrantyDays;
        Boolean hasExtendedWarranty = myCase.Product_Has_Extended_Warranty__c;
        
        myCase.Warranty_Summary__c  = 'Product purchased on ' + purchaseDate + ' '
                                    + 'and Case Created om ' + createdDate + '.\n'
                                    + 'Warranty is for ' + warrantyDays + ' '
                                    + 'and is ' + warrantyPercentage + '% through its waranty Period.\n'
                                    + 'Have a nice day!';
    
    }

}