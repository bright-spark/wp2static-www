---
title: Developing a static site generator for WordPress
linkTitle: Developers
description: Developer documentation for WP2Static improvement and extensibility.
weight: 100
menu:
  sidebar:
    identifier: developers
---

Documentation for developers, systems people who would like to know how the plugin works
 and how it can be used within their development pipeline.

## Application flow

The flow of information as we export and deploy a static version of our WordPress site

```
URL Detection
   |
Crawling
   |
Post Processing
   |
Deployment
```

## Functional description

WP2Static detects and crawls all HTML, CSS, JS, images and other resources in the WordPress site
 it is installed in, generating a self-contained static website, with URLs and other post-processing
 filters applied.

It allows you to deploy the generated static site to a staging or production environment.

WP2Static detects resources in a WordPress site by querying its database, installed plugins, themes and
 the filesystem for known resource paths. An initial list of URLs to crawl is generated from these
 detected URLs. The user has control over WP2Static's detection levels.

As WP2Static crawls your site, it can optionally discover URLs to any resources not already detected.

The expected output of the crawling phase is a self-contained static website. This site should be
 identical in structure and form to the original WordPress site, with minimal processing to allow it
 to work as a static site (ie, a permalink of `/my-post/` will become a directory `/my-post/`,
 containing an `index.html` file, required for static site serving).

Unless a URL is skipped due to caching or a particular rule, the content at the URL (HTML, CSS, image, etc)
 is inspected and if qualifies, is included in the generated static site.

Post-processing generates another static-site directory, this time, with URLs rewritten and other optimizations
 made, preparing a static site ready for deployment.

WP2Static can automatically deploy the generated static site to local or remote locations, with
 functionality provided by add-on plugins.

Developers can extend WP2Static's fuctionality through WordPress actions/filters or by using WP2Static's
 WP-CLI commands.

A [WP2Static Add-on Boilerplate](https://github.com/WP2Static/wp2static-addon-boilerplate) aim to serve as a starting point / reference for extending WP2Static with your own plugins or functions. [see blog post](https://wp2static.com/blog/easier-addon-development/)
