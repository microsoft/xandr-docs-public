---
title: Netflix Deal Defined Buying Line Items
description: This article explains about the Netflix PMP deals which are seller-defined. It means the seller defines the targeting parameters the buyer is allowed to configure.
ms.date: 10/28/2023
---

# Netflix deal defined buying line items

> [!NOTE]
> This feature is currently in Alpha. It is still under development and is subject to change without notice. To enable this feature, contact your Microsoft Advertising Account Representative.

## Overview

Due to the premium nature of Netflix inventory, Netflix PMP deals are considered "Seller Defined Deals," meaning the seller defines the targeting parameters the buyer is allowed to configure. The Deal Defined Line Item workflow in Microsoft Invest only displays the settings the buyer is able to control, eliminating the potential for conflict between a buyer and seller, and thus maximizing win rates.

## Before you begin

Before you create a **Deal Defined** line item, you must perform the following tasks:

- [Create an Advertiser](./create-an-advertiser.md)
- [Create an Insertion Order](./create-an-insertion-order.md)

The insertion order you created must have at least one billing period with dates in the future.

You must also have access to one or more PMP deals to target. Sellers must first create these deals for buyers to access them for targeting. If you have questions about how to gain access to a PMP deal, contact your account manager.

> [!WARNING]
> Advertisers in the following verticals are required to submit their licenses and/or proof of creative approval in select markets to serve their ads on Netflix:
>
> - Alcohol
> - Financial Services
> - Insurance
> - High fat/sugar/salt foods
> - Online sports betting
> - State-run lotteries
> - Healthcare
> - Pharmaceuticals
> - Dating
>
> More information on these requirements, along with web forms for submitting licenses and creative approval can be found on the Netflix [Restricted Policy Page](https://help.nflxext.com/legal/netflix_ad_restrictions.pdf).

## Access Netflix PMP deals

To access a Netflix PMP deal, do the following:

1. Click **Your Deals** in the **Inventory** menu
1. In the **Your Deals** screen, ensure that the **Deal Type** is set to **PMP**.
1. Choose the appropriate deal from the **Your Deals** screen.
1. Select the corresponding **Advertiser** and **Insertion Order** associated with that particular PMP Deal.
1. Click **Go To Line Item Create** to launch the page to create the **Deal Defined Line Item**.

## Start a new deal defined line item

To create a new Deal Defined line item, do the following:

1. Click **Create New** in the **Line Item** menu.

1. On the **Create New Line Item** screen, select **Augmented Line Item** > **Deal Defined** under **Line Item Type**

   > [!IMPORTANT]
   > You must have an **Advertiser** and **Insertion Order** associated with the Line item in the Advertiser and Insertion Order sections. If necessary, select an Advertiser and Insertion Order.

1. Click **Next** to open the **Create a Deal Defined Line Item** screen.

## Buying Netflix via PMP on Microsoft Invest

The primary difference between a **Deal Defined Line Item** and a standard **Augmented Line Item** is the deal relationship. Only one deal is allowed on a Deal Defined line item, and the settings of that deal will determine which targeting settings are displayed for you to configure. Because there is only one deal targeted, the buyer must ensure to take the suggested minimum bid of the deal (ask price + BASC) into account when formulating their bidding strategy. When using maximum revenue bids, the max will need to be higher than this suggestion in order to successfully win.

**Overview of deal defined line item setup**

| Feature | Deal Defined Setup Overview |
|:---|:---|
| Audience & Location Targeting | Geotargeting is required. Each Netflix PMP deal is set to target a single country, and you must ensure that the Deal Defined Line Item country target matches the deal. More granular geo targeting may be available depending on deal settings.<br> **Note**: Frequency, Recency & Cookieless targeting are hardcoded based on seller requirements. |
| Basic Settings | Set the LI name, state and deal. After selecting a deal, you'll see details of the deal: <br> - **Seller** - ID of the seller of the deal <br> - **Start Date** - date the deal becomes active <br> - **End Date** - date after which the deal is no longer active <br> - **Suggested Minimum Bid** - Calculated as the seller's ask price plus your buyer fees, the suggested minimum bid can be used to inform your bidding strategy. <br> **Note**: This suggestion should be used as a starting point, and you may need to increase your bid depending on your revenue type, goals, and deal competition. <br> - **Price** – The minimum amount the seller will accept for the deal |
| Budgeting & Scheduling | This section is identical to that of a standard ALI, except that Daypart Targeting may not be available based on deal settings. |
| Creatives | This section allows you to associate creatives to the line item and specify creative rotation & scheduling. For more information on Netflix specific creative requirements, see [Creative CTV Guidelines and Specifications](./creative-ctv-guidelines-and-specifications.md) |
| Fees | In this section, you can optionally apply a partner fee to track third party costs |
| Inventory & Brand Safety | This section is unavailable for **Deal Defined Line Items**. The deal targeting is defined in the basic settings section |
| Measurement | In this section, 3rd party verification via IAS and DoubleVerify are currently supported for Netflix PMP deals and can be enabled here |
| Optimization | In this section, you can enable/disable optimization, set a performance goal and goal priority, and associated conversion pixels. <br> **Note**: Given that Netflix inventory consists entirely of video content, it is essential to ensure that your goals are tailored to video buys. |
| Programmable Splits | Splits and custom models are unavailable for **Deal Defined Line Items** |
| Reporting Labels & Comments | In this section, you can optionally assign custom reporting labels to a line item. This enables you to create reports tracking metrics across multiple line items, as well as add comments to a line item for your reference. |
| Viewability & Environment Targeting | Device type, video player position and video content targeting may be available depending on the settings of the deal. |

## Creative rotation and associated creatives

**Creative requirements for Netflix PMP deals**

To serve on Netflix inventory, CTV creatives must meet strict guidelines and technical specifications that have been set by Netflix to ensure an optimal user experience. We recommend that Microsoft Invest buyers consider dedicated creatives when buying Netflix, and consider the context that the advertisement is in and how it will appear on Netflix content. For more information on CTV creatives specification, see [Creative CTV Guidelines and Specifications](./creative-ctv-guidelines-and-specifications.md).

> [!IMPORTANT]
> The Line item must be associated to a Netflix PMP deal for **Creative Requirements for the Selected Deal** to display. You must have at least one associated creative for each media type and ad size listed for the deal.

**Creative rotation**

Select the Creative Rotation Strategy:

- **Auto-optimize creative weight**: The creative with the highest click-through-rate (CTR) delivers the most
- **Evenly weight creatives**: The even rotation is handled automatically by our system
- **Manually weight creatives**: The rotation is based on a user- supplied weight

**Associated creatives**

1. Search for the creative name or the ID, to open the **Associated Creatives** dialog.
1. Select the creatives you want to associate to your PG line item from the **Available Creatives** list by clicking on the check next to the name. Selected creatives will appear in the **Selected Creatives** list. Ensure that you have at least one associated creative for each media type and ad size listed in **Creative Requirements for the PG Deal**. For more information on how to add creatives, see [Add a Creative](./add-a-creative.md) and [Creative CTV Guidelines and Specifications](./creative-ctv-guidelines-and-specifications.md)
1. When you finish making your selections, click **Save**.

## Related topics

- [Programmatic Guaranteed Buying Line Items](./programmatic-guaranteed-buying-line-items.md)
- [Create an Insertion Order](./create-an-insertion-order.md)
- [Add a Creative](./add-a-creative.md)
- [Creative CTV Guidelines and Specifications](creative-ctv-guidelines-and-specifications.md)
