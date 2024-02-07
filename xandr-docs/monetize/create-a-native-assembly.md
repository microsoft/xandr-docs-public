---
title: Create a Native Assembly
description: In this article, find information on how to create or modify a native assembly.
ms.date: 10/28/2023
---

# Create a native assembly

You can easily modify native assemblies that contain pre-configured native creative asset specifications or create your own from scratch.

1. Select a pre-configured native assembly or create your own by doing one of the following:
    - Click the **Select** button from one of the corresponding pre-configured assemblies.

      > [!NOTE]
      > We offer a variety of pre-configured native assembly types such as carousel and video. You can filter by creative asset specification to find a specific pre-configured native assembly.

    - Click the **Select** button from the **Create From Scratch** tile.

    The **Native Assembly** > **Setup** screen displays.

1. Enter a new name for the native assembly.

1. Associate placements with the native assembly by doing the following:
    1. If you would like to search for and associate placements under a specific publisher, select the **Filter placements by publisher** checkbox.

        If you would like to search for and associate placements across multiple publishers, leave the **Filter placements by publisher** checkbox deselected and proceed to substep **d**.

    1. Enter a publisher in the **Select a publisher to filter placement options** search field.

    1. Select the corresponding publisher from the search results that display.

        Only placements that are available for these specific publishers will display when searching and associating placements. You must associate the native assembly to a placement in order for it to go live. For more information, see [Create a Placement](create-a-placement.md).

    1. Enter a placement name or ID in the **Choose placements** search field.

        Search results will automatically display.

    1. Select any of the checkboxes for the corresponding placements that display.

        The selected placements will display under the **Choose placements** search field.

    1. Enter a **Main Image Floor Price** for each placement if applicable.

    1. Enter a **Video Floor Price** for each placement if applicable.

        For more information about floor prices, see [Floor Prices](floor-prices.md) and [Deal Auction Mechanics](deal-auction-mechanics.md).

1. Click the **Additional Specifications** menu in the **Creative Asset Specifications** section to add and configure creative asset specifications for the native assembly.

    > [!TIP]
    > For the best Microsoft Advertising marketplace performance, third-party ad server publishers should refrain from adding video assets and any custom native assets to their native assemblies.

    All pre-configured native assemblies contain preset creative asset specifications. Although these are recommended configurations, they can be modified. For example, if you want to only serve creatives that contain a particular asset specification, set it to **Required**, which may limit your demand. Otherwise, set the creative asset specification to **Optional**. You can also remove any
    creative asset specification at any time by clicking the **X**.

    > [!NOTE]
    > If you remove a creative asset specification, the HTML code on the **Renderer** tab won't automatically reflect this change, so you'll have to manually remove the corresponding HTML from the **HTML** text box.

1. Click the **Renderer** tab to add or update the HTML, CSS, and Javascript in the designated text boxes.

    To ensure that you're following our native assembly renderer best practices, see [Native Assembly Renderer Best Practices](native-assembly-renderer-best-practices.md).

1. Use the **Preview** window on the right to ensure that no additional changes are needed.

1. Use the **Preview Settings** to:
    - resize the **Preview** window.

      > [!NOTE]
      > Changing the **Preview** window size doesn't affect the renderer code.

    - specify which asset specifications should appear in the **Preview** window by clicking one of the following buttons if you've selected the video and image asset specifications from the **Creative Asset Specifications** section:
      - **Video and Text**: Only the sample video and text, such as the title, will display in the Preview window when this button is selected.
      - **Main Image and Text**: Only the sample main image and text, such as the title, will display in the Preview window when this button is selected.
      - **Text Only**: Only sample text, such as the title, will display in the Preview window when this button is selected.
      - **All**: All sample assets (video, main image, and any text) will display in the Preview window when this button is selected.

    - specify whether the **AdChoices** icon should appear in the **Preview** window by clicking one of the following buttons from the **Privacy URL Specifications** subsection:
      - **With Privacy URL**: The AdChoices icon will be appended to the creative in the Preview window when this button is selected.
      - **Without Privacy URL**: The AdChoices icon won't be appended to the creative in the Preview window when this button is selected.

    > [!NOTE]
    > Since various combinations of native assets can serve on the same placement when using a flexible renderer, it's important to preview your asset specifications to see how the renderer will handle your placements and native assets.

1. Do one of the following:
    1. Save all changes by clicking the **Save** button.
    1. Save all changes and duplicate the native assembly by clicking the arrow next to the **Save** button and clicking **Save and duplicate**.

    The native assembly is now available from the **Native Assembly Gallery** screen. If you've duplicated the native assembly, the current screen refreshes so that you can make the necessary updates. Use steps 2 - 7 outlined above to make the necessary updates.

## Related topics

- [Configuring a Native Assembly](configuring-a-native-assembly.md)
- [Native Creative Asset Specifications](native-creative-asset-specifications.md)
- [Enable Native Assembly for the Server Side](enable-native-assembly-for-the-server-side.md)
