---
title: Report Status Service
description: Explore the Report Status service to determine whether a report has been run and is ready for download.
ms.date: 10/28/2023
ms.custom: digital-platform-api
---

# Report Status service

The Report Status Service is used to determine whether a report has been run and is ready for download.

## REST API

| HTTP Method | Endpoint | Description |
|:---|:---|:---|
| `GET` | [https://api.appnexus.com/report-status](https://api.appnexus.com/report-status) | View the status of all reports. |
| `GET` | [https://api.appnexus.com/report-status?report_type=network_analytics,advertiser_analytics](https://api.appnexus.com/report-status?report_type=network_analytics,advertiser_analytics) | View the status of specific reports using a filter. |

## JSON fields

| Field | Type | Description |
|:---|:---|:---|
| `max_hour_closed` | Timestamp | The time (in UTC) at which the data pipeline finished processing this report's data. |
| `max_hour_closed_conversion` | Timestamp | **Deprecated.** Conversion data is now processed with other report data, instead of being delayed. |

## Example

### An example call to the report

```
$ curl -b cookies "https://api.appnexus.com/report-status"
{
    "response": {
        
        "reports": {
            "segment_load": "",
            "inventory_segment_daily_uniques": "",
            "inventory_domain_analytics": "",
            "inventory_source_segment_daily_uniques": "",
            "inventory_source_daily_uniques": "",
            "inventory_source_domain_analytics": "",
            "inventory_source_analytics": "",
            "marketer_analytics": "",
            "marketer_billing": {
                "max_hour_closed": "2012-12-03 15:00:00"
            },
            "analytics": "",
            "network_carrier_analytics": "",
            "network_device_analytics": "",
            "network_analytics_test2": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "seller_site_domain": "",
            "ttui_seller_platform_billing": "",
            "network_advertiser_analytics_larry": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "site_domain_performance_backup": "",
            "site_domain_daily_uniques": "",
            "clicktrackers": "",
            "network_analytics_feed_test": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "advertiser_analytics_daily_test": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "publisher_analytics_test": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "network_publisher_analytics_test": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "admin_buyer_analytics_test": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "admin_seller_analytics_test": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "opt_dash_analytics_test": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "network_advertiser_analytics_test": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "advertiser_analytics_test": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "network_analytics_test": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "advertiser_frequency_recency": "",
            "network_advertiser_frequency_recency": "",
            "pixel_fired": "",
            "network_site_domain_performance": "",
            "attributed_conversions": "",
            "network_analytics_feed": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "network_billing": {
                "max_hour_closed": "2012-12-03 15:00:00"
            },
            "advertiser_analytics_daily": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "site_domain_performance": "",
            "content_category_volume": {
                "max_hour_closed": "na"
            },
            "bidder_platform_buyer": "",
            "publisher_analytics": "",
            "network_publisher_analytics": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "admin_buyer_analytics": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "admin_seller_analytics": {
                "max_hour_closed": "2012-10-31 00:00:00"
            },
            "admin_platform_billing": "",
            "admin_platform_seller": "",
            "seller_platform_billing": "",
            "platform_seller": "",
            "platform_buyer": "",
            "buyer_platform_billing": "",
            "opt_dash_analytics": {
                 "max_hour_closed": "2012-10-31 00:00:00"
            },
            "inventory_daily_uniques": "",
            "network_advertiser_analytics": {
                 "max_hour_closed": "2012-10-31 00:00:00"
            },
            "advertiser_analytics": {
                 "max_hour_closed": "2012-10-31 00:00:00"
            },
            "network_analytics": {
                 "max_hour_closed": "2012-10-31 00:00:00"
            },
            "seller_monetization": {
                "max_hour_closed": "2014-04-15 00:00:00"
            }
        },
        "status": "OK"
    }
    }
```

## Related topics

- [Reporting Services](reporting-services.md)
- [Read-Only Services](read-only-services.md)
