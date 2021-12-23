global class VFRemotingcontroller {

    
    
    @RemoteAction //the function to be called in remote action should use this annotation
    global static list<Account> getaccounts() {
        //function should be static and global else it will throw error
        list<Account> acc1 = [SELECT id,name FROM account limit 5];
        if(acc1!=null && !acc1.isEmpty()){        
            return acc1;        
        }else{        
            return  new list<account>();        
        }
    }
}