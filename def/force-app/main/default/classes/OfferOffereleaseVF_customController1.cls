public with sharing class OfferOffereleaseVF_customController1 {
    public String strX {
        get;set;
    }
    public String idd {
        get;set;
    }
    public String aName {
        get;set;
    }
    public String arvn {
        get;set;
    }
    public String arvt {
        get;set;
    }
    public String aparentoffer {
        get;set;
    }
    public Integer seqc {
        get;set;
    }
    public Offering_Release__c ofr;
    //within custom controller create variables including your lists
    //these list objects get invoked whenever the object name is invoked in apex tag value ={!varobject}
    public List < Offering__c > offer {
        get {
            List < Offering__c > offer1;
            offer1 = [Select id, Name, Description_Text_Area__c from Offering__c];
            return offer1;
        }
        set;
    }
    public List < Offering_Release__c > offerrelease1 {
        get {
           transient List < Offering_Release__c > offerrelease1;
            offerrelease1 = [Select Offering_ID_Master_Detail_Rel__r.Id, id, Name, Release_Name_Text__c from Offering_Release__c where Offering_ID_Master_Detail_Rel__r.Id = : strX];
            return offerrelease1;
        }
        set;
    }
    public List < Core_Team_Member__c > ctm {
        get {
           transient List < Core_Team_Member__c > ctm;
            ctm = [Select id, name, Role_ID_Master_Detail_Rel__c, User_ID_Lookup_Rel__r.Id, User_ID_Lookup_Rel__r.LastName, User_ID_Lookup_Rel__r.Username, Role_ID_Master_Detail_Rel__r.Name from Core_Team_Member__c where Offering_Release_ID_Master_Detail_Rel__r.Offering_ID_Master_Detail_Rel__r.Id = : strX];
            return ctm;
        }
        set;
    }
    public PageReference TestX() {
        strX = ApexPages.currentPage().getParameters().get('X');
        idd = strX;
        return null;
    }
    public PageReference TestX1() {
        // offerrelease1.add();
        ofr = new Offering_Release__c();
        ofr.Name = aName;
        ofr.Release_Name_Text__c = arvn;
        ofr.Release_Version_Text__c = arvt;
        ofr.Offering_ID_Master_Detail_Rel__c = idd;
        insert ofr;
        return null;
    }
}