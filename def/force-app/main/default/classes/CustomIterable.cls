global class CustomIterable implements  Iterator<SObject>{ 
   List<Account> accs {get; set;} 
   Integer i {get; set;} 
  
   public CustomIterable(){ 
       accs = [SELECT id, name, numberofEmployees FROM Account limit 10]; 
       i = 0; 
   }   
   global boolean hasNext(){ 
       if(i >= accs.size()) 
           return false; 
       else 
           return true; 
   }    
   global Account next(){ 
       if(i == 8){ i++; return null;} 
       i=i+1; 
       return accs[i-1]; 
   } 
}