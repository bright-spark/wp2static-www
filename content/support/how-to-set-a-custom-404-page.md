---
title: How to set a 404 page in static website?
description: Custom 404 page setup for your WordPress static website by WP2Static.
weight: 80
---

> Is there a way for force wp2static to crawl a 404 error? 

> I have a couple of sites at s3 and i need to provide a static version of the 404 page. 
> If I enter a forced URL for wp2static to crawl e.g. /error.html - it will not crawl the URL as it 404's (error.html does not exist, I was simply trying to see if I could force crawl the rendered 404 error page from wordpress). 

Good question!

We're looking into ways to provide a streamlined solution to this in future versions/add-ons, but for this case with Amazon's S3, we recommend the following:

 - set your desired 404 page within WordPress as a regular page (not using any 404-page plugins or WordPress's own 404 page template
 - ensure that this page is included in your export and accessible within the static site, ie `/my404page/`
 - within your S3 bucket's static website settings, choose this page as your default error document, either `/my404page` or `/my404page/index.html`

Due to not having access to a database or the server's `REQUEST_URI` with S3, if you wan to have dynamic error pages, ie, make suggestions to the user based on the non-existent URL they requested, this could be done with CloudFront behaviours. CloudFront is a great way to speed up your S3-stored static website and allow attaching serverless functions to add dynamic functionality to your site where needed.
