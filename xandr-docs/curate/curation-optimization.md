---
title: Curation Optimization
description: In this article, learn about the Curation optimization process in detail.
ms.date: 10/28/2023
---

# Curation optimization

> [!NOTE]
> The Curation Optimization feature will roll out in phases through 2023. You will receive a notification when your account is enabled. Contact your Microsoft Advertising Account Representative for any queries.

With the growth of the programmatic industry, systems are having to process a greater volume of auctions with more and more information in them. For example, there are now industry IDs, schains, and, since the last few years, curated deals that have been incorporated into the auction. In programmatic auctions, each system participating has a fixed amount of time (a few milliseconds) in which to process the auction and respond. Each system must therefore ensure that it processes auctions as efficiently as possible and deprioritizing unnecessary information is one way to drive efficiency.

As a part of the curation process, we can deprioritize unnecessary information by sampling curated deals that buyers are not currently bidding on. Sampling allows the deal to remain active in case a buyer begins to bid. However, most of the resources are directed towards processing curated deals that buyers are actively using and spending against. In this way, buyers, curators, and sellers will be able to achieve better results.

## Curation optimization process

Microsoft Advertising tracks the bids a deal receives to determine whether buyers are currently interested in the deal. If we notice that buyers are not bidding against a deal, and are therefore not currently interested in the deal, we sample the auctions where that deal participates. If a deal is being sampled and receives a bid, we stop sampling it within 15 minutes and allow it to participate in all targeted auctions. For multi-buyer deals, a bid from any buyer will deactivate sampling for the deal.

To ensure a smooth taper, the sampling rate increases in stages over several weeks without bids:

- After a deal is activated, it has a seven-day grace period to participate in all its targeted auctions.
- If no bids have been received after seven days, it participates in an 80% random sample of targeted auctions.
- If no bids have been received after 14 days, the random sample is 40%. After 21 days, it is 20%, and after 30 days, it is 10%.

> [!NOTE]
> If you’ve deactivated a deal for more than 30 days and later reactivate it, then this deal also benefits from a seven-day grace period after reactivation.

## Curator's role

Curators don’t need to take additional actions to benefit from Curation Optimization. Curators should just be aware that if there is a lack of bidding activity, you and the buyer may observe a decrease in impressions matched and bid requests over time. This isn't a function of the available supply but of the sampling applied to the deal.

### Best practices to follow

- If your buyer has provided you with their campaign’s flight dates and you’re making a curated deal for them in advance, then you can use the **Flights** setting while creating your deal so that it launches at the same time as their campaign.
- If a deal is not needed for a prolonged period of time, you can deactivate it and reactivate it later, such as with seasonal deals. Alternatively, if a deal is no longer needed, you can also delete it. Reports can still be generated for deleted deals.
