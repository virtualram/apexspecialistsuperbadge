global class extcall{

 public String strX{get;set;}
 public Offering__c offer1{get;set;}

   
   webservice  static string webexamp()
    {
    return 'hello';// strX;
    }
    
     
     
     public extcall(ApexPages.StandardController controller){
     offer1 = [Select id, Name,Description_Text_Area__c from Offering__c where id ='a079000000Di7Ix'];
    strX =offer1.id;
     }

}