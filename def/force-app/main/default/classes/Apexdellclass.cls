public with sharing class Apexdellclass {
    
    
    public static void exec1method(){
        
        List<String> str1= new List<String>();
        str1.add('Red');
        str1.add('black');
        str1.add('blue');
        system.debug(str1);
        system.debug(str1[1]);
        Integer x = str1.size();
        Integer z=0;
        while(z <x-1){
            
            system.debug(str1[z]);  
            z++;
        }
        Map<String,String> mp1 = new Map<String,String>();
        mp1.put('Mumbai','Pune');
        mp1.put('Delhi','Agra');
        mp1.put('Bengaluru','Mysuru');
        system.debug(mp1);
        system.debug(mp1.keyset());
        system.debug(mp1.get('Delhi'));
        
    }
}