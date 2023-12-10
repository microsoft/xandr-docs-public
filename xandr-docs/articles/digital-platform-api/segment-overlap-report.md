---
Title : Segment Overlap Report
Description : <b>Note:</b> This reporting API is currently
ms.date: 10/28/2023
ms.custom: digital-platform-api
for internal use only. It is therefore only visible to
---


# Segment Overlap Report





<b>Note:</b> This reporting API is currently
for internal use only. It is therefore only visible to
AppNexus employees. It supersedes the existing
**Inventory Segment Daily Uniques** report, which was deprecated on
11/15/12.



The **Segment Overlap Report** allows buyers to view data about the
intersection of available inventory with a particular segment, filtered
by geographic area, seller, or audit status. It offers answers to
questions such as:

- How many unique, platform-reviewed impressions will I be able to buy
  for my segment from seller ID 123?
- How much impression volume in Canada is available for my segment from
  seller ID 456?

The aim of this report is to show you inventory that you can actually
target for purchase. For that reason, it takes into account the
publisher-side settings from the <a
href="ad-profile-service.md"
class="xref" target="_blank">Ad Profile Service</a> and <a
href="platform-member-service.md"
class="xref" target="_blank">Platform Member Service</a>.





<b>Note:</b> **Segment Availability and
Statistical Sampling  
**

Due to the high volume of impressions across our platform, this report
is based on a statistical sampling. This means that any combinations of
seller and segment which comprise fewer than 1,000 unique users will not
be included in this report, as they have been determined by our analysts
to lack statistical significance.





**Admin Users and Visibility Logic**



<b>Note:</b> This section is visible only to
AppNexus employees. It lists fields that clients
can neither see nor edit.



Calls to this report without the `member_id` query string parameter will
return information about all available inventory without any visibility
logic applied. Therefore admin users will need to pass a `member_id` via
the query string in order for that member's visibility logic to be
applied. See the <a href="segment-overlap-report.md#ID-00003ba1__5"
class="xref">Examples</a>below.



## Time Frame

The time frame covered by this report is the previous seven days, with
daily updates. Because of the fixed time frame availability, there is no
`"report_interval"` field required in the JSON request. For more
information see <a
href="segment-overlap-report.md#ID-00003ba1__Examples_segment_overlap_report"
class="xref">Examples</a> below.





## Dimensions





<b>Note:</b> **Wed Dec 19 2012:** `"inv_src"`
and audit statuses other than
`"``appnexus``_reviewed"` have been disabled at
the Data level and are about to be removed from this report.





