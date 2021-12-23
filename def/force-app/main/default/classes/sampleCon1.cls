public class sampleCon1 {
    
        public String[] countries {get;set;}
        
        public list<Contact> cc {get;set;}
        public  List<wrapperclass> wpl {get;set;}
         
        public List<wrapperclass> getcons(){        
        
        cc =[select id,name from  contact];
        wpl = new List<wrapperclass>();
        for(contact c:cc){
            
            wpl.add(new wrapperclass(c,false)); 
            }
         return wpl;
      
        }    
        public PageReference test() {
        return null;
        }
              
        public List<SelectOption> getItems() {
            List<devlight1973__TagObject__c> to = new List<devlight1973__TagObject__c>();
            to =[Select id,name from devlight1973__TagObject__c];
            List<SelectOption> options = new List<SelectOption>();
            
        
            for (TagObject__c t:to){
                  
             options.add(new SelectOption(t.name,t.name));

            }           
           return options;
        }
            
      
        
       
        
        public List<devlight1973__ContactTag__c> getcust(){
        return [Select Name,Contact__r.name,TagObject__r.name from devlight1973__ContactTag__c];// you need to place a limit of 1000 as VF supports max of 1000 recors to be displayed

        }
}