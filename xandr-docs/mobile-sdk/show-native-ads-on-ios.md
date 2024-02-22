---
title: Show Native Ads on iOS
description: Native ads give you the ability to create ads that are customized to match the look and feel of the rest of your application. Learn how to serve native ads in this page using the native ad request and native ad response.  
ms.custom: ios-sdk
ms.date: 10/28/2023
---


# Show Native Ads on iOS

## Overview

Native ads give you the ability to create ads that are customized to match the look and feel of the rest of your application. This article describes Mobile SDK Native Ads API at a high level, and includes an usage example. <!--For a complete reference, see the inline documentation in the code.-->

Native networks that supported through **mediation** for native ads are:

- Facebook
- Google AdMob and Google DoubleClick for Publishers (Google DFP)

In order to serve native ads, you will send a "native ad request" and receive a "native ad response" as explained in the following section.

> [!NOTE]
> Keep a reference to the `ANNativeAdRequest` and `ANNativeAdResponse` objects that you create, otherwise they will go out of scope and cause unexpected behavior.

## Process

- Set up a request object, and set some of its properties such as the placement ID and whether to pre-load the ad's icon image.
- Optionally, set the renderer_id for this NativeAdRequest. (For more on renderer_id see see [Native Layout Service](../digital-platform-api/native-layout-service.md).) The renderer_id needs to be specified for vastxml, likes, downloads, saleprice, phone, address, display URL to be returned in the NativeAdResponse.
- Assuming the request is successful, we load the native ad assets from the response into the view and register it so that we can track user interactions such as clicks.

## Request

First, we set up the request object and set some of its properties such as the placement ID and whether to pre-load the ad's icon image:

``` 
ANNativeAdRequest *request = [[ANNativeAdRequest alloc] init];
request.placementId = @"123456";
request.rendererId = 123;
request.gender = ANGenderMale;
request.shouldLoadIconImage = YES;
request.shouldLoadMainImage = YES;
request.delegate = self;
[request loadAd];
```

## Response

Assuming the request is successful, we load the native ad assets from the response into the view and register it so that we can track user interactions such as clicks:

``` 
- (void)adRequest:(ANNativeAdRequest *)request didReceiveResponse:(ANNativeAdResponse *)response {
      // (code which loads the view)
      MyDummyView *view;
      view.title.text = response.title;
      view.text.text = response.body;
      view.iconImageView.image = response.iconImage;
      view.mainImageView.image = response.mainImage;
      [view.callToActionButton setTitle:response.callToAction forState:UIControlStateNormal];
 
      response.delegate = self;
 
      [response registerViewForTracking:view
                 withRootViewController:self
                         clickableViews:@[view.callToActionButton, view.mainImageView]
                                  error:nil];
 }
```

In this example response, we use several elements of a native ad:

- A title
- An icon image
- The main ad image
- Bodytext
- A "call to action" button that the user can click to convert

## Fields supported in Native

As of version 5.0 of the Mobile SDK, support for native assets is aligned with how native creatives are set up in the application.

If you are still using Legacy Native in the application, you will need to move to "New" Native for your creatives.

The following is a comprehensive list of native assets supported in the SDKs.

