---
title: Add or Edit a Demand Partner
description: In this article, find information about how to add or edit a demand partner.
ms.date: 10/28/2023
---

# Add or edit a demand partner

Once inventory has been [Integrated with Prebid Server Premium (PSP)](integrate-with-psp.md) and [Global Settings have been reviewed](add-or-edit-psp-global-settings.md), Demand Partners can be enabled at the seller member level. This step is necessary before inventory can be mapped to Demand Partners via [PSP configurations](add-edit-or-delete-a-psp-configuration.md).

## Add a demand partner

Follow these steps to add a new Demand Partner:

1. Starting in the Monetize UI, hover over the **Publishers Menu**, then click **Prebid Server Premium**.
1. Click **Global Settings** in the left-hand navigation bar on the **Demand Partner Configurations** screen. This will load the **Global Settings** section and the **Demand Partners** list.
1. On the **Global Settings** page, click the **Add New** button at the top of the **Demand Partners** list. This will open the **New Demand Partner** details pane.
1. Type to search or select the desired Demand Partner from the **Partner** drop-down.
1. Click the **Enabled** toggle to either enable or disable this Demand Partner.
1. Optionally, update the **Bid CPM Adjustment** field. This is a multiplier value applied to the Demand Partner's CPM bid price to adjust how the bids compete in auction. This does not change the actual bid or revenue payout- only the ranking of the bid in the auction. The default value is 1.00 in which case all partners' bids compete equally with no adjustments. The adjustment can be used to account for partner fees or for optimization. If CPM adjustments are needed at a level more granular than Demand Partner, see [Create a Bias Rule](create-a-bias-rule.md).

> [!NOTE]
> You do not need to select Microsoft Advertising as a Demand Partner. All standard managed/direct and RTB demand in the Microsoft Advertising marketplace will operate and flow as it normally does outside the PSP environment/context.
>
> If you select Microsoft Advertising as a **Demand Partner**, do not input parameters that map the configuration to inventory within the same Member ID (Microsoft Advertising seat). The Microsoft Advertising Demand Partner is for mapping inventory from the Publisher's member/seat to a different Microsoft Advertising network seat where that partner has reselling authority.

## Edit a demand partner

Follow these steps to enable/disable or delete an existing Demand Partner in bulk:

1. Go to the **Demand Partners** list.
1. Check the box next to the name(s) of the Demand Partners you want to enable/disable or delete.
1. Click the **Actions** drop-down at the top of the **Demand Partners** list.
1. Select **Enable** or **Disable** to enable/disable the selected Demand Partner(s) across your PSP Configurations accordingly.
1. Select **Delete** if you wish not only to disable the selected Demand Partner(s) across your PSP Configurations, but also delete the Demand Partner(s) from your seat including any instance of the Demand Partner(s) within PSP Configurations settings.

    > [!WARNING]
    > Delete cannot be undone. This option will remove all uses/instances of the selected Demand Partner(s) from your Monetize account, and thus should only be taken if certain that the Partner(s) and associated parameters are no longer needed.

To enable or disable an existing Demand Partner and/or edit a partner's Bid CPM Adjustment value:

1. Click the name of the Demand Partner in the list.
1. In the **Demand Partner** details screen, click the **Edit** button next to the partner's name.
1. Toggle the **Status** selection.
1. If needed, edit the **Bid CPM Adjustment** filed.
1. Click **Save** to apply your changes.

## Related topics

- [Add or Edit PSP Global Settings](add-or-edit-psp-global-settings.md)
- [Add, Edit, or Delete a PSP Configuration](add-edit-or-delete-a-psp-configuration.md)
- [Prebid Server Premium Demand Partner Integrations](prebid-server-premium-demand-partner-integrations.md)
