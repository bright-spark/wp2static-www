---
title: Algolia Search Add-On
linkTitle: Algolia Search
weight: 35
slug: algolia
snipcart: true
---

Enable Algolia search for your static site.

### How it works

The Algolia search add-on is complimentary to WebDevStudio's [WP Search with Algolia](https://wordpress.org/plugins/wp-search-with-algolia) plugin, which is a maintained fork of Algolia's abandoned official WP plugin.

Whilst that plugin does a great job of providing Algolia search functions to WordPress, this add-on completes a few extra steps required to make it compatible with a static site, such as what WP2Static generates:

 - rewrite URLs sent to Algolia to be site root relative (ie, `https://example.com/sample-page/` becomes `/sample-page/`

We do this because your WordPress development site is almost always going to be a different domain/subdomain to where you host your WP2Static generated static site. By rewriting to site root relative URLs, we allow the InstantSearch to work identically on your development server as in your static site, for less unexpected suprises when you publish!

 - loads Algolia's InstantSearch on dedicated /search/ homepage

In development, on a typical WordPress site, Algolia InstantSearch doesn't require any server-side code to run, but it does use WordPress' templating system to detect when we're viewing a "search page" and only then load the InstantSearch required template. We create this /search/ page and force WP to consider it a "search" page, so that the Algolia plugin renders it's search form/results there.

 - route WP default search queries to new search page

By default, WP will send queries to `https://example.com/?s=my+query`, but in a static site, we can't use the homepage for both regular homepage and search results page, so we route search queries to the dedicated page we created, ie `/search/?s=my+query`.


### Configuring the WP Search with Algolia plugin

We currently support the Instantsearch.js mode of the [WP Search with Algolia](https://wordpress.org/plugins/wp-search-with-algolia) plugin. Choose this from the Algolia > Search Page options and "Save changes".


### WP-CLI commands

As is often the case, I needed some scripts to quickly check what was going on in Algolia while developing this add-on. Creating WP-CLI commands for these scripts helped me in development, but may also help you during regular usage or if you're looking to extend this add-on or create your own.

 - `wp wp2static algolia list_indices`
 - `wp wp2static algolia list_objects`

### Troubleshooting

 - check WP2Static's Logs for any errors
 - check webserver/PHP's error logs on server
 - check indices in Algolia's web UI
 - use the WP-CLI commands above to check your Algolia indices and objects


