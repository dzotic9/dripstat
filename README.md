[![DripStat](images/dripstat_logo.png)](../../../dripstat)
## Jelastic DripStat Add-on

This repository provides [DripStat](https://dripstat.com/) add-on for Jelastic Platform.

**DripStat** is a cool new way to monitor and look inside your running Java apps and automatically track exceptions. Jelastic users can enable DripStat monitoring on their Java apps with just a few clicks.

**Type of nodes this add-on can be applied to**: 
-  Tomcat 6
-  Tomcat 7
-  Jetty 6
-  Glassfish 3
-  Tomee

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

One of two initial options can be selected:
- I'm a new user in DripStat:
Select the "Application name" for your environment and fill in your first and last name to register at the DripStat control panel.
- I already have a license key:    
Select the "Application name" for your environment and fill in your "License key" which will be used at the DripStat control panel.

For more information on what DripStat Add-on can be used for, follow the [DripStat](https://dripstat.com/) reference.

### Deployment

In order to get this solution instantly deployed, click the "Get It Hosted Now" button, specify your email address within the widget, choose one of the [Jelastic Public Cloud providers](https://jelastic.cloud) and press Install.

[![GET IT HOSTED](https://raw.githubusercontent.com/jelastic-jps/jpswiki/master/images/getithosted.png)](https://jelastic.com/install-application/?manifest=https%3A%2F%2Fgithub.com%2Fjelastic-jps%2Fdripstat%2Fraw%2Fmaster%2Fmanifest.jps)

To deploy this package to Jelastic Private Cloud, import [this JPS manifest](../../raw/master/manifest.jps) within your dashboard ([detailed instruction](https://docs.jelastic.com/environment-export-import#import)).

For more information on what Jelastic add-on is and how to apply it, follow the [Jelastic Add-ons](https://github.com/jelastic-jps/jpswiki/wiki/Jelastic-Addons) reference.