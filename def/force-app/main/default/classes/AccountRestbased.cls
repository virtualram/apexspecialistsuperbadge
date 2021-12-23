@RestResource(urlMapping='/postacc/*')
global with sharing class AccountRestbased {
    @HttpPost
    global static String postacc(String accName) {
        RestRequest request = RestContext.request;
        // grab the name from json param
       Account acc = new Account(Name=accNAme);
       insert acc;
        return acc.id;
       //use this url to call from workbench /services/apexrest/devlight1973/postacc/
        }
       }