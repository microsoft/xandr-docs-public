---
title: Using Multiple Campaigns with a Guaranteed Line Item
description: Learn about different use cases while running more than one campaign. 
ms.date: 10/28/2023
---


# Using multiple campaigns with a guaranteed line item

When setting up a guaranteed line item, you may want to run more than
one campaign under that line item. Running more than one campaign
enables several interesting use cases, including:

- When an advertiser needs a line item to deliver during only certain
  date ranges within the overall flight.
- When an advertiser needs to implement multiple targeting strategies
  for a single guaranteed line item.

To enable these and other use cases, you can opt to **use campaign-level
settings** when creating a guaranteed line item. This will allow you to
configure multiple campaigns beneath that line item. Campaigns can be
created and edited as follows:

- Use the **Campaign Shells** section as a
  lightweight way to set up campaigns directly from the line item
  creation screen.
- After saving a guaranteed line item with campaign-level settings
  enabled, navigate directly to the underlying campaigns to edit their
  settings and/or create additional campaigns.

This page describes several use cases for campaigns, how to create and
edit campaigns, and how a campaign inherits targeting from its parent
line item.

> [!IMPORTANT]
> This feature is currently not available to all clients.

For instructions on adding campaign shells during guaranteed line item
setup, see [Create a Guaranteed Delivery Line Item](create-a-guaranteed-delivery-line-item.md).

## Use cases of campaign shells

- [Deliver during multiple date ranges within a flight](#deliver-during-multiple-date-ranges-within-a-flight)
- [Execute multiple targeting strategies](#execute-multiple-targeting-strategies)

### Deliver during multiple date ranges within a flight

Advertisers sometimes need a line item to deliver only during certain
date ranges within the overall flight.

For example, an advertiser may require that the media buy is active
during two separate periods of time within the line item's total flight,
with a gap of a few days in between. A line item with a 20-day overall
flight could be scheduled to serve during two discrete date ranges
within the flight:

- *Date range 1* is ten days long, running from days 1-10 of the flight.
- *Date range 2* is five days long, running from days 15-20 of the
  flight.

Despite the five day break in the middle of the flight, the line item
should still deliver evenly on eligible days, such that:

- Two-thirds (2/3) of total delivery occurs during the 10 days of *Date
  range 1*
- One-third (1/3) of total delivery occurs during the 5 days of *Date
  range 2*

## Execute multiple targeting strategies

Advertisers may wish to execute multiple targeting strategies with a
single guaranteed line item.

For example, an advertiser buying media for a regional group of auto
dealerships can target users with different creatives depending on which
dealership location is closest to the user.

As another example, an agency might provide multiple sets of creatives,
each targeted to a different user segment: one set of creatives
targeting male users, one targeting female users.

### Setting up campaign shells

Campaign shells are only available during guaranteed line item setup.
For instructions, see [Create a Guaranteed Delivery Line Item](create-a-guaranteed-delivery-line-item.md).

### Creating or editing campaigns directly

After a guaranteed line item that uses campaign-level settings has been
created, settings on its child campaigns can still be edited; campaigns
can also be added at any time. There are two ways to navigate to
campaigns from the [Line Items](explore-line-items.md) screen:

**Method 1**: You can click the numbered button in the
**Campaigns** column of the grid, which
will take you to a list of the campaigns under your guaranteed line
item.

**Method 2**: You can also navigate to the [Line Item Details](view-line-item-details.md) screen and create or edit campaigns from there.

### How a campaign inherits targeting from its parent line item

By default, your guaranteed line item will target all direct inventory.
As you add targeting settings, less and less inventory will be targeted.
One way to think of the inventory volume available to a line item is as
a pipe that funnels into narrower and narrower pipes as you continue to
add targeting criteria.

Campaigns that you create using the Campaign Shells feature can only
further limit the targeting applied by their parent line item. Using the
pipe analogy, they can only act as "narrower pipes" that receive
inventory that has been "funneled" to them through the line item's
targeting. As each campaign adds its own targeting (e.g., date ranges),
it further narrows its scope to a different subset of the line item's
overall inventory.

## Related topics

- [Create a Guaranteed Delivery Line Item](create-a-guaranteed-delivery-line-item.md)
- [Guaranteed Delivery](guaranteed-delivery.md)
- [Guaranteed Outcomes Auction Mechanics](guaranteed-outcomes-auction-mechanics.md)
- [Guaranteed Delivery Pacing](guaranteed-delivery-pacing.md)