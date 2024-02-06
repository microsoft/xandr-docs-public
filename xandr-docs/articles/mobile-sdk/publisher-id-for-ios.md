---
title: Publisher ID for iOS
description: The publisher ID parameter provides publishers two options for resolving default placements when an ad request fails at the placement level
ms.custom: ios-sdk
ms.date : 10/28/2023
---

# Publisher ID for iOS

This article explains about the `publisher_id` parameter of the Universal Tag service.  

## Overview

The publisher ID parameter enables publishers to indicate what action should occur when an ad request fails at the placement level. In older versions of mobile SDK, if the request failed, the member ID was be used to determine which default creative to return with the request. With the addition of the publisher ID parameter, publishers now have two following options to resolve default placements when the request fails:
1. publisher level default placement
2. member level default placement

### How it works

When an invalid placement code is called:

- If a `publisher_id` is present in the JSON request, the request will be rerouted to the publisher level default placement.
- When there is no `publisher_id` in the JSON request, the request will be rerouted to the member level default placement.

## Ad unit methods for publisher ID

The [AdUnit](./ios-sdk-ad-units.md) class has following two methods for setting and retrieving `publisherId`:

### 1. Setter Method

   **Code Sample (Swift)**
    
   ```
   public func setPublisherId (publisherId:Int)
   ```
    
   **Code Sample (Objective C)**
    
   ```
   - (void)setPublisherId:(NSInteger)publisherId;
   ```

### 2. Getter Method

**Code Sample (Swift)**

```
publisherId:Int
```

**Code Sample (Objective C)**

```
(NSInteger) publisherId;
```

## Multi ad request changes

Users can select from one of three initialization methods. All require a `memberId` and a `delegate` object as arguments in order for `ANMultiAdRequest` be initialized, `publisherId` is an optional setting. The `memberId`, `delegate` and `publisherId` may only be set during initialization. All `AdUnits` must contain the same `memberId` as the one passed in the initialization process.  See [ANMultiAdRequest](./multi-ad-request-for-ios.md) for more details.

**Code Sample (Objective C)**

```
- (nullable instancetype)
    initWithMemberId:(NSInteger)memberId
            delegate:(nullable id<ANMultiAdRequestDelegate>)delegate
             adUnits:(nonnull id<ANAdProtocolFoundationCore>)firstAdUnit,
                     ... NS_REQUIRES_NIL_TERMINATION;
- (nullable instancetype)
    initWithMemberId:(NSInteger)memberId
         publisherId:(NSInteger)publisherId
            delegate:(nullable id<ANMultiAdRequestDelegate>)delegate
             adUnits:(nonnull id<ANAdProtocolFoundationCore>)firstAdUnit,
                     ... NS_REQUIRES_NIL_TERMINATION;
- (nullable instancetype)
    initAndLoadWithMemberId:(NSInteger)memberId
                   delegate:(nullable id<ANMultiAdRequestDelegate>)delegate
                    adUnits:(nonnull id<ANAdProtocolFoundationCore>)firstAdUnit,
                            ... NS_REQUIRES_NIL_TERMINATION;
- (nullable instancetype)
    initAndLoadWithMemberId:(NSInteger)memberId
                publisherId:(NSInteger)publisherId
                   delegate:(nullable id<ANMultiAdRequestDelegate>)delegate
                    adUnits:(nonnull id<ANAdProtocolFoundationCore>)firstAdUnit,
                            ... NS_REQUIRES_NIL_TERMINATION;
- (nullable instancetype)
    initWithMemberId:(NSInteger)memberId
         andDelegate:(nullable id<ANMultiAdRequestDelegate>)delegate;
- (nullable instancetype)
    initWithMemberId:(NSInteger)memberId
         publisherId:(NSInteger)publisherId
         andDelegate:(nullable id<ANMultiAdRequestDelegate>)delegate;
```

> [!NOTE]
> The `addAdUnit` method of the `ANMultiAdRequest` will read the attached publisherId of the `AdUnit`. If that value does not match the `publisherId` set to the `ANMultiAdRequest` instance, the `ANMultiAdRequest` instance will reject the `AdUnit`.