<table class="table">
<thead class="thead">
<tr class="header row">
<th id="ID-00003ba1__entry__1"
class="entry colsep-1 rowsep-1">Column</th>
<th id="ID-00003ba1__entry__2" class="entry colsep-1 rowsep-1">Type</th>
<th id="ID-00003ba1__entry__3"
class="entry colsep-1 rowsep-1">Example</th>
<th id="ID-00003ba1__entry__4"
class="entry colsep-1 rowsep-1">Description</th>
</tr>
</thead>
<tbody class="tbody">
<tr class="odd row">
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__1"><code
class="ph codeph">segment_id</code></td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__2">int</td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__3"><code class="ph codeph">123</code></td>
<td class="entry colsep-1 rowsep-1" headers="ID-00003ba1__entry__4">The
ID of the segment whose browsing behavior you're researching.
<p><strong>Filter by:</strong>Yes</p></td>
</tr>
<tr class="even row">
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__1"><code
class="ph codeph">seller_member_id</code></td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__2">int</td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__3"><code class="ph codeph">456</code></td>
<td class="entry colsep-1 rowsep-1" headers="ID-00003ba1__entry__4">The
member ID of the seller whose inventory you're researching.
<p><strong>Filter by:</strong>Yes</p></td>
</tr>
<tr class="odd row">
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__1"><code
class="ph codeph">seller_member_name</code></td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__2">string</td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__3"><code
class="ph codeph">"PubMatic"</code></td>
<td class="entry colsep-1 rowsep-1" headers="ID-00003ba1__entry__4">The
name of the seller member upon whose inventory this report is based. If
the member has chosen to keep their platform exposure private, a value
like "Seller 453" will be shown. For more information about the
different types of platform exposure members can choose from, see the <a
href="platform-member-service.md"
class="xref" target="_blank">Platform Member Service</a>.
<p><strong>Default:</strong> NA</p>
<p><strong>Filter by:</strong>Yes</p></td>
</tr>
<tr class="even row">
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__1"><code
class="ph codeph">inventory_type</code></td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__2">enum</td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__3"><code
class="ph codeph">"seller"</code></td>
<td class="entry colsep-1 rowsep-1" headers="ID-00003ba1__entry__4">You
may filter the report by seller. Allowed value: <code
class="ph codeph">"seller"</code>.
<p><strong>Default:</strong><code class="ph codeph">"seller"</code></p>
<p><strong>Filter by:</strong>Yes</p></td>
</tr>
<tr class="odd row">
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__1"><code
class="ph codeph">geo_country</code></td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__2">enum</td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__3"><code class="ph codeph">"CA"</code></td>
<td class="entry colsep-1 rowsep-1" headers="ID-00003ba1__entry__4">A
two-character string denoting the country in which the impression was
viewed. For a complete listing of allowed values, see <a
href="https://en.wikipedia.org/wiki/ISO_3166-1" class="xref"
target="_blank">ISO 3166-1 country codes</a>.
<p><strong>Default:</strong><code class="ph codeph">"--"</code>(This
means "no country code," or "worldwide targeting.")</p>
<p><strong>Filter by:</strong>Yes</p></td>
</tr>
<tr class="even row">
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__1"><code
class="ph codeph">audit_type</code></td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__2">enum</td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__3"><code class="ph codeph">"</code><span
class="ph"><code class="ph codeph">appnexus</code><code
class="ph codeph">_reviewed"</code></td>
<td class="entry colsep-1 rowsep-1" headers="ID-00003ba1__entry__4">The
audit status of the domain on which the impression will be shown.
Allowed values:
<ul>
<li><code class="ph codeph">"any_audit_status"</code>: Includes all four
possible audit statuses: unaudited, <span
class="ph">AppNexus-reviewed, seller-reviewed, and <span
class="ph">AppNexus- and seller-reviewed inventory.</li>
<li><code class="ph codeph">"</code><code
class="ph codeph">appnexus</code><code
class="ph codeph">_reviewed"</code>: Includes one audit status: only
AppNexus-reviewed inventory.</li>
<li><code class="ph codeph">"</code><code
class="ph codeph">appnexus</code><code
class="ph codeph">_seller_reviewed"</code>: Includes three audit status:
seller-reviewed, AppNexus-reviewed, and seller-
and AppNexus-reviewed.</li>
</ul>
<p><strong>Default:</strong> <code
class="ph codeph">"any_status"</code></p>
<p><strong>Filter by:</strong>Yes</p></td>
</tr>
<tr class="odd row">
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__1"><code
class="ph codeph">inventory_id</code></td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__2">int</td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__3"><code class="ph codeph">999</code></td>
<td class="entry colsep-1 rowsep-1" headers="ID-00003ba1__entry__4">The
ID of the seller.
<p><strong>Filter by:</strong>Yes</p></td>
</tr>
</tbody>
</table>





## Metrics



<table class="table">
<thead class="thead">
<tr class="header row">
<th id="ID-00003ba1__entry__33"
class="entry colsep-1 rowsep-1">Column</th>
<th id="ID-00003ba1__entry__34"
class="entry colsep-1 rowsep-1">Type</th>
<th id="ID-00003ba1__entry__35"
class="entry colsep-1 rowsep-1">Example</th>
<th id="ID-00003ba1__entry__36"
class="entry colsep-1 rowsep-1">Description</th>
</tr>
</thead>
<tbody class="tbody">
<tr class="odd row">
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__33"><code
class="ph codeph">avg_total_imps</code></td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__34">int</td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__35"><code
class="ph codeph">1024</code></td>
<td class="entry colsep-1 rowsep-1" headers="ID-00003ba1__entry__36">The
daily average number of available impressions from that seller
associated with your chosen segment. This number includes all
impressions worldwide (e.g. a <code class="ph codeph">geo_country</code>
of <code class="ph codeph">"--"</code>).</td>
</tr>
<tr class="even row">
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__33"><code
class="ph codeph">avg_imps</code></td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__34">int</td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__35"><code
class="ph codeph">57180</code></td>
<td class="entry colsep-1 rowsep-1" headers="ID-00003ba1__entry__36">The
daily average number of available impressions, given any additional
filters you've specified beyond <code
class="ph codeph">seller_member_id</code> and <code
class="ph codeph">segment_id</code>. Compare this with <code
class="ph codeph">avg_total_imps</code> to determine the effects of your
campaign targeting on inventory availability.</td>
</tr>
<tr class="odd row">
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__33"><code
class="ph codeph">avg_uniques</code></td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__34">int</td>
<td class="entry colsep-1 rowsep-1"
headers="ID-00003ba1__entry__35"><code
class="ph codeph">12455</code></td>
<td class="entry colsep-1 rowsep-1" headers="ID-00003ba1__entry__36">The
daily average number of available impressions associated with unique
users given your choice of <code
class="ph codeph">seller_member_id</code> and <code
class="ph codeph">geo_country</code>.

