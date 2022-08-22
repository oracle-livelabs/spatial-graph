to do:
- optional lab: spatial operations that create new geoms > visualize i.e. aggr convex hull, buffer, intersect, problems to strategize/discuss
- pitfalls, i.e. failed spatial index, must fro artifacts;  geojson load


# Introduction

## About Oracle Spatial

Oracle’s mission is to help people see data in new ways, discover insights, and unlock endless possibilities. Spatial analysis is about understanding complex interactions based on geographic relationships – answering questions based on where people, assets, and resources are located. Spatial insights enable you to provide better customer service, optimize your workforce, locate retail and distribution centers, evaluate sales and marketing campaigns, and more. With Oracle’s spatial offerings, developers, database professionals, and analysts can use a comprehensive suite of spatial data management, analytics, and visualization tools to integrate spatial analysis and mapping into applications on enterprise grade data management infrastructure – Oracle Database and Oracle Exadata. Innovative technologies of Oracle Cloud and Oracle Autonomous Database, the industry’s only self-driving, self-securing, and self-repairing database, are available to spatial applications. 

As illustrated below, the spatial features of Oracle Database provide scalable and performant storage, processing and analysis of both basic and advanced spatial data types. A series of deployable Java EE components are also provided to support common mid-tier services. 

  ![img alt text](./images/spatial-platform.png)

For more information please visit [https://oracle.com/goto/spatial] (https://oracle.com/goto/spatial)

Estimated Workshop Time: 60 minutes

### Workshop Overview

In this workshop you will create and configure spatial data and perform some basic spatial queries.  The scenario involves STORES, WAREHOUSES, SALES\_REGIONS, and a historical TORNADO\_PATHS. You will create and configure these spatial tables, and then perform spatial queries to explore their relationships based on proximity and containment.


### Prerequisites

<if type="adb">
- An Oracle Cloud Account 
</if> 
<if type="anydb">
- This workshop requires access to an Oracle Database and SQL client (i.e., SQL Developer, SQL Developer Web, SQL*Plus). 
- If you already have access to these, then following this Introduction you may skip to the section Create Sample Data. 
- Otherwise you should proceed to sections Oracle Cloud Account, Autonomous Database, and SQL Developer Web.
- No previous experience with Oracle Spatial is required.
- An Oracle Cloud Account  
</if>

## Acknowledgements

* **Author** - David Lapp, Database Product Management, Oracle
* **Last Updated By/Date** - 


