---
title: Real-Time Signals Service API Reference
description: Explore the Real-Time Signals Service (RTSS) for uploading ID-to-segment data or other key-value data, facilitating the addition of segments to bid requests.
ms.date: 10/28/2023
ms.custom: digital-platform-api
---

# Real-time Signals Service API reference

> [!WARNING]
> The resources listed on this page are in Beta status, and are subject to change in the future.

The Real-Time Signals Service (RTSS) is used to upload ID-to-segment data or other key:value data used to add segments on bid requests.

## API usage

### Base URL

The base URL for all RTSS methods is listed below:

```
https://api.appnexus.com/apd-api
```

### Authentication

Authentication is performed through the [Digital Platform API authentication service](authentication-service.md). The Auth token retrieved from this service must be passed back to the RTSS service via the `Authorization` header, as outlined on the Auth Service page.

### HTTP headers

The following HTTP headers must be appended to your `apd-api` calls:

| Method | Required HTTP Headers |
|:---|:---|
| `GET` | `Accept: application/appnexus.apd.vauxhall.v1.0+json`|
| `POST`<br>`DELETE` | `Accept: application/appnexus.apd.vauxhall.v1.0+json`<br>`Content-Type: application/appnexus.apd.vauxhall.v1.0+json` |

## Segment fields

The following segment fields are common to the services listed on this page, and described in the section below:

| Field | Type | Description |
|:---|:---|:---|
| `seg_id` | int | The ID of the segment object. |
| `seg_val` | int | The value associated with the segment for the specified targeting. Segment values have a number of uses, from targetable features in campaigns and [Custom Models](../data-science-toolkit/custom-models.md) to computation inputs for [Bonsai Smart Leaves](../data-science-toolkit/bonsai-smart-leaves.md). The default value for targets uploaded without a `seg_val` is `0`.<br><br>**Note:** When you specify a `seg_val`, use the format `seg_id:seg_val:ttl`. Failure to do so may result in an incorrectly set value. |
| `seg_ttl` | int | The "time to live" for the segment association with the specified targeting. After the TTL duration has passed from the time of upload, the segment will no longer be associated with the specified targeting. Knowing when targets will expire can help you avoid uploading unnecessarily large files. If you need to frequently refresh segments or create new ones, for example when using OLC movement data derived from mobile app, you can also use `seg_ttl` to specify an expiration time period and ensure "old" items are deleted after a specific duration.<br><br>- The default TTL for segments uploaded without a `seg_ttl` value or an `expiry` value is `30` days.<br>- The maximum supported `seg_ttl` value is `365` days.<br><br>**Note:**<br>**`seg_ttl` versus expiry**<br>The TTL you set does not account for any processing delays. In other words, your effective TTL is calculated as TTL minus processing delay. For example, if the file is submitted on `3/1/2022 00:00:00` and processing starts the day after, then the effective TTL is `29` days and the segment expires on `3/31 00:00:00`. If you need to set segment expiration with very specific granularity, you should set it using `expiry`. `expiry` is set for the entire uploaded file, not at the segment level.<br>For the bulk upload format, a `seg_ttl` must be specified as an integer in seconds. For example, `1` day is represented as `86400`.<br><br>For individual uploads, use the following syntax to specify segment TTL durations:<br>- `"ns", "nano"`<br>- `"us", "µs", "micro"`<br>- `"ms", "milli"`<br>- `"s", "sec"`<br>- `"m", "min"`<br>- `"h", "hr", "hour"`<br>- `"d", "day"`<br>- `"w", "wk", "week"`<br><br>**Note:** Where the segment has a known `expiry` value (inherited from the file-level `expiry` setting) as well as a `seg_ttl` value, RTSS uses whichever value results in a shorter TTL. In other words, if the explicit TTL value would result in an earlier expiration, `seg_ttl` will determine the effective TTL. Otherwise, the `expiry` value will take priority.<br>For more information about using this parameter, see "Target Expiry" in [RTSS Best Practices](rtss-best-practices.md). |

## Geo targeting

### REST API ([Open Location Code](https://openlocationcode.com/) - OLC)

