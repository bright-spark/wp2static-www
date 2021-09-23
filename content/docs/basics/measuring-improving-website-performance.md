---
title: Measuring & improving website performance
weight: 25
---

> If you can’t measure it, you can’t improve it. -- Peter Drucker

Websites need to be fast. For attention, engagement, conversions.

### How fast does my website need to load?

 - faster than your competitor's
 - faster than the limit of your audience's attention span
 - faster than it did last month

Those are all relative values, as there's no magic number that makes sense for everyone.

### How to decide your target load times?

Here's some ways you can put concrete numbers to the values above.

#### Evaluate your competitors and know where you stand

_Why does it matter how fast your competitor's site loads?_

In case the user hits the results for a keyword search and opens each of the top 5 links in new tabs, the first place that gives them the information they are looking for is often the winner, with the other tabs being left to die. If your site is still loading when they quickly click through those tabs, your site may miss out on that opportunity!

Not only do users discriminate on page load speed, the search engines (is there more than one you care about?!?) are known to look favorably on fast loading sites, which can get you higher up the search engine results pages.

### Take a snapshot of you and your competitor's page loads

If creating an elaborate automated testing/monitoring solution isn't practical to you, start with a simple spreadsheet or pen & paper. Run at least a few different speed measuring tools against your site and your 5 biggest competitor's sites. Do the test from datacenters that matter to you. If you have a global audience, run each set of tests from the US, Asia and Europe. Log each set of results, along with the date.

> Congratulations! You've just measured the performance of you and your competitors' sites and can use this to start improving your load speed!

### Is your page load speed turning away people from your site?

If I think your site is going reveal the meaning of life to me, then I may wait a few seconds for it to load.

If, on the other hand, I'm shopping around on a few sites to get my information, then I'm going to give your site a very quick chance to engage me and convince me to stay.

There should be a general pattern when you have a high enough amount of traffic data to analyse. You should compare your page load speeds against your audience's bounce rate for that page or another key performance metric for your site, such as sales conversions.

> Look for the point at which your page load improvements stop making a difference to your bounce rate or conversions. That is now a page load time you need to remain faster than.

#### Faster than you were last month

Just like ad spend, you need to decide how much you can afford to spend on page load optimizations vs the risk of lost traffic/sales when you let page load speeds fall behind.

Once you've got some concrete numbers of your competitor's speeds and the slow point at which your audience drops, use these as your benchmark and monitor them over time. You'll generally never want to see the page load times drop, unless you are confident that introducing heavier page content or styling will add more value than you'll lose due to slower loading.

> And remember, your competitors will eventually read things like this and start improving their speeds, if they're not already! Stay dilligent!

### Increasing the speed of your site

You'll find that you can probably get 80% of the way to your target speeds by following common page load optimization techniques, including:

 - reducing total content size (compress images, reduce fonts, concatenate and minify)
 - reducing the number of requests
 - enabling gzip, HTTP/2, headers on web server
 - asynchronously load assets
 - implementing caching techniques

The last 20% may take you a lot longer to shave off those extra milliseconds and get your site to its target load times:

 - changing your web host
 - changing your DNS provider
 - adjusting amount of requests per domain
 - optimizing code structure in HTML/CSS/JS

WP2Static helps in a few areas here:

 - drastically increases the requests per second your server can handle
 - ability to host on globally distributed, static site optimized hosting
 - allows for deeper optimization of WordPress generated source code

_A note on requests per second: When you test your homepage or a single page load in a tool, it doesn't show realistic performance for when 100, 1,000 or 10,000 visitors all hit your server at once. This is where static site hosting really shines and we'll cover more specifically with "Load testing" in another article._

### Tools to help you measure

These tools are a good place to start in your web performance measurement

 - [Lighthouse](https://developers.google.com/web/tools/lighthouse)
 - [WebPageTest](https://www.webpagetest.org/)
 - [GTmetrix](https://gtmetrix.com/)
 - [Pagespeed Insights](https://developers.google.com/speed/pagespeed/insights/)
 - [Pingdom](https://tools.pingdom.com/)
 - [Sitespeed.io](https://www.sitespeed.io/) _self-host_

For load testing

 - [OctoPerf](https://octoperf.com/)
 - [LoadImpact](https://loadimpact.com/)
 - [Loader](https://loader.io/)

### Help with improving your website performance

Still struggling to get to your target page speed? We're not offering consulting right now, but if you [contact us](/contact) with your site details, we'll take a look and if we find areas to improve things, we'll add recommendations to our docs to help everyone.



