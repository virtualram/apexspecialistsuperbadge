# apexspecialistsuperbadge source code and other code samples for folks learning saleforce development .



Find Apex code samples for 
1. Apex class
2. Soap API
3. Rest API
4. Batch Apex
5. Standard,custom and extension controllers for Visualforce pages
6. Controllers for LWC components
7. Controllers for Aura components
8. LWC examples
9. Aura examples 




Apex Specialist
What You'll Be Doing to Earn This Superbadge
Automate record creation using Apex triggers
Synchronize Salesforce data with an external system using asynchronous REST callouts
Schedule synchronization using Apex code
Test automation logic to confirm Apex trigger side effects
Test integration logic using callout mocks
Test scheduling logic to confirm action gets queued
Concepts Tested in This Superbadge
Apex Triggers
Asynchronous Apex
Apex Integration
Apex Testing
Pre-work and Notes
Grab a pen and paper. You may want to jot down notes as you read the requirements.

Refer to the Apex Specialist Superbadge: Trailhead Challenge Help document for detailed resources and documentation.

Use the naming conventions specified in the requirements document to ensure a successful deployment.

Review the data schema in your modified Salesforce org as you read the detailed requirements below.

Set Up Development Org
Create a new Trailhead Playground or Developer Edition Org for this superbadge. Using this org for any other reason might create problems when validating the challenge. If you choose to use a development org, make sure you deploy My Domain to all the users. The package you will install has some custom lightning components that only show when My Domain is deployed.

Install this unlocked package (package ID: 04t6g000008av9iAAA). This package contains metadata you'll use to complete this challenge. If you have trouble installing this package, follow the steps in the Install a Package or App to Complete a Trailhead Challenge help article.

Add picklist values Repair and Routine Maintenance to the Type field on the Case object.

Update the Case page layout assignment to use the Case (HowWeRoll) Layout for your profile.

Rename the tab/label for the Case tab to Maintenance Request.

Update the Product page layout assignment to use the Product (HowWeRoll) Layout for your profile.

Rename the tab/label for the Product object to Equipment.

Use App Launcher to navigate to the Create Default Data tab of the How We Roll Maintenance app. Click Create Data to generate sample data for the application.

Review the newly created records to get acquainted with the data model.

Note
Notes
Before you begin the challenges, review the help article for this superbadge. This document will help you find useful resources to complete this superbadge and assist with frequently asked questions.

Review the help article relating to superbadge challenges for more information about credential security.

Use Case
There are two kinds of people in this world: those who would travel in a recreational vehicle (RV) and those who wouldn’t. The RV community is increasing exponentially across the globe. Over the past few years, HowWeRoll Rentals, the world’s largest RV rental company, has increased its global footprint and camper fleet tenfold. HowWeRoll offers travelers superior RV rental and roadside assistance services. Their tagline is, “We have great service, because that’s How We Roll!” Their rental fleet includes every style of camper vehicle, from extra large, luxurious homes on wheels to bare bones, retro Winnebagos.

You have been hired as the lead Salesforce developer to automate and scale HowWeRoll’s reach. For travelers, not every journey goes according to plan. Unfortunately, there’s bound to be a bump in the road at some point along the way. Thankfully, HowWeRoll has an amazing RV repair squad who can attend to any maintenance request, no matter where you are. These repairs address a variety of technical difficulties, from a broken axle to a clogged septic tank.

As the company grows, so does HowWeRoll’s rental fleet. While it’s great for business, the current service and maintenance process is challenging to scale. In addition to service requests for broken or malfunctioning equipment, routine maintenance requests for vehicles have grown exponentially. Without routine maintenance checks, the rental fleet is susceptible to avoidable breakdowns.

That’s where you come in! HowWeRoll needs you to automate their Salesforce-based routine maintenance system. You’ll ensure that anything that might cause unnecessary damage to the vehicle, or worse, endanger the customer is flagged. You’ll also integrate Salesforce with HowWeRoll’s back-office system that keeps track of warehouse inventory. This completely separate system needs to sync on a regular basis with Salesforce. Synchronization ensures that HowWeRoll’s headquarters (HQ) knows exactly how much equipment is available when making a maintenance request, and alerts them when they need to order more equipment.

Standard Objects
You’ll be working with the following standard objects:

Maintenance Request (renamed Case) — Service requests for broken vehicles, malfunctions, and routine maintenance.
Equipment (renamed Product) — Parts and items in the warehouse used to fix or maintain RVs.
Custom Objects
Vehicle — Vehicles in HowWeRoll’s rental fleet.
Equipment Maintenance Item — Joins an Equipment record with a Maintenance Request record, indicating the equipment needed for the maintenance request.
Entity Diagram
Entity Diagram - Vehicle, Maintenance Request, Equipment Maintenance Item, Equipment

