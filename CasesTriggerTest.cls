/**
 * Created by kerol on 24.03.2022.
 */
@IsTest
public with sharing class CasesTriggerTest {
    @TestSetup
    static void setup() {
        CaseSetting__c settings = new CaseSetting__c();
        settings.Name = 'Default';
        settings.MaxCasePerUser__c = 99;
        insert settings;
    }

    @IsTest
    static void testInsertANewCase() {
        Case c = new Case();
        c.Status = 'Open';
        insert c;

        List<Case> createdCases = [SELECT Id from Case where CreatedDate = THIS_MONTH];
        System.assert(createdCases.size() == 1);
    }

    @IsTest
    static void testInsertBulkCaseWithinTheLimit() {
        List<Case> newCases = new List<Case>();
        Decimal maximum = CaseSetting__c.getValues('Default').MaxCasePerUser__c;

        for (Integer i = 0; i < maximum; i++) {
            Case c = new Case();
            c.Subject = 'New case: ' + i;
            newCases.add(c);
        }
        insert newCases;

        List<Case> createdCases = [SELECT Id from Case where CreatedDate = THIS_MONTH];
        System.assert(createdCases.size() == maximum);
    }

    @IsTest
    static void testInsertBulkCaseOverTheLimit() {
        List<Case> newCases = new List<Case>();
        Decimal maximum = CaseSetting__c.getValues('Default').MaxCasePerUser__c;

        for (Integer i = 0; i < maximum + 1; i++) {
            Case c = new Case();
            c.Subject = 'New case: ' + i;
            newCases.add(c);
        }
        Boolean errorExist = false;
        try {
            insert newCases;
        } catch (Exception ex) {
            System.debug(ex.getMessage());
            errorExist = true;
        }
        System.assert(errorExist);
    }

    @IsTest
    static void testPartialInsertConsideringTheLimit() {
        List<Case> newCases = new List<Case>();
        Decimal maximum = CaseSetting__c.getValues('Default').MaxCasePerUser__c;

        for (Integer i = 0; i < maximum + 1; i++) {
            Case c = new Case();
            c.Subject = 'New case: ' + i;
            newCases.add(c);
        }

        Database.insert(newCases, false);

        List<Case> createdCases = [SELECT Id from Case where CreatedDate = THIS_MONTH];
        System.assert(createdCases.size() == maximum);
    }

    @IsTest
    static void testCodeNotConsiderLastMonth() {

        Case caseInLastMonth = new Case();
        caseInLastMonth.Subject = 'Last months case';
        insert caseInLastMonth;
        Datetime lastMonth = Datetime.now().addDays(-41);
        Test.setCreatedDate(caseInLastMonth.Id, lastMonth);
        System.assert(caseInLastMonth.Id != null);

        List<Case> newCases = new List<Case>();
        Decimal maximum = CaseSetting__c.getValues('Default').MaxCasePerUser__c;
        for (Integer i = 0; i < maximum; i++) {
            Case c = new Case();
            c.Subject = 'New case: ' + i;
            newCases.add(c);
        }
        insert newCases;

        List<Case> createdCases = [SELECT Id from Case where CreatedDate = THIS_MONTH];
        System.assert(createdCases.size() == maximum);
    }

}