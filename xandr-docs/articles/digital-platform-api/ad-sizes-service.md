---
title: Ad Sizes Service
description: Learn about the ad sizes service. The service returns accepted ad sizes from the member service, which cannot be set in PSP.
ms.date: 10/28/2023
ms.custom: digital-platform-api

---

# Ad sizes service

The Ad Size Service returns the ad sizes which are accepted by the member associated with the config.

Ad Sizes come from the `standard_sizes` returned from the Member Service (See [Member Service](./member-service.md)). Sizes are set at the member level. Since the sizes cannot be set in PSP, we add an endpoint in PSP to fetch member sizes for user convenience, and so we can surface them in the PSP UI.

`is_standard` means that the size is a standard size for a creative, and it is not a custom size added to the member.

## REST API

| HTTP Method | Endpoint | Description |
|:---|:---|:---|
| `GET` | [https://api.appnexus.com/prebid/ad-sizes](https://api.appnexus.com/prebid/ad-sizes) | Return all ad sizes. |

**Example response**

The response is a JSON array of ad size objects.

```
[
  {
    "height": 150,
    "is_standard": false,
    "width": 180
  },
  {
    "height": 250,
    "is_standard": false,
    "width": 300
  },
  {
    "height": 480,
    "is_standard": false,
    "width": 640
  },
  {
    "height": 120,
    "is_standard": false,
    "width": 980
  }
]
```
