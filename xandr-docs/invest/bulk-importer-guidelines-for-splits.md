---
title: Bulk Importer Guidelines for Splits
description: In this article, understand the bulk importer guidelines and the setup for splits when adding data to the bulk importer template.
ms.date: 10/28/2023
---

# Bulk importer guidelines for splits

> [!WARNING]
> Please do not rename the Splits sheet within the bulk importer template.

## Temporary ID information

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| LI Temporary Id | Specifies the identifier used to link a split to a parent line item within the spreadsheet. This is a placeholder value and will not be the actual identifier of the newly-created object. | Alphanumeric value | No | example123 |
| Split Temporary Id | Specifies the identifier used to link new objects to a parent split within the spreadsheet. This is a placeholder value and will not be the actual identifier of the newly-created object. | Alphanumeric value | No | example123 |

## Split setup

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Split Id | Specifies the identifier assigned to the split. <br><br> **Note**: If the split identifier isn't provided, a new split will be created. | Numeric value | No | 1234 |
| Line Item Id | Specifies the identifier of the existing line item that the split will be associated to. | Numeric value | Yes | 1234 |
| Split Name | Specifies the name of the split. | - Characters <br> - Default, if it is the default split | Yes | My split name or default |
| Is Default | Specifies whether the split should be the default. | - TRUE <br> - FALSE | Yes | FALSE |
| Active | Specifies the current status of the split. | - TRUE <br> - FALSE | Yes | TRUE |
| Priority | If an impression applies to multiple splits, the priority determines which split will be assigned to that impression. | Numeric value | Yes | 1 |
| Spend Allocation | Specifies which percentage of the line item budget should be allocated to the split. | Numeric value | No | 20 |
| Cap | Specifies the capping behavior of the split. | - constrained <br> - unconstrained | Yes, if allocation is present. | unconstrained |
| Bid Modifier | Specifies the bid amount that has been modified. <br><br> **Note**: This is only used if the line item has CPM specified as the Revenue Type. | Numeric value | Yes, if the line item has CPM specified as the Revenue Type. | 2 |
| Max Revenue Bid | Specifies the expected value of the split. <br><br> **Note**: This is only used if the line item has Dynamic CPM or Cost Plus specified as its Revenue Type. | Numeric value | Yes, if the line item has Dynamic CPM or Cost Plus specified as the Revenue Type. | 8 |
| Creatives | Specifies a comma-separated list of creative identifiers that correspond to the creatives associated with the split. | Numeric value | No | 123456,5432345,232554 |
| User Test Group Percent | Specifies the percentage of users in each test group. <br><br> **Note**: A line item can only contain up to 100 splits. | An integer between 0 and 100 | No | 30 |

