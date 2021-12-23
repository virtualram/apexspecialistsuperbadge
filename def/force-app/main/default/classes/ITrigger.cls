public interface ITrigger 
{
   //dont define any public access modifiers in interface 
  
    void bulkbefore();
    void beforeupdate(sobject so ,Sobject sold);
   
}