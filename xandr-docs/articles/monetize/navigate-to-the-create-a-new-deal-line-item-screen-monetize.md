---
title: Navigate to the Create New Programmatic Guaranteed Deal Screen
description: The article outlines the process of creating a programmatic guaranteed (PG) deal by selecting a pacing option and proceeding from the Create New Programmatic Guaranteed Deal screen.
ms.date: 10/28/2023
---
# Navigate to the create new programmatic guaranteed deal screen

To create a new programmatic guaranteed (PG) deal, start by pre-selecting a pacing option for your guaranteed deal, then proceed from the **Create New Programmatic Guaranteed Deal** screen.

1. Select  **Advertisers** \> **Monitoring**.

   The **Line Items** screen displays.

1. Click **+New** \> **Guaranteed Deal**.
   The **Create New Line Item** screen displays.

1. Search for and select an advertiser from the **Advertiser** text field.

   Optionally, select the **Make Default Advertiser** checkbox to make this advertiser the default advertiser for future PG deals.

1. Search and select an insertion order from the **Insertion Order** text field.

    Optionally, select the **Make Default Insertion Order** checkbox to make this insertion order your default insertion order for future PG deals.
1. Select a **Pacing** option:

   | Choice | Description |
   |---|---|
   | **Pacing in Microsoft Advertising** | If you choose this pacing option, pacing and other configurations such as targeting, frequency/recency caps, and deal creative criteria will be handled within Microsoft Advertising Monetize.<br>**Note**: **Pacing in Microsoft Advertising** is a **beta** feature that isn't available to all clients. If you'd like access to this feature, please contact your Microsoft Advertising account representative. |
   | **Pacing in Ad Server of Record** | If you choose this pacing option, a third-party ad server will handle pacing and other configurations. |

1. Click **Next**.

    Depending on your **Pacing** selection, you'll see the **Create New Line** Item screen (if you chose **Pacing in Microsoft Advertising**) or the **Create New Programmatic Guaranteed Deal** screen (if you chose **Pacing in Ad Server of Record**).

For instructions on creating a programmatic guaranteed deal with your pacing selection, see

- [Create a Programmatic Guaranteed Deal](create-a-programmatic-guaranteed-selling-line-item.md)(if you chose **Pacing in Microsoft Advertising**)
- [Create a Programmatic Guaranteed Deal that Uses Third-Party Ad Server Pacing, Tag Integration](create-a-programmatic-guaranteed-selling-line-item-ssp.md)(if you chose **Pacing in Ad Server of Record**)
