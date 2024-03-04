---
title: Digital Platform API - Country Service
description: In this article, learn about the Digital Platform API's Country service, their JSON fields, and REST API with thorough examples.
ms.date: 10/28/2023
ms.custom: digital-platform-api
---

# Digital Platform API - Country service

The read-only Country Service allows you to see information about the countries registered in the Xandr system. You can use this service to retrieve the ID for targeting in campaigns (see `country_targets` in the [Profile Service](profile-service.md)).

## REST API

| HTTP Method | Endpoint | Description |
|---|---|---|
| `GET` | [https://api.appnexus.com/country](https://api.appnexus.com/country) | View all countries. |
| `GET` | [https://api.appnexus.com/country?id=ID](https://api.appnexus.com/country?id=ID) | View a specific country by ID. |
| `GET` | [https://api.appnexus.com/country?name=NAME](https://api.appnexus.com/country?name=NAME) | View a specific country by NAME. |
| `GET` | [https://api.appnexus.com/country?code=CODE](https://api.appnexus.com/country?code=CODE) | View a specific country by CODE. |
| `GET` | [https://api.appnexus.com/country/meta](https://api.appnexus.com/country/meta) | Find out which fields you can filter and sort by. |

## JSON fields

| Field | Type | Description |
|:---|:---|:---|
| `id` | int | The ID of the country. |
| `name` | string | The name of the country. |
| `code` | string | The ISO code for the country. |
| `active` | Boolean | If true, the country is available for targeting. If false, there is no geolocation data for the country and so delivery is not possible. |

## Examples

### View all countries

```
$ curl -b cookies -c cookies 'https://api.appnexus.com/country'
{
    "response": {
        "status": "OK",
        "count": 250,
        "start_element": null,
        "num_elements": null,
        "countries": [
            {
                "id": 1,
                "name": "Anonymous Proxy",
                "code": "A1",
                "active": true
            },
            {
                "id": 2,
                "name": "Satellite Provider",
                "code": "A2",
                "active": true
            },
            {
                "id": 3,
                "name": "Other Country",
                "code": "O1",
                "active": true
            },
            ...
        ]
    }
}
```

### View a specific country by ID

```
$ curl -b cookies -c cookies 'https://api.appnexus.com/country?id=59'
{
    "response": {
        "status": "OK",
        "count": 1,
        "start_element": null,
        "num_elements": null,
        "country": {
            "id": 59,
            "name": "Germany",
            "code": "DE",
            "active": true
        }
    }
}
```

### View a specific country by code

```
$ curl -b cookies -c cookies 'https://api.appnexus.com/country?code=DE'
{
    "response": {
        "status": "OK",
        "count": 1,
        "start_element": null,
        "num_elements": null,
        "countries": [
            {
                "id": 59,
                "name": "Germany",
                "code": "DE",
                "active": true
            }
        ]
    }
}
```

### View all countries that contain "United" in their names

```
$ curl -b cookies -c cookies 'https://api.appnexus.com/country?like_name=United'
{
    "response": {
        "status": "OK",
        "count": 5,
        "start_element": null,
        "num_elements": null,
        "countries": [
            {
                "id": 5,
                "name": "United Arab Emirates",
                "code": "AE",
                "active": true
            },
            {
                "id": 80,
                "name": "United Kingdom",
                "code": "GB",
                "active": true
            },
            {
                "id": 229,
                "name": "Tanzania, United Republic of",
                "code": "TZ",
                "active": true
            },
            {
                "id": 232,
                "name": "United States Minor Outlying Islands",
                "code": "UM",
                "active": true
            },
            {
                "id": 233,
                "name": "United States",
                "code": "US",
                "active": true
            }
        ]
    }
}
```
