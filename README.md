# Extravagant-Record-Creation
An APEX exercise

Problem is retrieved from https://www.sfdc99.com/2014/11/10/show-me-the-code-extravagant-record-creation/

Requirements:
1. Write a trigger that will prevent each user from creating more than 99 cases a month!
2. The maximum number of cases per user should be configurable without code. Each user will have the same maximum.
3. Users should see the following error message if they break their max:
4. Too many cases created this month for user <<Name>> (<<User ID>>): <<Maximum>>
5. Don’t forget your test class!
  
3 apex classes (trigger class, trigger handler- class, test class) are developed for the solution. 
Worked on applying recommended best practices for trigger developments. (https://trailhead.salesforce.com/en/content/learn/modules/apex_triggers, https://niksdeveloper.com/salesforce/apex-trigger-best-practices-all-in-one/)
  
