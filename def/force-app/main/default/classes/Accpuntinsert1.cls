public class Accpuntinsert1 {
    public static void createacc(String accname){
        
        Account acc = new account();
        acc.name=accname;
        insert acc;
        system.debug(acc.id);
    }
}