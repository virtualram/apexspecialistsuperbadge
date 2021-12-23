trigger accounttriggerframework on Account (before update) {
    
    
    alltriggerhandler.gethandler(account.sobjecttype);//hardly any code in trigger due to seperation of concern
}