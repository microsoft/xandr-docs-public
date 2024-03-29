---
title: Video Guidance
description: Learn how to run video inventory through Prebid Server Premium (PSP). 
ms.date: 10/28/2023
---


# Video guidance

This page includes guidance on running video inventory through Prebid
Server Premium (PSP).

## Instream

- Include the Microsoft Advertising PSP `cache.url` object in
  the config settings as shown in the following example:

  ``` 
  pbjs.setConfig({
     "cache":{
        "url":"https://ib.adnxs.com/prebid/cache"
     },
     "debug":true,
     "enableSendAllBids":true,
     "s2sConfig":{
        "accountId":9325,
        "bidders":[
           "appnexus"
        ],
        "defaultVendor":"appnexuspsp"
     }
  });                        
                          
  ```

- To ensure that the relevant cache key-values are returned, include the
  `extPrebid.cache.bids[{}]` object within the `s2sConfig` as shown in
  the following example:

  ``` 
  extPrebid = ([
     {
        "cache":{
           "bids":[
              {
                 "bidder":"appnexus",
                 "params":{
                    "placementId":1234567
                 }
              }
           ]
        },
        "targeting":{
           "includebidderkeys":true,
           "includewinners":true
        }
     }
  ])                       
                          
  ```

## Outstream

- To ensure that the ad request is made for `Prebid.js s2s` (with PSP),
  include the renderer object within the adUnit definition as shown in
  the following example:

  ``` 
  var adUnits = ([
     {
        "code":"video1",
        "//first_comment":"This renderer would apply to all prebid creatives.",
        "renderer":{
           "url":"https://acdn.adnxs.com/video/outstream/ANOutstreamVideo.js",
           "render":"function (bid)",
           "ANOutstreamVideo.renderAd":{
              "targetId":"bid.adUnitCode",
              "adResponse":"bid.adResponse"
           }
        },
        "mediaTypes":{
           "video":{
              "context":"outstream",
              "playerSize":[
                 640,
                 480
              ],
              "mimes":[
                 "video/mp4"
              ],
              "protocols":[
                 1,
                 2,
                 3,
                 4,
                 5,
                 6,
                 7,
                 8
              ],
              "playbackmethod":[
                 2
              ],
              "skip":0,
              "playback_method":[
                 "auto_play_sound_on"
              ]
           }
        },
        "bids":[
           {
              "bidder":"appnexus",
              "params":{
                 "placementId":1234567,
                 "//first_comment":"Your placement ID."
              }
           }
        ]
     }
  ])                        
                          
  ```

- Microsoft Advertising response includes `prebid.type=video`,
  but if the user sets additional key-value targeting for Prebid, as
  shown in the below example, then the `hb_format=video` key-value will
  be sent to Google Ad Manager (GAM) and can be targeted accordingly.

  ``` 
  {
     "targetingControls":{
        "addTargetingKeys":[
           "SOURCE",
           "ADOMAIN",
           "FORMAT"
        ]
     }
  }                        
                          
  ```

- To leverage passing contextual key-values into the auction, be sure to
  upgrade to `Prebid.js` version 6.14.0 or higher, and define
  adUnit-level keywords accordingly. To ensure that the ad request is
  made properly for `Prebid.js s2s` (with PSP), pass adUnit-level
  keywords to Microsoft Advertising by including the keywords
  object within the adUnit definition as shown in the following example:

  ``` 
  var adUnits = ([
     {
        "code":"div-1",
        "mediaTypes":{
           "banner":{
              "sizes":[
                 {
                    "height":600,
                    "width":160
                 }
              ]
           }
        },
        "bids":[
           {
              "bidder":"appnexus",
              "params":{
                 "placementId":21230286,
                 "keywords":{
                    "test-key":[
                       "test-value"
                    ]
                 }
              }
           }
        ]
     }
  ])
  ```

- For more information, see [Ad Unit specific data](https://docs.prebid.org/features/firstPartyData.html#supplying-adunit-specific-data) and [auction-level keywords](https://docs.prebid.org/dev-docs/bidders/appnexus.html#appnexus-auction-keywords).
