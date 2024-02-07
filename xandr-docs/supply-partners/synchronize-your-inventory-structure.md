---
title: Synchronize Your Inventory Structure
description: Learn the benefits of synchronizing your inventory structure. 
ms.custom: supply-partners
ms.date: 10/28/2023
---

# Synchronize your inventory structure

You should synchronize your inventory structure with
Xandr on a regular basis, ideally
programmatically. Tight synchronization allows you to:

- Analyze discrepancies between Xandr and your
  system. 
- Investigate publisher or domain performance.
- Enforce ad quality and publisher blocking preferences to ensure
  that Xandr provides acceptable bids.
- Separate detectable and non-detectable inventory so that the impact of
  non-detectable inventory on overall selling can mitigated. 

If inventory is not properly categorized and becomes non-detectable by
Domain Detection, this will result in the inventory being unsellable via
Xandr, because without proper inventory grouping
and classification Xandr cannot reliably enforce
its [Policies for Selling](https://microsoftapc.sharepoint.com/teams/XandrServicePolicies/SitePages/Policies-for-Selling.aspx) (login required). 

Use the [UI to synchronize your inventory structure](use-the-ui-to-synchronize-your-inventory-structure.md) and [Use the API to synchronize your inventory structure](use-the-api-to-synchronize-your-inventory-structure.md) pages to introduce you to the basic sell-side object hierarchy and then walk you through the process of mapping your supply to these Xandr objects using Xandr UI or the API.
