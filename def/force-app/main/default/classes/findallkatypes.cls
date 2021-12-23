public with sharing class findallkatypes{//finds all KAV types in article
 public static void createDescribeMap() {
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        Set<String> keySet = gd.keySet();
        for (String key : keySet) {
            Schema.SObjectType objectType = gd.get(key);
            if (key.endsWith('kav') || key.endsWith('kb')) {
                system.debug(objectType.getDescribe().getName());
            }
        }
    }
}