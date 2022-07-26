trigger WarrantySummary on Case (after insert) {
    for (Case myCase: Trigger.new){
        Date purchaseDate       = myCase.Product_Purchase_Date__c;
        DateTime createdDate    = myCase.CreatedDate;
        Integer warrantyDays    = myCase.Product_Total_Warranty_Days__c.intValue();
        Decimal warrantyPecentage = purchaseDate.daysBetween(Date.today()) / warrantyDays;
        Boolean hasExtendedWarranty = myCase.Product_Has_Extended_Warranty__c;
    }

}