| Method | Endpoint | Description |
|:---|:---|:---|
| `GET` | `/members/{:member_id}/olcs/{:olc}` | Find segment/value pairs associated with an individual OLC code. |
| `POST` | `/members/{:member_id}/olcs/{:olc}` | Add or replace segment/value pair associated with an individual OLC code. |
| `DELETE` | `/members/{:member_id}/olcs/{:olc}` | Removes specified segments for a given OLC code. |

### Parameters (OLC)

| Name | Data Type | Description | Parameter Type | Required On | Example |
|:---|:---|:---|:---|:---|:---|
| `member_id` | long | Member ID | URL path | All Methods | `123` |
| `olc` | string | OLC code | URL path | All Methods | `58GR22WM+PW` |
| `segment_list` | array of ints | A list of segment IDs | JSON body | `DELETE` | `[123, 456]` |
| `segval_list` | array of objects | A list of segments with associated values | JSON body | `POST` | `[{"seg_id":123,"seg_ttl":"25s","seg_val":345}]` |

### Response fields (OLC)

| Name | Data Type | Description | Returned On | Example |
|:---|:---|:---|:---|:---|
| `segments` | Array of objects | An array of segments (id: value pairs) | `GET` | See [example](#segments-example). |

#### `segments` example

```
{
"segments": [
{
"seg_id": 555,
"seg_ttl": "1w",
"seg_val": 5050
}
]
}
```

### HTTP status codes (OLC)

| Status Code | Returned On | Reason | Headers | Header Description |
|:---|:---|:---|:---|:---|
| `200` | `GET`, `POST` | Success | `X-AuditID` | Reference Audit ID |
| `204` | `DELETE` | Success | `X-AuditID` | Reference Audit ID |
| `207` | `DELETE`, `POST` | Partial with Errors | `X-AuditID` | Reference Audit ID |

> [!NOTE]
> Although any valid OLC code will be accepted, for more detailed information, see the [RTSS Best Practices](rtss-best-practices.md) page.

## Geo administrative targeting

### REST API (country-regions)

| Method | Endpoint | Description |
|:---|:---|:---|
| `GET` | `/members/{:member_id}/countries/{:country}/regions/{:region}` | Find segment/value pairs associated with a region of a country. |
| `POST` | `/members/{:member_id}/countries/{:country}/regions/{:region}` | Add or replace segment/value pair associated with a region of country. |
| `DELETE` | `/members/{:member_id}/countries/{:country}/regions/{:region}` | Removes specified segments for a region of a country. |

### Parameters (country-regions)

| Name | Data Type | Description | Parameter Type | Required On | Example |
|:---|:---|:---|:---|:---|:---|
| `member_id` | long | Member ID | URL path | All Methods | `123` |
| `country` | string | Unique country code | URL path | All Methods | `US` |
| `region` | string | Region name/code | URL path | All Methods | `NJ` |
| `segval_list` | array of objects | A list of segments with associated values | JSON body | `POST` | `[ { "seg_id": 123, "seg_ttl": "25s", "seg_val": 345 } ]` |
| `segment_list` | Array of Segment IDs | List of segment IDs | JSON Body | `DELETE` | `[123, 456]` |

### Response (country-regions)

| Name | Data Type | Description | Returned On | Example |
|:---|:---|:---|:---|:---|
| `segments` | Array of objects | An array of segments (id: value pairs) | `GET` | See [example](#segments-response-example).  |

#### `segments` response example

```
{
"segments": [
{
"seg_id": 555,
"seg_ttl": "1w",
"seg_val": 5050
},
{
"seg_id": 666,
"seg_val": 0
}
]
}
```

### HTTP status codes (country-regions)

| Status Code | Returned On | Reason | Headers | Header Description |
|:---|:---|:---|:---|:---|
| `200` | `GET`, `POST` | Success | `X-AuditID` | Reference Audit ID |
| `204` | `DELETE` | Success | `X-AuditID` | Reference Audit ID |
| `207` | `DELETE`, `POST` | Partial with Errors | `X-AuditID` | Reference Audit ID |

## REST API (postal codes)

> [!NOTE]
> This RTSS functionality is no longer actively supported and is slated to be **deprecated**. You may be able to get the same results from other Xandr products. For assistance, contact your account manager.

| Method | Endpoint | Description |
|:---|:---|:---|
| `GET` | `/members/{:member_id}/postal-codes/{:pcode}` | Find segment/value pairs associated with an individual postal code. |
| `POST` | `/members/{:member_id}/postal-codes/{:pcode}` | Add or replace segment/value pair associated with an individual postal code. |
| `DELETE` | `/members/{:member_id}/postal-codes/{:pcode}` | Removes specified segments for a given postal code. |

### Parameters (postal codes)

| Name | Data Type | Description | Parameter Type | Required On | Example |
|:---|:---|:---|:---|:---|:---|
| `member_id` | long | Member ID | URL path | All Methods | `123` |
| `pcode` | string | Postal Code | URL path | All Methods | `07302` |
| `segval_list` | array of objects | A list of segments with associated values | JSON body | `POST` | `[ { "seg_id": 123, "seg_ttl": "25s", "seg_val": 345 } ]` |
| `segment_list` | Array of segment IDs | A list of segment IDs | JSON Body | `DELETE` | `[123, 456]` |

### Response (postal codes)

| Name | Data Type | Description | Returned On | Example |
|:---|:---|:---|:---|:---|
| `segments` | Array of objects | An array of segments (id: value pairs) | `GET` | See [example](#segments-response-example-postal-codes).  |

#### `segments` response example (postal codes)

```
{
"segments": [
{
"seg_id": 555,
"seg_ttl": "1w",
"seg_val": 5050
},
{
"seg_id": 626,
"seg_ttl": "2d3h",
"seg_val": 0
}
]
}
```

### HTTP status codes (postal codes)

| Status Code | Returned On | Reason | Headers | Header Description |
|:---|:---|:---|:---|:---|
| `200` | `GET`, `POST` | Success | `X-AuditID` | Reference Audit ID |
| `204` | `DELETE` | Success | `X-AuditID` | Reference Audit ID |
| `207` | `DELETE`, `POST` | Partial with Errors | `X-AuditID` | Reference Audit ID |

## IP targeting

### REST API (IP ranges)

| Method | Endpoint | Description |
|:---|:---|:---|
| `GET` | `/members/{:member_id}/ip-ranges/{:ip_begin}/{:ip_end}` | Find segment/value pairs associated with an IP Range. |
| `POST` | `/members/{:member_id}/ip-ranges/{:ip_begin}/{:ip_end}` | Add or replace segment/value pair associated with an IP range. |
| `DELETE` | `/members/{:member_id}/ip-ranges/{:ip_begin}/{:ip_end}` | Removes specified segments for an IP Range. |

### Parameters (IP ranges)

| Name | Data Type | Description | Parameter Type | Required On | Example |
|:---|:---|:---|:---|:---|:---|
| `member_id` | long | member id | URL Path | All Methods | `123` |
| `ip_begin` | string | The first IP in a range | URL Path | All Methods | `192.168.6.235` |
| `ip_end` | string | The last IP in a range | URL Path | All Methods | `192.168.6.255` |
| `segval_list` | array of objects | A list of segments with associated values | JSON body | `POST` | `[ { "seg_id": 123, "seg_ttl": "25s", "seg_val": 345 } ]` |
| `segment_list` | Array of segment IDs | A list of Segment IDs | JSON Body | `DELETE` | `[123, 456]` |

### Response (IP ranges)

| Name | Data Type | Description | Returned On | Example |
|:---|:---|:---|:---|:---|
| `segments` | Array of objects | An array of segments (id: value pairs) | `GET` | See [example](#segments-response-example-ip-ranges). |

#### `segments` response example (IP ranges)

```
{
"segments": [
{
"seg_id": 555,
"seg_ttl": "1w2d",
"seg_val": 5050
},
{
"seg_id": 626,
"seg_ttl": "3w2d30m",
"seg_val": 0
}
]
}
```

### HTTP status codes (IP ranges)

| Status Code | Returned On | Reason | Headers | Header Description |
|:---|:---|:---|:---|:---|
| `200` | `GET`, `POST` | Success | `X-AuditID` | Reference Audit ID |
| `204` | `DELETE` | Success | `X-AuditID` | Reference Audit ID |
| `207` | `DELETE`, `POST` | Partial with Errors | `X-AuditID` | Reference Audit ID |

> [!NOTE]
> Take care when adding or deleting large IP ranges. If a large IP range is added, and a subset of that range is then deleted, the original IP range may not be found in the system.

## REST API (IP address)

| Method | Endpoint | Description |
|:---|:---|:---|
| `GET` | `/members/{:member_id}/ips/{:ip}` | Find segment/value pairs associated with an individual IP. |
| `POST` | `/members/{:member_id}/ips/{:ip}` | Add or replace segment/value pair associated with an individual IP. |
| `DELETE` | `/members/{:member_id}/ips/{:ip}` | Removes specified segments for an individual IP. |

### Parameters (IP address)

| Name | Data Type | Description | Parameter Type | Required On | Example |
|:---|:---|:---|:---|:---|:---|
| `member_id` | long | Member ID | URL Path | All Methods | `123` |
| `ip` | string | An individual IP address. | URL Path | All Methods | `192.168.0.20` |
| `segval_list` | array of objects | A list of segments with associated values. | JSON body | `POST` | `[ { "seg_id": 123, "seg_ttl": "25s", "seg_val": 345 } ]` |
| `segment_list` | Array of Segment IDs | A list of segment IDs. | JSON Body | `DELETE` | `[123, 456]` |

### Response (IP address)

| Name | Data Type | Description | Returned On | Example |
|:---|:---|:---|:---|:---|
| `segments` | Array of objects | An array of segments (id: value pairs). | `GET` | See [example](#segments-response-example-ip-address). |

#### `segments` response example (IP address)

```
{
"segments": [
{
"seg_id": 555,
"seg_ttl": "1w",
"seg_val": 5050
},
{
"seg_id": 626,
"seg_ttl": "1m2d30m",
"seg_val": 0
}
]
}
```

### HTTP status codes (IP address)

| Status Code | Returned On | Reason | Headers | Header Description |
|:---|:---|:---|:---|:---|
| `200` | `GET`, `POST` | Success | `X-AuditID` | Reference Audit ID |
| `204` | `DELETE` | Success | `X-AuditID` | Reference Audit ID |
| `207` | `DELETE`, `POST` | Partial with Errors | `X-AuditID` | Reference Audit ID |

## URL targeting

### REST API (URL components)

Target URL components with `"OR"` logic, with up to 3 paths.

| Method | Endpoint | Description |
|:---|:---|:---|
| `GET` | `/members/{:member_id}/urls/components` | Find segment/value pairs targetable by URL Components. |
| `POST` | `/members/{:member_id}/urls/components` | Add or replace segment/value pair targetable by URL Components. |
| `DELETE` | `/members/{:member_id}/urls/components` | Removes specified segments for a URL from the target list of the URL Components. |

### Parameters (URL components)

| Name | Data Type | Description | Parameter Type | Required On | Example |
|:---|:---|:---|:---|:---|:---|
| `member_id` | long | Member ID | URL Path | `POST`, `DELETE`, `GET` | `123` |
| `path` | string | Partial URL<br>- A partial URL should contain only secondary and top level domains of the host section of the authority URL part, and up to 3 segments of the path URL part.<br>- A partial URL may only contain path components.<br>- Partial URLs support `"OR"` matching on paths. | Query string | `POST`, `DELETE`, `GET` | See [example](#path-example).<br>`mysampledomain.com/en` will match both:<br>- `mysampledomain.com/en`<br>- `mysampledomain.com/en/buyers` |
| `segval_list` | array of objects | A list of segments with associated values | JSON body | `POST`, `DELETE` | See [example](#segval_list-example). |
| `segment_list` | Array of Segment IDs | A list of segment IDs | JSON Body | `DELETE` | `[123, 456]` |

#### `path` example

```
mysampledomain.
mysampledomain.com
mysampledomain.com/en
mysampledomain.com/en/buyers
mysampledomain.com/en/buyers/mysampledomain-test
/en
/en/buyers
/en/buyers/mysampledomain-test
```

#### `segval_list` example

```
[
{
"seg_id": 123,
"seg_ttl": "30m",
"seg_val": 345
}
]
```

### Response (URL components)

| Name | Data Type | Description | Returned On | Example |
|:---|:---|:---|:---|:---|
| `segments` | Array of objects | An array of segments (id: value pairs) | `GET` | See [example](#segments-response-example-url-components). |

#### `segments` response example (URL components)

```
{
"segments": [
{
"seg_id": 555,
"seg_ttl": "1w",
"seg_val": 5050
},
{
"seg_id": 626,
"seg_ttl": "2d20m",
"seg_val": 0
}
]
}
```

### HTTP status codes (URL components)

| Status Code | Returned On | Reason | Headers | Header Description |
|:---|:---|:---|:---|:---|
| `200` | `GET`, `POST` | Success | `X-AuditID` | Reference Audit ID |
| `204` | `DELETE` | Success | `X-AuditID` | Reference Audit ID |
| `207` | `DELETE`, `POST` | Partial with Errors | `X-AuditID` | Reference Audit ID |

## REST API (URL reference)

Target Full URL with exact matching.

| Method | Endpoint | Description |
|:---|:---|:---|
| `GET` | `/members/{:member_id}/urls/reference` | Find segment/value pairs targetable by URL. |
| `POST` | `/members/{:member_id}/urls/reference` | Add or replace segment/value pair targetable by URL. |
| `DELETE` | `/members/{:member_id}/urls/reference` | Removes specified segments for a URL from the target list of the URL. |

### Parameters (URL reference)

| Name | Data Type | Description | Parameter Type | Required On | Example |
|:---|:---|:---|:---|:---|:---|
| `member_id` | long | Member ID | URL Path | `POST`, `DELETE`, `GET` | `123` |
| `path` | string | Full URL<br>URL should contain only secondary and top level domains of the host section of the authority URL part, and full path that will be matched exactly. | Query Parameter | `POST`, `DELETE`, `GET` | `mysampledomain.com/as/many/paths/as/i/want`<br>URLs will be matched exactly as they have been uploaded. |
| `segval_list` | array of objects | A list of segments with associated values. | JSON body | `POST`, `DELETE` | `[{"seg_id":123,"seg_ttl":"30m","seg_val":345}]` |
| `segment_list` | Array of Segment IDs | A list of segment IDs. | JSON Body | `DELETE` | `[123, 456]` |

### Response (URL reference)

| Name | Data Type | Description | Returned On | Example |
|:---|:---|:---|:---|:---|
| `segments` | Array of objects | An array of segments (id: value pairs) | `GET` | See [example](#segments-response-example-url-reference). |

#### `segments` response example (URL reference)

```
{
"segments": [
{
"seg_id": 555,
"seg_ttl": "1w",
"seg_val": 5050
},
{
"seg_id": 626,
"seg_ttl": "2d20m",
"seg_val": 0
}
]
}
```

### HTTP status codes (URL reference)

| Status Code | Returned On | Reason | Headers | Header Description |
|:---|:---|:---|:---|:---|
| `200` | `GET`, `POST` | Success | `X-AuditID` | Reference Audit ID |
| `204` | `DELETE` | Success | `X-AuditID` | Reference Audit ID |
| `207` | `DELETE`, `POST` | Partial with Errors | `X-AuditID` | Reference Audit ID |

## HTTP status codes

| Status Code | Returned On | Reason | Headers | Header Description |
|:---|:---|:---|:---|:---|
| `200` | `GET`, `POST` | Success | `X-AuditID` | Reference Audit ID |
| `204` | `DELETE` | Success | `X-AuditID` | Reference Audit ID |
| `207` | `DELETE`, `POST` | Partial with Errors | `X-AuditID` | Reference Audit ID |

> [!NOTE]
> Uploaded IDs are converted to lower-case values when stored. Matching is not case-sensitive.

## Events - Instantly activated segments

> [!NOTE]
> This RTSS functionality is no longer actively supported and is slated to be **deprecated**. You may be able to get the same results from other Xandr products. Contact your account manager for assistance.

Events are segments which could become active instantly across all data centers, and expire within a specified period. **Events are not associated with any targeting.**

> [!NOTE]
> Given the resources required to enable Events, the following limitations on the service are in place:
>
> 1. The Number of simultaneously active events per member is: **200**.
> 1. Events cannot be bulk loaded, though multiple can be activated per single API call.
> 1. Events must have a TTL.
> 1. Maximum TTL is: **1 hour**.

## REST API (Events)

| Method | Endpoint | Description |
|:---|:---|:---|
| `GET` | `/members/{:member_id}/events` | Gets information on active Events. |
| `POST` | `/members/{:member_id}/events` | Adds new or replaces existing segment(s), creating Events with TTL. |
| `DELETE` | `/members/{:member_id}/events` | Removes specified segment(s), immediately deactivating Events. |

### Parameters (Events)

| Name | Data Type | Description | Parameter Type | Required On | Example |
|:---|:---|:---|:---|:---|:---|
| `member_id` | long | Member ID | URL Path | All Methods | `123` |
| `segval_list` | Array of Objects | A list of segments with associated values | JSON Body | `POST` | `[ { "seg_id": 123, "seg_ttl": "20m", "seg_val": 345 } ]` |
| `segment_list` | Array of Segment IDs | List of segment IDs | Query string | `GET`, `DELETE` | `https://api.appnexus.com/apd-api/members/958/events?segment_list=123,345` |

### Response (Events)

| Name | Data Type | Description | Returned On | Example |
|:---|:---|:---|:---|:---|
| `segments` | Array of objects | An array of segments (id: value pairs) | `GET` | See [example](#segments-response-example-events). |

#### `segments` response example (Events)

```
{
"segments": [
{
"seg_id": 555,
"seg_ttl": "30m",
"seg_val": 5050
},
{
"seg_id": 626,
"seg_ttl": "1wk",
"seg_val": 0
}
]
}
```

### HTTP status codes (Events)

| Status Code | Returned On | Reason | Headers | Header Description |
|:---|:---|:---|:---|:---|
| `200` | `GET`, `POST` | Success | `X-AuditID` | Reference Audit ID |
| `204` | `DELETE` | Success | `X-AuditID` | Reference Audit ID |
| `207` | `DELETE`, `POST` | Partial with Errors | `X-AuditID` | Reference Audit ID |

## Uploads

### REST API (Bulk upload)

The maximum size for a single upload may not exceed 256 MB. Ensure that you compress your files using GZIP before uploading to RTSS.

| Method | Endpoint | Description |
|:---|:---|:---|
| `GET` | `/members/{:member_id}/uploads` | Get a list of active uploads. |
| `POST` | `/members/{:member_id}/uploads` | Upload a CSV file (can be GZIP compressed). |

### Parameters (Bulk upload)

| Name | Data Type | Description | Parameter Type | Required On | Example |
|:---|:---|:---|:---|:---|:---|
| `member_id` | long | Member ID | URL Path | All Methods | `123` |
| `id` | string | UUID of Accepted File Job | Query string |  | `102951` |
| `Content-Type` | string | The Content-Type HTTP Header | HTTP Header | `POST` | `'Content-Type: multipart/form-data'` |
| `file` | file | The data file to be processed. Max file size of 256 MB | Form Data | `POST` | See [File Format and Examples](#file-format-and-upload-examples) section below. |
| `expiry` | date | The fixed time and date when the segments in the file should expire, taking into account any processing time required to meet the deadline. For more information about using this parameter, see "Target Expiry" in [RTSS Best Practices](rtss-best-practices.md). | [RFC 339](https://datatracker.ietf.org/doc/html/rfc3339#section-5.6) |  | `expiry=2022-03-01T17:32:28Z` |

### Response (Bulk upload)

| Name | Data Type | Description | Returned On | Example |
|:---|:---|:---|:---|:---|
| `uploads` | Array of Objects | An array of upload infos | `GET` | See [example](#uploads-response-example-bulk-upload). |
| `id` | string | uuid of accepted file which will be processed asynchronously | `POST` | See [example](#id-response-example-bulk-upload). |

#### `uploads` response example (Bulk upload)

```
{
"uploads": [
{
"added": "string",
"id": "string",
"member_id": 0,
"message": "string",
"rows_failed": 0,
"rows_total": 0,
"started": "string",
"status": "string",
"stopped": "string"
}
]
}
```

#### `id` response example (Bulk upload)

```
{
"id": "a04d88c3-8cc7-11e6-868d-7cd30ab7f6e2"
}
```

### HTTP status codes (Bulk upload)

| Status Code | Returned On | Reason | Headers | Header Description |
|:---|:---|:---|:---|:---|
| `200` | `GET`, `POST` | Success | `X-AuditID` | Reference Audit ID |

### File format and upload examples

#### File format

| **`keytype`** | separator | **`key`** | separator | **`action`** | separator | **`segment`** | separator | **`segment`** |

- **Columns**: `keytype`, `key`, `action`, `segment`
- **Separators**: comma `,` or tab `0x09` `\t` (csv or tsv files)
- **Line separator**: `0x0A` `\n`
- Representation of each column must be less or equal to **`32,767` byt `keytype` and `key` Columns**

| `keytype` ID | Type | `key` Examples |
|:---|:---|:---|
| `0` | string | - IP range: `"127.0.0.1,127.0.0.10"`<br>- Single IP address: `"127.0.0.1"`<br>*Should be quoted.* |
| `1` | string | Country: Region<br>- `"US"`<br>- `"US:KY"` |
| `2` | string | Geo hashcode in OLC format:<br>[OLC spec](https://openlocationcode.com/) |
| `3` | string | Postal code<br>**Note:** Postal codes targets will be **deprecated** soon.<br>`"11235"` |
| `4` | string | Partial URL (up to 3 paths)<br>- `mysampledomain.com`<br>- `mysampledomain.com/en/buyers`<br>- `mysampledomain.com/en/buyers/page` |
| `6` | string | Full URL<br>`mysampledomain.com/many/paths/are/supported` |

##### `action` column

| ID | Description |
|:---|:---|
| `0` | Add to segment |
| `1` | Remove from segment |

##### `segment` column

The segment column can contain:

- `segment_id;segment_id`
- `segment_id:segment_value`
- `segment_id:segment_value:segment_ttl`

When only the `segment_id` is provided, RTSS will assume that segment value is `0`, and segment a TTL of `default` (180 days).

`segment_ttl` must be an integer, indicating TTL duration in **seconds** only.

###### Example CSV file

The header row in the sample file below can be excluded. The bulk upload service will accept files with or without a header.

```
keytype,key,action,segment
0,"63.148.81.22,63.148.81.22",0,1000
1,"US,US:KY",0,1001
1,"US,US:NJ",0,1001:22
2,"8FGQGG00+",0,1002
4,"mysampledomain.",0,1008:10
4,"/en/buyers",0,1004;1005;1006
4,"mysampledomain.com/en",0,1008:25:86400
5,123e4567-e89b-12d3-a456-426655440000,0,1005
6,"mysampledomain.com/many/paths/exact/match",0,1009
```

#### Example `POST` method

##### `POST` request using cURL

```
curl -X POST --header 'Content-Type: multipart/form-data' \
-F file=@"member-1-test.csv.gz"  'https://api.appnexus.com/apd-api/members/1/uploads'
```

##### JSON response

Server responds with the job ID.

```
{ "id": "a04d88c3-8cc7-11e6-868d-7cd30ab7f6e2" }
```

#### Example `GET` method

##### `GET` request using cURL

```
curl https://api.appnexus.com/apd-api/members/1/uploads?id=a04d88c3-8cc7-11e6-868d-7cd30ab7f6e2
```

##### `GET`: JSON response

Server responds with information about the job ID specified in the Query Parameters.

```
{
    "uploads": [
        {
            "added": "2016-10-07T19:52:49Z",
            "id": "a04d88c3-8cc7-11e6-868d-7cd30ab7f6e2",
            "member_id": 1,
            "rows_total": 6, // total number of processed lines in the file
            "rows_failed": 1, // total number of failed lines in the file
            "records_total": 8, // total number of processed "segment records" in the file                          
                                // "records_total" > "rows_total" ==> there were several segments on at least one line in the file
            "records_failed": 2, // total number of failed "segment records" in the file (could be many on a single line)
            "message": "5: bad ip range",
            "started": "2016-10-07T19:52:49Z",
            "status": "completed_with_errors",
            "stopped": "2016-10-07T19:52:49Z"
        }
    ]
}
```

> [!NOTE]
>
> - The `rows_failed` field indicates how many lines failed to process.
> - The `message` field is an error description for failed lines. It returns a maximum of 100 errors.

## Best upload practices

For more information about Bulk Uploads, see [RTSS Best Practices](./rtss-best-practices.md#bulk-uploads).
