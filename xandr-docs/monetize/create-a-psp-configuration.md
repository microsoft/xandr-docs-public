---
title: Create a New PSP Configuration
description: In this article, find step-by-step instructions on how to create and set up a new PSP configuration.
ms.date: 10/28/2023
---

# Create a new PSP configuration

Follow these steps to create a new PSP configuration:

1. Starting in the Monetize UI, hover over the **Publishers Menu** then click **Prebid Server Premium**. This loads the default **Demand Partner Configurations** screen.
1. In the top section of the **Demand Partner Configurations** screen, click the **New** button.

## Config details (General settings)

1. Enter the name of the configuration.
1. Toggle the configuration status to **Disabled** if requests should not be sent to the Demand Partners once the configuration is saved.
1. Remove any media types that do not apply to the inventory that will be mapped to these Demand Partners. New media types can be added any time via the **Supported Media Types** field. These selections will filter the available Demand Partners to those that support at least one of the selected media types.

    > [!NOTE]
    > If the configuration includes multi-format inventory, you can choose one or more of the inventory's associated media types and the PSP auction will run for the selected media types that are in the auction and supported by the demand partners you choose.

## Microsoft Advertising inventory selection

You can set a PSP configuration at the Placement, Placement Group (site), or Publisher (all child Placements and Placement Groups) level. If an auction matches multiple configurations, the configuration at the lowest level of the hierarchy will be selected. For example, if an auction matches one configuration at a Publisher level and a different configuration at the Placement level, the Placement configuration will be selected.

Follow these steps to restrict your configuration to be triggered only when the selected Placement/Placement Group/Publisher ID is included in an auction:

1. Select **Placement**, **Placement Group**, or **Publisher**.

1. In the search field below, select a Placement, Placement Group, or Publisher, or type in the field to see filtered options. The object you select here will be the inventory object used to trigger this configuration in an auction, and in turn request bids from the demand partner(s) selected in the [Add Demand Partners](#add-demand-partners) section below.

    You can also include these optional configuration settings:

    | Options | Settings |
    |---|---|
    | **Operating System (OS)** | To set the OS for your configuration click in the **Search OS** text field and select an OS, or type in the field to see filtered options. This will ensure the PSP configuration is utilized (PSP demand partners are sent ad requests) only when Microsoft Advertising detects the corresponding OS from the user's device in the auction. For more information, see the [Operating System-Families API Service](../digital-platform-api/operating-system-families-service.md). |
    | **Ad Size Selection** | To specify which ad sizes will be allowed for this configuration, click in the **Ad Size Selection** field and select some ad sizes, or type in the field to see filtered options. This will ensure the PSP configuration is utilized (PSP demand partners are sent ad requests) only when the auction includes one of the selected ad sizes. The **Ad Size Selection** menu includes all standard sizes as well as any custom sizes saved to your member seat. <br><br> Follow these steps to add new custom sizes: <br> a. Select **Network** > **Tools** > **General** from the top menu. This will display the **Tools: General** page. <br> b. Select **Custom Sizes** from the horizontal sub-menu. <br> c. Click the **New custom size** button. This will display the **Custom Size Details** popover. <br> d. Enter values for **Width** and **Height** text fields and click the check box if you want to make this a standard size. <br> e. Click the **Save** button. |

    If these optional settings are left blank, then any auction for the selected Placement/Placement Group/Publisher ID will trigger the corresponding PSP configuration to be used in the auction and enable PSP to call the associated Demand Partners.

## Add demand partners

1. Type to search or select a demand partner from the **Select a Demand Partner** drop down.

    > [!NOTE]
    > Follow the below tips if you do not see the Demand Partner you wish to add in the drop down list:
    > - Ensure that you have the proper media type selected above.
    > - If the media type is set properly, ensure you have added the Demand Partner in the **Global Settings** page under **Demand Partners**, as described in [Add or Edit a Demand Partner](add-or-edit-a-demand-partner.md).
    > - Check that the partner shows up as `Enabled` in that list.
    >
    > You can view a full list of available Demand Partners at [Prebid](https://docs.prebid.org/dev-docs/pbs-bidders.html).

1. Once you select a Demand Partner from the dropdown, new input fields will appear representing the parameters, both required and optional, that each demand partner's adapter accepts. Fill in the values of the required parameters and any desired optional parameters based on the fields in the UI. To get a broader picture of partners and their adapter schemas leverage the [Demand Partner Schema API Service](../digital-platform-api/demand-partner-schema-service.md).

1. To add additional Demand Partners, click the **Add Another** button.

1. Click the **Save** button to save your configurations and return to the **Demand Partner Configurations** screen.

> [!NOTE]
> You do not need to select Microsoft Advertising as a Demand Partner. All standard managed/direct and RTB demand in the Microsoft Advertising marketplace will operate and flow as it normally does outside the PSP environment/context. If you select Microsoft Advertising as a Demand Partner, do not input parameters that map the configuration to inventory within the same Member ID (Microsoft Advertising seat). The Microsoft Advertising Demand Partner is for mapping inventory from the Publisher's member/seat to a different Microsoft Advertising network seat where that partner has reselling authority.

## Related topics

- [Manage a PSP Configuration](manage-a-psp-configuration.md)
- [Manage PSP Configurations in Bulk](manage-psp-configurations-in-bulk.md)
- [Add or Edit PSP Global Settings](add-or-edit-psp-global-settings.md)
- [Prebid Server Premium Demand Partner Integrations](prebid-server-premium-demand-partner-integrations.md)
- [Config Service](../digital-platform-api/config-service.md)
