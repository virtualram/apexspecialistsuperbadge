//Generated by wsdl2apex

public class AsyncSoapSforceComSchemasClassDevlight19 {
    public class CrAccountResponse_elementFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            soapSforceComSchemasClassDevlight19.CrAccountResponse_element response = (soapSforceComSchemasClassDevlight19.CrAccountResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class AsyncSoaprequestcreateAccount {
        public String endpoint_x = 'https://ap15.salesforce.com/services/Soap/class/devlight1973/SoaprequestcreateAccount';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        public soapSforceComSchemasClassDevlight19.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public soapSforceComSchemasClassDevlight19.CallOptions_element CallOptions;
        public soapSforceComSchemasClassDevlight19.DebuggingInfo_element DebuggingInfo;
        public soapSforceComSchemasClassDevlight19.SessionHeader_element SessionHeader;
        public soapSforceComSchemasClassDevlight19.DebuggingHeader_element DebuggingHeader;
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/devlight1973/SoaprequestcreateAccount';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/devlight1973/SoaprequestcreateAccount';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/devlight1973/SoaprequestcreateAccount';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/devlight1973/SoaprequestcreateAccount';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/devlight1973/SoaprequestcreateAccount';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/devlight1973/SoaprequestcreateAccount', 'soapSforceComSchemasClassDevlight19'};
        public AsyncSoapSforceComSchemasClassDevlight19.CrAccountResponse_elementFuture beginCrAccount(System.Continuation continuation,String Accname) {
            soapSforceComSchemasClassDevlight19.CrAccount_element request_x = new soapSforceComSchemasClassDevlight19.CrAccount_element();
            request_x.Accname = Accname;
            return (AsyncSoapSforceComSchemasClassDevlight19.CrAccountResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSoapSforceComSchemasClassDevlight19.CrAccountResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/devlight1973/SoaprequestcreateAccount',
              'CrAccount',
              'http://soap.sforce.com/schemas/class/devlight1973/SoaprequestcreateAccount',
              'CrAccountResponse',
              'soapSforceComSchemasClassDevlight19.CrAccountResponse_element'}
            );
        }
    }
}