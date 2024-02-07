---
title : Toggle PSAs on iOS
description : PSAs (Public Service Announcements) are ads that can be served as a last resort, if there are no other ads to show on iOS.
ms.custom : ios-sdk
ms.date : 10/28/2023
---


# Toggle PSAs on iOS

PSAs (Public Service Announcements) are ads that can be served as a last
resort, if there are no other ads to show.

They are not enabled by default, but you can turn them on using the code
shown below.

``` 
// Whether to serve PSAs if there are no ads.
banner.shouldServePublicServiceAnnouncements = true;
    
```
