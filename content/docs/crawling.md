---
title: Crawling
linkTitle: Crawling
slug: crawling
author: Leon Stafford
summary: WP2Static's crawling process explained. 
weight: 30
---

The Crawling phase of WP2Static requests each detected URL and saves it in a static site friendly format.

```
URL Detection
   |
Crawling    <--- here
   |
Post Processing
   |
Deployment
```

<br>

When you visit a page in your WordPress site, the contents are assembled from PHP scripts, database entries and any manipulations themes and plugins apply. WP2Static saves a copy of the page as your users see it - after all the assembly has been done.

### How WP2Static's crawling works

For each detected URL in our Crawl Queue, WP2Static:

 - requests the URL and saves the contents to a file
 - adds successfully saved URLs to the Crawl Cache

**Static site friendly HTML pages**

In your WordPress site, visiting a path like `https://example.com/posts/my-sample-post/` relies on your webserver and WordPress to route that URL to show the appropriate post content. There is no directory /posts/ within your WordPress installation.

With a static website, we have no PHP or database to magically route such URLs. Instead, we need to create directories to support the full path being requested, ie `/posts/my-sample-post/`. Most static site hosting providers work by routing requests to directories to a default document within that directory, usually `index.html`. If this wasn't the case, URLs in static sites would need to look like: `https://example.com/posts/my-sample-post/index.html` - not ideal.

When WP2Static crawls a URL like `https://example.com/posts/my-sample-post/`, it will thus create the following directories and file within your *Generated Static Site* directory: `/wp-content/uploads/wp2static-crawled-site/posts/my-sample-post/index.html`.

For static assets, such as images, CSS, JavaScript, fonts, etc, it will make the required directories, similar to an HTML page, but will then just save the asset file, without needing to do an extra steps.

**Crawl Caching**

If everytime we change a page in our WordPress site, WP2Static needed to detect, crawl, post-process and deploy every single URL again, it would be very slow (ask anyone who used versions 6 and earlier!).

When we've successfully crawled a URL, we add it to WP2Static's *CrawlCache*. On subsequent crawls, we skip any URLs already in our CrawlCache.

**Caching is hard!**

> There are only two hard things in Computer Science: cache invalidation, naming things, and off-by-one errors

I need to give website caching it's own page in our docs, as there are so many layers of cache between your user and your website. For now, I'll just explain the decisions made around our Crawl Cache.

 - every succeesfully crawled URL is added to the CrawlCache
 - URLs in the CrawlCache aren't crawled again until removed from the CrawlCache (invalidated)
 - editing/deleting a post or page will invalidate that URL in the CrawlCache
 - more actions (changing theme, setting different homepage, etc) should invalidate more URLs (not yet implemented)
 - CrawlCache can be completely cleared via WP2Static's UI, WP-CLI or a custom function

I opted to aggressively cache all successfully crawled URLs and incrementally fine-tune the cache-invalidation mechanisms. For now, when you edit/delete a post or page, that invalidates the CrawlCache for that URL, allowing it to be freshly crawled in the next Job.

Because of this, you may find that changing a menu, switching themes or other WordPress content updates don't properly reflect in your next static site export. To alleviate this, you can manually clear the CrawlCache between jobs in WP2Static's UI or if using WP-CLI, add the `wp wp2static crawl_cache delete` command before the `wp wp2static crawl` command.

Before the official release of version 7, I'm likely to either:

 - add a checkbox to UI to disable CrawlCaching
 - improve the CrawlCache invalidation logic to be more robust

### Crawling options

**HTTP basic authentication credentials**

In the core WP2Static plugin, the only Crawling option you can set is if you are using HTTP basic authentication on our development site (highly recommended!), you can enter the username and password on the main WP2Static > Options UI screen (or using WP-CLI).

HTTP basic auth is not required to use WP2Static, so you can leave those 2 fields empty if not using HTTP basic auth. When saved, as with other WP2Static sensitive information, we encrypt the basic auth password when saving to the database.


![Crawling options](/images/crawling-basic-auth-options.png)

HTTP basic authentication adds an extra login/password to your development WordPress site. Because only you and your team should be able to access this site, it makes sense to lock it down with an extra layer of security, keeping it away from malicious users and bots. Only your deployed static site needs to be publicly accessible. This is one of the key ways in which WP2Static can offer a much more secure setup for WordPress sites.


### Verifying which URLs have been crawled and cached

 - via WP2Static's UI: Caches > Crawl Cache > Show URLs
 - via WP-CLI: `wp wp2static crawl_cache list`

### Verifying which URLs were saved

 - via WP2Static's UI: Caches > Generated Static Site > Show Paths
 - via WP-CLI: `wp wp2static static_site list`
 - via the directory: `/wp-content/uploads/wp2static-crawled-site/`

### Ways to trigger URL detection

 - via enqueuing a Crawl Site Job
 - via the WP-CLI command `wp wp2static crawl`
 - calling the Crawler class:
```php
<?php
$crawler = new \WP2Static\Crawler();
$crawler->crawlSite( \WP2Static\StaticSite::getPath() );
```

### Ways to clear the Crawl Queue

You generally don't need to manually clear the Crawl Queue, as WP2Static will clear it before each new detection Job. It's also a part of the whole detect, crawl, post-process, deployment Job that takes up very little time, even on very large sites (takes only seconds).

 - via WP2Static's UI: Caches > Crawl Cache > Delete Crawl Cache
 - via WP-CLI: `wp wp2static crawl_cache delete`

### Ways to clear the files saved from crawling

 - via WP2Static's UI: Caches > Generated Static Site > Delete Files
 - via WP-CLI: `wp wp2static static_site delete`


### Example Crawl Cache

The CrawlCache should look identical to your CrawlQueue (Detected URLs) after a full crawl has completed, ie a sampling:

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
### Example Generated/Crawled Static Site

This should look similar to your CrawlCache, noting the `index.html` preppended to URLs with HTML content:

```
/category/uncategorized/index.html
/category/uncategorized/page/1/index.html
/hello-world/index.html
/index.html
/page/1/index.html
/sample-page/index.html
/wp-content/plugins/wp-search-with-algolia/css/algolia-autocomplete.css
/wp-content/plugins/wp-search-with-algolia/css/algolia-instantsearch.css
/wp-content/plugins/wp-search-with-algolia/includes/admin/css/algolia-admin.css
/wp-content/plugins/wp-search-with-algolia/includes/admin/fonts/algolia.woff
```

### What happens to the crawled URLs?

In a typical workflow, crawled files are saved to the `/wp-content/uploads/wp2static-crawled-site/` directory. This directory then undergoes the *[Post-processing](/docs/post-processing)* phase of a WP2Static Job before deployment.

### Crawling FAQs

> I have some CSS or XML served from `/my-css/` or `/feed/` paths, will that work?

Because a `/feed/` URL is common in WordPress, I'm working on a way to support maintaining those URLs. With  static hosting providers offering serverless functions or redirects, this should be possible with a bit of work.

For the case of CSS, images or other files served without file extensions in WordPress, it's less common and more of an exception, so I'd advise to avoid the theme/plugin that's generating such URLs. I can look into supporting such cases, but it's going to be further down the list of priorities. You may be able to workaround such a case with a plugin like Autoptimize, which could make troublesome static asset URLs more friendly for static site export.
