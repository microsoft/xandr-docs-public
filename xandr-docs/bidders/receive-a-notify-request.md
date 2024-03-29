---
title: Receive a Notify Request
description: In this article, learn what it means to receive a Notify Request during the auction process, along with a sample notify request.
ms.date: 10/28/2023
---

# Receive a notify request

> [!IMPORTANT]
> The information on this page applies to a legacy implementation. It cannot be used for OpenRTB.

The impression bus responds to a Bid Response with a Notify Request (see [Notify Request](notify-request.md) for more details). The notify request communicates the auction results, bid response time, and any errors generated by that particular bidder's bid response(s). This may include whether or not the bidder won the auction(s).

> [!TIP]
> Notify requests are not sent for debug auctions. To receive notify requests use the following auction URL instead:
>
> `https://ib.client-testing.net/mob?st=mobile_app&id=Tiny_Tag_ID&size=(WIDTHxHEIGHT)`

A notify request may signal that the bidder won or lost, or that the results are pending the publisher's decision. This third category is used for impressions that have a second auction after the impression bus. For example, certain aggregators take the winning bid from Xandr (subject to [Price Reduction Mechanics](price-reduction-mechanics.md)) and apply their own decisioning logic.

> [!TIP]
> By using the [Bidder Service](bidder-service.md), a bidder may adjust the notify requests sent by the impression bus.

A sample notify request is below. Based on the bidder's notify parameters and whether the bidder has bid on a particular auction, the notify request may look different.

```
{  
   "notify_request":{
      "timestamp":"2016-12-09 00:11:44",
      "response_time_ms":4,
      "tags":[
         {
            "id":474074,
            "auction_id_64":7606327141949238687,
            "payment_rule_id":65930,
            "price_paid":0.90000,
            "member_id":670,
            "notify_type":"won"
         }
      ],
      "responses":[
         {
            "result":"ok",
            "price_bid":1.00000
         }
      ]
   }
}
```

## Related topics

- [Auction Overview](auction-overview.md)
- [Notify Request](notify-request.md)
- [Bid Response](bid-response.md)
- [Ready Request](ready-request.md)
- [Notify Request - FAQ](notify-request---faq.md)
