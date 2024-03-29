---
title: Buyer Transparency Feed
description: In this article, find information about the Buyer transparency feed and details about the columns associated with this data feed.
ms.custom: log-level-data
ms.date: 10/28/2023
---

# Buyer transparency feed

The Buyer Transparency Feed provides advertisers with the most granular insights about transactions that occurred on supply. Those insights include the bid that was submitted, the inventory that was sold, the auction that was run, as well as the tech fees and revenues that ended up with the exchange and the seller. The feed provides 28 datapoints for each impression that was served.

Currently, more than 60% of our direct seller transactions globally—and 85% in the US—are fee transparent.

For most auctions, there will be 1 row with all columns populated (fee columns will not be populated if the seller is not transparent). For Guaranteed Outcomes auctions, where the buyer is buying on an event basis (e.g., such as views or video completion), there can be 1 or 2 rows for the same auction. This will be determined by the following:

- For Guaranteed Outcomes auctions, where the buyer wins the auction and their creative is rendered, there will be 1 row that contains columns 1-10 (all columns).
- If the buyer’s required outcome (e.g., a view or complete) occurs, there will be another row that will include columns 1-7 and 10.

The Xandr internal name for this feed is `brand_transparency_feed`.

## Sequence

The columns below are listed in the same order in which they appear in the log-level feed file (top to bottom here, left to right in the file).

## Integer key

- tinyint = 1 byte (8 bit)
- smallint = 2 byte (16 bit)
- int = 4 byte (32 bit)
- bigint = 8 byte (64 bit)

## Columns

| Column Index | Column Name | Type | Description |
|---|---|---|---|
| 1 | date_time | UNIX Epoch time | The date and time of the transaction (e.g., `1526057561` which would need to be translated to *Friday, May 11, 2018 4:52:41 PM (UTC)*) . |
| 2 | partition_time_millis | bigint | Auction timestamp in milliseconds. |
| 3 | auction_id_64 | bigint | The auction ID (`bid.request.imp.id`) generated by the Xandr exchange. Value is unique for a given hour (counter is reset each hour). |
| 4 | buyer_member_id | int | The ID of the buyer member within Xandr that bid on this inventory. |
| 5 | buyer_member_name | string | The name of the buyer associated with the buyer member ID. |
| 6 | bidder_id | int | The ID of the DSP that bid on this inventory. |
| 7 | bidder_name | string | The name of the DSP associated with the Bidder ID. |
| 8 | inventory | message | Information about the inventory being purchased. See [Inventory](#inventory) for more details. |
| 9 | bid | message | Information about the bid. See [Bid](#bid) for more details. |
| 10 | result | message | Information about the final costs and revenue results. See [Result](#result) for more details. |
| 11 | external_bidrequest_id | bigint | A unique identifier for the bid request. This ID is often generated by the exchange (or the platform making the request) to distinguish and track individual bid requests. Demand side platforms (DSPs) can use this identifier to associate a response with the corresponding bid request. |
| 12 | external_bidrequest_imp_id | bigint | A unique identifier for the impression within the bid request. Each impression in a bid request has its own ID, allowing advertisers and demand side platforms (DSPs) to reference and submit bids for a specific impression. This field helps identify which impression a bid pertains to. |

### Inventory

| Column Index | Column Name | Type | Description |
|---|---|---|---|
| 1 | site_domain | string | The top-level domain of the website. |
| 2 | exchange | string | The name of the exchange selling the inventory. |
| 3 | seller_member_id | int | The ID of the selling member within the Xandr exchange. |
| 4 | seller_name | string | The name associated with the Seller member ID. |
| 5 | tag_id | int | The ID of the tag that was registered with Xandr. |
| 6 | supply_type | tinyint | The type of supply. Possible values are: <br> - `0` - Web <br> - `1` - Mobile Web <br> - `2` - Mobile App |
| 7 | device_type | tinyint | The type of device on which the impression is served. Possible values are <br> - `0` - Other <br> - `1` - Desktop/laptop <br> - `2` - Mobile phone <br> - `3` - Tablet <br> - `4` - TV <br> - `5` - Game console <br> - `6` - Media player <br> - `7` - Set top box |
| 8 | country | string | The country where the inventory was sold. |
| 9 | auction_type | enum | The auction type (first price or second price). Possible values are: <br> - `1 - FIRST_PRICE` - The auction is a first price auction <br> - `2 - SECOND_PRICE` - The auction is a second price auction |
| 10 | ads_txt_certification | enum | Whether or not this seller is authorized to sell the inventory according to ads.txt. Possible values are: <br> - `1 - domain_data_unavailable` <br> - `2 - seller_unauthorized` <br> - `3 - seller_authorized` |

### Bid

| Column Index | Column Name | Type | Description |
|---|---|---|---|
| 1 | bid_amount | numeric | Gross bid from the buyer (including tech fees). |
| 2 | creative_id | int | Creative ID submitted on the bid response. |
| 3 | deal_id | int | Deal ID submitted on the bid response. |
| 4 | clearing_event_id | int | The commodity being bought; either impressions or one of the Guaranteed Outcomes clearing events. Possible values are: <br> - `1 - IMPRESSIONS` <br> - `2 - VIEWS - STANDARD DISPLAY` <br> - `6 - VIEWS - CUSTOM DISPLAY - 100pv1s` <br> - `8 - VIEWS - STANDARD VIDEO` <br> - `9 - VIEWS - CUSTOM VIDEO - 100pv50pd` <br> - `10 - COMPLETES - STANDARD COMPLETE` |
| 5 | media_type | tinyint | The general display style of the creative, classified by media subtype. To map media subtype IDs to their names and parent media types, use the [Media Subtype Service](../digital-platform-api/media-subtype-service.md). Two common values are: <br> - `1` - BANNER <br> - `64` - VIDEO |
| 6 | external_campaign_id | string | The campaign identifier passed in by external DSPs on their bids. |
| 7 | insertion_order_id | int32 | The ID of the insertion order (in Invest). |
| 8 | bidder_seat_id | int32 | The DSP's identifier for a buyer (including external DSPs). |
| 9 | bidder_seat_name | string | The name of the buyer corresponding to the `bidder_seat_id`. |

### Result

| Column Index | Column Name | Type | Description |
|---|---|---|---|
| 1 | gross_media_ cost | numeric | Cost charged to the buyer inclusive of all tech fees. Total Media Cost plus any tech fees specified in the buyer’s contract applied outside the auction. |
| 2 | total_media_cost | numeric | Final amount that the buyer owes Xandr for the media that was purchased in this auction. |
| 3 | exchange_ revenue | numeric | Amount destined towards the Xandr exchange. Total Media Cost less any tech fees specified in the buyer’s contract applied as a part of the auction. |
| 4 | exchange_cost | numeric | Amount destined towards the seller. Exchange Revenue less any tech fees that the exchange must collect for running this auction. |
| 5 | seller_revenue | numeric | Revenue that the seller will make for selling this media. Exchange Cost less any tech fees specified on the seller’s contract applied as a part of the auction. |
| 6 | net_seller_revenue | numeric | Net revenue paid to the seller. Seller Revenue less any tech fees specified in the seller’s contract applied outside the auction. |
| 7 | sasc_cap_savings | double | Savings from applied SASC cap (e.g., `0.50`). |
