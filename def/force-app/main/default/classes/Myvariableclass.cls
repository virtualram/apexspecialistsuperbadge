public class Myvariableclass {
    
    public  static void runvariables(){
        
        
        List<String> z = new List<String>();
        z.add('test1');
        z.add('test2');
        z.add('test3');
        for (String zz:z){
            system.debug(zz);   }
        
        Set<String> s = new set<String>();
        s.add('test3');
        s.add('test3');
        system.debug(s);
        
        String a = 'B';
        Map<String,String> prodmap = new Map<String,String>();
        prodmap.put('A','Laptop');
        prodmap.put('B','Cellphone');
        system.debug(prodmap.get(a));//finding a key and value pair by passing key value
        system.debug(prodmap);
        for(String m:prodmap.keyset()){//can also use prodmap.values
            system.debug(m);
        }
        
        
    }
    
}