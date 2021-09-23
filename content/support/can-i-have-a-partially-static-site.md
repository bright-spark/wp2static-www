---
title: Can I have a partially static site?
description: Hybrid static sites involve keeping some URLs served by the WordPress dev server.
weight: 60
---


> Can I keep my dynamic WordPress site for WooCommerce or other heavily dynamic sections, but serve static for the rest?


---

I've paraphrased the question above, but we get many similar ones, so time to provide a common answer!

TL;DR - it's possible, but with extra effort and complexity you'll need to consider.

The two biggest benefits WP2Static users enjoy are security and performance. By keeping any dynamic parts of your WordPress site exposed to the public, you're likely to lose most of the potential security benefits of going static.

Where this may still make sense, is when your WooCommerce or membership parts of your site are worth isolating and you're willing to accept the risk of keeping them as publicly exposed WordPress. For this, you have a few options:

 - clone the site and run your public WordPress from a subdomain/subdirectory
 - set up your webserver to prioritize index.html files over dynamic WordPress URLs
 - set up your webserver to first look for a path's match in a subdir and rewrite that to the dynamic path

Phew, I get tired just thinking about setting those up!

If the only dynamic content you're worried about are forms or search, I recommend just replacing those, see options at:

 - [Contact Forms for Static Websites](/docs/basics/contact-forms-for-static-sites/)
 - [Search Options for Static Sites](/docs/basics/search-options-for-static-sites/)

There are also great options for e-commerce, such as [Snipcart](https://snipcart.com/).

If you're still wanting to keep a WordPress site publicly-exposed, then trying to use WP2Static to do a hybrid approach probably isn't worth your time. Instead, you may use other WordPress hardening and performance techniques, such as:

 - hiding WordPress common admin URLs
 - disabling unnecessary services, APIs, etc
 - running a Web Application Firewall like CloudFlare in front of your site
 - running WordPress specific threat detection plugins like Sucuri
 - enabling [redis](https://redis.io/) for object/page caching
 - enabling caching via plugins like W3 Total Cache

Even though I enjoy playing with technical things, my preference is for a fully static site, these days with any required dynamic functionality offloaded to a small DIY or hosted web service.

The choice to keep running a dynamic, publicly-exposed WordPress site is one you'll need to decide for your own use case and what you prefer to spend your time on - content and marketing or fixing hacked/slow WordPress sites ;)

Cheers,

Leon
