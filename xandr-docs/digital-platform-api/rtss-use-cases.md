---
title: RTSS Use Cases
description: In this article, explore the supported use cases for the Real-Time Signals Service (RTSS).
ms.date: 10/28/2023
ms.custom: digital-platform-api
---

# RTSS use cases

> [!WARNING]
> **Beta Notice**
>
> - The Real-Time Signals Service is in closed beta status, and is subject to change in the future.
> - As we transition to open beta, **we will be adding a monthly charge for new and existing clients that use RTSS**. For more information, speak to your account manager.

The RTSS beta is still under development, and may have additional features deployed in response to changing use cases. This page lists the current supported use cases.

- [OLC Geolocation](#olc-geolocation)
- [Country Targeting](#country-targeting)
- [IP Address and Range Targeting](#ip-address-and-range-targeting)
- [URL Targeting](#url-targeting)
- [Events](#events)

## OLC geolocation

RTSS uses the [Open Location Code (OLC)](https://openlocationcode.com/) open standard for geo-targeting. OLC supports encoding of latitude and longitude coordinates. OLC also allows for targeting the locality around a specific point, removing the need to specify both a point and a radius. Full 10-character OLC codes allow more granular targeting, while shorter codes increase the targeted area around the point. Although RTSS supports 10-character OLC codes, we recommend only using up to 8 characters due to limited granularity of information received on bid impressions. Using 10 characters could severely limit your reach, or prevent your campaign from buying at all.

To use Lat/Long targeting effectively with OLC, this information needs to be reported by the device. If only the IP Address is provided, Xandr will map it to a DMA or Postal Code. Currently, approximately 30% of impressions received by RTSS contain Lat/Long coordinates.

RTSS will use Lat/Long for location whenever it is provided at the time of impression, and will fall back to IP address otherwise. Lat/Long is usually only provided via in-app impressions, when the user has explicitly granted permission to the application to identify location of the device.

In most cases involving a desktop or mobile browser, the IP address is used to approximate location of the impression. IP Address precision is usually sufficient to identify to a zip code for desktop, but in some cases it can accurately identify a building, for example when an office has an explicit IP range. For mobile carrier connections, the IP Address will effectively give you the location of the cell tower that the device is connected to.

## Country targeting

Geo Administrative targeting via Country-Regions is also supported.

## IP address and range targeting

RTSS supports targeting IP addresses or ranges, including targeting businesses or internet providers via known blocks of IP addresses.

## URL targeting

RTSS URL Targeting currently supports:

- Exact URL matching
- URL component matching up to 3 paths deep

Wildcard domain matching is supported within components.

## Events

Events are segments which could become active instantly across all data centers, and expire within a specified period. Events are not associated with any targeting.
