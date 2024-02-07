---
title: Bulk Importer Guidelines for Line Items
description: In this article, understand the bulk importer guidelines and the setup for line items when adding data to the bulk importer template.
ms.date: 10/28/2023
---

# Bulk importer guidelines for line items

Please adhere to these general guidelines:

- Please do not rename the Line Items sheet within the bulk importer template.
- When adding flight details to the following columns per line item, leave the cells that are on the same row as the other line item
  details empty:
  - **Flight Id**
  - **Flight Start Date**
  - **Flight End Date**
  - **Lifetime Budget**
  - **Lifetime Budget Imps**
  - **Pacing, Pacing Percent**
  - **Flight Creatives**
- If adding multiple flights for one line item, be sure to enter all the details for each flight, such as start dates and end dates, on a
  separate row.

## Temporary ID information

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| IO Temporary Ids | Specifies the identifier or comma-separated list of identifiers used to link new line items to a parent insertion order that will be created within the spreadsheet. | Alphanumeric values | No | example123 |
| LI Temporary Id | Specifies the identifier used to link new objects within the spreadsheet to a particular line item. This is a placeholder value and will not be the actual identifier of the newly-created object. | Alphanumeric value | No | example123 |

## Basic settings

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Line Item Id | Specifies the identifier assigned to the line item. <br><br> **Note**: If the line item identifier isn't provided, a new line item will be created. | Numeric value | No | 1234 |
| Advertiser Id | Specifies the identifier assigned to the associated line item's advertiser. | Numeric value | Yes | 1234 |
| Insertion Order Ids | Specifies the identifiers of the existing insertion orders that the line item will be associated to. | Numeric value <br><br> **Note**: If there are multiple numeric values, use commas to separate them. | Yes | 1234,4567 |
| Line Item Name | Specifies the name of the line item. | Characters | Yes | My line item |
| External Code | Specifies the custom code assigned to the insertion order. | - Alphanumeric values <br> - Periods <br> - Underscores <br> - Dashes | No | code1234 |
| State | Specifies current status of the line item. | - active <br> - inactive | Yes | active |
| Ad Type | Specifies the creative type associated with the line item. | - banner <br> - video <br> - audio <br> - native | Yes | banner |

## Budgeting and scheduling

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Revenue Type | Specifies the line item's revenue type. | - cpm <br> - viewable cpm <br> - dynamic cpm <br> - cpc <br> - cpcv <br> - cost_plus_margin | Yes | cpm |
| Revenue Value | Specifies the revenue amount. | Numeric value | Yes | 5 |
| Payment Type | Specifies the line item's payment type. <br><br> Note: If "Native" is specified as the Ad Type, then you can only specify "Impression" as the Payment Type. | - impression <br> - view <br> - video | Yes | impression |
| Flight Start Date | Specifies the flight's start date. | Date/time <br><br> Use the YYYY-MM-DD hh:mm:ss format. Excel will try to auto format the date to MM/DD/YYYY, which is also accepted but will be less accurate. Hours should be based on the UTC time zone. | Yes | 2018-11-09 00:00:00 |
| Flight End Date | Specifies the flight's end date. Do not enter an end date if there is no end date. | Date/time <br><br> Use the YYYY-MM-DD hh:mm:ss format. Excel will try to auto format the date to MM/DD/YYYY, which is also accepted but will be less accurate. Hours should be based on the UTC time zone. | No | 2018-11-09 23:59:39 |
| Daily Budget | Specifies the daily budget amount. | Numeric value | No | 1000 |
| Daily Budget Imps | Specifies the daily budget represented by a number of impressions. | Numeric value | No | 10 |
| Lifetime Budget | Specifies the flight's lifetime budget. | Numeric value | Yes, if Lifetime Budget Imps is not specified. | 100 |
| Lifetime Budget Imps | Specifies the flight's lifetime budget represented by a number of impressions. | Numeric value | Yes, if a Lifetime Budget is not specified. | 80 |
| Pacing | Specifies whether the line item should spend its overall lifetime budget evenly across flights. | - TRUE <br> - FALSE | Yes | FALSE |
| Pacing Percent | Specifies what percentage of your flight budget should be spent per day. | Numeric value between 50 and 150 | No | 50 |
| Underspend Catch-Up | Dictates how your line item distributes unspent budget throughout the remainder of a flight. | - evenly <br> - asap | Yes | evenly |
| Daypart Monday | Specifies a comma-separated list of hour ranges to target throughout Monday. | Numeric range consisting of any whole number between 0 and 23 | No | 7-16,20-23 |
| Daypart Tuesday | Specifies a comma-separated list of hour ranges to target throughout Tuesday. | Numeric range consisting of any whole number between 0 and 23 | No | 20-23 |
| Daypart Wednesday | Specifies a comma-separated list of hour ranges to target throughout Wednesday. | Numeric range consisting of any whole number between 0 and 23 | No | 7-16,20-23 |
| Daypart Thursday | Specifies a comma-separated list of hour ranges to target throughout Thursday. | Numeric range consisting of any whole number between 0 and 23 | No | 7-16,20-23 |
| Daypart Friday | Specifies a comma-separated list of hour ranges to target throughout Friday. | Numeric range consisting of any whole number between 0 and 23 | No | 7-16,20-23 |
| Daypart Saturday | Specifies a comma-separated list of hour ranges to target throughout Saturday. | Numeric range consisting of any whole number between 0 and 23 | No | 7-16,20-23 |
| Daypart Sunday | Specifies a comma-separated list of hour ranges to target throughout Sunday. | Numeric range consisting of any whole number between 0 and 23 | No | 7-16,20-23 |
| Daily Pacing Allocation | Sets the pace for how quickly the budget should be spent in one day. |  - evenly <br> - asap | Yes | evenly |

