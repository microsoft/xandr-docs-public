---
title: Set Up Placements with AST
description: This article contains a sample web page showing how AST functions can be implemented in the header and body of a sample client page.
ms.custom: seller-tag
ms.date: 10/28/2023
---

# Set up placements with AST

This page contains a sample web page showing how Xandr's seller tag (AST) functions can be implemented in the header and body of a sample client page.

> [!NOTE]
> See the [AST API Reference](ast-api-reference.md) for more details on using the functions in this example.
>
> Xandr now supports a domain, adnxs-simple.com, which does not send or read browser cookies on requests. Clients can leverage this cookie-free domain when there is no consent to use personal data. Relevant calls initiated by Xandr will automatically use this domain when there is no consent or when cookies are not required for the function. For more information, see [Part of Service Policies](../policies-regulations/index.yml).
>
> To use the adnxs-simple.com domain:
>
> - If you load `ast.js` directly from Xandr's CDN, update the library tag to start loading from the new cookie-free domain: [https://acdn.adnxs-simple.com/ast/ast.js](https://acdn.adnxs-simple.com/ast/ast.js)
> - If you load `ast.js` from a local server, update `ast.js` to the latest version (version 0.37.1 or higher)

## Step 1: Create the APN object and load the Xandr JavaScript library

In line 5, we set up an empty AST object. In line 7, we create a function queue on that object which allows us to push functions into that queue with the information about the tags and be able to request bids from the Xandr ad server. In lines 10–15, we asynchronously load the client-side auction library from the Xandr CDN. If the script exists, we process it; otherwise, it is put in the queue.

> [!NOTE]
> This code can be pasted directly into your web page; no additional developer changes are required. You may separate the code into the `head` and `body` as shown below or, if you do not have access to the page `head`, you may put the entire tag in one code block in the `body`.
> [!WARNING]
> Deploying the AST tag into an external Javascript file or other customizations to the deployment of this code could result in unintended outcomes or loss of functionality, and will require customer action to test and utilize features in future AST releases. Xandr may not be able to troubleshoot or support in this instance.

```
<html>
<head>
    <script type="text/javascript">
    //create empty apntag object if it doesn't exist
    var apntag = apntag || {};
    //create a queue on the apntag object        
    apntag.anq = apntag.anq || [];
        
        //load ast.js - async
    (function() {
       var d = document, e = d.createElement('script'), p = d.getElementsByTagName('head')[0];
       e.type = 'text/javascript';  e.async = true;
       e.src = '//acdn.adnxs.com/ast/ast.js';
       p.insertBefore(e, p.firstChild);
    })();
```

## Step 2: Set global page options

Now we set the global page options with the `setPageOpts` function. Here, we set the member ID to `958` and define the page-wide targeting parameters. `member` is required in either `setPageOpts` or `defineTag` (see below). This example uses age and gender.

```
    //push commands to loading queue, to allow for async loading
    apntag.anq.push(function() {
        //set global page options
        apntag.setPageOpts({
            member: 958,
            keywords: {
                'artist': 'Prince',
                                'genre': ['rock', 'pop']
            },
                        user: {
                                age: 26,
                                gender: 1
                        }
        });
```

## Step 3: Define ad tags

Next, we define all the ad placements we want on this page using the `defineTag` function. Here, we specify the following for each placement:

- `member`: can override the global page option with member ID for this placement (optional; must be present if not specified in `setPageOpts`)

- `invCode`: the placement code for this placement. (`invCode` OR `tagId` required)

- `tagId`: the placement ID for this placement ( `invCode`  OR  `tagId` required)

- `sizes`: if you are using multiple sizes, the first item in the list is the placement size and other sizes are promo sizes.

- `targetId`: Any unique string; this must correspond to a unique `div` ID in the body of the page.

- Other options available; see the [AST API Reference](./ast-api-reference.md).

  ```
          //define ad tags
          apntag.defineTag({
                          invCode: 'ABC1234',
              sizes: [728,90],
              targetId: 'apn_ad_slot_1'
          });
          apntag.defineTag({
                          tagId: 123456,
              sizes: [[300,250],[300,600]],
              targetId: 'apn_ad_slot_2'
          });
  ```

## Step 4: Load tags

As soon as all the tags are defined, call the `loadTags` function. This function sends out ad requests for the tags in one ad call asynchronously.

```
        //start loading tags
        apntag.loadTags();
    });
    </script>
</head>
```

## Step 5: Define location of placements

In the body of the page, specify the location of each placement using `div` tags that correspond to the `targetId` elements from each of your `defineTag` calls. Use the `showTag` function to indicate that the placement is ready to receive an ad. Once this function is called, the impression will be marked as transacted and will be considered an "impression" for accounting purposes.

> [!NOTE]
> AST manages all the DOM elements inside the ad placeholder `div` tag programmatically. Since these elements may change, do not directly access any of the elements; use only the built-in AST functions, such as `refresh`. Accessing these elements directly may result in unexpected behavior, such as ads appearing in the wrong location on the page, duplicate ads, or blanks.

```
<body>
        <script type="text/javascript">
        apntag.anq.push(function() {
            //signal to script that this DOM element has been loaded and is ready to be populated with an ad
            apntag.showTag('apn_ad_slot_1');
        });
        </script>
    
    <br>
        <script type="text/javascript">
        apntag.anq.push(function() {
            apntag.showTag('apn_ad_slot_2');
        });
        </script>
    
 
</body>
</html>
```

## Related topics

- [Seller Tag](./seller-tag.md)
- [AST API Reference](./ast-api-reference.md)
