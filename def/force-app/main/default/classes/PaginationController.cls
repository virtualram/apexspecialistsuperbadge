public class PaginationController {
  
    public List<Contact> contactlist {get;set;}
    public Integer breakpoint =0;
    public ApexPages.StandardSetController apcontactset{get;set;}
    public string str = ' ';
    public Integer xx = 5;
    public Id contactid {get;set;}
    public string contactname {get;set;}
    public string str1 {get;set;}
    public string accountid {get;set;}
    //gettotal count of records
    public PaginationController(){//constructor fires only when the page is initialised and not when methods are called
     system.debug('inside constructor');   
    firstpage();
       /*  apcontactset = new  ApexPages.StandardSetController(Database.getquerylocator(str));
         apcontactset.setpagesize(xx);
        contactlist =new List<contact>();
         contactlist = (List<contact>)apcontactset.getRecords();        */       
    }
    
    public void firstpage(){
       system.debug('inside firstpage');   
        str ='select id,name,firstname,lastname from contact';
         apcontactset = new  ApexPages.StandardSetController(Database.getquerylocator(str));        
         apcontactset.setpagesize(xx);        
        contactlist =new List<contact>();
         contactlist = (List<contact>)apcontactset.getRecords();        
         breakpoint =1;
          system.debug('inside firstpage'+':'+contactlist+':'+apcontactset);
    }
    public  void nextpage(){
        
      //  if(apcontactset.gethasnext()){
      //  str= 'select id,name from contact limit 20 offset 6';
     //   apcontactset = new  ApexPages.StandardSetController(Database.getquerylocator(str));
         //  apcontactset.setpagesize(xx);
        
     //   contactlist =new List<contact>();
         apcontactset.save();
        apcontactset.next();
         contactlist = (List<contact>)apcontactset.getRecords();    
          system.debug('inside secondpage'+':'+contactlist+':'+apcontactset);
        //}
    }    
    
    public void updatecontact(){
        str1= String.valueOf(ApexPages.currentPage().getParameters().get('contactid'));
        system.debug(str1+'test');
        system.debug(contactid);
       // system.debug('updatecontact method'+contactid);
        List<Contact> cn = new List<Contact>();
        cn =[select id,lastname from contact where id =:contactid];
      //  System.debug(cn.size());
        if(cn.size()>0){
        cn[0].lastname = contactname;
        //system.debug(cn[0].lastname +contactname);
        update cn;
        
        system.debug(cn[0].lastname +contactname);
            
        }
    }
}