global class  Newaccountclass{

webservice static Id createacc(String name){

  Account acc = new Account();
  acc.name = name;
  insert acc;
  return acc.id;
} 


}