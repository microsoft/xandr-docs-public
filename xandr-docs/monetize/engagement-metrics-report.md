---
title: Microsoft Monetize - Engagement Metrics Report
description: Explore Microsoft Advertising Publisher Adserver's Engagement Metrics; unveil ad viewability insights, addressing measurement challenges.
ms.date: 10/28/2023
---

# Microsoft Monetize - Engagement metrics report

The Engagement Metrics report provides information about ad viewability, as well as indicating any problems that might be preventing Microsoft Advertising from measuring an impression's viewability. This report is only available for Microsoft Advertising Publisher Adserver customers.

Report data is retained for 35 days.

## Time frame

All dates and times are given in UTC.

### Time ranges

Time ranges define the time period of the data extracted for the report. The following is a complete list of time ranges available for reports.

However, all time ranges are not available for every report.

- Custom
- Current Hour
- Last Available Day
- Last Hour
- Today
- Last 24 Hours
- Last 48 Hours
- Yesterday
- Last 2 Days
- Last 7 Days
- Last 7 Available Days
- Last 14 Days
- Last 14 Available Days
- Last 30 Days
- Last 30 Available Days
- Last Month
- Last 100 Days
- Last 365 Days
- Quarter to Date
- Month to Date
- Month to Yesterday
- Lifetime

### Intervals

Intervals determine how your data is grouped together into rows in the report response. The following is a complete list of intervals available for reports. However, all intervals are not available for every report.

- Hourly: Data is grouped into rows by the hour.
- Daily: Data is grouped into rows by the day.
- Monthly: Data is grouped into rows by the month.
- Cumulative: Data is grouped together in one figure, covering the entire selected time range.

> [!TIP]
> For more information about how quickly report data is processed, see [Availability of Reporting Data](availability-of-reporting-data.md).

## Dimensions

| Field Name | Filter? | Description |
|---|---|---|
| Advertiser | Y | The advertiser whose creative served on this impression |
| Publisher | Y | The publisher on whose inventory this impression occurred |
| Placement | Y | The placement through which this impression occurred.  |
| Insertion Order | Y | The insertion order under which this impression was purchased. The buy-side hierarchy is Insertion Order > Line Item > Campaign. |
| Line Item | Y | The line item under which this impression was purchased. The buy-side hierarchy is Line Item > Campaign. |
| Campaign | Y | The campaign which purchased this impression. |
| Creative | Y | The creative served for the impression. |
| Media Type | Y | The media type associated with the creative that served on this impression. |
| Impression Type | Y | See Impression Types below for definitions of the different types of impressions. |
| Device Type | Y | The type of device on which the impression was served. Possible values:<br> - Desktops & Laptops<br> - Tablets<br> - Mobile Phones<br> - TV<br> - Game Consoles<br> - Set Top Box<br> - Media Players<br> - Other Devices |
| Operating System Family | Y | The name of the operating system family associated with the device the impression was served on. |
| Buyer | Y | The buyer of this impression |
| Seller | Y | The seller of this impression |
| Minimum Impressions | Y | Filter only |

## Metrics

> [!NOTE]
> When values of a metric are displayed as percentages in the UI, they will be displayed as decimals when you export the report.