| Asset | Supported Pre 5.0? | Supported Post 5.0? | v5.0+ API-Usage Example |
|--|--|--|--|
| Image, Width, Height | Yes, Yes, Yes | Yes, Yes, Yes | `response.mainImage;` <br> `response.mainImageSize;` <br> `response.mainImageURL;` |
| Icon+Width+Height | Yes, No, No | Yes, Yes, Yes | `response.iconImage;`<br> `response.iconImageURL;` <br> `response.iconImageSize;` |
| Title | Yes | Yes | `response.title;` |
| Sponsored by | Yes | Yes | `response.sponsoredBy;` |
| Body text | Yes | Yes | `response.body;` |
| Desc2 | Yes | Yes | `response.additionalDescription;` |
| Call-to-action | Yes | Yes | `response.callToAction;` |
| Rating, Scale | Yes, Yes | Yes, No | `response.rating;` |
| Likes | No | Yes (json only) | ```NSDictionary *customElements = response.customElements[@"ELEMENT"]; if(customElements){ NSString *likes = customElements[@"likes"] NSString *downloads = customElements[@"downloads"] NSString *price = customElements[@"price"] NSString *saleprice = customElements[@"saleprice"] NSString *phone = customElements[@"phone"] NSString *address = customElements[@"address"]; NSString *displayurl = customElements[@"displayurl"]; // To Get clickUrl NSString *clickUrl = customElements[@"link"][@"url"]; //To Get clickFallbackUrl NSString *clickFallbackUrl = customElements[@"link"][@"fallback_url"] }``` |
| Downloads | No | Yes (json only) | ```NSDictionary *customElements = response.customElements[@"ELEMENT"]; if(customElements){ NSString *likes = customElements[@"likes"] NSString *downloads = customElements[@"downloads"] NSString *price = customElements[@"price"] NSString *saleprice = customElements[@"saleprice"] NSString *phone = customElements[@"phone"] NSString *address = customElements[@"address"]; NSString *displayurl = customElements[@"displayurl"]; // To Get clickUrl NSString *clickUrl = customElements[@"link"][@"url"]; //To Get clickFallbackUrl NSString *clickFallbackUrl = customElements[@"link"][@"fallback_url"] }``` |
| Price | No | Yes (json only) | ```NSDictionary *customElements = response.customElements[@"ELEMENT"]; if(customElements){ NSString *likes = customElements[@"likes"] NSString *downloads = customElements[@"downloads"] NSString *price = customElements[@"price"] NSString *saleprice = customElements[@"saleprice"] NSString *phone = customElements[@"phone"] NSString *address = customElements[@"address"]; NSString *displayurl = customElements[@"displayurl"]; // To Get clickUrl NSString *clickUrl = customElements[@"link"][@"url"]; //To Get clickFallbackUrl NSString *clickFallbackUrl = customElements[@"link"][@"fallback_url"] }``` |
| Sale Price | No | Yes (json only) | ```NSDictionary *customElements = response.customElements[@"ELEMENT"]; if(customElements){ NSString *likes = customElements[@"likes"] NSString *downloads = customElements[@"downloads"] NSString *price = customElements[@"price"] NSString *saleprice = customElements[@"saleprice"] NSString *phone = customElements[@"phone"] NSString *address = customElements[@"address"]; NSString *displayurl = customElements[@"displayurl"]; // To Get clickUrl NSString *clickUrl = customElements[@"link"][@"url"]; //To Get clickFallbackUrl NSString *clickFallbackUrl = customElements[@"link"][@"fallback_url"] }``` |
| Phone | No | Yes (json only) | ```NSDictionary *customElements = response.customElements[@"ELEMENT"]; if(customElements){ NSString *likes = customElements[@"likes"] NSString *downloads = customElements[@"downloads"] NSString *price = customElements[@"price"] NSString *saleprice = customElements[@"saleprice"] NSString *phone = customElements[@"phone"] NSString *address = customElements[@"address"]; NSString *displayurl = customElements[@"displayurl"]; // To Get clickUrl NSString *clickUrl = customElements[@"link"][@"url"]; //To Get clickFallbackUrl NSString *clickFallbackUrl = customElements[@"link"][@"fallback_url"] }``` |
| Address | No | Yes (json only) | ```NSDictionary *customElements = response.customElements[@"ELEMENT"]; if(customElements){ NSString *likes = customElements[@"likes"] NSString *downloads = customElements[@"downloads"] NSString *price = customElements[@"price"] NSString *saleprice = customElements[@"saleprice"] NSString *phone = customElements[@"phone"] NSString *address = customElements[@"address"]; NSString *displayurl = customElements[@"displayurl"]; // To Get clickUrl NSString *clickUrl = customElements[@"link"][@"url"]; //To Get clickFallbackUrl NSString *clickFallbackUrl = customElements[@"link"][@"fallback_url"] }``` |
| Display URL | No | Yes (json only) | ```NSDictionary *customElements = response.customElements[@"ELEMENT"]; if(customElements){ NSString *likes = customElements[@"likes"] NSString *downloads = customElements[@"downloads"] NSString *price = customElements[@"price"] NSString *saleprice = customElements[@"saleprice"] NSString *phone = customElements[@"phone"] NSString *address = customElements[@"address"]; NSString *displayurl = customElements[@"displayurl"]; // To Get clickUrl NSString *clickUrl = customElements[@"link"][@"url"]; //To Get clickFallbackUrl NSString *clickFallbackUrl = customElements[@"link"][@"fallback_url"] }``` |
| Click URL | No | Yes (json only) | ```NSDictionary *customElements = response.customElements[@"ELEMENT"]; if(customElements){ NSString *likes = customElements[@"likes"] NSString *downloads = customElements[@"downloads"] NSString *price = customElements[@"price"] NSString *saleprice = customElements[@"saleprice"] NSString *phone = customElements[@"phone"] NSString *address = customElements[@"address"]; NSString *displayurl = customElements[@"displayurl"]; // To Get clickUrl NSString *clickUrl = customElements[@"link"][@"url"]; //To Get clickFallbackUrl NSString *clickFallbackUrl = customElements[@"link"][@"fallback_url"] }``` |
| Click Fallback URL | No | Yes (json only) | ```NSDictionary *customElements = response.customElements[@"ELEMENT"]; if(customElements){ NSString *likes = customElements[@"likes"] NSString *downloads = customElements[@"downloads"] NSString *price = customElements[@"price"] NSString *saleprice = customElements[@"saleprice"] NSString *phone = customElements[@"phone"] NSString *address = customElements[@"address"]; NSString *displayurl = customElements[@"displayurl"]; // To Get clickUrl NSString *clickUrl = customElements[@"link"][@"url"]; //To Get clickFallbackUrl NSString *clickFallbackUrl = customElements[@"link"][@"fallback_url"] }``` |
| Privacy URL | No | Yes | `response.privacyLink;` |
| Video | No | Yes | `response.vastXML;` |
| Custom | Yes | No |  |
| Context | Yes | No |  |
| Full text | Yes | No |  |

## Related topics

- [Integrate with iOS](ios-sdk-integration.md)
- [Mediate with iOS](mediate-with-ios.md)
