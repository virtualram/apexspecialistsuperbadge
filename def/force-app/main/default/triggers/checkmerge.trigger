trigger checkmerge on Contact (before delete) {

for (Contact c:trigger.old){


   system.debug( Wrapperclassdeletevar.contactdelmap.get(c.id));
  if(c.LastName== 'Testmerge')
  {
      c.adderror('Cannot merge');
  
  }
  
}

}