public inherited sharing class Contactdxcreator {
    
  //  public string createonecontact(String name){
        public static string createonecontact(String name){
        try{
            Contact con = new Contact();
            con.lastname =name;
            insert con;
            system.debug(con.id);
            return con.id;
        } catch(exception e){
            system.debug(e.getmessage());
            return e.getmessage();
        }
        
        
        
    }
    
    
}