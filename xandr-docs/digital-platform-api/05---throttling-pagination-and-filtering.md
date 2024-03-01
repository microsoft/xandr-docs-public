---
title: Throttling Pagination and Filtering
description: In this article, learn about the concepts such as, Throttling, Pagination, and Filtering, accompanied by examples.
ms.date: 10/28/2023
ms.custom: digital-platform-api
---

# Throttling Pagination and Filtering

## Throttling

In order to prevent abuse of the API services, all accounts are generally limited to 1000 reads and writes per minute. This limit is enforced programmatically by the API on a member level. That means if there are two API users for a single member, they will share the throttling limit (i.e., two users can average 50 reads per minute each, four users can average 25 reads per minute each). However, Xandr adjusts the rate limits dynamically when our platform has free capacity.

If you exceed the throttling limit, the API will respond with the HTTP 429 (Too Many Requests) response code. The `Retry-After` header specifies the number of seconds you should wait before trying again.

You can use the HTTP status 429 as the indication that you need to pause and wait for the amount of time specified in the `Retry-After` field in the response header before continuing with your API call. This will allow you to take advantage of the opportunity to exceed your rate limits when our platform has the free capacity to handle your API calls.

### Error messages

If the throttling limit is exceeded, the API will respond with an error message in the response contents in addition to the HTTP 429 response code. An example of the error message is below:

```
{
  "response": {
    "error_id": "SYSTEM",
    "error": "You have exceeded your request limit of 100 per 60 seconds for this user, please wait and try again or contact AppNexus for higher limits",
    "error_description": "rate limit has been exceeded",
    "error_code": "RATE_EXCEEDED",
    ...
  }
}
```

## Pagination

The API limits responses to any request to 100 objects. Pagination will allow you to use multiple requests to retrieve more than 100 objects in total, though each single request is still limited to 100 objects. This is accomplished by using the `start_element` and `num_elements` querystring parameters. In the below example, we use multiple HTTP `GET` calls to retrieve many creatives.

> [!NOTE]
> The output has been abbreviated to save space.

### Pagination: Example

```
$ curl -c cookies -b cookies 'https://api.appnexus.com/creative?start_element=0&num_elements=100'
{
  "response": {
    "status": "OK",
    "creatives": [...],
    "count": 203151,
    "start_element": 0,
    "num_elements": 100
  }
}
$ curl -c cookies -b cookies 'https://api.appnexus.com/creative?start_element=100&num_elements=100'
{
  "response": {
    "status": "OK",
    "creatives": [...],
    "count": 203151,
    "start_element": 100,
    "num_elements": 100
  }
}
$ curl -c cookies -b cookies 'https://api.appnexus.com/creative?start_element=200&num_elements=100'
{
  "response": {
    "status": "OK",
    "creatives": [...],
    "count": 203151,
    "start_element": 200,
    "num_elements": 100
  }
}
```

## Filtering

Filtering allows you to specify a subset of objects to be returned by the API. The most common, and arguably most useful filter is `min_last_modified`, which only returns objects that have been changed since the date specified. In the example below, we use filtering in an API `GET` request to return only those creatives modified after 05/14/2013 00:00:00 UTC.

> [!NOTE]
> The output of the API call has been abbreviated to save space.

### Filtering: Example

```
$ curl -b cookies -c cookies 'https://api.appnexus.com/creative?min_last_modified=2013-05-14+00:00:00'
{
  "response": {
    "status": "OK",
    "creatives": [
      {
        "id": 298390,
        "last_modified": "2011-07-13 16:08:32",
        ...
      },
      {
        "id": 298391,
        "last_modified": "2011-07-13 16:08:32",
        ...
      },
      {
        "id": 317677,
        "last_modified": "2011-07-13 04:44:04",
        ...
      },
      {
        "id": 317678,
        "last_modified": "2011-07-13 04:12:57",
        ...
      },
      {
        "id": 328516,
        "last_modified": "2011-07-13 18:18:21",
        ...
      },
      {
        "id": 328531,
        "last_modified": "2011-07-13 18:57:12",
        ...
      }
    ],
    "count": 1740,
    "start_element": 0,
    "num_elements": 6
  }
}
```
