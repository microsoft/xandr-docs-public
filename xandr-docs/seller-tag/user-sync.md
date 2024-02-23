---
title: User Sync
description: This article explains about the user sync configuration object which offers publishers control over the behaviour of AST.
ms.custom: seller-tag
ms.date: 10/28/2023
---

# User sync

> [!NOTE]
> This feature is a sub-set of [Set Page Options](./set-page-options.md) AST API.

The user sync configuration object offers publishers the control over the behaviour of AST when it loads the AppNexus user sync script after completion of an auction. This object is designed to create and/or update cookies for users with IDs. These cookies provide better knowledge about the users to DSPs (buyers) and other systems in ad server. They share information with buyers about the user's interests, behaviors, and history that enables the buyers to bid on impressions on the publisher site(s) more efficiently.

> [!NOTE]
> The user information collected here is not PII (personally identifiable information) and the logic used by the user sync script follows regulatory requirements about sharing information found within General Data Protection Regulation (GDPR), U.S. Privacy Laws, Global Privacy Platform (GPP) Interactive Advertising Bureau (IAB) specification. If the user does not provide consent in their respective regions, then the information is not shared with the ad server.

The user sync script is loaded by AST after each auction when `loadTags()` or `refresh()` call is made. By default, the script is loaded 3 seconds after the auction gets over, but this delay can be altered according to the publisher's preference.

Although the AST user sync feature is enabled by default in the publisher's interest, there are options available to disable this feature if desired using `trackingManagement.userSync` settings in [Set Page Options](./set-page-options.md).

## Parameters

| Parameter | Type | Default | Description |
|:---|:---|:---|:---|
| `syncEnabled` | boolean | true | Enables or disables the logic in AST that loads the `userSync` script after the auction ends. |
| `syncDelay` | number | 3000 | Specifies the amount of time (in milliseconds) that AST waits after the auction ends before loading the `userSync` script. |
| `publisherId` | number | none | Numeric identifier for the publisher entity used for the auction on this page. It includes the value that is passed to the `userSync` script, which provides more information downstream. |
| `sellerId` | number | none | Numeric identifier of the seller entity used for the auction on this page. It includes the value that is passed to the `userSync` script, which provides more information downstream. |

### Example of how to populate the settings for AST

```
apntag.setPageOpts({
    trackingManagement: {
        userSync: {
            syncEnabled: true,
            syncDelay: 5000,
            publisherId: 12345,
            sellerId: 123
        }
    }
  });
```
