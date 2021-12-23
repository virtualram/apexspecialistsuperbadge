public class Exceptionhandler1Exception extends Exception{
    public void excpmethod(){
        try{
            throw new  Exceptionhandler1Exception('raisecustomexception');
        }catch(Exceptionhandler1Exception e){
        }
    }    
}