/**
 * Created by kerol on 24.03.2022.
 */

public with sharing class CasesTriggerHandler {

    public static void beforeInsertHandler(List<Case> cases) {
        Id userId = System.UserInfo.getUserId();
        Decimal maximum = CaseSetting__c.getValues('Default').MaxCasePerUser__c;

        List<Case> existingCasesOfUser = [SELECT Id, CreatedBy.Name from Case where CreatedById = :userId and CreatedDate =THIS_MONTH];

        Integer existingCasesSize = existingCasesOfUser.size();
        for (Case c : cases) {
            if (existingCasesSize >= maximum) {
                c.addError('Too many cases created this month for user ' + c.CreatedBy.Name + '(' + userId + '): ' + maximum);
            } else {
                existingCasesSize = existingCasesSize + 1;
            }
        }
    }

}