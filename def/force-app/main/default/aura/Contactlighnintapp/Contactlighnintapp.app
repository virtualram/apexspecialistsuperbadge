<aura:application extends="force:slds">
    <!--<aura:application extends="force:slds">-->
    <link href='/resource/bootstrap/' rel="stylesheet"/>  
    <div class=" background-color:red  " role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a href="#" class="navbar-brand  ">Lightning Contacts</a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 .small">                
                <c:SearchKeyChange1 /> 
                <c:ContactList />
               <c:ContactDetails />
                <!--  <devlight1973:ContactDetails />-->
            </div>
            <div class="col-sm-8">
        </div>
        </div>
    </div>
</aura:application>