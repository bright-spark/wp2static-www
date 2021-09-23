---
title: URL Detection
linkTitle: URL Detection
slug: url-detection
weight: 20
---

URL detection is the first part of any WP2Static Job, as per this workflow illustration:

```
URL Detection  <--- here
   |
Crawling    
   |
Post Processing
   |
Deployment
```

<br>
We need to detect URLs in order for WP2Static to know which URLs to *crawl* and save as static files that later get deployed.

### How URL detection works

WP2Static detects all of your WordPress URLs, by querying the database for all kinds of URLs:

 - posts
 - pages
 - archives
 - categories
 - &amp; many more...

It also looks at all the files within your WordPress installation, to determine any other URLs that we can't identify just from the database, such as theme files, cache dirs, robots.txt, &amp; some more...


> But I don't want to include *all* my old media gallery files!

That's fine, we accomodate selectively filtering/adding URLs to your *Crawl Queue* (your list of detected URLs). The challenge is, we don't know what each user wants, so we default to detecting *ALL* URLs we can identify from your site, then let you adjust this list of URLs, by the plugin's options, custom filters or via add-ons.

> There are a bunch of URLs included that I don't think I need

This is usually fine to just leave them in there. Thanks to WP2Static's caching mechanisms, after your initial job of detecting, crawling, post-processing and deploying, only files changed since the previous deploy need to be crawled, processed and deployed again.

### Verifying which URLs have been detected

 - via WP2Static's UI: Caches > Crawl Queue (Detected URLs) > Show URLs
 - via WP-CLI: `wp wp2static crawl_queue list`

### Ways to trigger URL detection

 - via enqueuing a URL Detection Job
 - via the WP-CLI command `wp wp2static detect`
 - calling the static method `URLDetector::detectURLs()`

### Ways to modify the Crawl Queue (add/remove/transform URLs)

 - via WP2Static's UI: Options > Detection Options
 - via the filter `wp2static_modify_initial_crawl_list`
 - via the database, table named `{wp_prefix}_wp2static_urls`

### Ways to clear the Crawl Queue

You generally don't need to manually clear the Crawl Queue, as WP2Static will clear it before each new detection Job. It's also a part of the whole detect, crawl, post-process, deployment Job that takes up very little time, even on very large sites (takes only seconds).

 - via WP2Static's UI: Caches > Crawl Queue (Detected URLs) > Delete Crawl Queue
 - via WP-CLI: `wp wp2static crawl_queue delete`

### Example Crawl Queue (Detected URLs)

A small sampling of what URLs may be detected in your WordPress site, given that your theme, posts, pages, permalinks, etc can vary between sites. Crawl Queue is sorted alphabetically, as are other listings of paths/URLs in the site, to make it easier to compare/troubleshoot a missing file.

```
/
/category/uncategorized/
/category/uncategorized/page/1/
/favicon.ico
/hello-world/
/page/1/
/pages/page/1/
/robots.txt
/sample-page/
/sitemap.xml
/wp-content/plugins/wp-search-with-algolia/css/algolia-autocomplete.css
/wp-content/plugins/wp-search-with-algolia/css/algolia-instantsearch.css
/wp-content/plugins/wp-search-with-algolia/css/algolia-logo.svg
/wp-content/plugins/wp-search-with-algolia/includes/admin/css/algolia-admin.css
/wp-content/plugins/wp-search-with-algolia/includes/admin/fonts/algolia.eot
/wp-content/plugins/wp-search-with-algolia/includes/admin/fonts/algolia.svg
/wp-content/plugins/wp-search-with-algolia/includes/admin/fonts/algolia.ttf
/wp-content/plugins/wp-search-with-algolia/includes/admin/fonts/algolia.woff
...
```

### What happens to the detected URLs?

Our Crawl Queue (detected URLs) is consumed by the *[Crawling](/docs/crawling)* phase of a WP2Static Job.
