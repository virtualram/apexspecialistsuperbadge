public class Apexclassforvariables {
    
    public static void showdebugvalues(){
        
        List<String> strlist = new List<String>();
        strlist.add('Monday');
        strlist.add('Tuesday');
        strlist.add('Wednesday');
        strlist.add('Thursday');
        
        String x ='Dell';
        Integer z =10;
        system.debug(x +z +strlist);
        system.debug(strlist.size());
        for (String s:strlist){
            
            system.debug(s);
        }
        
        Map<String,String> mpcitystates = new Map<String,String>();
        mpcitystates.put('Maharashtra','Mumbai');
        mpcitystates.put('Karnataka','Bangalore');
        mpcitystates.put('TN','Chennai');
        
        system.debug(mpcitystates.get('Karnataka'));
        
        for(String m:mpcitystates.keyset()){
            system.debug(m);
        }
        
        for(String m:mpcitystates.values()){
            system.debug(m);
        }
        
        
    }
    
}