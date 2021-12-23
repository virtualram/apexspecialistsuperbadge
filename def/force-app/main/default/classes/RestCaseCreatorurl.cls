@RestResource(urlMapping='/GetCase2/*')
global with sharing class RestCaseCreatorurl {
 
    @HttpGet
    global static Case getCaseById() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
       Case result =  [SELECT CaseNumber,Subject,Status,Origin,Priority FROM Case WHERE Id = :caseId];
        return result;
       //use this url to call from workbench /services/apexrest/devlight1973/GetCase2/5009000001NxD87
        }
    
    @HttpPost
    global static  String createcase1(String status, String origin){
        
        Case cs = new Case();
        cs.Status = status;
        cs.Origin = origin;
        insert cs;
        return cs.id;
    }
    
    
}


       /*Java code to access
       package sfdc_rest;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;

import org.apache.http.client.methods.*;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.ParseException;
import org.apache.http.util.EntityUtils;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.client.ClientProtocolException;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.json.JSONException;
public class Main {
static final String USERNAME = "narenrr@yahoo.com";
static final String PASSWORD = "pwdWHVAUUcVWbxXMmKFQDEl1sgK0";
static final String LOGINURL = "https://login.salesforce.com";
static final String GRANTSERVICE =
"/services/oauth2/token?grant_type=password";
static final String CLIENTID = "3MVG9Y6d_Btp4xp7zpH04V6xgnCGIjiRvaGyUe3CIaIwVd5KmnEfStMNlYeql3EN3UugSvGlQ2pUh0QfkK4lj";
static final String CLIENTSECRET = "2948595789758136914";
public static void main(String[] args) {
DefaultHttpClient httpclient = new DefaultHttpClient();
// Assemble the login request URL
String loginURL = LOGINURL +
GRANTSERVICE +
"&client_id=" + CLIENTID +
"&client_secret=" + CLIENTSECRET +
"&username=" + USERNAME +
"&password=" + PASSWORD;
// Login requests must be POSTs
HttpPost httpPost = new HttpPost(loginURL);
HttpResponse response = null;
try {
// Execute the login POST request
response = httpclient.execute(httpPost);
} catch (ClientProtocolException cpException) {
// Handle protocol exception
} catch (IOException ioException) {
// Handle system IO exception
}
// verify response is HTTP OK
final int statusCode =response.getStatusLine().getStatusCode();
if (statusCode != HttpStatus.SC_OK) {
System.out.println("Error authenticating to Force.com:"+statusCode);
// Error is in EntityUtils.toString(response.getEntity())
return;
}
String getResult = null;
try {
getResult = EntityUtils.toString(response.getEntity());
} catch (IOException ioException) {
// Handle system IO exception
}
JSONObject jsonObject = null;
String loginAccessToken = null;
String loginInstanceUrl = null;
try {
jsonObject = (JSONObject) new JSONTokener(getResult).nextValue();
loginAccessToken = jsonObject.getString("access_token");
loginInstanceUrl = jsonObject.getString("instance_url");
} catch (JSONException jsonException) {
// Handle JSON exception
}
System.out.println(response.getStatusLine());
System.out.println("Successful login");
System.out.println(" instance URL: "+loginInstanceUrl);
System.out.println(" access token/session ID:"+loginAccessToken);
// release connection

HttpGet httpget = new HttpGet();//loginInstanceUrl +  "/services/data/v30.0/sobjects/GetCase/5009000001NxD81");
httpget.addHeader("Authorization", "OAuth " + loginAccessToken);
HttpResponse response1 = null;
URIBuilder builder;
try {
    builder = new URIBuilder(loginInstanceUrl + "/services/apexrest/devlight1973/GetCase/5009000001NxD81");

            httpget.setURI(builder.build());
        } catch (URISyntaxException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

String getResult1 = null;
    try{
    response1 =httpclient.execute(httpget);
    }catch(Exception e){
        System.out.println("error");
    }
System.out.println(response1.getStatusLine().getStatusCode() );
    if (response1.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                        try {
    
                            // Do the needful with entity.
                          
                            try {
                                getResult1 = EntityUtils.toString(response1.getEntity());
                            } catch (ParseException e) {
                                // TODO Auto-generated catch block
                                System.out.println(e.getMessage());
                            } catch (IOException e) {
                                // TODO Auto-generated catch bloc=
                                e.printStackTrace();
                                System.out.println(e.getMessage());
                            }
        
                            jsonObject = (JSONObject) new JSONTokener(getResult1).nextValue();
                             
    
                            System.out.println("Query response: " + jsonObject);
                        }catch(JSONException e){
                                        
                            
                        }

                                httpPost.releaseConnection();
}
}}
       */