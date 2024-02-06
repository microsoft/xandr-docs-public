---
title: Modeled Audiences
description: In this article, learn about modeled audiences and how advertisers can take their first-party segments and expand them to similar users for targeting.
ms.date: 10/28/2023
---

# Modeled audiences

> [!NOTE]
> This feature is currently in Alpha. It is still under development and may be subjected to changes without notice. To enable this feature, contact your Microsoft Advertising Account Representative.

Modeled Audience is a feature available for Microsoft Invest that allows advertisers to take their first-party segments and expand them to similar users for targeting. For first-party seed segments, Microsoft Advertising gathers auction data such as geographic information, device type, and inventory URL. Microsoft Advertising uses this data and machine learning algorithms to find more users with similar characteristics as those within the first-party segment. These users are then added to the new modeled audience segment.

## Modeled audience requirements

Before you create a modeled audience, make sure:

- The advertiser-owned first-party segments and pixels have over 18,000 daily active users.
- The line item's minimum duration is 30 days.

## Set up a modeled audience

1. In the Microsoft Invest, select the line item for your advertiser.
1. Click **Edit** and select the **Audience & Location Targeting** option on the left pane.
1. An **Audience and Location Segments** panel is displayed on the right. Now, click on **Create Modeled Audience** from the targeting model.
1. Select a **Seed Segment** from the dropdown menu.

    > [!NOTE]
    > Only eligible seed segments are shown in the dropdown menu.

1. Select one of the **Segment Reach** options for the modeled segment:
    - **More Precise**: Includes approximately the top one-third (1/3) of the users in the modeled segment.
    - **Balanced**: Includes approximately the top two-thirds (2/3) of the users in the modeled segment.
    - **More Reach**: Includes all the users in the modeled segment.
1. Click on **Save Modeled Segment** to save your modeled segment. The newly generated segment model will be available within the next 48-72 hours, along with its estimated size.

> [!NOTE]
> **Alpha release restrictions:**
>
> - Legal disclosure policies have not been updated yet. Hence, modeled segments will no longer include users from the EU. This may be subjected to changes in the future.
> - A modeled audience can only be created and edited in the line item view.
> - Modeled audiences are not supported for data marketplace or third-party segments.
> - The seed segment must be in the same member seat as the modeled audience segment.
> - Only one modeled audience can be targeted per line item.
> - Only one segment can be used as the seed for a modeled audience.
> - The seed segment must be an advertiser-owned first-party segment.
> - The start date of the line items are used to determine when to start modeling.
