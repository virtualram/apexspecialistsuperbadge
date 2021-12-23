public class CheckAssignment {
  
// @InvocableVariable(required=true)  
 //public String xx;
    @InvocableMethod 
  //  public static void assigner(List<case> cs){
  
    public static  void assigner(){
  String xx;  
  List<Case> cs;   
 AssignmentRule AR = new AssignmentRule();
   AR = [select id from AssignmentRule where SobjectType = 'Case' and Active = true limit 5];

//Creating the DMLOptions for "Assign using active assignment rules" checkbox
Database.DMLOptions dmlOpts = new Database.DMLOptions();
dmlOpts.assignmentRuleHeader.assignmentRuleId= AR.id;     
  //  156342
   // 156103
                
  cs =[select id from case where id =:xx];

  for(case c:cs){
    c.setOptions(dmlOpts);
    //insert newCase ;
    }
    update cs;
        system.debug ('called from process builder');
       
    }}