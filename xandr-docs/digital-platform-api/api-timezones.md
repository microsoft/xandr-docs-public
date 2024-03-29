---
title: API Timezones
description: This article provides information on API timezones. Advertisers take on their member's timezone by default.
ms.date: 10/28/2023
ms.custom: digital-platform-api
---

# API timezones

The default timezone for members is EST5EDT (U.S. Eastern Time -4/-5 UTC depending on daylight savings). Advertisers take on their member's timezone by default.

Reporting currently defaults to Eastern Time except for Network Billing, which is in UTC, but you can manually choose the timezone on any report.

> [!WARNING]
> **Non-integer timezones are not supported**
>
>Non-integer timezones are not supported by our system. This applies everywhere timezones are used, including reporting. Unsupported timezones include:
>
> - America/Caracas
> - America/St_Johns
> - Asia/Tehran
> - Asia/Kabul
> - Asia/Kolkata
> - Asia/Katmandu
> - Indian/Cocos
> - Australia/Adelaide

## Member service

If the parent member's timezone is changed through the [Member Service](./member-service.md), the child object timezones do not change. You cannot make a member's timezone "trickle down" after a change. You would have to change your existing advertiser timezones through the [Advertiser Service](./advertiser-service.md).

## Advertiser service

If an advertiser is created without a timezone, it will take on the timezone of its member parent.

When you change an advertiser's timezone, you can choose whether or not to make the change "trickle down" to child objects (campaigns, line items, and creatives). See the [Advertiser Service](./advertiser-service.md) page for details.

## Where else can you set timezones?

- [Insertion Order Service](insertion-order-service.md)
- [Line Item Service](line-item-service.md)
- [Campaign Service](campaign-service.md)
- [Publisher Service](publisher-service.md)
- [Payment Rule Service](payment-rule-service.md)

## Accepted timezone values for objects

The following timezone values are accepted for members, advertiser, and the other objects mentioned above:

