---
title: Set SafeFrame Configuration
description: Use the set SafeFrame configuration function to configure SafeFrame, which is a managed iframe that provides additional consumer protection and publisher control. 
ms.custom: seller-tag
ms.date: 10/28/2023
---

# Set SafeFrame configuration

This function allows configuration of SafeFrame, a managed iframe that provides additional consumer protection and publisher control beyond that provided by a standard iframe. Here is more information on the  SafeFrame API Reference.

```pre
setSafeFrameConfig({ parameters})
```

The parameters listed below can be sent as arguments in the function.

| Parameter | Type | Description |
|:---|:---|:---|
| `allowExpansionByPush` | Boolean | Specifies whether host can toggle expansion by push. |
| `allowExpansionByOverlay` | Boolean | Specifies whether host can toggle expansion by overlay. |

## Example

```pre
apntag.setSafeFrameConfig({
    "allowExpansionByPush" : true,
    "allowExpansionByOverlay" : true
});
```
