---
title: Microsoft Invest - Set Split Priority
description: Learn how to set split priority. If an impression applies to multiple programmable splits, the impression is assigned to the split with the lowest priority number.
ms.date: 10/28/2023
---

# Microsoft Invest - Set split priority

If an impression applies to multiple programmable splits, the impression is assigned to the split with the lowest priority number.

For example, if Split A (priority 1) is targeting "domain=cnn.com", Split B (priority 2) is targeting "city=Boston", and an impression is available from a user in Boston visiting cnn.com, then the impression will be assigned to Split A because it has a higher priority (lower priority number) than Split B.

1. Go to the **Split Details** grid.
1. Set a priority number for each of your line item's splits. The same priority number can't be set for multiple splits.
