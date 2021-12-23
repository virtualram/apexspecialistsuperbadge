trigger hoteltest on Masterhotelbill__c (after insert) {
List<Masterhotelbill__c> masterhotellistitems =
[SELECT j.name
FROM Masterhotelbill__c j
WHERE Masterhotelbill__c.id IN :Trigger.new
FOR UPDATE];




for (Masterhotelbill__c li: masterhotellistitems) {
{
li.name = li.name +'ok';
}
}
update masterhotellistitems;

}