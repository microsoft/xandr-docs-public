---
title: Microsoft Monetize - Use User Test Groups with a Split
description: Learn steps to perform A/B testing with user test groups. 
ms.date: 10/28/2023
---


# Microsoft Monetize - Use user test groups with a split

You can perform A/B testing with user test groups, which target distinct
groups of users per split.

1. Select the **Use User Test Groups** checkbox.<br>In the **User Test Group** column
    that appears, line item traffic is evenly distributed to the
    existing splits (excluding the Line Item Default split).
1. To modify a percentage, enter a new value in the **Percent** field.
    <br>Alternatively, you can modify the percentage from the
    **Edit
    Split** \> **Setup** tab
    by entering a new value in the **% for this split** field.

    > [!NOTE]
    > When the Line Item Default split is set to active or has a budget allocation greater than 0%, the line item default will always include the remaining pool of users not targeted by the other splits. Also, the Line Item Default split will always include cookieless users. If you don't want to serve cookieless users:
    >
    > - **If you're using spend allocation**: Set the Line Item Default allocation to **0%**.
    > - **If you're not using spend allocation:** Set the Line Item Default split to **inactive**.