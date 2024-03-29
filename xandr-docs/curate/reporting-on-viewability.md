---
title: Microsoft Curate - Reporting on Viewability
description: In this article, explore viewability definitions, metrics, reports, best practices, and learn how to incorporate viewability metrics.
ms.date: 10/28/2023
---

# Microsoft Curate - Reporting on viewability

This page defines viewability metrics that are available and best practices for making optimal use of them.

Microsoft Advertising provides **always-on**, **free**, **reliable**, and **independent** ad-viewability measurement to all participants of the internet advertising industry. Viewability improves the performance and quality of internet advertising.

## Viewability definitions

### Viewability measurement metrics

Not all impressions are successfully measured, because of one, or more of the following:

- Unsupported environment - The script does not attempt to measure viewability in this environment because it isn't supported.
- Partial implementation - The script could not be successfully loaded in the browser. For example, the user left the page before the ad call response was returned.
- Technical limitation - The script successfully loaded in the browser, but still couldn't be measured.

> [!NOTE]
> Viewability metrics in reporting will be available at the same time that impression level metrics become available.

| Viewability Metric | Definition |
|:---|:---|
| View-Measured Imps | The total number of impressions that were measured for viewability. |
| Viewability Measurement Rate | The percentage of impressions measured for viewability out of the total number of impressions. (View Measured Imps / Imps) |

> [!NOTE]
> The Microsoft Advertising measured viewability rate should not be directly compared to other measurement vendors, due to differences in what, where, and how impressions were served.

### Viewability metrics

| Viewability Metric | Definition |
|:---|:---|
| Viewable Imps | The number of measured impressions that were viewable, per the IAB Viewability definition, which states that 50% of the pixels of a creative are in-view during 1 consecutive second. |
| Viewability Rate | The percentage of impressions that were viewable out of the total number of impressions measured for viewability. (Viewed Imps / View Measured Imps) |

> [!NOTE]
> An impression that could not be measured will not have a viewability status.

## Viewability reporting

### Reports with viewability metrics

Viewability metrics are included in several reports in the reporting system:

### How to add viewability metrics?

Go to the appropriate tab and select **Reporting** from the navigation menu. Select the type of report from the drop-down menu.

Viewability indicators are located in the **Metrics** section. Click the **Edit** button to select the desired indicators.

> [!TIP]
> For an explanation of how metrics work, see [Dimensions, Metrics, Filtering, and Grouping](dimensions-metrics-filtering-and-grouping.md).

## Impression-level viewability

A column in the Log Level Data Standard Feed enables impression-level viewability analytics. You can determine the result of the Microsoft Advertising viewability measurement for each individual impression and use the data to perform enhanced reporting and in-depth analysis.

| Column | Description |
|:---|:---|
| VIEW_RESULT_TYPE | The possible values are:<br> - Measured Viewable<br> - Measured Non-Viewable<br> - Non-Measured |

For more information, see [Log-Level Data Feeds](../log-level-data/log-level-data-feeds.md) and [Standard Feed](../log-level-data/standard-feed.md).

## Best practices

### Viewable Imps and Viewability Rate

If you select **Viewable Imps** and **Viewability Rate**, it is recommended that you add **View-Measured Imps** as well.

> [!IMPORTANT]
> Viewability Rate = Viewable Imps / View-Measured Imps

**Viewability Rate** is NOT **Viewable Imps / All Imps.**

For example:

- **All Imps** = 1,000,000
- **Viewed** **Imps** = 450,000

**Viewability Rate** = 50%

Without **View-Measured Imps**, you would think the results are incorrect, and believe that **Viewability Rate** should be 450,000 /
1,000,000 = 45%, not 50%.

When you add **View-Measured Imps**, you will see that the total number of successfully measured imps = 900,000.

**Viewability Rate = Viewable Imps / View-Measured Imps** = 450,000 / 900,000 = **50%**

## Sample report

:::image type="content" source="./media/viewability-sample-report.png" alt-text="Diagram of a viewability sample report.":::
