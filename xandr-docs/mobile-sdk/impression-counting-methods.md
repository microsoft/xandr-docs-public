---
title: Impression counting methods - Mobile SDK v7.0 and below
description: In this article, learn about the various impression counting methods, types, AdUnits, and how to enable them.
ms.custom: android-sdk, ios-sdk
ms.date : 10/28/2023
---

# Impression counting methods - Mobile SDK v7.0 and below

The Mobile SDK uses different impression tracking mechanisms for various Ad formats. These methods apply to Mobile SDK versions 7.0 and earlier.

| Type | Counting Method | AdUnits | How to enable |
|:---|:---|:---|:---|
| Default | Impression trackers are fired when rendered (attached to window) | Banner Ads | NA |
| Default | Impression trackers are fired when rendered (attached to window) | Native Ads | NA |
| Feature | Impression trackers are fired when 1 pixel of the content is loaded | Banner and Native Ads | iOS:<br>`ANSDKSettings.sharedInstance.countImpressionOn1PxRendering = YES;`<br>Android:<br>`SDKSettings.setCountImpressionOn1pxRendering(true)` |
| Feature | When lazy load is enabled, impression trackers are fired when content is loaded in webview  | Banner Ads | **Note:** For more information on lazy load, visit [lazy load for iOS](lazy-load-for-ios.md) and [Android](lazy-load-for-android.md) page. |

For more information about generic impression counting, see [Impression counting](../industry-reference/impression-counting.md).

## Viewability and impression counting

Viewability and impression counting are two different entities. Impression counting measures if an ad is served whereas viewability measures a whole lot of analytics like how long the ad was viewed by the user, what actions the user took, etc. to give better picture for the advertiser to serve better.

The definition of impression counting definition has evolved over the years. Initially an impression was counted when it was rendered on the page or it was downloaded to the user page. However, it was not necessary that the ad was viewed though it was downloaded. So even if the ad was downloaded in the background the impression count was considered.

This method of impression counting becomes irrelevant as advertisers want accurate counts to understand how many ads are actually served the user which means how many ads are actually downloaded as well as viewed by the user. This is what viewable impression counts. Viewable impression counting applies for all managed demand and for certain bidders like DV 360 who count only viewable impressions. The logic applies only for mobile app impressions and not for mobile web or web pages as these still count when the ad is rendered or downloaded to the page.
