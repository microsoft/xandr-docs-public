---
title: Clear Request
description: In this article, learn what the clearRequest function is and the parameters that can be added to this function.
ms.custom: seller-tag
ms.date: 10/28/2023
---

# Clear Request

This function resets the state of the `apntag` back to its uninitialized state. The function clears out the relevant objects in the AST tag, enabling the user to call `defineTag` for new placements with an unconfigured AST tag. This can be useful in single page applications to reset all the previously defined ad slots, page targeting, etc. Only use this function if you need to hard reset all the states in the `apntag` .

> [!NOTE]
> Unlike the refresh function, `clearRequest` does not remove any DOM elements, including `iFrames`. It is the responsibility of the user to manage their DOM elements.

``` pre
clearRequest(targetId)
```

The parameters listed below can be sent as arguments in the function.

| Parameter | Type | Description |
|---|---|---|
| `targetId`| string or array of strings | The unique identifier of a specific ad slot. One or more identifiers can be specified in an array. The tags identified must be defined first using `apntag.defineTag`. Omit the parameter to clear all tags. It is an optional parameter. |

## Example

To completely reset all tags that are currently defined:

``` pre
apntag.clearRequest(); 
```

To reset a single tag using its `targetId` value:

``` pre
apntag.clearRequest('adslot1');
```

To reset multiple tags using their `targetId` values:

``` pre
apntag.clearRequest(['adslot1', 'adslot2']);
```
