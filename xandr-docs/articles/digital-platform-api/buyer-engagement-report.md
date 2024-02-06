---
title: Digital Platform API - Buyer Engagement Report
description: In this article, learn about the Buyer Engagement report and the dimensions and metrics associated with it.
ms.date: 10/28/2023
ms.custom: digital-platform-api
---

# Digital Platform API - Buyer engagement report

The Buyer Engagement Report gives you insight into the viewable duration of your display and video creatives.

For instructions on retrieving a report, please see [Report Service](report-service.md) or the [example](#example) below.

## Time frame

The `report_interval` field in the JSON request can be set to one of the following:

- custom
- yesterday
- last_7_days
- last_14_days
- month_to_yesterday
- last_30_days

### Data retention period

Data in this report has a daily time granularity and is retained for five weeks. This report also displays data under the UTC/GMT time zone.

> [!NOTE]
> To run a report for a custom time frame, set the `start_date` and `end_date` fields in your report request. For more details about these fields, see [Report Service](report-service.md).

## Dimensions

| Column | Type | Filter? | Example | Description |
|---|---|---|---|---|
| `advertiser_id` | int | Yes | `3` | The ID of the advertiser whose creative was served |
| `advertiser_name` | string | No | `"Advertiser"` | The name of the advertiser whose creative was served |
| `buyer_member_id` | int | Yes | `210` | The member ID of the buyer |
| `campaign_id` | int | Yes | `728` | The ID of the campaign (doesn't apply to all advertisers) |
| `campaign_name` | string | No | `"Test"` | The name of the creative (doesn't apply to all advertisers) |
| `creative_id` | int | Yes | 554 | The ID of the creative that served. <br> - For impressions older than 14 months, creatives will be aggregated into one row with 0 as the creative ID. <br> **Note**: For external click or impression trackers, `creative_id` will be `"External Clicks"` or `"External Imps"`. |
| `creative_name` | string | No | `"Q1 2010 728x90"` | The name of the creative that served <br> - For impressions older than 14 months, creatives will be aggregated into one row with "All creative data older than 14 months" as the creative name. <br> **Note**: For external click or impression trackers, `creative_name` will be `"External Clicks"` or `"External Imps"`. |
| `day` | date | Yes | `"2012-08-23"` | The day when the impression occurred |
| `deal_id` | int | Yes | `2345` | The ID of the deal that the served impression is associated with. <br> - For more information about deals you have negotiated with sellers, see [Deal Buyer Access Service](deal-buyer-access-service.md). |
| `deal_name` | string | No | `"Private deal for buyer 1085 with floor of $2.50"` | The name of the deal that the served impression is associated with |
| `device_type` | string | Yes | `"Mobile Phones"` | The type of device where the impression occurred: <br> - `Desktops & Laptops` <br> - `Tablets` <br> - `Mobile Phones` <br> - `TV` <br> - `Game Consoles` <br> - `Set Top Box` <br> - `Media Players` <br> - `Other Devices` |
| `domain` | string | No | `"bestsiteever.com (1536)"` | The URL and ID of the domain on which the impression occurred |
| `domain_id` | int | No | `1536` | The ID of the domain on which the impression occurred |
| `domain_name` | string | No | `"bestsiteever.com"` | The URL of the domain on which the impression occurred |
| `imp_type` | string | Yes | `"External Impression"` | The type of impression that served. For possible values, see `imp_type_id`. |
| `imp_type_id` | int | Yes | `3` | The ID for the type of impression that served (associated types in parentheses): <br> - `1 ("Blank")`: No creative served <br> - `2 ("PSA")`: A public service announcement served because there were no valid bids and no default creative was available <br> - `3 ("Default Error")`: A default creative served due to a timeout issue <br> - `4 ("Default")`: A default creative served because there were no valid bids <br> - `5 ("Kept")`: Your advertiser's creative served on your publisher's site <br> - `6 ("Resold")`: Your publisher's impression was sold to a third-party buyer <br> - `7 ("RTB")`: Your advertiser's creative served on third-party inventory <br> - `8 ("PSA Error")`: A public service announcement served due to a timeout issue or lack of a default creative <br> - `9 ("External Impression")`: An impression from an impression tracker <br> - `10 ("External Click")`: A click from a click tracker <br> - `11 ("Insertion")`: Your creative served on third-party inventory, where it persists across page-loads and sessions. This impression type is currently only for Facebook News Feed creatives. |
| `insertion_order_id` | int | No | `648359` | The ID of the insertion order |
| `insertion_order_name` | string | No | `"InsertionOrderABC"` | The name of the insertion order |
| `line_item_id` | int | Yes | `947764` | The ID of the line item that served the impression |
| `line_item_name` | string | No | `"LineItemDEF"` | The name of the line item that served the impression |
| `media_type` | string | No | `"Banner"` | The general display style of the creative that served: <br> - `Banner` <br> - `Interstitial` <br> - `Video` <br> - `Text` <br> - `Expandable` <br> - `Skin` <br> - `Facebook` |
| `mediatype_id` | int | Yes | `2` | The ID of the media type that served |
| `placement_id` | int | Yes | `546` | The ID of the placement where the creative was served |
| `placement_name` | string | No | `"300x250 Business"` | The name of the placement where the creative was served |
| `publisher_id` | int | Yes | `374967` | The ID of the publisher that owns the inventory |
| `publisher_name` | string | No | `"Publisher XYZ"` | The name of the publisher that owns the inventory |
| `seller_member_id` | int | Yes | `765` | The member ID of the seller who sold the impression |
| `seller_member_name` | string | No | `"AdMeld"` | The name of the seller who sold the impression. |
| `size` | string | Yes | `"728x90"` | The size of the creative that was served |
| `split_id` | int | Yes | `342` | The ID of the split that purchased the impressions in this data set. Splits are only applicable to augmented line items. For any reports that contain campaigns, the `split_id` (if included) will be `null` . |
| `split_name` | string | No | `"Mobile Split A"` | The name of the split that purchased the impressions in this data set. Splits are only applicable to augmented line items. For any reports that contain campaigns, the `split_name` (if included) will be `null` . |
| `supply_type` | string | Yes | `"mobile_web"` | The supply (inventory) type on which the impression occurred: <br> - `Web` <br> - `Mobile Web` <br> - `Mobile App` |

## Metrics

| Column | Type | Example | Formula | Description |
|---|---|---|---|---|
| `average_viewable_duration` | seconds | `132297` | Average Viewable Duration = Total Viewable Duration / Viewable Imps | The average number of seconds for which the creative was in view according to IAB viewability criteria |
| `clicks` | int | `132297` | N/A | Your line item's total number of clicks |
| `ctr` | double | `0.00067472306143` | N/A | The click-through rate – the ratio of clicks to impressions, expressed as a percentage |
| `imps` | int | `11080000` | N/A | Your line item's total number of impressions |
| `total_viewable_duration` | seconds | `152.4298` | N/A | The total number of seconds for which the creative was in view according to IAB viewability criteria |
| `video_completion_rate` | double | `0.0084979838709677` | Video Completion Rate = Video Completions / Total Impressions | The ratio of video completions to total impressions, expressed as a percentage |
| `video_completions` | int | `10` | N/A | The total number of video creatives played for their entire duration |
| `view_measurable_imps` | int | `11080000` | N/A | The total number of impressions that were measured for viewability |
| `view_measurable_rate` | double | `0.00067472306143` | Viewability Measurement Rate = View Measurable Imps / Imps | The percentage of impressions measured for viewability out of the total number of impressions |
| `view_rate` | double | `0.00067472306143` | Viewability Rate = Viewed Imps / View Measurable Imps | The percentage of impressions that were viewable out of the total number of impressions measured for viewability |
| `viewable_completion_rate` | double | `0.0084979838709677` | Viewable Completion Rate = Viewable and Completed Video Impressions / Measurable Video Impressions | The ratio of in-view video completions to total impressions, expressed as a percentage |
| `viewdef_view_rate` | double | `0.00067472306143` | N/A | The percentage of impressions that were viewable, according to the member-level custom definition configuration, out of the total number of impressions measured for viewability |
| `viewdef_viewed_imps` | int | `5.678014273984716` | N/A | The number of measured impressions that were viewable, according to the member-level custom definition configuration (for more details, contact your Xandr account representative) |
| `viewed_imps` | int | `51.47677411571988` | N/A | The total number of impressions that were deemed viewable as defined by the Interactive Advertising Bureau (IAB): For at least one second, 50% of a creative's pixels (or 30% for a creative with at least 242,500 pixels) must be viewable to a viewer on their screen. |

## Example

### Create the JSON-formatted report request

The JSON file should include the `report_type` `"engagement_report_for_buyers"`, as well as the columns (dimensions and metrics) and `report_interval` that you want to retrieve. You can also filter for specific dimensions, define granularity (year, month, day), and specify the format in which the data should be returned (csv, excel, or html). For a full explanation of fields that can be included in the JSON file, see [Report Service](report-service.md).

```
$ cat engagement_report_for_buyers
  {
    "report":
    {
        "report_type":"engagement_report_for_buyers",
        "columns":[
            "line_item_id",
            "line_item_name",
            "creative_name",
            "viewable_completion_rate",
            "average_viewable_duration",
            "ctr",
            "clicks",
            "imps"
        ],
        "report_interval":"last_7_days",
        "format":"csv"
    }
}
```

### `POST` the request to the reporting service

```
$ curl -b cookies -c cookies -X POST -d @engagement_report_for_buyers 'https://api.appnexus.com/report'
{
   "response":{
      "status":"OK",
      "report_id":"097f59fc3ab7d02c5d60db42081d9b69"
   }
}
```

### `GET` the report status from the report service

Make a `GET` call with the Report ID to retrieve the status of the report. Continue making this `GET` call until the `execution_status` is `"ready"`. Then use the **report-download** service to save the report data to a file, as described in the next step.

```
$ curl -b cookies -c cookies 'https://api.appnexus.com/report?id=097f59fc3ab7d02c5d60db42081d9b69'
{
   "response":{
      "status":"OK",
      "report":{
         "name":null,
         "created_on":"2021-05-25 19:19:53",
         "json_request":"{\"report\":{\"report_type\":\"engagement_report_for_buyerss\",\"columns\":[\"line_item_id\",
            \"line_item_name\",\"creative_name\",\"viewable_completion_rate\",\"average_viewable_duration\",\"ctr\",\"clicks\",\"imps\"],
            \"report_interval\":\"last_7_days\"}}",
         "url": "report-download?id=b97897a7864dd8f34e7457226c7af592"
      },
      "execution_status":"ready"
   }
}
```

### `GET` the report data from the report download service

To download the report data to a file, make another `GET` call with the Report ID, but this time to the **report-download** service. You can find the service and Report ID in the `url` field of the previous `GET` response. When identifying the file that you want to save to, be sure to use the file extension of the `"format"` that you specified in your initial `POST`.

> [!NOTE]
> If an error occurs during download, the response header will include an HTTP error code and message. Use `-i` or `-v` in your call to expose the response header.

```
$ curl -b cookies -c cookies 'https://api.appnexus.com/report-download?id=b97897a7864dd8f34e7457226c7af592' > /tmp/engagement_report_for_buyers.csv
```
