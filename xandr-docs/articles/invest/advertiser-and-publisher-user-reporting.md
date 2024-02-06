---
title: Microsoft Invest - Advertiser User Reporting
description: Learn how an Advertiser User report provides insights into advertiser behavior, performance metrics, dimension, and filters, to optimize and enhance ad experience.
ms.date: 10/28/2023
---

# Microsoft Invest - Advertiser User reporting

If you have created separate [user login](managing-user-logins-and-permissions.md) for your advertisers, they will be able to run reports from their perspective. These advertiser users have a limited set of metrics, filters, and dimensions available to them. This allows you to give your clients access to reporting while protecting your proprietary business data.

For instructions on how to give advertiser users access to reporting, see [Create a User](create-a-user.md).

> [!IMPORTANT]
> Conversion-related data in reports is processed asynchronously. As a result, reports are available more quickly, while some conversion-related data is still being processed in the background. For more information, see [Availability of Reporting Data](availability-of-reporting-data.md).
>
> The **Metrics** are shown from the advertiser's perspective, so the **Revenue** field displays the advertiser's revenue (not the Member's).

## Metrics

- **Imps** - Total number of impressions served.
- **Clicks** - Total number of clicks across all impressions.
- **CTR** - Click-through rate (Clicks / Imps).
- **Total Conversions** - Total number of post view and post click conversions.
- **Conversion Rate** - Conversions / Imps.
- **CPC** - Clicks / Conversions.
- **Spend** - Booked advertiser revenue.
- **Revenue** - PVRevenue + PCRevenue.
- **PV Convs** - Total number of recorded post view conversions.
- **PV Revenue** - Total amount of recorded post view revenue.
- **PC Convs** - Total number of recorded post click conversions.
- **PC Revenue** - Total amount of recorded post click revenue.
- **CPM** - (Cost / Imps) X 1000.
- **RPM** - (Revenue / Imps) X 1000.
- **PPM** - (Profit / Imps) X 1000.
- **CPC** - (Cost / Clicks).
- **CPA** - (Cost / Conversions).

## Metrics specific to Viewability

- **Viewed Imps** - The number of measured impressions that were viewable.
- **View Measured Imps** - The total number of impressions that were measured for viewability.
- **Viewability Rate** - The percentage of impressions that were viewable out of the total number of impressions measured for viewability.
- **Viewability Measurement Rate** - The percentage of impressions measured for viewability out of the total number of impressions.

## Dimensions

- **Insertion Order** - Available if the advertiser uses insertions orders.
- **Line Item**
- **Media Type** - Banner, Interstitial, Video, Text, Expandable, or Skin.
- **Country**
- **Size**
- **Advertiser Currency**
- **Conversion Pixel**

## Filters

- **Insertion Order** - Available if the advertiser uses insertions orders.
- **Line Item**
- **Media Type** - Banner, Interstitial, Video, Text, Expandable, or Skin.
- **Country**
- **Size**
- **Advertiser Currency**
- **Conversion Pixel**
- **Minimum Impressions**

## Related topics

- [Reporting Guide](reporting-guide.md)
- [Member Reporting](network-reporting.md)
- [Advertiser Reporting](advertiser-reporting.md)
