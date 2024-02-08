---
title: Google Ad Manager Deal Auction Mechanics
description: In this article, find information about how the Google Ad Manager deal auction works, examples of bid requests - bid responses, and how to interpret bid responses on the Google Ad Manager RTB Breakout UI. 
ms.date: 10/28/2023
---

# Google Ad Manager deal auction mechanics

## Google Ad Manager Bids from Microsoft Advertising

Every bid response submitted to Google Ad Manager by the Microsoft Advertising bidder contains a **dealid** field. The **dealid** value depends on whether the bid was generated by a [campaign](create-a-campaign.md) or a [deal campaign](create-a-deal-campaign.md).

- If the bid was generated by a [campaign](create-a-campaign.md), Microsoft Advertising will pass back a value of **1**.
- If the bid was generated by a [deal campaign](create-a-deal-campaign.md), Microsoft Advertising will pass back the appropriate **Google Ad Manager deal ID** in the bid response.

For every Google Ad Manager impression containing a deal ID, the Microsoft Advertising bidder will submit all bids generated by Deal Campaigns **in addition to** the single highest bid response per Microsoft Advertising Member generated by an open-auction Campaign.

## Bid request - bid response examples

To help you understand which deal ID(s) Microsoft Advertising will return to Google Ad Manager, we have provided several illustrative campaign/targeting configuration samples below.

First, assume the following two campaigns exist:

**Campaign 1 - Open-auction campaign**

- **Domain:** Google Ad Managerexampledomain.com
- **Geo:** Germany
- **Base Bid:** $1.00 CPM

**Campaign 2 - Deal-targeted campaign**

- **Deal ID:** 12345 [corresponding to Google Ad Manager deal ID 99999999999]
- **Base Bid:** $2.00 CPM

The table below describes several hypothetical Google Ad Manager bid requests and the respective bid responses submitted to Google Ad Manager by Microsoft Advertising.

| Google Ad Manager Bid Request | Microsoft Advertising Bid Response to Google Ad Manager |
|---|---|
| **Bid Request 1** <br> - URL: `www.dummydomain.com` <br> - Geo: France <br> - Deal ID: 99999999999 | **Campaign 2** submits a valid bid. Microsoft Advertising sends one bid response to Google Ad Manager. <br> - price: $2.00 <br> - deal_id: 99999999999 |
| **Bid Request 2** <br> - URL: `www.Google Ad Managerexampledomain.com` <br> - Geo: Germany <br> - Deal ID: 99999999999 | **Campaign 1** and **Campaign 2** both submit valid bids. Microsoft Advertising sends two bid responses to Google Ad Manager. <br> **Bid Response 1** <br> - price: $1.00 ; <br> - deal_id: 1 <br> **Bid Response 2** <br> - price: $2.00 <br> - deal_id: 99999999999 |
| **Bid Request 3** <br> - URL: `www.Google Ad Managerexampledomain.com` <br> - Geo: Germany <br> - Deal ID: 555555555555 | **Campaign 1** submits a valid bid. Microsoft Advertising sends one bid response to Google Ad Manager. <br> - price: $1.00 <br> - deal_id: 1 |

## Interpreting bid responses in Google Ad Manager's RTB breakout UI

If you have your own Google Ad Manager Account (most Google Ad Manager buyers do), you have access to the **Google Ad Manager RTB Breakout UI**. As a result, you may have encountered something similar to the following when troubleshooting non-delivery of deal campaigns. This table presents some reasons why, for a given deal ID, Google Ad Manager may log a substantial number of "Responses without bids for this deal".

:::image type="content" source="media/interpreting-adx-bid-responses.png" alt-text="A diagram that shows some possible reasons for a large number of 'Responses without bids for this deal' being logged.":::

When you see **Bids not for this deal** in the **Google Ad Manager RTB Breakout**, it means that the only campaigns that have bid on Google Ad Manager impressions containing the relevant deal ID are Open-auction Campaigns.

This is because bids containing **deal_id: 1** are not counted as bids for any specific Google Ad Manager deal. This **does not mean** that the Microsoft Advertising bidder is unable to properly target/respond to Google Ad Manager deals. However, it **may mean**:

- You have no active Microsoft Advertising campaigns targeting the specific Google Ad Manager deal ID.
- The impressions sent with the specific Google Ad Manager deal ID do not match the targeting settings of any Microsoft Advertising deal-targeted campaign.
- There are one or more Google Ad Manager Publisher blocks passed within the specific Google Ad Manager bid requests which exclude the Microsoft Advertising deal-targeted campaign (e.g., a Deal Campaign with a single Creative whose brand category is "Apparel", but the Google Ad Manager Publisher with whom the deal has been created blocks "Apparel" across their inventory).
- There are additional mismatches between Microsoft Advertising deal-targeted campaign/creative parameters and Google Ad Manager blocks.