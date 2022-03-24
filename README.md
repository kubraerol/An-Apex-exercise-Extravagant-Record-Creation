# An Apex exercise: Extravagant-Record-Creation

Problem is retrieved from https://www.sfdc99.com/2014/11/10/show-me-the-code-extravagant-record-creation/

What to do:
1. Write a trigger that will prevent each user from creating more than 99 cases a month!
2. The maximum number of cases per user should be configurable without code. Each user will have the same maximum.
3. Users should see the following error message if they break their max:
'Too many cases created this month for user <<Name>> (<<User ID>>): <<Maximum>>'
5. Don’t forget your test class!
  
** 3 apex classes (trigger class, trigger handler- class, test class) are developed for the solution. 
Worked on applying recommended best practices for trigger developments. (https://trailhead.salesforce.com/en/content/learn/modules/apex_triggers, https://niksdeveloper.com/salesforce/apex-trigger-best-practices-all-in-one/)
  
*** To make the maximum number is configurable, a new custom setting is created. (Setting Type of the setting is list. If you can not select the type as list, please check 'Manage list custom settings type' is enabled in 'Schema Settings') 
  ![image](https://user-images.githubusercontent.com/34946067/160011786-f9cc6871-e635-4a46-96b7-bf16a9c044b2.png)
