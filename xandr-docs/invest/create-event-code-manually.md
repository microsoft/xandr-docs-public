---
title: Microsoft Invest - Create Event Code Manually
description: Learn how to create a code for your standard event using a template, and check the different names which can be given to them. 
ms.date: 10/28/2023
---


# Microsoft Invest - Create event code manually 

You can manually create event code based on a template and deploy it on your website.

Use the following template to create the code for your standard event, where:

- *EventName* is the name for your event
- *UUID* is the unique ID for your pixel as shown in the Microsoft Advertising UI

See [Standard Events and Parameters](standard-events-and-parameters.md) for the names of standard events.

``` 
<script> 
     pixie('event', 'EventName'); 
</script> 

<noscript>
     <img width="1" height="1" style="display:none;" 
     src="//ib.adnxs.com/pixie?pi=UUID&e=EventName&script=0" />
</noscript> 
```

## Related topics

- [Universal Pixel Code Structure](universal-pixel-code-structure.md)
- [Standard Events and Parameters](standard-events-and-parameters.md)
- [Create Custom Events and Parameters](create-custom-events-and-parameters.md)
