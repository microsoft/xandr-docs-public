---
title: Modify Tag
description: In this article, learn about the Modify Tag function and its parameters with a detailed example.
ms.custom: seller-tag
ms.date: 10/28/2023
---

# Modify Tag

This function modifies the parameters for a specified target ID. For each key passed in the `params` object, the function will replace any existing information for that key on the specified ad slot.

``` pre
modifyTag ('targetId', {params})
```

> [!WARNING]
> Do not use `modifyTag` to change the `targetId` param. Use `defineTag`instead of renaming the tag object for a new request. Modifying the `targetId` through the `modifyTag` endpoint will not create a new tag object and can lead to unexpected results.

The parameters listed below can be sent as arguments in the function.

| Parameter | Type | Description |
|:---|:---|:---|
| `targetId` | string | The unique identifier of a specific ad slot. |
| `params` | object | An object of tag parameters to modify. For a list of parameters, see [Define Tag](define-tag.md). |

## Example

``` pre
apntag.modifyTag('apn_ad_slot_1',{
    invCode: 'XYZ4567',
    tagId: 987654,
    allowSmallerSizes : false
});
```