<b>Note:</b> <strong><br />
Availability of Uniques<br />
</strong>
<p>There are only two cases in which the <code
class="ph codeph">"avg_uniques"</code> metric will be displayed by this
report:</p>
<ul>
<li>When you've chosen to filter by <code
class="ph codeph">"segment_id"</code> and an <code
class="ph codeph">"inventory_type"</code> of "seller" (the
default).</li>
<li>When you've chosen to filter by <code
class="ph codeph">"segment_id"</code>, an <code
class="ph codeph">"inventory_type"</code> of "seller," and <code
class="ph codeph">"geo_country"</code>.<br />
In all other cases only the <code class="ph codeph">"avg_imps"</code>
metric will be available, and the <code
class="ph codeph">"avg_uniques"</code> column will hold a value of
"N/A."</li>
</ul>
</td>
</tr>
</tbody>
</table>





>

## Examples

**List the inventory sources that overlap with your segment**

``` pre
$ cat report-request
{
    "sync-report": {
        "report_type":"segment_overlap",
        "filters": [
            {
                "segment_id":106,
                "inventory_type":"inv_src"
            }
        ]
    }
}
```

``` pre
$ curl -b cookies -X POST -d @report-request "https://api.appnexus.com/sync-report"
{
      "response": {
          "status": "OK",
          "report": {
              "data": [
                  {
                      "inventory_type": "inv_src",
                      "id": "43307767",
                      "segment_id": 106,
                      "seller_member_id": 273,
                      "inventory_id": 0,
                      "geo_country": "--",
                      "audit_type": 2,
                      "avg_imps": 1202560,
                      "avg_uniques": 168940,
                      "inventory_name": null,
                      "seller_member_name": "Yahoo RTB member"
                  },
                  {
                      "inventory_type": "inv_src",
                      "id": "40720823",
                      "segment_id": 106,
                      "seller_member_id": 630,
                      "inventory_id": 0,
                      "geo_country": "--",
                      "audit_type": 3,
                      "avg_imps": 7180,
                      "avg_uniques": 3400,
                      "inventory_name": null,
                      "seller_member_name": "Marimedia Ltd."
                  },
                  ...
              ],
              "total_count": 332,
              "offset": 0,
              "count": 0,
              ],
          },
  ...
  }
```

**List the inventory sources that overlap with your segment, in CSV
format**

``` pre
$ cat report-request
{
    "sync-report": {
        "report_type":"segment_overlap",
        "filters": [
            {
                "segment_id":106,
                "inventory_type":"inv_src"
            }
        ]
    }
}
```

``` pre
$ curl -b cookies -X POST -d @report-request "https://api.appnexus.com/sync-reportdownload"
segment_id,geo_country,seller_member_id,seller_member_name,audit_type,inventory_type,inventory_id,inventory_name,avg_imps,avg_uniques
106,--,273,Yahoo RTB member,2,inv_src,0,--,1202560,168940
106,--,630,Marimedia Ltd.,3,inv_src,0,--,7180,3400
106,--,86,Photobucket,2,inv_src,212,Photobucket Brandsafe,327500,14000
106,--,86,Photobucket,2,inv_src,15,Photobucket,574680,56300
106,--,514,AudienceScience,2,inv_src,0,--,1489240,271200
106,--,852,AdMeld,2,inv_src,1308,The Weather Channel,782700,210820
106,--,459,Rubicon,2,inv_src,924,Rubicon - Mom & Baby,2650020,35420
106,--,357,OpenX,2,inv_src,1186,Unanimis Auto2,22933,5167
106,--,74,PubMatic,2,inv_src,483,Detroit Free Press,31920,9360
106,--,74,PubMatic,2,inv_src,686,Netzero,739740,33120
106,--,181,Google AdExchange,2,inv_src,75,AdSense Long Tail - Entertainment,15078140,843800
106,--,468,"Kontera Technologies, Inc.",3,inv_src,0,--,5540,3960
106,--,852,AdMeld,2,inv_src,845,Lijit,7108180,474960
106,--,818,Media Shakers,2,inv_src,0,--,13560,2200
106,--,1264,WRAL,2,inv_src,0,--,464960,16160
106,--,181,Google AdExchange,2,inv_src,49,Slickdeals,1041720,46600
...
```



