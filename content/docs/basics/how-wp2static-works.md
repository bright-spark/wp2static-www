---
title: How WP2Static works
linkTitle: How WP2Static works
slug: how-wp2static-works
weight: 20
---

WP2Static is a unique security and performance plugin for WordPress. It generates a snapshot of your WordPress site, which looks identical to your site’s audience, but with the complicated parts of a WordPress site removed from behind the scenes.

This snapshot of your WordPress site contains just the generated HTML, CSS and Images of your site. This is the same as what you see if you inspect the source code of your website in a browser (right-click > view source).

The result is what is known as a static website.

### Will my site's design change?

#### Original WordPress Site

![example WordPress site rendering](/images/example_website.png)

#### Published Static  Site

![example WordPress site rendering](/images/example_website.png)

Because we only remove the complexity behind the scenes (server-side), what your site’s visitors see (the front-end) will not change at all.

What will change is the security and speed of your site. And likely your hosting costs will be greatly reduced!

### A more secure and website

With no database or PHP code running your static website, we greatly reduce the opportunities for your site being hacked or encountering errors that break your site for visitors.

### Is it unhackable?

Some competitors in the static site space claim “unhackable websites”. This is untrue and dangerous hype . As long as you have the ability to change the content of your website, then anyone who can gain access to your credentials can do the same. Just as with any other usernames and passwords you use for your email, social media or other online accounts, you should be diligent in keeping your passwords for any accounts secure.

Where you host your website is also a potential attack vector. Whilst one can feel safer with a larger company and their team of security professionals, major incidents over the past few years should remind us that where there is motivation on the side of the attackers, no site is “unhackable”, it’s just a matter of how much security there is and how passionate the hackers are to get in.

### How safe is a static site?

After the responsible words of warning above, we can assure you that a static site is a much more secure way to host your website.

#### No moving pieces

No exposes database or server-side language (PHP), greatly reduces the opportunities for hackers to exploit your website and gain access.
Less need for keeping WordPress up to date

Many of the large scale WordPress hacks have been attributed to out of date plugins or themes. As the heart of WordPress, we don’t want to stop using all the great themes and plugins. But having to keep them updated, checking for compatibility with new versions and listening out for alerts is not what we want to be doing with our time.

When you “go static” with your WordPress site, you’ll end up with one WordPress server, either hosted on your local computer or on a typical server. You’ll be publishing static snapshots of your site whenever you want to update what your users see. This is already a huge improvement for most WordPress sites, on which changes are made directly to the live site – one mistake and your visitors are looking at error pages, not your content!

By maintaining your WordPress site on a different server than your live (production) site, you gain the ability to make mistakes and correct them before publishing out for your users to see.

#### Host like usual, but with added security

As the public no longer needs to access your WordPress development site (only your live static site), you can take extra steps to lock it down from potential attacks. For a site where multiple people need to contribute to the content management, you can add http basic authentication, IP whitelisting or host behind a secure VPN. How to do this is explained further in this User Guide.

#### Host locally for faster and more secure development

If you are the only one who needs to develop the WordPress website, you can really benefit from hosting it locally on your personal computer. Any computer from the last 15 – 20 years is powerful enough to host a local WordPress site. When you have a powerful laptop/desktop computer, you’ll find hosting WordPress locally to be a great experience. With the full power of your computer to run the site, pages load near instantly and if using a heavy modern pagebuilder, such as Elementor or Brizy, there is less time waiting and more time creating!

### How WP2Static creates the static snapshots of your site

Creating static snapshots of websites is not a new technique. There exist great open source tools like HTTrack and wget which can do just that. WP2Static’s big difference is that it’s been purpose built for WordPress sites, so it can work faster, by communicating directly with WordPress to know all the URLs of your site. It also allows us to do advanced rewriting of URLs from your development site to the live site’s URL. The ability to create a ZIP of your static site or deploy it to specialist static site hosts with 1-click are some of the powerful advantages it has. All of this can be run either from within your WordPress dashboard via your browser or via the command line for great control.

#### URL discovery

To speed up the crawling time of traditional crawling tools, WP2Static first detects the majority of the URLs in your WordPress site. These are all your Posts, Pages, Archive pages and more. We also add special rules to detect certain plugin and theme files that your site needs and would be missed by other crawling methods.

#### Crawling to find other URLs

WP2Static will proceed to crawl each of the discovered URLs, saving the output as static files (HTML, CSS, images, PDFs, etc). As it reads each page’s content, it will take note of any URLs it didn’t initially detect and queue them for the 2nd round of crawling and generating static files.

### Processing WordPress pages for static site hosting

The processing within WP2Static is quite advanced, allowing for multiple methods or link rewriting and ensuring your site looks identical to the original when served statically.

#### index.html files for every folder

When you visit a URL like https://oldwp2staticwww.netlify.com/documentation/ there is a webserver running on the server to understand your request and serve you the correct content. In a normal WordPress site, this request is routed (thanks to common rewrite directives in your Apache, Nginx, httpd, LiteSpeed or other webserver) and the appropriate content is loaded. Again, for a regular WordPress site, this involves executing a lot of PHP code and querying the database, then assembling it all into HTML content which is served to your browser.

With a static site, we’ve pre-generated all of this HTML content while crawling the site. We save the result into a file named index.html, which is usually the default that any static web server will look for when a user requests a URL like https://oldwp2staticwww.netlify.com/documentation/.

With your static site, in the example above, you would find a directory within your output static site named documentation. Inside of this directory, you will have an index.html file, containing all the same contents that your WordPress site shows when accessing that same URL. This is part of what keeps your static website looking exactly the same as your WordPress site, including all the URLs (keeping the SEO benefits of the original site!).

#### Link rewriting

At a minimum, WP2Static will rewrite links from your development site, ie http://dev.mydomain.com, to your live site, ie https://mydomain.com.

We can go a lot further than this, though! You can adjust the plugin’s settings to rewrite all URLs to be relative, absolute, protocol-relative or suitable for offline usage (send a snapshot of the WordPress site to your client or use in a conference with no internet access!).

#### Stripping WordPress identifying markers
Another benefit that WP2Static offers above other static site or caching tools is the ability to completely hide any traces of WordPress from your site’s source code.

Not only can you choose to strip out WordPress meta tags and things your site doesn’t need, you can also rename common WordPress directories, like wp-content, themes, uploads, wp-includes or any others. This reduces the amount of bot traffic that will be visiting your site, looking for WordPress sites to attack or spam. It is also useful to obfuscate the tools you are using to build your site, making it a bit harder for people to copy your site!

### Deploying your generated static site

Once all the crawling, processing and saving is complete, WP2Static will give you complete static snapshot of your site and optionally deploy it to your static hosting environment automatically!

The free and open source version of WP2Static gives you a full static snapshot of your site as a directory or ZIP file. You can deploy this manually by dragging and dropping into a static host like Netlify, use your regular FTP client or any custom scripts on the command line (or use WP2Static’s hooks to write your own deployment functions within your theme or plugin).

With the suite of Add-ons WP2Static offers, you can get the convenience and extra functionality of automatically deploying your generated site to services like Amazon S3, Azure, Bitbucket, GitHub, GitLab, Netlify and more!

Depending on the deployment method, this may transfer one file at a time or in batches of files, which you can control the size of within the plugin’s settings.