## Conditions

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Country | Specifies whether or not to target impressions based on the user's country. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | in 20,4 |
| Region | Specifies whether or not to target impressions based on the user's region. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | in 5,20 |
| City | Specifies whether or not to target impressions based on the user's city. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | not_in 15,17 |
| Metro Code | Specifies whether or not to target impressions based on the user's metro code. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | in 20,54 |
| Postal Code | Specifies whether or not to target impressions based on specific postal codes. | - in region:postalcode,region:postalcode <br> - not_in region:postalcode,region:postalcode | No | in US:01609,US:01520 |
| Postal Code Lists | Specifies whether or not to target impressions based on the postal codes that have been grouped together in a list. | - in POSTAL_CODE_LIST_Id1,POSTAL_CODE_LIST_Id2 <br> - not_in POSTAL_CODE_LIST_Id1,POSTAL_CODE_LIST_Id2 | No | in My_Postal_Code_List1,My_Postal_Code_List2, |
| Deals | Specifies whether or not to target impressions based on specific deals. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | not_in 9480,9481,7979,5923 |
| Deal Lists | Specifies whether or not to target impressions based on the deals that have been grouped together in a list. | - in DEAL_LIST_Id1,DEAL_LIST_Id2 <br> - not_in DEAL_LIST_Id1,DEAL_LIST_Id2(not_)in DEAL_LIST_Id1,DEAL_LIST_Id2 | No | not_in My_Deal_List_Id1,My_Deal_List_Id2 |
| Size | Specifies whether or not to target impressions based on the creative placement size. | - in WxH,WxH,WxH <br> - not_in WxH,WxH,WxH | No | in 900x800,1200x995 |
| Domain or App | Specifies whether or not to target impressions based on a specific domain. | - in domain1,domain2 <br> - not_in domain1,domain2 | No | not_in food.com,drink.com |
| Inventory List | Specifies whether or not to target an allowlist or blocklist established at the network level. <br><br> **Note**: You can only target a single list. | - in (numeric value) <br> - not in (numeric value) | No | not in 16 |
| Inventory Type | Specifies the type of inventory ("app" or "web") that will be targeted by the split. | app,web | No | app,web |
| Placement | Specifies whether or not to target impressions based on a specific placement. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | in 32,22 |
| Publisher | Specifies whether or not to target impressions based on specific publishers. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | in 32,22 |
| Seller Member | Specifies whether or not to target impressions based on specific seller members. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | not_in 32,22 |
| Operating System Family | Specifies whether or not to target impressions based on the user's operating system. See the [OS Family list](https://download.microsoft.com/download/6/f/7/6f755603-e9af-4148-9e52-02e1fb7262b0/Xandr/Bulk-Importer-Lists.xlsx) to look up the appropriate operating system identifiers. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | in 4,17,8 |
| Operating System Version | Specifies whether or not to target impressions based on a specific version of the user's operating system. See the [OS Versions list](https://download.microsoft.com/download/6/f/7/6f755603-e9af-4148-9e52-02e1fb7262b0/Xandr/Bulk-Importer-Lists.xlsx) to look up the appropriate operating system version identifiers. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | in 17,18,20,21 |
| Browser | Specifies whether or not to target impressions based on the user's browser. See the [Browser list](https://download.microsoft.com/download/6/f/7/6f755603-e9af-4148-9e52-02e1fb7262b0/Xandr/Bulk-Importer-Lists.xlsx) to look up the appropriate browser identifiers. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | in 17,18,20,21 |
| Browser Language | Specifies whether or not to target impressions based on the user's browser language. See the [Language list](https://download.microsoft.com/download/6/f/7/6f755603-e9af-4148-9e52-02e1fb7262b0/Xandr/Bulk-Importer-Lists.xlsx) to look up the appropriate language identifiers. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | in 17,18,20,21 |
| Device Type | Specifies whether or not to target impressions based on specific types of physical devices. | - in [pc & other devices,phone,tablet] <br> - not_in [pc & other devices,phone,tablet] | No | in pc & other devices, phone,tablet |
| Device Model | Specifies whether or not to target impressions based on specific models of physical devices. See the [Device Model list](https://download.microsoft.com/download/6/f/7/6f755603-e9af-4148-9e52-02e1fb7262b0/Xandr/Bulk-Importer-Lists.xlsx) to look up the appropriate device model identifiers. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | in 17,18,20,21 |
| Carrier | Specifies whether or not to target impressions based on specific mobile carriers. | - in Id1,Id2 <br> - not_in Id1,Id2 | No | in 17,18,20,21 |
| Predicted IAB View Rate | Specifies whether or not to target web-display impressions by how likely they are to be measured as viewable by the IAB standard. | (<,<=,=,>,>=) numeric value | No | < 0.12 |
| Predicted IAB Video View Rate | Specifies whether or not to target web-video impressions by how likely they are to be measured as viewable by the IAB standard. | (<,<=,=,>,>=) numeric value | No | < 0.12 |
| Predicted Video Completion Rate | Specifies whether or not to target web-video impressions by how likely they are to be completed. | (<,<=,=,>,>=) numeric value | No | < 0.12 |
| Segment Boolean operator | Allows "and" or "or" boolean operators to be used between targeted segment groups. | - and <br> - or | No | and |
| Daily Frequency | Specifies the number of ads that a user sees for a split within the current day. | (<,<=,=,>,>=) numeric value | No | <= 10 |
| Lifetime Frequency | Specifies the number of ads that a user sees over the lifetime of a split. | (<,<=,=,>,>=) numeric value | No | <= 20 |
| Split Recency | Specifies the number of minutes since a user has seen an ad. | (<,<=,=,>,>=) numeric value | No | <= 1800 |
| Advertiser Lifetime Frequency | Specifies the number of ads that a user sees over the lifetime based on what is set at the advertiser level. | Id (<,<=,=,>,>=) numeric value | No | 19328 <= 12 |
| Advertiser Daily Frequency | Specifies the number of ads that a user sees on the current day based on what is set at the advertiser level. | Id (<,<=,=,>,>=) numeric value | No | 18106 <= 13 |
| Advertiser Recency | Specifies the number of minutes since a user has seen an ad based on what is set at the advertiser level. | Id (<,<=,=,>,>=) numeric value | No | 18106 <= 12 |
| Line Item Lifetime Frequency | Specifies the number of ads that a user sees over the lifetime based on what is set at the line item level. | Id (<,<=,=,>,>=) numeric value | No | 179484 >= 10 |
| Line Item Daily Frequency | Specifies the number of ads that a user sees on the current day based on what is set at the line item level. | Id (<,<=,=,>,>=) numeric value | No | 192321 >= 30 |
| Line Item Recency | Specifies the number of minutes since a user has seen an ad based on what is set at the line item level. | Id (<,<=,=,>,>=) numeric value | No | 3218 <= 20 |

## Related topics

- [Bulk Importer Template Guidelines](bulk-importer-template-guidelines.md)
- [Exporting and Importing Object Details in Bulk](exporting-and-importing-object-details-in-bulk.md)
