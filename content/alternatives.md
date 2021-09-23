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


 - [Simply Static](https://wordpress.org/plugins/simply-static)

  Simply static came onto the scene during a hiatus of WP2Static development years ago and did a really good job of providing a simple yet solid solution. WP2Static came back and evolved into what it is today. Sadly, Simply Static development died - but hopefully someone (maybe me) will patch it to work with the latest WP versions as a simple alternative WP plugin to generate static sites.

 - [Appish](https://appi.sh)

  This is a little side project I started, which allows simple static site conversion with URL rewriting for any publicly accessible website. Feedback encouraged.

 - Scraping frameworks/custom code

   I really enjoyed using the Python Scrapy project years ago, which has so much power and extensibility as a scraping tool. You'll find ways to scrape whole websites in most any programming language, usually with a bunch of frameworks/guides available to help you get started.


### Commercial Alternatives

 - [Shifter](https://www.getshifter.io)

  Shifter started out with their own WordPress plugin, I believe used by a web consulting company out of Japan. They now have teams spanning the Pacific and do a lot of good community work, including keeping a lot of useful code and plugins open source. They offer a WordPress as a service type setup, which means you'll need to host with them, but then get some tools to output static version of your site to host with them or deploy externally. If you need on-premises/enterprise arrangements, I think their consulting arm will be happy to arrange that.

 - [Strattic](https://www.strattic.com)

  Similar to Shifter and HardyPress, Strattic is a platform for your to host your WordPress, offering some nice features for generating a static site and dealing with forms, search, etc. They've just raised a massive amount of VC funding and built a team including some big names in PHP, so exciting to see what products/services they release. With their noticeable funding, hopefully more WordPress users and industry people will learn about this whole WordPress to static site niche!
 
 - [HardyPress](https://www.hardypress.com)

  Again, similar to Shifter/Strattic, I haven't talked to the HardyPress team in a while, but seem like a nice group of people out of Italy. I imagine the feature set is comparable to the other two.

 - [Sitesauce](https://sitesauce.app)

This is a really cool new project by Miguel Piedrafita, that provides static conversion and serving of any sites, not just WordPress. Currently, limited to serving via Vercel. Great work so far in a short time span, so one to watch out for! 


 - [SiteSucker](https://ricks-apps.com/osx/sitesucker)

  SiteSucker is similar to using a GUI version of the HTTrack tool mentioned above, but with less options and only available on macOS. The app store version costs about $5, but you can download other versions for free on their site that should still work with the latest macOS.

 - Any other website mirroring software

 Anything that gives your a full copy of your website, often branded as "website archiver" or "offline website downloader" may do the job for you. You'll probably still need to do some URL rewriting to get things ready for deployment, but with a little DNS fiddling, just one of these tools may be enough.