**List all available inventory worldwide where your segment can be
found**

``` pre
$ cat report-request.json
{
  "sync-report": {
    "filters": [
      {
        "segment_id": 94425
      }
    ],
    "report_type": "segment_overlap"
  }
}
```



``` pre
$ curl -b cookies -X POST -d @report-request "https://api.appnexus.com/sync-report"
{
  "response": {
    "dbg_info": {
      "version": "1.12.39",
      "start_microtime": 1345224526.0922,
      "time": 1078.34815979,
      "warnings": [
      ],
      "db": "master",
      "slave_hit": false,
      "instance": "19.bm-hbapi.prod.nym1"
    },
    "sync-report": {
      "query": {
        "orders": [
          {
            "direction": "DESC",
            "order_by": "avg_imps0"
          }
        ],
        "string": "geo_country:\\-\\- AND segment_id:94425 AND inventory_type:2",
        "ast": {
          "inventory_type": 2,
          "segment_id": 94425,
          "geo_country": "\\-\\-"
        }
      },
      "count": 20,
      "offset": 0,
      "total_count": 243,
      "data": [
        {
          "audit_type": "any_status",
          "avg_total_imps": 296095900,
          "avg_imps": 296095900,
          "inventory_name": "YouTube",
          "seller_member_name": "Google AdExchange",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 39,
          "seller_member_id": 181,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1790532
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 221322600,
          "avg_imps": 221322600,
          "inventory_name": "OpenX - Default",
          "seller_member_name": "OpenX",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 1243,
          "seller_member_id": 357,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1831949
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 184479000,
          "avg_imps": 184479000,
          "inventory_name": "AdX - Unverticalized",
          "seller_member_name": "Google AdExchange",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 114,
          "seller_member_id": 181,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1796558
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 181159900,
          "avg_imps": 181159900,
          "inventory_name": "AdSense Long Tail - Entertainment",
          "seller_member_name": "Google AdExchange",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 75,
          "seller_member_id": 181,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1791449
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 144808000,
          "avg_imps": 144808000,
          "inventory_name": "Rubicon - Entertainment",
          "seller_member_name": "Rubicon",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 899,
          "seller_member_id": 459,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1839085
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 87032600,
          "avg_imps": 87032600,
          "inventory_name": "AdMeld - Default",
          "seller_member_name": "AdMeld",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 1241,
          "seller_member_id": 852,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1868874
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 77004000,
          "avg_imps": 77004000,
          "inventory_name": "Rubicon - News & Reference",
          "seller_member_name": "Rubicon",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 905,
          "seller_member_id": 459,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1839702
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 70802000,
          "avg_imps": 70802000,
          "inventory_name": "OpenX Longtail - Entertainment Vertical",
          "seller_member_name": "OpenX",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 513,
          "seller_member_id": 357,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1830368
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 33801500,
          "avg_imps": 33801500,
          "inventory_name": "Lijit",
          "seller_member_name": "AdMeld",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 845,
          "seller_member_id": 852,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1868690
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 31285500,
          "avg_imps": 31285500,
          "inventory_name": "Rubicon - Social Networking",
          "seller_member_name": "Rubicon",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 908,
          "seller_member_id": 459,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1840023
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 25680100,
          "avg_imps": 25680100,
          "inventory_name": "PubMatic - Default",
          "seller_member_name": "PubMatic",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 183,
          "seller_member_id": 74,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1785499
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 21725000,
          "avg_imps": 21725000,
          "inventory_name": "OpenX Longtail - Internet and Computing Vertical",
          "seller_member_name": "OpenX",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 528,
          "seller_member_id": 357,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1831072
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 21153300,
          "avg_imps": 21153300,
          "inventory_name": "Rubicon - Music",
          "seller_member_name": "Rubicon",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 904,
          "seller_member_id": 459,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1839527
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 20240500,
          "avg_imps": 20240500,
          "inventory_name": "AdSense Long Tail - Internet",
          "seller_member_name": "Google AdExchange",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 82,
          "seller_member_id": 181,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1792661
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 20214900,
          "avg_imps": 20214900,
          "inventory_name": "Rubicon - Mom & Baby",
          "seller_member_name": "Rubicon",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 924,
          "seller_member_id": 459,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1841696
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 19615600,
          "avg_imps": 19615600,
          "inventory_name": "AdSense Long Tail - Online Communities",
          "seller_member_name": "Google AdExchange",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 99,
          "seller_member_id": 181,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1795468
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 18702300,
          "avg_imps": 18702300,
          "inventory_name": "Rubicon - Anime",
          "seller_member_name": "Rubicon",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 918,
          "seller_member_id": 459,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1841234
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 17818000,
          "avg_imps": 17818000,
          "inventory_name": "Grooveshark",
          "seller_member_name": "Google AdExchange",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 972,
          "seller_member_id": 181,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1798102
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 17691200,
          "avg_imps": 17691200,
          "inventory_name": "Playlist",
          "seller_member_name": "Google AdExchange",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 104,
          "seller_member_id": 181,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1796215
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 16504800,
          "avg_imps": 16504800,
          "inventory_name": "AdSense Long Tail - Games",
          "seller_member_name": "Google AdExchange",
          "geo_country_name": "Worldwide",
          "geo_country": "--",
          "inventory_id": 79,
          "seller_member_id": 181,
          "segment_id": 94425,
          "inventory_type": "inv_src",
          "id": 1792146
        }
      ]
    },
    "status": "OK"
  }
}
```



