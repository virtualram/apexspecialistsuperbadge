public class accwrap {
    
    public boolean selectaccount{get;set;}
    public account acc{get;set;}
    public List<accwrap> acslist{get;set;}
    public List<accwrap> acslist2{get;set;}
    public  accwrap acs{get;set;}
    
    
    public void addthis2(){
       
        acslist2 = new List<accwrap>();
       system.debug(acslist);
        for (accwrap aw:acslist){ 
            system.debug('test'+aw.selectaccount);
            if(aw.selectaccount == true)
                acslist2.add(aw);
            
        }   system.debug('second list'+acslist2);}
        // public void accwrapit(List<account> acclist,boolean selectaccount){
        public void accwrapit(List<account> acclist){
            
            acslist = new List<accwrap>();
            acs =  new accwrap();
            acslist  = new List<accwrap>();
            for (account a:acclist){
                acs.acc = a;
                acs.selectaccount = false;
                acslist.add(acs);
                
            }system.debug(acslist);}}