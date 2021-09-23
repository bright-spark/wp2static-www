---
title: System Requirements
linkTitle: System Requirements
slug: system-requirements
weight: 20
---

These are the recommended system requirements for the WP2Static WordPress plugin.

You may have luck running the plugin in alternate configurations, but when errors occur, please try to meet these requirements to eliminate potential environmental issues.

### You'll need a WordPress installation!

That may go without saying, but this is a WordPress plugin, not a standalone product.

If you don't have a WordPress site yet, fear not, you can set one up for free on your own computer or get a $5/month VPS or look into free tiers on platforms like AWS/Heroku. You can always change where you host your WordPress site - another advantage of using WordPress as a static site generator is the ease at which you can move your WordPress installation without causing any downtime for your actual website.

### PHP

The WordPress web application is written in PHP. For security and performance, it's best to use an actively supported PHP version. As of early 2020, this should be PHP 7.3. WP2Static requires a minimum of PHP 7.2.

To see which versions are currently officially supported by the developers of PHP visit https://www.php.net/supported-versions.php

### PHP Extensions

If you are using a webserver tailored to WordPress hosting, it should already have these extensions installed. If you're building a custom server environment, please ensure these extensions are all installed and loaded. WP2Static's *Diagnostics* page should alert you to any missing extensions or potential problems with your environment .

#### cURL

cURL is used when WP2Static is crawling your URLs to make the static site and also when deploying your site via external APIs. We don't use the wp_remote_get() and wp_remote_put() commands built-into WordPress for performance and portability reasons.

#### mysql

Already a requirement to run WordPress, listed here just for thoroughness.

### PHP Configuration

Whether using PHP or the more common PHP-FPM, you may need to adjust some configuration options, depending on the size of your site and how quickly you want the static site generation to run. There are a lot of variables to consider, but these should be a good starting point.

When adjusting these values, verify that the changes have been applied. It will usually need a reloading of the PHP service. Be mindful to change the settings for both command line PHP and PHP-FPM which is usually running your WordPress application. These are usually defined in different configuration files.

#### max_execution_time

WP2Static is designed in such a way as to overcome low limits imposed by some hosting providers. Each request from the client (your browser) to the server (your WordPress application/PHP) needs to complete in the time set by this configuration option.

Where you want to be able to crawl and generate your static site as quickly as possible, this duration will need to be long enough to support that. For most sites on decent hosting, a max_execution_time of 300 (5 minutes is enough).

#### memory_limit

Certain intensive operations within WP2Static may consume high amounts of server memory. This can be when the page being processed is large or complex in structure. This is currently the case with parsing complex CSS files in particular, though work is underway to optimize this for reduced resource utilization.
 
If your exports are failing due to memory limit exhaustion, it's usually safe to double the amount that is currently defined. For sites of average complexity, on decent hosting, 256M is a good minimum to aim for in order to get decent export speeds.

#### OPcache

OPcache should already be installed, but possibly not enabled for your PHP setup. There can be a quick performance improvement by enabling and adjusting the amount of cache available to it. This again depends on the available resources of your server, so some trial and error may be necessary to find the sweet spot.
 
As with any caching, it is good to learn what PHP objects will be cached with OPcache and when/how the cache will be overwritten.

#### PHP-FPM pool

If you are only running one WordPress site on your development server and want to get the maximum performance when generating your static site, you will want to adjust the PHP-FPM pool's pm option to static. This will help utilize as many of the server's resources when crawling, along with choosing the highest number of pm.max_children without the server running out of resources.

You can spend a lot of time researching these settings, but some trial and error can get you some performance gains quickly. Just save trial and error for a webserver that is not user-facing, as mistakes may happen that cause the site to not load or potentially expose sensitive credentials.

You may also need to extend the idle-timeout settings in PHP-FPM if the process between the client and server is exceeding limits.

### Web server

WP2Static should generally work with any web server capable of running WordPress. This includes Nginx, Apache, LiteSpeed and httpd.

For best practice, you should be running your WordPress site on a development server different than your live site is hosted on. For such a server, not hosted on your local computer, it is highly advised to protect your WordPress site from public access using http basic authentication, IP whitelisting or putting it behind a VPN for only you, your staff and client to access. This will prevent bots, search engines and other unwanted traffic from poking around your development server. It is also recommended to have a firewall on this server, restricting access only to the ports required (typically SSH, HTTP, HTTPS and ICMP).

If you are running a DNS level caching/security service in front of your WordPress development site, such as Cloudflare, AWS's WAF, etc, these may mistakenly detect WP2Static's crawling mechanism or your server's IP as malicious and block access. For a suitably protected WordPress development site, you should not need to run such services, but that is a security decision we cannot make for you. You can whitelist WP2Static in these security tools by using our user-agent: *WP2Static.com*.

Similarly, if running caching mechanisms on your web server itself, such as mod_pagespeed, you will need to at least disable the URL modifications that they implement. 

### WordPress

There are several settings required in WordPress to ensure smooth static exports with WP2Static.

#### Permalinks

A static site will replicate the permalink structure you have defined in the WordPress Settings > Permalinks within your admin dashboard. As static sites generally cannot serve content from php files, your permalink structure cannot contain the index.php in them.

So a permalink structure of /%postname%/ will be fine, but/index.php/%postname%/ will not work.

#### Site URL and Home URL

Much of the plugins current functions rely heavily on what URLs are defined in your Site URL and Home options.
 
If you access your site via TLS (links start with https://), then your Site URL and Home options must also be starting with https://
 
If you are running from within Docker or you access your site using local host file overrides, the server that hosts WordPress will also need to have those host entries defined. You can test this by fetching the Site URL from the command line of the web server, using a tool such as cURL, wget, FTP or with a browser such as lynx.

#### Security Plugins

Some WordPress security plugins may throw false-positives of WP2Static's crawling mechanism. If you have the ability to whitelist certain user-agents, WP2Static used the user-agent of WP2Static.com.

If you're using the best practice of protecting your WordPress development site from the public or you are hosting locally, you should not need to use any WordPress security (and possibly no caching plugins) and can activate them, for better performance.

#### Redis / memcached

Though a static site is itself a great caching mechanism for your live site, when generating your site, you will still benefit from object and page caching where possible with Redis or memcached.

#### MySQL / MariaDB

The general steps for optimizing your database setup and query caching for WordPress will also benefit in faster exports of your static site. It is out of the scope for this user guide, but WP2Static doesn't rely heavily on the WordPress database, so no special attention should be required.

For your WordPress development server, it is good practice to limit access to the WordPress database to only the IP/socket of the WordPress server.
