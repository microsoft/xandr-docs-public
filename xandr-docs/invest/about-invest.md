---
title: About Microsoft Invest
description: Learn about Microsoft Invest as a strategic buying platform for advertisers, its benefits, and how it works as a real-time bidding system and ad server. 
ms.date: 10/28/2023
---

# About Microsoft Invest

Microsoft Invest is a strategic buying platform built for the needs of today’s advertisers looking to invest in upper-funnel buying and drive business results. Microsoft Invest brings power, high performance, and an end-to-end approach to advertising technology, with a commitment to buyer success.

## Benefits

Microsoft Invest lets you set up managed media buys and auction-based buys using a unique interface where you can easily monitor your insertion order and line item delivery and performance. Microsoft Invest is an end-to-end, integrated platform across the buy and sell side, which provides a number of benefits to users, including:

- Seamless integration with major ad networks, exchanges, and aggregators.
- Streamlined, direct access to premium, omnichannel supply.
- Reduced discrepancies and optimal match rates on our platform supply.
- Built-in fraud protections and inventory quality protections.

## Technical details

The Microsoft Advertising platform is a real-time bidding system and ad server. The main processing system is called the "impression bus". The impression bus receives ad requests, applies data to the request, receives bids, makes decisions, serves creatives, logs auctions, etc.

Ad calls come in via our inventory supply partners: exchanges, SSPs, ad networks, and a few valued publishers. Some of the ad calls are client-side, meaning there is a Microsoft Advertising tag on the page, and we get the call directly. Others are server-side, meaning our partners initially field the call and then contact us asking for a bid.

Once we get the call, we overlay segment data from our server-side cookie store. Data is added to the cookie store either through Microsoft Advertising segment pixels or by clients sending us a file of data. We also contact third-party data providers and overlay any available data.

We contact all of the bidders on our platform. The ad call includes whatever user data belongs to each bidder, and information about the inventory. Bidders have a certain number of milliseconds in which to respond with a bid and the creative they want to serve.

Microsoft Invest serves as our proprietary bidder, which has a suite of features including targeting, bidding algorithms, multi-currency support, and all the other features of a premium ad server. It can be accessed by either a UI or API.

The impression bus decides which bid wins based on the amount of the bid, and any preferences the publisher has about what they want served on their page. If the call was client-side, Microsoft Advertising serves the ad. If it was server-side, Microsoft Advertising passes the bid and the location of the creative to the partner who will ultimately serve the ad.

## Get started

[Get in touch](https://www.xandr.com/contact-us/) with a Microsoft Advertising representative today so you can get started!

Already have an account? [Log in to Microsoft Invest](https://invest.xandr.com/login)
