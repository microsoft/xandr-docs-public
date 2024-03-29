---
title: Microsoft Invest - Segment Pixels - Advanced
description: Learn how to manually create secure pixels and place them on HTTPS pages. Insecure pixels must be placed on HTTP pages.
ms.date: 10/28/2023
---

# Microsoft Invest - Segment pixels - Advanced

## Secure pixels

The UI allows you to create secure pixels, or pixels to be placed on HTTPS pages. To do this manually, simply create a pixel as usual and then make two small changes:

1. Replace "http" with "https".
2. The sub-domain should be "ib.adnxs.com".

> [!NOTE]
> Secure pixels **must** be placed on a **secure** page. In addition, insecure pixels **must** be placed on an **insecure** page.

## Segment and conversion pixels in the same call

To record a conversion and add the user to a segment in one call, use the conversion pixel syntax with "seg" as a querystring parameter:

```
https://ib.adnxs.com/px?id=[ID]&seg=[segIDs] 
```

Example:

```
https://ib.adnxs.com/px?id=532&seg=17523,12345 
```

With codes. Note that when using codes the member parameter is required, since codes are not unique.

```
https://ib.adnxs.com/px?id=532&seg_code=auto&member=234 
```

To record a conversion and remove the user from a segment in one call, use the conversion pixel syntax with "remove" as a querystring parameter:

```
https://ib.adnxs.com/px?id=[ID]&remove=[Seg IDs]&t=2 
```

## JavaScript pixels

Some advertisers require JavaScript tags. Image pixels can only perform one redirect, so parent pixels with multiple piggybacks must be JavaScript. If a piggyback pixel is JavaScript, the parent pixel should be JavaScript as well.

An image pixel looks like this, with a t=2 parameter:

```
<img src="media/seg?add=11837&t=2" width="1" height="1" /> 
```

A JavaScript pixel looks like this, with a t=1 parameter:

```
<script src="https://ib.adnxs.com/seg?add=11837&t=1" type="text/javascript"></script> 
```

- You can choose a JavaScript pixel format in the UI.
- If the parameter `t=1` or `t=2` is not present, the pixel defaults to image.

## Parameter list

These parameters can be auto-added through the UI, in the pixel export screen.

| Field | Meaning | Example |
|:---|:---|:---|
| `add` | Comma-separated segments to add for the user | `add=37,28,12` |
| `add_code` | Comma-separated list of segment codes to add for the user.<br> **Note**: Member parameter is required when using codes. Codes are case-sensitive. | `add_code=auto,travel&member=3` |
| `remove` | Comma-separated segments to remove for the user | `remove=14` |
| `remove_code` | Comma-separated list of segment codes to remove for the user.<br> **Note**: Member parameter is required when using codes. Codes are case-sensitive. | `remove_code=auto,travel&member=3` |
| `member` | ID of member owning segment id/code. | `member=5` |
| `redir` | A redirect URL used to piggyback another pixel | `redir= https://ad.yieldmanager.com/pixel?id=1243` |
| `value` | A user-defined field with a positive integer value that can be targeted in a line item.<br> The word "value" should not be implemented as a querystring parameter. Instead, implement this as a colon (:) after the segment ID. An example can be found in the column to the right.<br><br> **Note**: If the user is being added to multiple segments in the call, the "value" parameter will apply to all the segments in the call. To apply values to individual segments in a multi-segment call, instead put a ":" after the segment ID. For example:<br> ```https://ib.adnxs.com/seg?add=[seg_id_1]:[seg1value],[seg_id_2]:[seg2value],[seg_id_3]:[seg3value]```<br> <br> The maximum accepted value is 2147483647. (If a value above this is included, there may be behavior unpredictability such as the pixel fire not processing. Therefore, the user will not be added to the segment. Other times, it will be processed, however the value set will be much smaller than what was passed.) <br> **Value Use Scenario**: <br> The value field can be utilized to indicate the likelihood of a user doing something.<br> For example, we can use values to indicate the likelihood of a user purchasing an iPhone:<br> `add=1234:1` -> (low)<br> `add=1234:2` -> (medium)<br> `add=1234:3` -> (high)<br><br> Instead of creating three different segments, you can utilize the value field to differentiate the level of a user's interest to buy.<br> However, you would still have to identify how the values would be determined/categorized (for instance, if a user placed the iPhone into their shopping cart but they didn't actually buy it, that could equate to value 3). You would have to subjectively distinguish what separates one value from another. | `add=1234:65` |
| `other` | A user-defined, page-level segment modifier value. This should only be used for [Segment Modifier Testing Guidelines integrations](./segment-modifier-testing-guidelines.md) (see Page-Level Modifiers on that page). | `other=2` |

## Examples

### Adding segment pixels using segment ID

```
<img src="media/seg?add=1,2,4" width=1 height=1/> 
```

### Segment pixels using segment code

If using codes, your member id is required.

```
<img src="media/seg?add_code=auto1,travel5&member=10" width=1 height=1/> 
```

### Adding and removing segments in one call

```
<img src="media/seg?add=1,2,4&remove=3" width=1 height=1/> 
```

### Redirect to another URL/pixel

```
<img src="media/pixel?id=1243" width=1 height=1 /> 
```

## Targeting segment values

This is how to target values in segments: 
- When you create a line item, click the **Targeting** tab. 
- In the **Targeted Segments** window, go to the **Value** selection. See the above table for the `value` definition.