## Optimization

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Optimization Type | Specifies the metrics that should be used to measure the line item's performance. | - none <br> - cpc <br> - cpa <br> - viewable cpm <br> - ctr <br> - cpcv <br> - vcr | Yes | cpc |
| Min CPM | Specifies the minimum CPM when Cost Plus or Dynamic CPM is set for the line item. | Numeric value | No | 1 |
| Max CPM | Specifies the maximum CPM when Cost Plus or Dynamic CPM is set for the line item. | Numeric value | No | 8 |
| Optimization Goal Target | Required for CTR, CPC, CPA, Viewable CPM, CPCV, and VCR optimization types. <br><br> **Note**: Depending on the chosen optimization type, this numeric value can take on the form of a percentage or a currency value. | Numeric value | No | 85 |
| Post-View Post-Click Strategy | Only used when the line item has a CPA goal for both post-click and post-view conversions to determine whether it is optimized for retargeting or prospecting. | - prospecting <br> - retargeting | No | propsecting |
| Post Click Only | Specifies the CPA post-click goal that the line item will optimize to. | - TRUE <br> - FALSE | No | FALSE |
| Post Click Goal Target | Specifies the CPA post-click goal that the line item will optimize to. | Numeric value | No | 12 |
| Goal Pixel Id | Specifies the identifier assigned to the targeted goal pixel. | Numeric value | No | 1036301 |
| Goal Priority | Specifies whether to give greater priority to delivery, performance, or margin. | - delivery <br> - performance <br> - margin | Yes | margin |
| Min Margin Percent | Only set this field if the goal priority has been set to margin and revenue type has not been set to cost_plus_margin. | Numeric value (in %) | No | 25 |
| Conversion Pixels | Specifies a comma-separated list of conversion pixel identifiers that will be tracked. | Numeric value | No | 4912,192941,10203 |

## Inventory and brand safety targeting

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Supply Strategies | Specifies the type of inventory (open exchange, managed, or deal inventory) that should be targeted. | - rtb <br> - managed <br> - deals | Yes | rtb,managed |
| Deals | Specifies a comma-separated list of individual deals that will be targeted. <br><br> **Note**: If this cell is left empty and "deals" is selected as the supply strategy, then all deals will be targeted. | Numeric value | No | 10918,10433,123412 |
| Deal Lists | Specifies a series of deal lists separated by commas that will be targeted. <br><br> **Note**: If this cell is left empty and "deals" is selected as the supply strategy, then all deal lists will be targeted. | Alphanumeric value | No | My_Deal_List_1,My_Deal_List_2 |
| Include Deals | Specifies whether a deal should be included. | - TRUE <br> - FALSE | No | TRUE |
| Managed Priority | Specifies how line items that have their supply strategy set to Managed should be prioritized. <br><br> **Note**: This field doesn't apply to line items that have their supply strategy set to Open Exchange or Deals. | Numeric value | No | 5 |
| Inventory Types | Specifies a comma-separated list of inventory types to exclude. <br><br> **Note**: If this cell is left empty, all inventory types will be included by default. | - web <br> - mobile_web <br> - mobile_app | Yes | mobile_web,web |
| Blocklists | Specifies blocklists that are associated with the line item. | Id | No | 160 |
| Allowlists | Specifies allowlists that are associated with the line item. | Id | No | 17,18 |
| Ads Txt Authorized Only | Specifies whether the associated creatives should only serve on ads.txt verified inventory. | - TRUE <br> - FALSE | No | TRUE |
| Member Targets | Specifies which seller member identifiers should be excluded or included in a profile. | Action (exclude or include)-Id1,Id2,Id3 | No | include-1,2,3 |
| Seller Member Group Targets | Specifies which seller member groups should be excluded or included in a profile. | Action (exclude or include)-Id1,Id2,Id3 | No | exclude-4,5,6 |

