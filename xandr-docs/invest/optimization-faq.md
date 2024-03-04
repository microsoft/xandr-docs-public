---
title: Optimization FAQ
description: In this article, find answers to frequently asked question (FAQ) regarding Optimization.
ms.date: 10/28/2023
---

# Optimization FAQ

This page provides answers to the most common question on optimization.

## What should I do if my line item isn't pacing or to improve my line item delivery?

Take a look at the [Troubleshooting](troubleshoot-your-augmented-line-item-delivery-and-bid-performance.md) tab, which lists the main roadblocks that could interfere with delivery. Additionally, we need to take into account how the line item configuration may affect delivery if a line item is underpacing. For example, the underpacing could be caused by marketplace competition or too restrictive targeting.

### Marketplace competition

In this scenario, a specific line item is losing against other line items that want to buy the same inventory. In order to win more impressions, it is recommended to increase the bid or decrease your margin. This can be done by changing the **CPM**, increasing the **Optimization Goal** threshold, or adjusting your margin (either under **Revenue Type** or **Optimization Goal Priority**, depending on the campaign set up). For more information about how these settings can impact your bids, you can check the [Valuation](valuation.md) page.

High competition can also be related to your supply source targeting. If the supply source is Open Exchange, it might be deprioritized compared to Deal Inventory. If the supply source is Deals, priority on the publisher side might favor another buyer. It is recommended to contact the publisher for more detailed information about your priority.

### Targeting biases

Every [targeting parameter](buy-side-targeting.md) used can affect inventory availability and the amount of traffic available to your line item. Adjusting your targeting can help increase delivery. While there are many different targetings that can be adjusted, some examples for optimizing delivery are:

- Extend allowlist targeting and/or expand the targeted inventory.
- Decrease or remove the viewability rate threshold.
- Add more segments in the segment targeting section.
- Expand geographic targeting by adding new cities or postal codes.
- Adding a new format to the creative rotation.
