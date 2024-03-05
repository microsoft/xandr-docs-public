---
title: Mediated Network Service
description: Use the Mediated Network service to create and maintain mediated networks.
ms.date: 10/28/2023
ms.custom: digital-platform-api
---

# Mediated Network service

> [!NOTE]
> Only available to Microsoft Monetize Ad Server customers.

This service is used to create and maintain mediated networks. Use this service to define your integration with an external network.

## REST API

| HTTP Method | Endpoint | Description |
|:---|:---|:---|
| `POST` | `https://api.appnexus.com/mediated-network` <br>(+ JSON payload) | Add a new mediated network |
| `PUT` | `https://api.appnexus.com/mediated-network?id=ID` <br>(+ JSON payload) | Modify a mediated network |
| `GET` | `https://api.appnexus.com/mediated-network` | View all mediated networks |
| `GET` | `https://api.appnexus.com/mediated-network?id=ID` | View a specific mediated network |
| `DELETE` | `https://api.appnexus.com/mediated-network?id=ID` | Delete a mediated network |
| `GET` | `https://api.appnexus.com/mediated-network/meta` | Find out which fields you can filter and sort by |

## JSON fields

| Field | Type | Description |
|:---|:---|:---|
| `id` | int | The system-generated unique ID for this network.<br><br>**Required On**: `PUT` |
| `name` | string | The name of the network, as supplied by the user.<br><br>**Required On**: `POST` |
| `credentials` | string | **Read-only**. A system-generated unique value that securely identifies the network. Credentials are encrypted after a `POST` or `PUT` and cannot be decrypted. |
| `advertiser_id` | int | **Read-only**. The unique, system-generated ID of the advertiser associated with this mediated network. |
| `member_id` | int | **Read-only**. Every advertiser object in our system is associated with a parent [member](./member-service.md). The unique, system-generated ID of the member to which the advertiser described by `advertiser_id` belongs. (And by extension, this mediated network as well.) |
| `active` | boolean | Active mediation networks target and purchase media in auctions.<br><br>**Default**: `false` |
| `is_data_integration_active` | boolean | Whether reporting data is currently being pulled from this network's systems into ours.<br><br>**Default**: `false` |
| `creative_custom_request_partner_id` | int | The *Creative Custom Request Partner* this mediated network is associated with.<br><br>**Required On**: `POST` |
| `default_bid_currency` | string | The currency to be used for bids from this network.<br><br>**Default**: `USD` |
| `processed_on` | date | **Read-only**. The date and time at which this mediated network's associated line item was updated with metrics (revenue, imps, clicks) pulled from the external network's reporting system. |
| `last_modified` | date | **Read-only**. The date and time at which the mediated network object was last modified. |
| `network_type` | string | The type of mediated network this is. Allowed values:<br>- `mobile`: This network is focused on purchasing mobile (in-app?) inventory.<br> - `banner`: This network is focused on purchasing web inventory.<br><br>**Default**: `mobile` |

## Examples

### Add a mediated network

```
$ cat add-network
{
    "mediated-network": {
        "name": "JMS Test 2",
        "creative_custom_request_partner_id": 1
    }
} 

$ curl -b cookies -c cookies -X POST -d @add-network.json 'https://api.appnexus.com/mediated-network

{
    "response":{
        "status":"OK",
        "count":1,
        "id":371,
        "start_element":0,
        "num_elements":100,
        "mediated-network":{
            "id":371,
            "name":"JMS Test 2",
            "credentials":null,
            "advertiser_id":110692,
            "member_id":4209,
            "active":true,
            "is_data_integration_active":false,
            "creative_custom_request_partner_id":1,
            "default_bid_currency": "USD",
            "processed_on":"1970-01-01 00:00:01",
            "last_modified":"2014-04-28 14:59:11",
            "bid_count":0,
            "network_type":"mobile"
        }
    }
}
```

### Update a mediated network