**List inventory, ordered by `avg_imps`, from the top 3 sellers on whose
inventory your segment has been seen**

``` pre
$ cat report-request.json
{
  "sync-report": {
    "filters": [
      {
        "segment_id": 94425,
        "geo_country": "US"
      }
    ],
    "orders": [
      {
        "direction": "DESC",
        "order_by": "avg_imps"
      }
    ],
    "count": 3,
    "report_type": "segment_overlap"
  }
}
```



``` pre
$ curl -b cookies -X POST -d @report-request "https://api.appnexus.com/sync-report"
{
  "response": {
    "dbg_info": {
      "version": "1.12.39",
      "start_microtime": 1345231627.9961,
      "time": 126.81794166565,
      "warnings": [
      ],
      "db": "master",
      "slave_hit": false,
      "instance": "17.bm-hbapi.prod.nym1"
    },
    "sync-report": {
      "query": {
        "orders": [
          {
            "order_by": "avg_imps",
            "direction": "DESC"
          }
        ],
        "string": "geo_country:US AND segment_id:94425 AND inventory_type:0",
        "ast": {
          "inventory_type": 0,
          "segment_id": 94425,
          "geo_country": "US"
        }
      },
      "count": 3,
      "offset": 0,
      "total_count": 104,
      "data": [
        {
          "audit_type": "any_status",
          "avg_total_imps": 893806800.0,
          "avg_imps": 338874800,
          "inventory_name": "Google AdExchange",
          "seller_member_name": "Google AdExchange",
          "avg_uniques": 25875000,
          "geo_country_name": "United States",
          "geo_country": "US",
          "inventory_id": 181,
          "seller_member_id": 181,
          "segment_id": 94425,
          "inventory_type": "seller",
          "id": 1790516
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 349341500,
          "avg_imps": 310694500,
          "inventory_name": "OpenX",
          "seller_member_name": "OpenX",
          "avg_uniques": 9203400,
          "geo_country_name": "United States",
          "geo_country": "US",
          "inventory_id": 357,
          "seller_member_id": 357,
          "segment_id": 94425,
          "inventory_type": "seller",
          "id": 1830356
        },
        {
          "audit_type": "any_status",
          "avg_total_imps": 424966400,
          "avg_imps": 284220200,
          "inventory_name": "Rubicon",
          "seller_member_name": "Rubicon",
          "avg_uniques": 11085600,
          "geo_country_name": "United States",
          "geo_country": "US",
          "inventory_id": 459,
          "seller_member_id": 459,
          "segment_id": 94425,
          "inventory_type": "seller",
          "id": 1838429
        }
      ]
    },
    "status": "OK"
  }
}
```





