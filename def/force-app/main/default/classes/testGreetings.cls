@isTest
private class testGreetings {
    static testMethod void testSayHello(){
            GreetingClass greeting = new GreetingClass();
            // you can add a System.runAs() here wrapping this call to get outcomes for a given user
            // test that sending 'Joe' as parameter to the sayHello method, the output is 'Hello Joe'
            System.assertEquals(greeting.sayHello('Joe'),'Hello Jo');
    }
}