global class HelloService {
    webservice static String sayHello(String name,String Phone){
        Contact con = new Contact(LastName = name,homephone=phone);
        insert con;        
        return 'Hello  ' + con.LastName + ' ! : ' + con.Id;       
    }
}