- Africa/Abidjan  
- Africa/Accra  
- Africa/Addis_Ababa  
- Africa/Algiers  
- Africa/Asmara  
- Africa/Asmera  
- Africa/Bamako  
- Africa/Bangui  
- Africa/Banjul  
- Africa/Bissau  
- Africa/Blantyre  
- Africa/Brazzaville  
- Africa/Bujumbura  
- Africa/Cairo  
- Africa/Casablanca  
- Africa/Ceuta  
- Africa/Conakry  
- Africa/Dakar  
- Africa/Dar_es_Salaam  
- Africa/Djibouti  
- Africa/Douala  
- Africa/El_Aaiun  
- Africa/Freetown  
- Africa/Gaborone  
- Africa/Harare  
- Africa/Johannesburg  
- Africa/Kampala  
- Africa/Khartoum  
- Africa/Kigali  
- Africa/Kinshasa  
- Africa/Lagos  
- Africa/Libreville  
- Africa/Lome  
- Africa/Luanda  
- Africa/Lubumbashi  
- Africa/Lusaka  
- Africa/Malabo  
- Africa/Maputo  
- Africa/Maseru  
- Africa/Mbabane  
- Africa/Mogadishu  
- Africa/Monrovia  
- Africa/Nairobi  
- Africa/Ndjamena  
- Africa/Niamey  
- Africa/Nouakchott  
- Africa/Ouagadougou  
- Africa/Porto-Novo  
- Africa/Sao_Tome  
- Africa/Timbuktu  
- Africa/Tripoli  
- Africa/Tunis  
- Africa/Windhoek  
- America/Adak  
- America/Anchorage  
- America/Anguilla  
- America/Antigua  
- America/Araguaina  
- America/Argentina/Buenos_Aires  
- America/Argentina/Catamarca  
- America/Argentina/ComodRivadavia  
- America/Argentina/Cordoba  
- America/Argentina/Jujuy  
- America/Argentina/La_Rioja  
- America/Argentina/Mendoza  
- America/Argentina/Rio_Gallegos  
- America/Argentina/Salta  
- America/Argentina/San_Juan  
- America/Argentina/San_Luis  
- America/Argentina/Tucuman  
- America/Argentina/Ushuaia  
- America/Aruba  
- America/Asuncion  
- America/Atikokan  
- America/Atka  
- America/Bahia  
- America/Barbados  
- America/Belem  
- America/Belize  
- America/Blanc-Sablon  
- America/Boa_Vista  
- America/Bogota  
- America/Boise  
- America/Buenos_Aires  
- America/Cambridge_Bay  
- America/Campo_Grande  
- America/Cancun  
- America/Catamarca  
- America/Cayenne  
- America/Cayman  
- America/Chicago  
- America/Chihuahua  
- America/Coral_Harbour  
- America/Cordoba  
- America/Costa_Rica  
- America/Cuiaba  
- America/Curacao  
- America/Danmarkshavn  
- America/Dawson  
- America/Dawson_Creek  
- America/Denver  
- America/Detroit  
- America/Dominica  
- America/Edmonton  
- America/Eirunepe  
- America/El_Salvador  
- America/Ensenada  
- America/Fortaleza  
- America/Fort_Wayne  
- America/Glace_Bay  
- America/Godthab  
- America/Goose_Bay  
- America/Grand_Turk  
- America/Grenada  
- America/Guadeloupe  
- America/Guatemala  
- America/Guayaquil  
- America/Guyana  
- America/Halifax  
- America/Havana  
- America/Hermosillo  
- America/Indiana/Indianapolis  
- America/Indiana/Knox  
- America/Indiana/Marengo  
- America/Indiana/Petersburg  
- America/Indiana/Tell_City  
- America/Indiana/Vevay  
- America/Indiana/Vincennes  
- America/Indiana/Winamac  
- America/Indianapolis  
- America/Inuvik  
- America/Iqaluit  
- America/Jamaica  
- America/Jujuy  
- America/Juneau  
- America/Kentucky/Louisville  
- America/Kentucky/Monticello  
- America/Knox_IN  
- America/La_Paz  
- America/Lima  
- America/Los_Angeles  
- America/Louisville  
- America/Maceio  
- America/Managua  
- America/Manaus  
- America/Marigot  
- America/Martinique  
- America/Mazatlan  
- America/Mendoza  
- America/Menominee  
- America/Merida  
- America/Mexico_City  
- America/Miquelon  
- America/Moncton  
- America/Monterrey  
- America/Montevideo  
- America/Montreal  
- America/Montserrat  
- America/Nassau  
- America/New_York  
- America/Nipigon  
- America/Nome  
- America/Noronha  
- America/North_Dakota/Center  
- America/North_Dakota/New_Salem  
- America/Panama  
- America/Pangnirtung  
- America/Paramaribo  
- America/Phoenix  
- America/Port-au-Prince  
- America/Porto_Acre  
- America/Porto_Velho  
- America/Port_of_Spain  
- America/Puerto_Rico  
- America/Rainy_River  
- America/Rankin_Inlet  
- America/Recife  
- America/Regina  
- America/Resolute  
- America/Rio_Branco  
- America/Rosario  
- America/Santarem  
- America/Santiago  
- America/Santo_Domingo  
- America/Sao_Paulo  
- America/Scoresbysund  
- America/Shiprock  
- America/St_Barthelemy  
- America/St_Kitts  
- America/St_Lucia  
- America/St_Thomas  
- America/St_Vincent  
- America/Swift_Current  
- America/Tegucigalpa  
- America/Thule  
- America/Thunder_Bay  
- America/Tijuana  
- America/Toronto  
- America/Tortola  
- America/Vancouver  
- America/Virgin  
- America/Whitehorse  
- America/Winnipeg  
- America/Yakutat  
- America/Yellowknife  
- Antarctica/Casey  
- Antarctica/Davis  
- Antarctica/DumontDUrville  
- Antarctica/Mawson  
- Antarctica/McMurdo  
- Antarctica/Palmer  
- Antarctica/Rothera  
- Antarctica/South_Pole  
- Antarctica/Syowa  
- Antarctica/Vostok  
- Arctic/Longyearbyen  
- Asia/Aden  
- Asia/Almaty  
- Asia/Amman  
- Asia/Anadyr  
- Asia/Aqtau  
- Asia/Aqtobe  
- Asia/Ashgabat  
- Asia/Ashkhabad  
- Asia/Baghdad  
- Asia/Bahrain
- Asia/Baku  
- Asia/Bangkok  
- Asia/Beirut  
- Asia/Bishkek  
- Asia/Brunei  
- Asia/Calcutta  
- Asia/Choibalsan  
- Asia/Chongqing  
- Asia/Chungking  
- Asia/Colombo  
- Asia/Dacca  
- Asia/Damascus  
- Asia/Dhaka  
- Asia/Dili  
- Asia/Dubai  
- Asia/Dushanbe  
- Asia/Gaza
- Asia/Harbin
- Asia/Hong_Kong
- Asia/Hovd
- Asia/Ho_Chi_Minh
- Asia/Irkutsk
- Asia/Istanbul
- Asia/Jakarta  
- Asia/Jayapura
- Asia/Jerusalem
- Asia/Kamchatka
- Asia/Karachi
- Asia/Kashgar
- Asia/Kathmandu
- Asia/Krasnoyarsk
- Asia/Kuala_Lumpur
- Asia/Kuching
- Asia/Kuwait  
- Asia/Macao
- Asia/Macau
- Asia/Magadan
- Asia/Makassar
- Asia/Manila
- Asia/Muscat
- Asia/Nicosia
- Asia/Novosibirsk
- Asia/Omsk
- Asia/Oral
- Asia/Phnom_Penh
- Asia/Pontianak
- Asia/Pyongyang
- Asia/Qatar
- Asia/Qyzylorda
- Asia/Rangoon
- Asia/Riyadh
- Asia/Saigon
- Asia/Sakhalin
- Asia/Samarkand  
- Asia/Seoul
- Asia/Shanghai
- Asia/Singapore
- Asia/Taipei
- Asia/Tashkent
- Asia/Tbilisi
- Asia/Tel_Aviv
- Asia/Thimbu
- Asia/Thimphu
- Asia/Tokyo
- Asia/Ujung_Pandang  
- Asia/Ulaanbaatar
- Asia/Ulan_Bator
- Asia/Urumqi  
- Asia/Vientiane  
- Asia/Vladivostok
- Asia/Yakutsk
- Asia/Yekaterinburg
- Asia/Yerevan  
- Atlantic/Azores
- Atlantic/Bermuda
- Atlantic/Canary
- Atlantic/Cape_Verde
- Atlantic/Faeroe
- Atlantic/Faroe
- Atlantic/Jan_Mayen
- Atlantic/Madeira
- Atlantic/Reykjavik
- Atlantic/South_Georgia
- Atlantic/Stanley
- Atlantic/St_Helena
- Australia/ACT  
- Australia/Brisbane
- Australia/Broken_Hill
- Australia/Canberra
- Australia/Currie
- Australia/Darwin  
- Australia/Eucla
- Australia/Hobart  
- Australia/LHI  
- Australia/Lindeman  
- Australia/Lord_Howe  
- Australia/Melbourne
- Australia/North
- Australia/NSW  
- Australia/Perth  
- Australia/Queensland  
- Australia/South
- Australia/Sydney  
- Australia/Tasmania  
- Australia/Victoria
- Australia/West
- Australia/Yancowinna  
- Brazil/Acre  
- Brazil/DeNoronha  
- Brazil/East
- Brazil/West
- Canada/Atlantic
- Canada/Central  
- Canada/East-Saskatchewan  
- Canada/Eastern  
- Canada/Mountain  
- Canada/Newfoundland  
- Canada/Pacific
- Canada/Saskatchewan
- Canada/Yukon  
- CET
- Chile/Continental
- Chile/EasterIsland
- CST6CDT  
- Cuba
- EET  
- Egypt
- Eire  
- EST  
- EST5EDT  
- Etc/GMT  
- Etc/GMT+0  
- Etc/GMT+1  
- Etc/GMT+10  
- Etc/GMT+11  
- Etc/GMT+12
- Etc/GMT+2  
- Etc/GMT+3  
- Etc/GMT+4  
- Etc/GMT+5  
- Etc/GMT+6  
- Etc/GMT+7  
- Etc/GMT+8  
- Etc/GMT+9  
- Etc/GMT-0
- Etc/GMT-1
- Etc/GMT-10
- Etc/GMT-11
- Etc/GMT-12
- Etc/GMT-13  
- Etc/GMT-2
- Etc/GMT-3
- Etc/GMT-4
- Etc/GMT-5  
- Etc/GMT-6
- Etc/GMT-7
- Etc/GMT-8  
- Etc/GMT-9
- Etc/GMT0
- Etc/Greenwich  
- Etc/UCT  
- Etc/Universal  
- Etc/UTC  
- Etc/Zulu  
- Europe/Amsterdam  
- Europe/Andorra  
- Europe/Athens  
- Europe/Belfast  
- Europe/Belgrade  
- Europe/Berlin  
- Europe/Bratislava  
- Europe/Brussels  
- Europe/Bucharest  
- Europe/Budapest  
- Europe/Chisinau  
- Europe/Copenhagen  
- Europe/Dublin  
- Europe/Gibraltar  
- Europe/Guernsey  
- Europe/Helsinki  
- Europe/Isle_of_Man  
- Europe/Istanbul  
- Europe/Jersey  
- Europe/Kaliningrad  
- Europe/Kiev  
- Europe/Lisbon  
- Europe/Ljubljana  
- Europe/London  
- Europe/Luxembourg  
- Europe/Madrid  
- Europe/Malta  
- Europe/Mariehamn  
- Europe/Minsk  
- Europe/Monaco  
- Europe/Moscow  
- Europe/Nicosia  
- Europe/Oslo  
- Europe/Paris  
- Europe/Podgorica  
- Europe/Prague  
- Europe/Riga  
- Europe/Rome  
- Europe/Samara  
- Europe/San_Marino  
- Europe/Sarajevo  
- Europe/Simferopol  
- Europe/Skopje  
- Europe/Sofia  
- Europe/Stockholm  
- Europe/Tallinn  
- Europe/Tirane  
- Europe/Tiraspol  
- Europe/Uzhgorod  
- Europe/Vaduz  
- Europe/Vatican  
- Europe/Vienna  
- Europe/Vilnius  
- Europe/Volgograd  
- Europe/Warsaw
- Europe/Zagreb
- Europe/Zaporozhye
- Europe/Zurich
- Factory  
- GB  
- GB-Eire  
- GMT
- GMT+0
- GMT-0
- GMT0
- Greenwich  
- Hongkong
- HST
- Iceland
- Indian/Antananarivo
- Indian/Chagos  
- Indian/Christmas
- Indian/Comoro  
- Indian/Kerguelen  
- Indian/Mahe  
- Indian/Maldives
- Indian/Mauritius
- Indian/Mayotte  
- Indian/Reunion
- Iran
- Israel  
- Jamaica
- Japan  
- Kwajalein
- Libya
- MET  
- Mexico/BajaNorte  
- Mexico/BajaSur  
- Mexico/General
- MST
- MST7MDT  
- Navajo  
- NZ
- NZ-CHAT
- Pacific/Apia
- Pacific/Auckland  
- Pacific/Chatham
- Pacific/Easter  
- Pacific/Efate
- Pacific/Enderbury  
- Pacific/Fakaofo  
- Pacific/Fiji  
- Pacific/Funafuti
- Pacific/Galapagos  
- Pacific/Gambier  
- Pacific/Guadalcanal  
- Pacific/Guam  
- Pacific/Honolulu  
- Pacific/Johnston  
- Pacific/Kosrae  
- Pacific/Kwajalein
- Pacific/Majuro  
- Pacific/Marquesas  
- Pacific/Midway
- Pacific/Nauru
- Pacific/Niue
- Pacific/Norfolk
- Pacific/Noumea  
- Pacific/Pago_Pago
- Pacific/Palau
- Pacific/Pitcairn
- Pacific/Ponape  
- Pacific/Port_Moresby  
- Pacific/Rarotonga  
- Pacific/Saipan
- Pacific/Samoa
- Pacific/Tahiti  
- Pacific/Tarawa  
- Pacific/Tongatapu  
- Pacific/Truk
- Pacific/Wake  
- Pacific/Wallis
- Pacific/Yap
- Poland
- Portugal  
- PRC  
- PST8PDT  
- ROC  
- ROK  
- Singapore
- Turkey
- UCT
- Universal  
- US/Alaska  
- US/Aleutian  
- US/Arizona
- US/Central  
- US/East-Indiana
- US/Eastern
- US/Hawaii  
- US/Indiana-Starke
- US/Michigan  
- US/Mountain  
- US/Pacific
- US/Samoa
- UTC
- W-SU
- WET
- Zulu

## Accepted timezone values for reporting

When you use the [Report Service](./report-service.md) to request a report, you can set the `timezone` field to any of the following values.

- EST5EDT  
- CST6CDT  
- MST7MDT
- PST8PDT
- CET
- UTC
- Pacific/Apia
- Pacific/Honolulu
- America/Juneau
- America/Los_Angeles
- America/Denver
- America/Chicago
- America/New_York  
- America/Halifax
- America/Argentina/Buenos_Aires
- Atlantic/South_Georgia  
- Atlantic/Cape_Verde
- Europe/London  
- Europe/Amsterdam
- Europe/Berlin
- Europe/Helsinki  
- Africa/Cairo
- Asia/Jerusalem  
- Europe/Moscow  
- Asia/Dubai  
- Indian/Maldives  
- Asia/Dhaka  
- Asia/Bangkok  
- Asia/Hong_Kong  
- Asia/Tokyo  
- Australia/Sydney  
- Asia/Magadan

## Further reading

Dates and Times in Reporting: A more high-level, UI-specific page on this information. Customer login to [Monetize](https://monetize.xandr.com/docs/dates-and-times-in-reporting) or [Invest](https://invest.xandr.com/docs/dates-and-times-in-reporting) is required.
