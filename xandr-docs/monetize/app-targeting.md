---
title: Microsoft Monetize - App Targeting
description: In this article, learn how to target predefined app lists or specific apps.
ms.date: 10/28/2023
---

# Microsoft Monetize - App targeting

> [!IMPORTANT]
> This form of targeting is only available to Standard Line Items. For an overview of which targeting options are available to Standard versus Augmented Line items, see [Buy-Side Targeting](buy-side-targeting.md).

When your campaign is set to serve on mobile app inventory (see [Supply Type Targeting](supply-type-targeting.md)), you can narrow your targeting to include or exclude predefined app lists or specific apps.

> [!NOTE]
> App targeting applies only to mobile app impressions, and these settings will not be considered for web and mobile web impressions. To not serve on web and mobile web impressions, switch the **Web Placements** and **Mobile Web Placements** toggle **OFF**. See [Supply Type Targeting](supply-type-targeting.md) for more information.

## Target predefined app lists

1. In the **Targeting** section, click **Edit** next to **Inventory**.
1. On the **App Lists** tab, include or exclude relevant lists. For instructions on adding app lists, see [Working with Targeting Lists](working-with-targeting-lists.md).

    > [!NOTE]
    >
    > - It is not possible to include some app lists and exclude others; all targeted app lists must be either included or excluded.
    > - There is an OR relationship, not an AND relationship, between included app lists and included individual apps.

1. Click **Add**.

## Target specific mobile apps

1. In the **Targeting** section, click **Edit** next to **Inventory**.
1. On the **Specific Apps** tab, target up to 25 specific app IDs as follows:
    1. Enter the app IDs in list separated by lines or commas.
    1. Click **Add Apps**.
    1. Choose whether to **Include** or **Exclude** the app IDs.

        > [!NOTE]
        >
        > - It is not possible to include some app lists and exclude others; all targeted app lists must be either included or excluded.
        > - There is an OR relationship, not an AND relationship, between included domain lists and included individual domains.

1. Click **Add**.

## How to find app IDs

To find the ID for an Android or IOS app, locate the app's detail webpage by searching for the app in the relevant online store (e.g., iTunes or Google Play).

### iTunes apps

To find the ID for an IOS app, locate the app's detail webpage by searching for the app in the iTunes store. Then, locate the series of numbers after `/id` in the URL. For example, Lyft's iTunes app detail page is `https://itunes.apple.com/us/app/lyft-taxi-app-alternative/id529379082?mt=8`; therefore, its app id is `529379082`.

### Google Play apps

To find the ID for an Android app, locate the app's detail webpage by searching for the app in Google Play. Then, locate the text after `/id` in the URL. For example, Lyft's Google Play app detail page is `https://play.google.com/store/apps/details?id=me.lyft.android`; therefore, its app id is `me.lyft.android`.

## How to choose which apps to target

To identify specific mobile apps to target, we recommend targeting the region you're interested in, activating your campaign, and after a few days running the [Site Domain Performance](site-domain-performance.md) report, which will show you the apps that you've been reaching. You can then update your campaign targeting to include or exclude specific apps to meet your needs.

## Related topics

- [Create a Campaign](create-a-campaign.md)
- [Working with Targeting Lists](working-with-targeting-lists.md)
- [Domain Targeting](domain-targeting.md)