Business Requirements
This section represents the culmination of your meetings with key HowWeRoll stakeholders. It’s your blueprint to programmatically automate the support and maintenance side of their business.

Automate Maintenance Requests
With the exponential increase in RV popularity worldwide, HowWeRoll is supplying hundreds more luxury and economy vehicles around the globe. Along with this increase in their rental stock comes an inevitable increase in equipment failure. HowWeRoll has an existing process to handle these failures, but they want you to build an automation for their routine maintenance. You’ll build a programmatic process that automatically schedules regular checkups on the equipment based on the date that the equipment was installed.

Note
Notes
Use the help article for this superbadge to reference the API names of the objects and fields. This accelerates your development process by not going back and forth between Setup and your development tool.

When an existing maintenance request of type Repair or Routine Maintenance is closed, create a new maintenance request for a future routine checkup. This new maintenance request is tied to the same Vehicle and Equipment Records as the original closed request. This new request's Type should be set as Routine Maintenance. The Subject should not be null and the Report Date field reflects the day the request was created. Remember, all equipment has maintenance cycles. Therefore, calculate the maintenance request due dates by using the maintenance cycle defined on the related equipment records. If multiple pieces of equipment are used in the maintenance request, define the due date by applying the shortest maintenance cycle to today’s date.

Design this automated process to work for both single and bulk maintenance requests. Bulkify the system to successfully process approximately 300 records of offline maintenance requests that are scheduled to import together. For now, don’t worry about changes that occur on the equipment record itself.

Also expose the logic for other uses in the org. Separate the trigger (named MaintenanceRequest) from the application logic in the handler (named MaintenanceRequestHelper). This setup makes it simpler to delegate actions and extend the app in the future.

Synchronize Inventory Management
In addition to equipment maintenance, automate HowWeRoll’s inventory data synchronization with the external system in the equipment warehouse. Although the entire HQ office uses Salesforce, the warehouse team still works on a separate legacy system. With this integration, the inventory in Salesforce updates after the equipment is taken from the warehouse to service a vehicle.

Write a class that makes a REST callout to an external warehouse system to get a list of equipment that needs to be updated. The callout’s JSON response returns the equipment records that you upsert in Salesforce. Beyond inventory, ensure that other potential warehouse changes carry over to Salesforce. Your class maps the following fields: replacement part (always true), cost, current inventory, lifespan, maintenance cycle, and warehouse SKU. Use the warehouse SKU as the external ID to identify which equipment records to update within Salesforce.

Although HowWeRoll is an international company, the remote offices follow the lead of the HQ’s work schedule. Therefore, all maintenance requests are processed during HQ’s normal business hours. You need to update Salesforce data during off hours (at 1:00 AM). This logic runs daily so that the inventory is up to date every morning at HQ.

Create Unit Tests
Test your code to ensure that it executes correctly before deploying it to production.

First, test the trigger to ensure that it works as expected. Follow best practices by testing for both positive use cases (when the trigger needs to fire) and negative use cases (when the trigger must not fire). Of course, passing a test doesn’t necessarily mean you got everything correct. So add assertions into your code to ensure you don’t get false positives. For your positive test, assert that everything was created correctly, including the relationships to the vehicle and equipment, as well as the due date. For your negative test, assert that no work orders were created.

As mentioned previously, the huge wave of maintenance requests could potentially be loaded at once. The number will probably be around 200, but to account for potential spikes, pad your class to successfully handle at least 300 records. To test this, include a positive use case for 300 maintenance requests and assert that your test ran as expected.

When you have 100% code coverage on your trigger and handler, write test cases for your callout and scheduled Apex classes. You need to have 100% code coverage for all Apex in your org.

Ensure that your code operates as expected in the scheduled context by validating that it executes after Test.stopTest() without exception. Also assert that a scheduled asynchronous job is in the queue. The test classes for the callout service and scheduled test must also have 100% test coverage.

Superbadge Complete!
+13000 Points
Hi Student's,
NEW YEAR NEW courses,NEW coupons
JAVA for beginners
https://www.tutorialspoint.com/market/course/preview.jsp/6223
Python https://www.tutorialspoint.com/market/course/preview.jsp/6021

Angular and React =>https://www.tutorialspoint.com/market/course/preview/6022

Html javascript =>https://www.tutorialspoint.com/market/course/preview/6020

:Salesforce Apex : https://www.tutorialspoint.com/market/course/preview/6032
Salesforce Admin :https://www.tutorialspoint.com/market/course/preview.jsp/6013

Salesforce LWC => https://www.tutorialspoint.com/market/course/preview/6030
Best Regards,
👍


Best Regards