| Column | Description |
|--|--|
| Imps | The total number of impressions served. |
| Measurable Imps | The total number of impressions that were measured for viewability. |
| Viewed Imps | The number of measured impressions that were viewable according to the IAB Viewability definition, which states that an impression is viewable if 50% of the pixels are in view for 1 continuous second. |
| Viewability Measurement Rate | The percentage of impressions measured for viewability out of the total number of impressions. (View Measured Imps / Imps). |
| Viewability Rate | The percentage of impressions that were viewable out of the total number of impressions measured for viewability. (Viewed Imps / View Measured Imps). |
| In-View Duration | The average in-view duration (in seconds) measured for which impressions met the IAB Viewability definition. |
| Not Measured Imps (unsupported cross-domain iframe) | The number of impressions not measured because the creative cannot be measured because the ad was served in a cross-domain iframe and the browser was not supported. All modern browsers are supported but certain old versions may not be supported. |
| Not Measured Imps (creative not found) | The number of impressions not measured because the creative could not be found by the viewability script on the page. For example, this could occur if the div is being replaced or the creative isn't located within five seconds. |
| Not Measured Imps (script not initialized) | The number of impressions not measured because the measurement script did not initialize. This could occur for very short sessions when a user leaves a page before the other component (like the OS in mobile apps) can provide feedback on viewability. |
| Not Measured Imps (no script callback) | The number of impressions not measured because no callback was received from the measurement script. For example, this could occur if the script hasn't executed. |
| Not Measured Imps (unsupported in-app SDK) | The number of impressions not measured because the in-app SDK for the specific inventory is not supported. Please visit the Viewability FAQ to learn about supported in-app SDKs. |
| Not Measured Imps (unsupported native integration) | The number of impressions not measured because the specific type of native inventory is not supported. Please visit the Viewability FAQ to learn about supported native supply. |
| Not Measured Imps (unsupported media type) | The number of impressions not measured because the media type is not supported. Please visit the Viewability FAQ to learn about supported media types. |
| Not measured imps (unsupported supply type) | The number of impressions not measured because the supply type is not supported. Please visit the Viewability FAQ to learn about supported supply types. |
| Not Measured Imps (unsupported impression type) | The number of impressions not measured because the imp type is not supported. Please visit the Viewability FAQ to learn about supported impression types. |
| Not Measured Imps (unknown) | The number of impressions not measured because of an unknown reason. |
| Not Viewed Imps (creative not loaded) | The number of impressions not viewed because the creative did not load before the web page was closed. For example, when a user leaves the web page within one second of the creative being loaded. |
| Not Viewed Imps (not visible per SDK) | The number of impressions not viewed because in-app SDK responded with not visible signal. For example, the Open Measurement Software Development Kit (OM SDK) reported the ad as non-viewable. |
| Not Viewed Imps (hidden browser) | The number of impressions not viewed because either the browser was not in focus, or the browser tab was hidden. |
| Not Viewed Imps (creative hidden by CSS/HTML) | The number of impressions not viewed because the creative was explicitly hidden by CSS or HTML on the webpage. For more details, check your ads' recent style changes. |
| Not Viewed Imps (out of viewport) | The number of impressions not viewed because the creative was outside the visible area of a webpage on a display device. Ensure that the creative is visible and not at the bottom of the page. |
| Not Viewed Imps (insufficient surface area) | The number of impressions not viewed because the surface threshold based on IAB definition was not met. |
| Not Viewed Imps (insufficient duration) | The number of impressions not viewed because time threshold based on IAB definition was not met. |
| Not Viewed Imps (unknown) | The number of impressions not viewed because of an unknown reason. |
| In-View Duration (greater than 0% pixels) | The average duration (in seconds) for which impressions displaying greater than 0% of the pixels in the creative remained in view. |
| In-View Duration (greater than 25% pixels) | The average duration (in seconds) for which impressions displaying greater than 25% of the pixels in the creative remained in view. |
| In-View Duration (greater than 50% pixels) | The average duration (in seconds) for which impressions displaying greater than 50% of the pixels in the creative remained in view. |
| In-View Duration (greater than 75% pixels) | The average duration (in seconds) for which impressions displaying greater than 75% of the pixels in the creative remained in view. |
| In-View Duration (equal to 100% pixels) | The average duration (in seconds) for which impressions displaying 100% of the pixels in the creative remained in view. |

## To Run your report

Follow these steps to run your report. Refer to **Dimensions** and **Metrics** section above for more information about the definitions of the data fields.

> [!WARNING]
> The more dimensions you group by, the larger the data set that is returned. Larger data sets can take substantially longer to process. Be sure to group using only the dimensions you need.
>
> 1. Select **Reporting** from the **Network** menu.
> 2. Select the relevant report from the list. The Report screen shows the available filters, dimensions, and delivery options for the report. The selections you make here will determine what report data is delivered to you, and how. For an explanation of how grouping and filtering work, see [Dimensions, Metrics, Filtering, and Grouping](dimensions-metrics-filtering-and-grouping.md).
> 3. Select the relevant filters to limit the data displayed to just the information you want. For example, rather than running a report that shows impressions for all inventory sources, you may want to list results for just a select few. When you select a filter (by clicking Edit), a selection panel appears. Select items in the **Available** list (left), then click Add to include them in the **Chosen** list (right).
> 4. Group by Dimension. Grouping allows you to display rows of data in the order you prefer.
> 5. Choose a delivery option. Once you've selected your filters and grouped by your chosen dimensions, you need to choose a delivery method. Available delivery methods include:
>
>     - **Run now, show results in screen**: For smaller amounts of data, you may want to view the report as soon as possible in your browser.
>     - **Run in background, notify me when results are ready to view**: A popup notification will let you know when the report is ready to view or download.
>     - **Export, send results via email**: Run the report in the background and email the results to one or more email addresses.
>     - **Save as report template**: Save your selected report settings so that you can run this report again in the future. You can name this template using the text entry field under Name this report (its checkbox is auto-selected when you choose this option). A saved report can be rerun from the Your Reports screen.
>     - **Add to scheduled reports**: Run this report automatically at specified times and have it sent to one or more email addresses.
>     - **Name this report**: Give this report with its current settings a name for future reference.
>
> 6. Click **Run report** to send yourreport request.
