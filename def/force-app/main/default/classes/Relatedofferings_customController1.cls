public with sharing class Relatedofferings_customController1 {
 public String strX{get;set;}
 public Integer rid{get;set;}
 public  RelatedOfferings__c  rofr; 
     public String selectedValues { get; set; }
         public String selectedValues1 { get; set; }
public String idd{get;set;}

   public SelectOption[] alloffers { get;set; }
    public SelectOption[] relatedoffer { get;set; }
public  List<SelectOption> relatedoptions;
 public     List<SelectOption> options ;

    public PageReference DoUnselect() {
        return null;
    }
     public PageReference Doupd()
     {
       rofr = new RelatedOfferings__c(); 
     rofr = [select id,name,seq__c from RelatedOfferings__c where name = :selectedValues1];
     rofr.seq1__c = rid;
     update rofr;
     return null;
     }

    public PageReference DoSelect() {
    
   strX = ApexPages.currentPage().getParameters().get('X');
    rofr = new RelatedOfferings__c();                
                    rofr.Name = selectedValues;                   
                 //   rofr.Offering__c =idd;
                    rofr.Offering__c=  'a079000000Di7Ix';
                    insert rofr;
   // relatedoptions.add(new SelectOption('',strX));
        return null;
    }


  

     public List<SelectOption> getItems() {
      options= new List<SelectOption>();
            
            
            for (Offering__c c : alloffers1)
      {
           // options.add(new SelectOption(c.Id, c.Name));
            options.add(new SelectOption(c.Name,c.Name));
      } 
         /*   options.add(new SelectOption('US','US'));
            options.add(new SelectOption('CANADA','Canada'));
            options.add(new SelectOption('MEXICO','Mexico'));*/
            return options;
        }


 public List<SelectOption> getrelatedItems() {
           relatedoptions = new List<SelectOption>();
            
           for (RelatedOfferings__c c1 : relatedoffer1)
         {
           // relatedoptions.add(new SelectOption(c1.Name, c1.Id));
            relatedoptions.add(new SelectOption(c1.Name, c1.Name));
        } 
    
         /*   options.add(new SelectOption('US','US'));
            options.add(new SelectOption('CANADA','Canada'));
            options.add(new SelectOption('MEXICO','Mexico'));*/
            
        //    relatedoptions.add(new SelectOption('', 'test'));
            return relatedoptions;
        }

    public Relatedofferings_customController1() {


      alloffers = new List<SelectOption>();
    relatedoffer = new List<SelectOption>();
    for (Offering__c c : alloffers1)
      {
          //  alloffers.add(new SelectOption(c.Id, c.Name));
            alloffers.add(new SelectOption(c.Name, c.Id));
      } 

        for (RelatedOfferings__c c1 : relatedoffer1)
         {
            relatedoffer.add(new SelectOption(c1.Id, c1.Name));
        } 
    }
         
      
    

  
   
    public  List<Offering__c> offer { 
    get{
   List<Offering__c> offer1;
        offer1 = [Select id, Name,Description_Text_Area__c from Offering__c where id ='a079000000Di7Ix'];
        return offer1;
    }  
    
     set; }
    
    
   public  List<Offering__c> alloffers1 { 
    get{
   List<Offering__c> alloffers1;
        alloffers1 =   [Select id,  Name from Offering__c];
        return alloffers1;
    }  
    
     set; }   
 
   
   public  List<RelatedOfferings__c> relatedoffer1 { 
    get{
   List<RelatedOfferings__c> relatedoffer1;
        relatedoffer1 = [select id, Name ,seq__c from RelatedOfferings__c where  Offering__r.Id  ='a079000000Di7Ix' order by seq1__c];
        return relatedoffer1;
    }  
    
     set; }              

   
     
  
 }