## Audience and location targeting

> [!NOTE]
> Effective August 30, 2021:
>
> - Tapad's graph (id:3) will provide global coverage excluding Europe.
> - Microsoft Advertising's graph (id:4) will provide coverage for Europe and the United States.

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Countries | Specifies whether or not to target a particular country. See the [Country list](https://download.microsoft.com/download/6/f/7/6f755603-e9af-4148-9e52-02e1fb7262b0/Microsoft Advertising/Bulk-Importer-Lists.xlsx) to look up the appropriate country codes. | Action (include or exclude)-Code1,Code2,Code3 | Yes | include-US,FR |
| Regions | Specifies whether or not to target a particular region. See the [Region list](https://download.microsoft.com/download/6/f/7/6f755603-e9af-4148-9e52-02e1fb7262b0/Microsoft Advertising/Bulk-Importer-Lists.xlsx) to look up the appropriate region identifiers. | Action (include or exclude)-Id1,Id2,Id3 | No | exclude-1080,1081 |
| Cities | Specifies whether or not to target a particular city. See the [City list](https://download.microsoft.com/download/6/f/7/6f755603-e9af-4148-9e52-02e1fb7262b0/Microsoft Advertising/Bulk-Importer-Lists.xlsx) to look up the appropriate City identifiers. | Action (include or exclude)-Id1,Id2,Id3 | No | include-68778,68779,68780 |
| Metro Codes | Specifies whether or not to target a particular metro code. See the [Metro Code list](https://download.microsoft.com/download/6/f/7/6f755603-e9af-4148-9e52-02e1fb7262b0/Microsoft Advertising/Bulk-Importer-Lists.xlsx) to look up the appropriate metro codes. | Action (include or exclude)-Id1,Id2,Id3 | No | include-500,501,502 |
| Postal Codes | Specifies whether or not to target specific postal codes. | Postal Code 1,Postal Code 2,Postal Code 3,Postal Code 4 | No | 120563,120564 |
| Postal Code Lists | Specifies whether or not to target postal codes that have been grouped together in a list. | Alphanumeric value | No | My_Postal_Code_List_1,My_Postal_Code_List_2 |
| Cross Device | Specifies the identifier of the cross device graph that is being targeted. | - null (no cross device) <br> - 3 (Tapad graph) <br> - 4 (Microsoft Advertising graph) | No | 3 |
| Segment Boolean operator | Allows "and" or "or" boolean operators to be used between targeted segment groups. | - and <br> - or | No | and |
| Congressional Districts | Specifies whether or not to target specific Congressional Districts. | Numeric Values (Note: If there are multiple numeric values, use commas to separate them). | No | 139898 |
| State Senate Districts | Specifies whether or not to target specific State Senate Districts. | Numeric Values (Note: If there are multiple numeric values, use commas to separate them). | No | 141210 |
| State House Districts | Specifies whether or not to target specific State House Districts. | Numeric Values (Note: If there are multiple numeric values, use commas to separate them). | No | 139960 |

## Frequency and recency

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Hourly Frequency | Specifies the maximum number of impressions per person per hour. | Numeric value (255 characters max) | No | 10 |
| Daily Frequency | Specifies the maximum number of impressions per person per day. | Numeric value (255 characters max) | No | 20 |
| Weekly Frequency | Specifies the maximum number of impressions per person per week. | Numeric value (255 characters max) | No | 50 |
| Monthly Frequency | Specifies the maximum number of impressions per person per month. | Numeric value (255 characters max) | No | 200 |
| Lifetime Frequency | Specifies the maximum number of impressions per person. | Numeric value (255 characters max) | No | 255 |
| Recency | Specifies the minimum number of minutes between impressions per person. | Numeric value (255 characters max) | No | 60 |
| Include Users Without Cookies | Determines whether impressions will be served to unidentified users. <br><br> **Note**: When serving impressions to unidentified users, frequency and recency caps will be ignored for those users. | - TRUE (excludes users who do not have cookies enabled) <br> - FALSE (includes users who do not have cookies enabled) | Yes | TRUE |

## Viewability and environment targeting

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Viewability Threshold | Percentage of how likely an impression is to be viewable. <br><br> **Note**: Custom viewability thresholds are allowed. | Numeric value between 0 and 100 | No | - For standard IAB thresholds: 12 <br> - For custom viewability thresholds: custom-12 |
| Video Completion Threshold | Percentage of how likely a video impression is to be viewed in its entirety. | Numeric value between 0 and 100 | No | 18 |
| Device Types | Specifies a comma-separated list of device types that will be targeted. | - pc <br> - phone <br> - tablet <br> - tv <br> - stb <br> - gameconsole | No | pc,phone |
| Playback Methods | Specifies a comma-separated list of playback method identifiers: (1: playback-method-auto-play-sound-on),(2: playback-method-auto-play-sound-off),(3: playback-method-click-to-play),(4: playback-method-mouse-over),(5: playback-method-auto-play-sound-unknown). | 1,2,3,4, or 5 | No | 1,3,5 |
| Video Targets Allow Unknown Playback Method | Determines whether to allow unknown playback methods. | - TRUE <br> - FALSE | Yes | FALSE |
| Video Targets Allow Unknown Context | Determines whether to allow unknown contexts for video targeting. | - TRUE <br> - FALSE | Yes | FALSE |
| Player Sizes | Specifies the player size for video targeting in which 1= Small, 2= Medium, and 3= Large. | 1, 2, and/or 3 (small, medium, or large) | No | 1, 2 |
| Video Targets Allow Unknown Player Size | Determines whether to allow unknown player sizes for video targeting. | - TRUE <br> - FALSE | Yes | TRUE |
| Video Target Contexts | Specifies a comma separated list of video target contexts. | 1, 2, 3, and/or 4 (pre-roll, mid-roll, post-roll, outstream) | No | 1, 2 |
| Browsers | Specifies a comma-separated list of browser identifiers that will be included or excluded. See the [Browser list](https://download.microsoft.com/download/6/f/7/6f755603-e9af-4148-9e52-02e1fb7262b0/Microsoft Advertising/Bulk-Importer-Lists.xlsx) to look up the appropriate browser identifiers. | Action (include or exclude)-Id1,Id2,Id3 | No | include-210,401,201 |
| Languages | Specifies a comma-separated list of language identifiers that will be included or excluded. See the [Language list](https://download.microsoft.com/download/6/f/7/6f755603-e9af-4148-9e52-02e1fb7262b0/Microsoft Advertising/Bulk-Importer-Lists.xlsx) to look up the appropriate language identifiers. | Action (include, exclude)-Id1,Id2,Id3 | No | exclude-129,140,120 |
| User Group Bucket | Specifies a comma-separated list of user groups that will be targeted using A/B testing. | Numeric value ranges between 0 and 99 | No | 0-18,25-32,58-63 |
| User Groups Include Cookieless Users | Determines whether to target users who don't have cookies enabled. | - TRUE <br> - FALSE | No | FALSE |

## Creatives

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Creative Rotation | Specifies the creative-rotation strategy that will be used when multiple creatives of the same size are trafficked through the line item. | - even <br> - weighted <br> - ctr-optimized | No | even |
| Flight Creatives | Specifies the creatives associated to the flight. | Id1,Id2,Id3,Id4 | No | 10040,120421,120202 |

## Fees

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Partner Fees | Specifies a comma-separated list of partner fee identifiers that have been applied to the line item. | Numeric value | No | 321014,149129,1292 |

## Internal fields

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Flight Id | Specifies the identifier assigned to the flight. <br><br> **Note**: If you're leveraging exported object details, leave the existing flight identifier. Otherwise, leave this cell empty so that a new flight can be created. | Numeric value | No | 12345 |
| Profile Id | Specifies the identifier assigned to the profile. <br><br> **Note**: If you're leveraging exported object details, leave the existing profile identifier. Otherwise, leave this cell empty so that a new profile can be created. | Numeric value | No | 13912 |

## Related topics

- [Bulk Importer Template Guidelines](bulk-importer-template-guidelines.md)
- [Exporting and Importing Object Details in Bulk](exporting-and-importing-object-details-in-bulk.md)
