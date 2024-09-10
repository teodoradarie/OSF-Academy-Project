public with sharing class DiscountCalculator {
    public decimal calculateDiscount(decimal Amount, String DiscountCode) {
        decimal finalAmount=0;
        if(Amount==null||Amount<=0)
        {
            return 0;
        }
        if(Amount<100)
        {
            finalAmount=Amount;
        }else if(Amount>=100&&Amount<=200){
            finalAmount=Amount-Amount*0.1;
        }else if(Amount>200&&Amount<500){
            finalAmount=Amount-Amount*0.15;
        }else if(Amount>=500){
            finalAmount=Amount-Amount*0.2;
        }
        
        if(DiscountCode=='OSF5')
        {
             finalAmount=finalAmount-finalAmount*0.05;
        }
        return finalAmount;
        }
    }
       
       