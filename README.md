# Jelastic DripStat Add-on

This repository provides [DripStat](https://dripstat.com/) add-on for Jelastic Platform.

**DripStat** is a cool new way to monitor and look inside your running Java apps and automatically track exceptions. Jelastic users can enable DripStat monitoring on their Java apps with just a few clicks.

**Type of nodes this add-on can be applied to**:
-  tomcat7
-  jetty6
-  tomcat6
-  glassfish3
-  tomee

### What it can be used for?
1. Visibility Across Layers
  -  **Details of every layer**<br />
     Every layer is automatically identified. See complete detail per layer to pinpoint the root cause of performance issues.
  -  **Database Monitoring**<br />
     See how much time your queries are taking, down to the statment level.
  -  **External Services Monitoring**<br />
     See every External Service and how much time is spent calling External Services.
2. Code Level Visibility
  -  **Code Level view of transactions**<br />
     See every transaction processed by your system. Drill into any one and see exactly where time is being spent.
  -  **Transaction Traces**<br />
     See the full stacktrace and pinpoint the exact line of code which made your application go slow. See the exact queries or external services which caused performance drop.
  -  **Pinned Transactions**<br />
     Flag your key business transactions to quickly spot issues.
  -  **Asynchronous Code Support**<br />
     Capture all asynchronous actvitiy in your Java and Scala apps.
3. Error Monitoring
  -  **See all uncaught exceptions**<br />
     See the exact exceptions and the transaction responsible for throwing it.
  -  **Full Stacktrace**<br />
     See the full stacktrace of your exceptions.
4. JVM Monitoring
  -  **Detailed Stats per JVM**
  -  **GC Monitoring**<br />
     Get details of GC activity in your JVM, down to the individual pause.
  -  **Detailed Memory Stats**<br />
     Detailed stats on every memory pool within your JVM.
  -  **JVM Level Alerts**<br />
     Get alerted if you run into High GC or High Heap Usage. Prevent your JVM from running into OutOfMemory Exceptions.
5. Alerts that don't overwhelm
6. Optimize Hardware Utilization

     


### What Jelastic add-on is?

Jelastic add-on represents a package with a kind of a patch, that can be applied to an environment in order to improve and complement its functionality. The full list of the available at a platform add-ons can be seen at the corresponding same-named section of [Jelastic Marketplace](https://docs.jelastic.com/marketplace#add-ons].

### How to install an add-on?
###### For Developers

In case you can’t find the desired package within the list of available ones, copy and save the content of add-on’s manifest as a *.json* file and [import](https://docs.jelastic.com/environment-export-import#import) it to the dashboard. Herewith, you can apply any necessary adjustments to an add-on through this file (if such are required) and install its customized version in the similar way.

###### For Cluster Admins

In order to add the desired add-on to your platform and make it available for users, perform the following:
- copy content of its manifest 
- switch to the [Marketplace](http://ops-docs.jelastic.com/marketplace-46) section of your JCA panel and choose **Add > Add-on** menu option
- paste the copied strings into the appeared frame and **Save** the template
- choose your newly added add-on within the list and click on **Publish** above

Also, you are able to adjust the given add-on template according to your needs and provide its customized version.