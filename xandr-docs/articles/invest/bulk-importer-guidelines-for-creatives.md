---
title: Bulk Importer Guidelines for Creatives
description: In this article, understand the bulk importer guidelines and the setup for creatives when adding data to the bulk importer template. 
ms.date: 10/28/2023
---

# Bulk importer guidelines for creatives

Please adhere to these general guidelines:

- Please do not rename the Creatives sheet within the bulk importer template.
- When adding custom date range details to the **Start Date** and **End Date** columns, leave the cells that are on the same row as the other creative details empty.
- If adding multiple start dates and end dates, be sure to place each individual date on separate rows.
- If a creative does not apply to all flights and does not have a custom date range, the creative identifier must also be entered on the Line Items sheet in the corresponding **Flight Creatives** column.

## Temporary ID information

| Column Name | Description | Potential Values | Mandatory | Examples |
|--|--|--|--|--|
| LI Temporary Id | Specifies the identifier used to link a creative to a parent line item within the spreadsheet. This is a placeholder value and will not be the actual identifier of the newly-created object. | Alphanumeric value | No | example123 |

## Creative setup

| Column Name | Description | Potential Values | Mandatory | Examples |
|---|---|---|---|---|
| Line Item Id | Specifies the identifier of the existing line item that the creative will be associated to. | Numeric value | No | 1234 |
| Line Item Name | Specifies the name of the line item. | Characters | No | My line item |
| Creative Id | Specifies the identifier assigned to the creative. | Numeric value | Yes | 1234 |
| Weight | Specifies a designated prioritization that will be given to the creative over other creatives with identical dimensions. | Numeric value (1-999) | No | 1 |
| Applies To All Flights | Specifies whether a creative should be applied to all flights of the associated line item. | - TRUE <br> - FALSE | Yes | FALSE |
| Start Date | Specifies the start date of the custom date range. | Date/time <br><br> Use the YYYY-MM-DD hh:mm:ss format. Excel will try to auto format the date to MM/DD/YYYY, which is also accepted but will be less accurate. Hours should be based on the UTC time zone. | No | 2018-11-09 00:00:00 |
| End Date | Specifies the end date of the custom date range. | Date/time <br><br> Use the YYYY-MM-DD hh:mm:ss format. Excel will try to auto format the date to MM/DD/YYYY, which is also accepted but will be less accurate. Hours should be based on the UTC time zone. | No | 2018-11-15 23:59:59 |

## Related topics

- [Bulk Importer Template Guidelines](bulk-importer-template-guidelines.md)
- [Exporting and Importing Object Details in Bulk](exporting-and-importing-object-details-in-bulk.md)
