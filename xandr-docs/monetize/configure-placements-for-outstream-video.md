---
title: Configure Placements for Outstream Video
description: Configure outstream video placements by adjusting settings for your inventory setup, without using colons, slashes, or semi-colons.
ms.date: 10/28/2023
---

# Configure placements for outstream video

In order to set up your outstream inventory, you must configure a placement with the following settings:

- **Media Types**: Click **Other** and select the **Video** media type which will automatically include the **Standard VAST** media subtype.
- **Size**: Should be set to 1x1 (the video player size is declared on the **Video Settings** tab).

If you have [outstream video player options](outstream-video-player-options.md), you may fine-tune your outstream video player options to enable waterfall processing and further increase your ability to find viable ads within your specified timeout period.

A new **Video Settings** tab appears when the **Video** media type is selected. On the **Video Settings** tab, you must configure the following:

- **Position** (also known as context): Select **outstream**.
- **Duration**: Enter maximum duration of returned content you will accept (in seconds).
- **Skippable**: Whether the player shows a button to skip the ad. Clicking the button closes the outstream ad unit.
- **Playback Method**: How the video is initiated and audio options.
- **Player Width**: The default width of the player that will be rendered on the page.
- **Media Types**: Click **Other** and select the **Video** media type which will automatically include the **Standard VAST** media subtype.
- **Size**: Should be set to 1x1 (the video player size is declared on the **Video Settings** tab).
- **Vast Version**: Select the video player's VAST version from the **Player Vast Version** menu. The default value is VAST 2.0. You should use the most recent VAST version that your player can handle because players are backwards compatible. Therefore, creatives with lower VAST versions can still serve on these placements. For example, a VAST 2.0 creative can serve on a VAST 4.0 player, but a VAST 4.0 creative can't serve on a VAST 2.0 player. The following VAST versions are supported:
  - VAST 2.0
  - VAST 3.0
  - VAST 4.0
  - VAST 4.1
  - VAST 4.2
