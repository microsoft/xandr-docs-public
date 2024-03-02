---
title: Forecast-Shaped Pacing 
description: Explore Forecast-Shaped Pacing which governs daily pacing schedules for all impression-based guaranteed line items on the platform.
ms.date: 10/28/2023
---

# Forecast-shaped pacing

Microsoft Advertising applies pacing throughout the lifetime of a line item to ensure that each line item meets its delivery goal in full and at a steady rate. Forecast-Shaped Pacing (FSP) – which governs daily pacing schedules for all impression-based guaranteed line items on the platform – takes standard pacing methods a step further by ensuring
line items deliver at a rate that reflects the forecasted inventory available for the line item.

FSP provides a great amount of precision in delivery and allows publishers to realize increased revenue from RTB through [Open Dynamic Allocation and Flexible Priorities](open-dynamic-allocation-and-flexible-priorities.md).

## How it works

Availability of inventory typically changes throughout the day. One challenge of a naïve pacing system that tries to pace a line item evenly across the hours of a day is that it becomes difficult to fulfill hourly delivery goals during the less-trafficked, lower inventory times of day. This lack of inventory could prevent the line item from meeting its pacing goals during those low-inventory times and therefore make it seem as if it's underdelivering. To account for this, pacing speeds up. As more inventory becomes available later in the day, this increased pace will start to overspend. Pacing again will adjust. Oftentimes this continuing need to adjust leads to spend completion before the day is over.

Forecast-Shaped Pacing (FSP) solves this problem by setting hourly delivery goals for a guaranteed delivery line item according to an inventory forecast specific to that line item. For example, there may be less inventory available to that line item in the early morning hours (say, 2:00 AM) than in the afternoon. FSP can predict this variance and
will therefore set a much lower delivery goal for the line item at 2 AM than at 2 PM. In the afternoon, FSP sets delivery targets to be higher because more supply is expected to be available than in the early morning. And if – as is often the case – inventory starts to drop again during the end of the day, the FSP-governed line item will have less
delivery scheduled accordingly.

To summarize: FSP takes into account the variability of inventory throughout the day, setting hourly delivery goals that map to high-fidelity, line-item specific forecasts powered by the [Yield Forecasting Engine](../yield-analytics-ui/yield-analytics-overview.md).

> [!NOTE]
> Microsoft Advertising uses FSP for all impression-based Guaranteed Delivery line items. It does not apply to line items with an **Exclusive** delivery type.

## What FSP means to publishers

FSP has proven overall to positively impact both revenue from RTB as well as delivery accuracy.

### Increased yield from RTB

FSP increases a publisher's yield through Open Dynamic Allocation. By pacing according to a forecasted supply curve, guarantees don't have to "try as hard" to deliver impressions when inventory is scarce (such as late night or early morning). In other words, the predicted CPM (pCPM) of the guaranteed line item can be significantly lower during these hours when there is less supply. This allows the publisher to take advantage of high CPMs from RTB throughout all hours of the day.

> [!IMPORTANT]
> **FSP Analysis**
>
> An early analysis of production data showed that this relaxed pressure during low-supply hours resulted in guaranteed line items using FSP were able to bid a 25-35% lower pCPM on average than without FSP. A lower pCPM means the opportunity cost of serving guaranteed is lower and publishers can capture more of their most valuable RTB demand, which, in this analysis, translated to 15-20% more RTB revenue on average.

### Delivery throughout the day

FSP not only optimizes how often guaranteed lines items deliver in full, but also how frequently they deliver through the last hour of the day. Analysis has shown that with FSP, 90 – 95% of line items deliver through the last hour of the day, a 15-20% improvement over pre-FSP pacing mechanics. This improvement is the result of fewer adjustments having to be made throughout the day to meet delivery goals than were historically required.

## Restrictions

At this time, FSP is not used during the final day in the lifetime of the line item. More aggressive pacing is in place for the last day to ensure full delivery. FSP logic that accounts for last day delivery is currently in development. See [Daily Pacing](daily-pacing.md) for more ##information on last day pacing.

### Related topics

- [Guaranteed Delivery](guaranteed-delivery.md)
- [Create a Guaranteed Delivery Line Item](create-a-guaranteed-delivery-line-item.md)
- [Daily Pacing](daily-pacing.md)
