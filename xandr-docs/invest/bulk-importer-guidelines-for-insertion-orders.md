---
title: Bulk Importer Guidelines for Insertion Orders
description: In this article, understand the bulk importer guidelines and the basic setup of insertion orders when adding data to the bulk importer template.
ms.date: 10/28/2023
---

# Bulk importer guidelines for insertion orders

Please adhere to these general guidelines:

- Please do not rename the Insertion Orders sheet within the bulk importer template.
- When adding billing period details to the following columns per insertion order, leave the cells that are on the same row as the other
  insertion order details empty:
  - **Billing Period Id**
  - **Billing Period Start Date**
  - **Billing Period End Date**
  - **Lifetime Budget**
  - **Lifetime Budget Imps**
  - **Daily Budget**
  - **Daily Budget Imps**
- If adding multiple billing periods for one insertion order, be sure to enter all the details for each billing period, such as start dates and end dates, on a separate row.

## Temporary ID information

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| IO Temporary Id | Specifies the identifier used to link a new line item to a particular IO. This is a placeholder value and will not be the actual identifier of the newly-created object. | Alphanumeric value | No | example123 |

## Basic setup

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Insertion Order Id | Specifies the identifier assigned to the insertion order. <br><br> **Note**: If the insertion order identifier isn't provided, a new insertion order will be created. | Numeric value | No | 1234 |
| Advertiser Id | Specifies the identifier assigned to the insertion order's associated advertiser. | Numeric value | Yes | 1234 |
| Insertion Order Name | Specifies the name of the insertion order. | Characters (255 Max) | Yes | my insertion order |
| External Code | Specifies the custom code assigned to the insertion order. | - Alphanumeric values <br> - Periods <br> - Underscores <br> - Dashes | No | code1234 |
| Billing Code | Specifies an internal billing code that you want to appear on invoices for an insertion order, if you receive insertion order specific invoices. | - Alphanumeric values <br> - Periods <br> - Underscores <br> - Dashes | No | code1234 |
| State | Specifies the current status of the insertion order. | - active <br> - inactive | Yes | active |
| Currency | Specifies the currency that's associated to the insertion order. See the [Currency list](https://download.microsoft.com/download/6/f/7/6f755603-e9af-4148-9e52-02e1fb7262b0/Microsoft Advertising/Bulk-Importer-Lists.xlsx) to look up the appropriate currency code. | 3 character code | Yes | USD |
| Viewability Standard | Specifies the criteria by which an impression is measured as viewable. | - IAB <br> - Custom | Yes | IAB |
| Budget Type | Specifies the insertion order's budget type. | - impression <br> - revenue | Yes | impression |
| Billing Period Start Date | Specifies the start date of the insertion order's billing period. | Date/time <br><br> Use the YYYY-MM-DD hh:mm:ss format. Excel will try to auto format the date to MM/DD/YYYY, which is also accepted but will be less accurate. Hours should be based on the UTC time zone. | Yes | 2018-11-09 00:00:00 |
| Billing Period End Date | Specifies the end date of the insertion order's billing period. <br><br> **Note**: Do not enter an end date if there is no end date. | Date/time <br><br> Use the YYYY-MM-DD hh:mm:ss format. Excel will try to auto format the date to MM/DD/YYYY, which is also accepted but will be less accurate. Hours should be based on the UTC time zone. | No | 2018-11-10 23:59:59 |
| Billing Period External Code | Specifies the custom reporting code for the billing period. | - Alphanumeric values <br> - Periods <br> - Underscores <br> - Dashes | No | code1234 |
| Lifetime Budget | Specifies the lifetime budget amount. <br><br> **Note**: The value specified in the **Currency** field determines which currency is applied to the lifetime budget. | Numeric value <br><br> **Note**: If 0 is entered, then the lifetime budget will be set to "Unlimited". | Yes, if Lifetime Budget Imps is left null. | 1200 |
| Lifetime Budget Imps | Specifies the lifetime budget represented by a number of impressions. | - Numeric value <br> - Null (unlimited) | Yes, if Lifetime Budget is left null. | 200 |
| Daily Budget | Specifies the daily budget amount. <br><br> **Note**: If both the daily budget and lifetime pacing percent are left empty, then the pacing strategy is set at the line item level. | Numeric value | No | 1000 |
| Daily Budget Imps | Specifies the daily budget represented by a number of impressions. | Numeric value | No | 10 |

## Internal fields

| Column Name | Description | Potential Values | Mandatory | Example |
|---|---|---|---|---|
| Billing Period Id | Specifies the identifier assigned to the billing period. <br><br> **Note**: If you're leveraging exported object details, leave the existing billing period identifier. Otherwise, leave this cell empty so that a new billing period can be created. | Numeric value | No | 12345 |
| Profile Id | Specifies the identifier assigned to the profile. <br><br> **Note**: If you're leveraging exported object details, leave the existing profile identifier. Otherwise, leave this cell empty so that a new profile can be created. | Numeric value | No | 13912 |

## Related topics

- [Bulk Importer Template Guidelines](bulk-importer-template-guidelines.md)
- [Exporting and Importing Object Details in Bulk](exporting-and-importing-object-details-in-bulk.md)