```
$ cat add-network

{
    "mediated-network": {
        "id": 368,
      "active": false   
    }
}

$ curl -b cookies -c cookies -X PUT -d @update-network.json 'https://sand.api.appnexus.com/mediated-network?member_id=4209' | json-pp

{
    "response":{
        "status":"OK",
        "count":1,
        "id":368,
        "start_element":0,
        "num_elements":100,
        "mediated-network":{
            "id":368,
            "name":"Integration Test TEST1398457680380",
            "credentials":"OlkWxzZaQjVpgMRd\/\/o6cbUgjuNYkrP\/toKzFRdR9gnpQ2upKNhDu5mQrr871RCjBbjsNlyO6hN2fVNg4VV
             LiMix2mrky38F\/M30uEIVo0zQzmVJ8K4Uz0UyLVagVwdsgNPx9sAN0LZD+ZskyXQx6R4dZCjQD9mKHLT+nJ2Usfs=",
            "advertiser_id":110648,
            "member_id":4209,
            "active":false,
            "is_data_integration_active":false,
            "creative_custom_request_partner_id":1,
            "default_bid_currency": "USD",
            "processed_on":"1970-01-01 00:00:01",
            "last_modified":"2014-04-28 14:56:48",
            "bid_count":0,
            "network_type":"mobile"
        }
    }
}
```

### View all mediated networks

```
$ curl -b cookies -c cookies 'https://api.appnexus.com/mediated-network

{
    "response":{
        "status":"OK",
        "count":20,
        "start_element":0,
        "num_elements":100,
        "mediated-networks":[
            {
                "id":89,
                "name":"Doubleclick for Publishers",
                "credentials":null,
                "advertiser_id":110021,
                "member_id":4209,
                "active":false,
                "is_data_integration_active":false,
                "creative_custom_request_partner_id":28,
                "default_bid_currency": "USD",
                "processed_on":"1970-01-01 00:00:01",
                "last_modified":"2014-04-18 23:37:01",
                "bid_count":0,
                "network_type":"mobile"
            },
            {
                "id":90,
                "name":"Tim's Custom Network",
                "credentials":null,
                "advertiser_id":110022,
                "member_id":4209,
                "active":false,
                "is_data_integration_active":false,
                "creative_custom_request_partner_id":22,
                "default_bid_currency": "EUR",
                "processed_on":"1970-01-01 00:00:01",
                "last_modified":"2014-04-18 23:37:01",
                "bid_count":0,
                "network_type":"mobile"
            },
            {
                "id":210,
                "name":"Amazon",
                "credentials":null,
                "advertiser_id":110203,
                "member_id":4209,
                "active":false,
                "is_data_integration_active":false,
                "creative_custom_request_partner_id":25,
                "default_bid_currency": "EUR",
                "processed_on":"1970-01-01 00:00:01",
                "last_modified":"2014-04-18 23:32:36",
                "bid_count":1,
                "network_type":"mobile"
            }
      ]
  }
}
```

### View a specific mediated network

```
$ curl -b cookies -c cookies 'https://api.appnexus.com/mediated-network?id=368' | json-pp

{
    "response":{
        "status":"OK",
        "count":1,
        "start_element":0,
        "num_elements":100,
        "mediated-network":{
            "id":368,
            "name":"Integration Test TEST1398457680380",
            "credentials":"OlkWxzZaQjVpgMRd\/\/o6cbUgjuNYkrP\/toKzFRdR9gnpQ2upKNhDu5mQrr871RCjBbjsNlyO6hN2fVNg4VVL
             iMix2mrky38F\/M30uEIVo0zQzmVJ8K4Uz0UyLVagVwdsgNPx9sAN0LZD+ZskyXQx6R4dZCjQD9mKHLT+nJ2Usfs=",
            "advertiser_id":110648,
            "member_id":4209,
            "active":true,
            "is_data_integration_active":false,
            "creative_custom_request_partner_id":1,
            "default_bid_currency": "USD",
            "processed_on":"1970-01-01 00:00:01",
            "last_modified":"2014-04-25 20:28:07",
            "bid_count":0,
            "network_type":"mobile"
        }
    }
}
```

### Delete a mediated network

```
$ curl -b cookies -c cookies -X DELETE 'https://api.appnexus.com/mediated-network?id=371

{
    "response":{
        "status":"OK",
        "count":1,
        "start_element":null,
        "num_elements":null
    }
}
```

## Related topics

- [API Semantics](./api-semantics.md)
- [API Best Practices](./api-best-practices.md)
- [Mediated Bid Service](./mediated-bid-service.md)
