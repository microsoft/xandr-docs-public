---
title: Fire Impression Trackers
description: In this article, learn about the Fire Impression Trackers function and its parameter with a detailed example.
ms.custom: seller-tag
ms.date: 10/28/2023
---

# Fire Impression Trackers

This function accepts one parameter which is a native ad object. The function fires impression trackers and JavaScript trackers if they exist on the given native ad object. This could be used in the callback that handles native ad responses.

``` pre
fireImpressionTrackers(adObj)
```

The parameters listed below can be sent as arguments in the function.

| Parameter | Type | Description |
|:---|:---|:---|
| `adObj` | object | The native ad object. (See [Ad Object API](ad-object-api.md).) |

## Example

``` pre
apntag.onEvent('adLoaded', function(data) {
  apntag.fireImpressionTrackers(data);
});
```
