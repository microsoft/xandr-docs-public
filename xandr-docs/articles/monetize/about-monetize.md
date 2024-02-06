---
title: About Microsoft Monetize
description: In this article, find information on Microsoft Monetize and its features along with technical details.
ms.date: 10/28/2023
---

# About Microsoft Monetize

Microsoft Monetize is a web-based application for your programmatic advertising. Whether you’re buying or selling ad space, or both, Monetize provides all the tools that you need to manage your accounts.

## Buyers

Monetize can manage both traditional media buys and real-time bidding through a single, unified interface. Instead of operating an ad server and a buying platform, Monetize can perform both functions, eliminating double-trafficking, discrepancies, and another set of fees.

Monetize offers:

- Seamless integration with major ad networks, exchanges, aggregators, and SSPs.
- Site list with volume and price estimates.
- Direct and managed media buys and auction-based buys through one simple interface.
- Built-in fraud protections and inventory quality protections.
- No need for contracts with each publisher or exchange.

A number of other key features help Microsoft Monetize optimize your ad buying revenue and increase buying efficiency.

## Sellers

Monetize has a number of features that allow you to maintain business and technical relationships with your managed publishers. With Monetize, you can:

- Set up publishers and traffic campaigns on managed inventory.
- Resell inventory on the Microsoft Advertising platform for better monetization.
- Apply optimization strategies to your direct campaigns since optimizing direct campaigns is as important as optimizing on third-party inventory.
- Manage individual publishers' ad quality requirements, ensuring that you meet expectations about the quality and content of ads served on their sites.

## Ad server

As an ad server user, you have access to your end-to-end setup of advertiser and publisher information. You can set up publishers and available inventory, as well as advertisers and their selling specifications. With an ad server, you can set up and manage your buy-side systems and your sell-side systems, as well as manage forecasting, priorities, and many other types of functionality between the two.

## Technical details

The Microsoft Advertising platform is a real-time bidding system and ad server. The main processing system here is called the "impression bus". The impression bus receives ad requests, applies data to the request, receives bids, makes decisions, serves creatives, logs auctions, etc.

Ad calls come in via our inventory supply partners: exchanges, SSPs, ad networks, and a few valued publishers. Some of the ad calls are client-side, meaning there is a Microsoft Advertising tag on the page, and we get the call directly. Others are server-side, meaning our partners initially field the call and then contact us asking for a bid.

Once we get the call, we overlay segment data from our server-side cookie store. Data is added to the cookie store either through segment pixels or by clients sending us a file of data. We also contact third-party data providers and overlay any available data.

We contact all of the bidders on our platform. The ad call includes whatever user data belongs to each bidder, and information about the inventory. Bidders have a certain number of milliseconds in which to respond with a bid and the creative they want to serve.

Monetize serves as our proprietary bidder, which has a suite of features including campaigns and targeting, bidding algorithms, multi-currency support, and all the other features of a premium ad server. It can be accessed by either a UI or an API.

The impression bus decides which bid wins based on the amount of the bid and any preferences the publisher has about what they want served on their page. If the call was client-side, Microsoft Advertising serves the ad. If it was server-side, Microsoft Advertising passes the bid and the location of the creative to the partner who will ultimately serve the ad.

## Get started

[Get in touch](https://about.ads.microsoft.com/en-us/solutions/xandr/contact-xandr) with a Microsoft Advertising representative today so you can get started! Already have an account? Log in to [Monetize](https://monetize.xandr.com/login).
