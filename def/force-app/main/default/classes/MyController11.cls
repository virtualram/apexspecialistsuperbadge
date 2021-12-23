Public class MyController11 {
Public string MyString_From_Methode{get;set;}

    public MyController11(ApexPages.StandardController controller) {

    }

    public string ActionFunMethode(){
     MyString_From_Methode = 'Method called from js using Action function';
     return null;
    }
}