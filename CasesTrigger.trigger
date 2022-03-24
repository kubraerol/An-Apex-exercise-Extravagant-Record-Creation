/**
 * Created by kerol on 24.03.2022.
 */

trigger CasesTrigger on Case (before insert) {

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            CasesTriggerHandler.beforeInsertHandler(Trigger.new);
        }
    }

}