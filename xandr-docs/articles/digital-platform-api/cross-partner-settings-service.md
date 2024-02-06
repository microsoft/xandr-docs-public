---
title: Cross-Partner Settings Service
description: In this article, learn about the Cross-Partner Settings service, their parameters, session data, and responses with thorough examples.
ms.date: 10/28/2023
ms.custom: digital-platform-api
---

# Cross-Partner Settings service

The Cross-Partner Settings Service allows for the retrieval and editing of the the member-wide settings for a member in PSP. They contain global bidder timeouts, price granularity details for bids, and currency settings. Cross Partner Settings are [Global Settings in the UI](../monetize/add-or-edit-psp-global-settings.md).

## REST API

| HTTP Method | Endpoint | Description |
|:---|:---|:---|
| `GET` | [https://api.appnexus.com/prebid/cross-partner-settings?member_id=9385](https://api.appnexus.com/prebid/cross-partner-settings?member_id=9385) | Get all the cross-partner settings for the caller's member. |
| `POST` | [https://api.appnexus.com/prebid/cross-partner-settings](https://api.appnexus.com/prebid/cross-partner-settings) | Create a new cross-partner setting. Pass the cross-partner settings as JSON in the body of the request. |
| `PUT` | [https://api.appnexus.com/prebid/cross-partner-settings](https://api.appnexus.com/prebid/cross-partner-settings) | Update an existing cross-partner setting. Pass the updated cross-partner settings as JSON in the body of the request. |
| `PATCH` | [https://api.appnexus.com/prebid/cross-partner-settings](https://api.appnexus.com/prebid/cross-partner-settings) | Update a portion of an existing cross-partner setting. Pass the updated cross-partner settings as JSON in the body of the request. |

## GET

Get all the cross-partner settings. In order for the request to be valid user session data must be included.

### Parameters

| Name | Type | Scope | Description |
|:---|:---|:---|:---|
| `member_id` | integer | Required | The member id the cross-partner settings will be associated with. |

### Example call using curl

```
curl data = ([
   {
      "username":"aedwards_1",
      "user_id":"1",
      "user_type":"admin",
      "entity_id":7293,
      "initial_user_id":null,
      "initial_user_name":null,
      "access_control":{
         "member_configured":null,
         "groups":{
            "roles":[
               123
            ],
            "teams":[
               232,
               12,
               32
            ]
         }
      }
   }
])

'https://api.appnexus.com/prebid/cross-partner-settings?member_id=9385'
```

### Session data

| Name | Type | Scope | Description |
|:---|:---|:---|:---|
| `username` | string | Required | The name of the user making the request. |
| `user_id` | integer | Required | The id of the user making the request. |
| `user_type` | string | Required | The type of user making the request. For example, `"admin"`. |
| `entity_id` | integer | Required | The id of the user's entity. |
| `initial_user_id` | integer | Required |  |
| `initial_user_name` | string | Required |  |
| `access_control` | object | Required |  |
| `access_control.member_configured` |  | Required |  |
| `access_control.groups` | object | Required |  |
| `access_control.groups.roles` | array | Required |  |
| `access_control.groups.teams` | array | Required |  |

### Response

A successful response will return JSON containing the cross-partner settings for the passed member.

| Field | Type | Description |
|---|---|---|
| `bidder_timeout_ms` | integer | The maximum time, in milliseconds, that Prebid Server Premium partners and other bidders in our marketplace are given to respond. |
| `deleted` | boolean | Indicates if the cross-partner setting has been deleted. |
| `id` | integer | Unique identifier for the cross-partner setting object. |
| `last_modified` | string | The last modification date of the cross-partner setting object. |
| `member_id` | integer | Unique identifier of the member the cross-partner setting object belongs to. |
| `price_granularity` | object | See the [price granularity table](#price-granularity) below. |

> [!NOTE]
> The full timeout hierarchy in order from highest to lowest priority is:
>
> 1. [Debug Auction timeout value](../monetize/understanding-the-debug-auction.md) (2000ms) \[if debug=1/true\].
> 1. Ad Request `auction_timeout_ms` value set by the publisher.
>    1. For AMP, [See guidance here](../monetize/add-or-edit-psp-global-settings.md).
>    1. For Android, [See guidance here](../mobile-sdk/set-the-auction-timeout-for-android.md).
>    1. For iOS, [See guidance here](../mobile-sdk/set-the-auction-timeout-for-ios.md).
> 1. Placement-level `auction_timeout_ms` value. Contact your Xandr Representative to set this value.
> 1. PSP Global Settings (Cross Partner) Timeout value set by the publisher. [See guidance here](../monetize/add-or-edit-psp-global-settings.md).
> 1. Member-level `default_auction_timeout_ms` value for the given data center. Contact your Xandr Representative to set this value.
> 1. Member-level `default_auction_timeout_ms` value. Contact your Xandr Representative to set this value.
> 1. Xandr data center/global default (150ms).

### Price granularity

Price granularity defines the CPM price buckets into which demand partner bids will be grouped. For more information, see [Prebid documentation](https://docs.prebid.org/adops/price-granularity.html).

| Property | Type | Description |
|:---|:---|:---|
| `label` | string | The accepted value for price granularity. See [Prebid documentation](https://docs.prebid.org/adops/price-granularity.html). |
| `ranges` | array | Container object describing the price granularity range. |
| `ranges.max` | integer | The maximum length of the range. |
| `ranges.increment` | float | The amount to increment through the range. |
| `precision` | integer | The number of decimal places to round the price. Two is the default, so a price of 2.1234 would be rounded to two decimal places, 2.12. |
| `currency_code` | string | String containing desired currency code for price bucket calculations. Must be a part of the [Xandr-approved list of currencies](../monetize/currency-support.md). |

### Example response

```
{
   "id":5,
   "member_id":7293,
   "bidder_timeout_ms":0,
   "price_granularity":{
      "label":"Dense",
      "ranges":[
         {
            "max":3,
            "increment":0.01
         },
         {
            "max":8,
            "increment":0.05
         },
         {
            "max":20,
            "increment":0.5
         }
      ],
      "currency_code":"USD",
      "precision":2
   },
   "last_modified":"2019-10-31T17:37:50Z",
   "deleted":false
}            
            
```

## POST

Create a new cross-partner setting.

### POST: Example call using curl

```
{
   "id":123,
   "member_id":13859,
   "bidder_timeout_ms":995,
   "price_granularity":{
      "label":"Dense",
      "ranges":[
         {
            "max":3,
            "increment":0.01
         },
         {
            "max":8,
            "increment":0.05
         },
         {
            "max":20,
            "increment":0.5
         }
      ],
      "precision":2,
      "currency_code":"USD"
   }
}            
            
```

### POST: Parameters

| Name | Type | Scope | Description |
|:---|:---|:---|:---|
| `bidder_timeout_ms` | integer | Required | The maximum time, in milliseconds, that Prebid Server Premium partners and other bidders in our marketplace are given to respond. |
| `member_id` | integer | Required | The member id the cross-partner settings will be associated with. |
| `price_granularity` | object | Required | The price granularity settings. For more details on this object, see the [price granularity table](#post-price-granularity) below. |

### POST: Price granularity

Price granularity defines the CPM price buckets into which demand partner bids will be grouped. For more information, see [Prebid documentation](https://docs.prebid.org/adops/price-granularity.html).

| Property | Type | Scope | Description |
|:---|:---|:---|:---|
| `ranges` | array | Required | Container object describing the price granularity range. |
| `ranges.max` | integer | Required | The maximum length of the range. |
| `ranges.increment` | float | Required | The amount to increment through the range. |
| `precision` | integer | Required | The number of decimal places to round the price. Two is the default, so a price of 2.1234 would be rounded to two decimal places, 2.12. |
| `currency_code` | string | Required | String containing desired currency code for price bucket calculations. Must be a part of the [Xandr-approved list of currencies](../monetize/currency-support.md). |

### POST: Example

```
{
   "username":"aedwards_1",
   "user_id":"1",
   "user_type":"admin",
   "entity_id":7293,
   "initial_user_id":null,
   "initial_user_name":null,
   "access_control":{
      "member_configured":null,
      "groups":{
         "roles":[
            123
         ],
         "teams":[
            232,
            12,
            32
         ]
      }
   }
}            
            
```

## Related topics

- [Currency Support](../monetize/currency-support.md)
- [Add or Edit PSP Global Settings](../monetize/add-or-edit-psp-global-settings.md)
