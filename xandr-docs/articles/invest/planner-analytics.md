---
title: Microsoft Invest - Planner Analytics
description: Learn about planner visualizations and how it can help your media plan and you understand the capability of specific campaigns.
ms.date: 10/28/2023
---


# Microsoft Invest - Planner analytics

The Planner visualizations show a summary and visualization of your
projected line item performance for a plan when you select it from the
list of plans. You can see more detailed, interactive projections when
you create or edit a plan.

Planner's visualizations can guide your media plan and help you
understand the capability of specific campaigns.
As you try out different configurations in the left pane while you
create or edit a plan, you can update the analytics and visualizations
to show the projected results, so you can adjust your strategy before
making a final decision.

> [!NOTE]
> Planner relies on data that is collected over time for its forecasts. For the most accurate results, audiences should be onboarded and deals should be live for a week before you begin forecasting in Planner.

A user is a device ID, not an actual person: often a person has multiple
user IDs. If you've enabled cross-device, Planner returns estimates for
all the device IDs linked to a user. For impression estimates, we sample
auction logs and generate sketches that include dimensions (supply type,
ad type, inventory URL, and so on) specific to the auction. For user
estimates, we sample users and include geo region, segments, and other
data. We also find all associated auctions and related dimensions, and
use all this data to generate sketches.

## Summary view

When you select a completed plan from the list in the main
**Planning** screen, you can see non-interactive overview information about targeting and supply in the right pane.

| Targeting Tab | Supply Tab |
|---|---|
| **Total Estimated Reach** shows the total projected impressions for the full flight of your line item, based on the plan definition | Provides a list of the projected top sellers and apps that match your inventory requirements, sortable by domain/app or seller |
| **Targeting Dimensions** shows your projected impressions filtered by the dimensions defined in the plan | Provides a list of the projected top sellers and apps that match your inventory requirements, sortable by domain/app or seller |
| **Targeting Breakdown** visualizes an overview of the data in **Targeting Dimensions**, so you can quickly understand where drop-off is occurring, especially when your Total Estimated Reach is low |Provides a list of the projected top sellers and apps that match your inventory requirements, sortable by domain/app or seller  |

## Create/Edit view

When you create or edit a plan, you have access to detailed interactive
visualizations that analyze the factors in your projected line item
performance and recommend inventory based on your settings. Changing the
settings in the left pane lets you estimate the impact of your
adjustments to budget, targeting, and other line item criteria.

| Graph | Description |
|---|---|
| **Targeting Breakdown** | Visualizes an overview of the data broken down by dimensions, so you can quickly understand where drop-off is occurring, especially when your Total Estimated Reach is low. |
| **Supply Strategy** | Shows which types of targeted inventory perform best for your line item. Clicking **View Inventory Report** shows a downloadable breakdown of the top recommended sellers and apps. |
| **Device Type** | Shows which targeted devices perform best for your targeted inventory. |
| **Ad Type** | Shows which ad types are projected to perform best for your targeted inventory. |
| **Inventory Pricing** | Shows the performance of various price points for your targeted inventory. |
| **Estimated Delivery** | If you specified CPM, shows the projected delivery budget over the time frame you set for the plan. The meter shows how close you are to maxing out inventory based on your line item configuration. If you're at risk for low delivery based on your settings, the meter shows yellow or red.<br>Clicking **Show Estimated Costs** displays detailed costs, including a breakdown of CPM for media and data. |
| **Cross Device** | If you enabled cross-device, shows the estimated gain in reach that was attributable to cross-device user tracking. |
