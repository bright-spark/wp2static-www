---
title: Alternatives
linkTitle: Alternatives
menu:
  sidebar:
    identifier: alternatives
weight: 140
slug: alternatives
---

WP2Static isn't the only way to use WordPress to generate a static HTML site.

I like to think WP2Static has the best all-round solution out there, but everyone's needs are different, so go with whatever works best for you. I won't go into the pros/cons of each one right now, but I can expand this article with the major differences later. If you know of any other tools/services, please [contact me](/contact) and I may add them here..

### Open Source Alternatives

 - [HTTrack](https://www.httrack.com)

  HTTrack has been around for ages, runs on almost any system from the CLI or GUI and specialises in website archival for offline use. Scripting this or running occasionally and rewriting URLs as needed in the output can give you a static version of your WordPress site.

 - [Wget](https://www.gnu.org/software/wget)

  Wget is a more generic tool for requesting remote URLs. It is very scriptable and allows mirroring a complete website by recursively following links it discovers.


 - [Appish](https://appi.sh)

  This is a little side project I started, which allows simple static site conversion with URL rewriting for any publicly accessible website. Feedback encouraged.

 - Scraping frameworks/custom code

   I really enjoyed using the Python Scrapy project years ago, which has so much power and extensibility as a scraping tool. You'll find ways to scrape whole websites in most any programming language, usually with a bunch of frameworks/guides available to help you get started.


### Commercial Alternatives

 - [Strattic](https://www.strattic.com)

Strattic is an end-to-end managed WordPress to static publishing and hosting platform. Leon has recently joined the expert team at Strattic, building a fully automated, end-to-end solution for secure and performant WordPress hosting. [Try it free for 30 days](https://app.strattic.com/signup?utm_campaign=WP2Static&utm_source=WP2&utm_medium=link&utm_content=trail), no credit card required.
 
 - [SiteSucker](https://ricks-apps.com/osx/sitesucker)

  SiteSucker is similar to using a GUI version of the HTTrack tool mentioned above, but with less options and only available on macOS. The app store version costs about $5, but you can download other versions for free on their site that should still work with the latest macOS.

 - Any other website mirroring software

 Anything that gives your a full copy of your website, often branded as "website archiver" or "offline website downloader" may do the job for you. You'll probably still need to do some URL rewriting to get things ready for deployment, but with a little DNS fiddling, just one of these tools may be enough.
