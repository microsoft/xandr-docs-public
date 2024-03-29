---
title: Postal Code List Service
description: Explore the features of Postal Code List service, enabling users to search, create, fetch, and delete a specific postal code list.
ms.date: 10/28/2023
ms.custom: digital-platform-api
---

# Postal Code List service

In the traditional way of geo-targeting of audiences, users can target only a limited number of postal codes at the line item or split level. With the introduction of the Postal Code List Service API into the Xandr platform, this limitation will be eliminated. The Postal Code List API will allow buyers to create a list of postal codes and reuse it across different objects (line items, splits) for targeting. With the Postal Code List Service, users can now target 100k postal codes on an individual list and 100 individual lists on a line item or split.

The Postal Code List Service enables user:

- To search, create, fetch and delete a specific or different include and exclude postal code lists containing a number of postal codes (by postal code ID).
- To enable include and exclude postal code list targeting on line item and split level.

> [!NOTE]
> All query parameters in postal code list service support a list of comma separated values. For example, to delete a set of postal code lists, a comma separated list of ids can be passed as query parameters.

## REST API

| HTTP Method | Endpoint | Description |
|:---|:---|:---|
| `POST` | [https://api.appnexus.com/postal-code-list](https://api.appnexus.com/postal-code-list) | Add a new Postal Code List. |
| `PUT` | [https://api.appnexus.com/postal-code-list](https://api.appnexus.com/postal-code-list) | Modify a Postal Code List. |
| `DELETE` | [https://api.appnexus.com/postal-code-list?id=POSTAL_CODE_LIST_ID](https://api.appnexus.com/postal-code-list?id=POSTAL_CODE_LIST_ID) | Delete a Postal Code List. |
| `DELETE` | [https://api.appnexus.com/postal-code-list?id=POSTAL_CODE_LIST_ID1,POSTAL_CODE_LIST_ID2,POSTAL_CODE_LIST_ID3](https://api.appnexus.com/postal-code-list?id=POSTAL_CODE_LIST_ID1,POSTAL_CODE_LIST_ID2,POSTAL_CODE_LIST_ID3) | Delete multiple Postal Code Lists. |
| `GET` | [https://api.appnexus.com/postal-code-list](https://api.appnexus.com/postal-code-list) | View all Postal Code Lists and Postal Codes they contain. |
| `GET` | [https://api.appnexus.com/postal-code-list?name=POSTAL_CODE_LIST_NAME](https://api.appnexus.com/postal-code-list?name=POSTAL_CODE_LIST_NAME) | View a Postal Code List by name and Postal Codes it contains. |
| `GET` | [https://api.appnexus.com/postal-code-list?id=POSTAL_CODE_LIST_ID](https://api.appnexus.com/postal-code-list?id=POSTAL_CODE_LIST_ID) | View a specific Postal Code List and Postal Codes it contains. |
| `GET` | [https://api.appnexus.com/postal-code-list?postal_code_id=POSTAL_CODE_ID](https://api.appnexus.com/postal-code-list?postal_code_id=POSTAL_CODE_ID) | View all Postal Code Lists containing a Postal Code. |
| `GET` | [https://api.appnexus.com/postal-code-list?search=SEARCH_TERM](https://api.appnexus.com/postal-code-list?search=SEARCH_TERM) | Search a Postal Code List by ID or name as search term.<br><br>**Note:**<br>`SEARCH_TERM` may be `POSTAL_CODE_ID` or `POSTAL_CODE_LIST_NAME` containing certain characters. |
| `GET` | [https://api.appnexus.com/postal-code-list?line_item_id=LINE_ITEM_ID](https://api.appnexus.com/postal-code-list?line_item_id=LINE_ITEM_ID) | View all Postal Code Lists targeted by a line item. |

## JSON fields

| Field | Type | Description |
|:---|:---|:---|
| `id` | int | The ID of a postal code list.<br>**Required On:** `PUT` |
| `name` | string | The name of the postal code list.<br>**Required On:** `POST` |
| `postal_codes` | array of objects | The postal codes that are to be included in the postal code list. The postal code IDs of the postal codes are included here. For example, see the [formats](#postal_codes-formats) that can be used.<br><br>**Note:**<br>For USA, you can target the full 9 digit postal code (also known as zip +4). For example, see [below](#postal_codes-example).<br><br> **Required On:** `POST` and `PUT`. |
| `last_modified` | timestamp | Time of last modification made to the postal code list.<br>It's a **Read Only** field. |
| `created_on` | timestamp | Time of creation of the postal code list.<br>It's a **Read Only** field. |
| `line_items` | array of objects | The line items that are targeting the postal code list (line items that have a profile attached to them and that profile is targeting the postal code list).<br>It's a **Read Only** field.<br>For example, see [below](#line_items-example). |

### `postal_codes` formats

```
"postal_codes":[
{"id": 1},
{"id": 2},
{"id": 3}
],
```

```
"postal_codes": [
{"country_code":"US","code":"10010"},
{"country_code":"US","code":"10111"},
{"country_code":"US","code":"10100"}
],
```

### `postal_codes` example

```
"postal_codes":[{"country_code":"US","code":"10010-7456"}],
```

### `line_items` example

```
"line_items":[
{
"id" : 1,
"name": "LINE_ITEM1",
"code": null
},
{
"id" : 2,
"name": "LINE_ITEM2",
"code": null
}
],
```

## Examples

### Create a postal code list

```
$ cat postal-code-list-create

{
   "postal-code-lists":[
      {
         "postal_codes":[
            {"id": 1},
            {"id": 2},
            {"id": 3}
         ],
         "name":"My first postal code list"
      },
      {
         "postal_codes": [ 
            {"country_code":"US","code":"10011"},
            {"country_code":"US","code":"10110"},
            {"country_code":"US","code":"11111"}
        ],
         "name":"Another one"
      }
   ]
}

$ curl -b cookies -X POST -d @postal-code-list-create 'https://api.appnexus.com/postal-code-list'
{
    "response": {
        "status": "OK",
        "postal-code-list": {
           "id": 3901,
           "name": "My first postal code list"
           ....
         }
    }
}
```

### Update a postal code list

```
$ cat postal-code-list-update

{
    "postal-code-list": {
        "id": 3901,
        "name": "Modified Postal Code List name",
        "description": "Modified Postal Code List description",
        "postal_codes": [
            {"id": 2}
        ]
    }
}

$ curl -b cookies -X PUT -d @postal-code-list-update 'https://api.appnexus.com/postal-code-list'
{
    "response": {
        "status": "OK",
        "postal-code-list": {
           "id": 3901,
           "name": "modified postal code list name"
           "description": "Updated Description",
           ....
         }
    }
}
```

### Add a new postal code to postal code list

```
$ cat postal-code-list-update

{
    "postal-code-list": {
        "id": 3901,
        "postal_codes": [
            {"id": 9987}
        ]
    }
}

$ curl -b cookies -X PUT -d @postal-code-list-update 'https://api.appnexus.com/postal-code-list&append=true'

{
    "response": {
        "status": "OK",
        "postal-code-list": {
           "id": 3901,
           "postal_codes": [
            {"id": 9987}
        ]
    }
}
```

### Delete a postal code list

```
$ curl -b cookies -c cookies -X DELETE 'https://api.appnexus.com/postal-code-list?id=3901'

{
    "response": {
        "status": "OK",
        "count": 1,
        "start_element": null,
        "num_elements": null
    }
}
```

## Related topics

- [Profile Service](profile-service.md)
- [Splits Service](splits-service.md)
