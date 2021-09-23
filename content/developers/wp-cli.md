---
title : WP-CLI
linkTitle: WP-CLI
weight: 10
tags: [workers, cloudflare, sftp]
---

[WP-CLI](https://wp-cli.org/) is a developer-friendly way to manage WordPress sites. WP2Static integrates
 with WP-CLI, adding useful commands to generate and deploy your static site.


## WP-CLI commands

Running the command `wp wp2static` will give you all the avaiable options and is the best way to know
 which commands are available on your system. WP2Static Add-ons may provide additional commands.

WP-CLI commands will apply to the site relative to the system path you run them from.

### System user when running WP-CLI

TL;DR - run `wp` commands as the same user as your webserver

When WP-CLI runs, it will likely be using the system default PHP, which executes in a different environment than when accessing your WP site via the webserver. This means that the PHP configuration is likely pulled from a `php.ini` vs a `php-fpm.conf` type file, so check you have any webserver environment customizations you need also in your CLI PHP environment.

It also means that when you run the `wp` command from the CLI, you'll be doing so as the currently logged in user, unless specified otherwise. For WP2Static and other plugins which touch files on the webserver, this can lead to issues with file permissions, ie - `mylocaluser` runs `wp wp2static generate`, which sets files with ownership of `mylocaluser`, but then when you perform an action via the webserver, your webserver user (`www`, `www-data`, etc) may not have permissions to use those files, resulting in unexpected errors.

To change the user who runs `wp` commands:

#### OpenBSD

Edit your `/etc/doas.conf` file, adding a line:

`permit persist MYUSERNAME as www cmd wp`

You may then choose to alias the command for easier usage. In your `~/.profile`:

`alias wp='doas -u www wp'`

Alternatively, configure your web root to be owned by `{MY_USER}:www` and be group-writable, then you may run `wp` as your regular user.

#### Linux/macOS/Windows

Try something similar with `sudo -u www wp` or `runas /noprofile /user:mymachine\www wp`. [Let us know](/contact) what works and we'll update this doc.


### Multisite WP2Static WP-CLI commands

When running WordPress in a Network/Multisite setup, add the `--url=<url>` argument to force the command to be
 applied to the WordPress site with that Site URL.

### Undefined environment variables when running WP-CLI commands

 - `$_SERVER['SERVER_NAME']`
 - `$_SERVER['HTTP_HOST']`
 - `$_SERVER['DOCUMENT_ROOT']`

You may need to override these in your `/wp-config.php` file to get identical behaviour when executing WP2Static commands via WP-CLI vs from within the WordPress web application.

### Issue with some detected URLs not matching your site's protocol

As per [this issue's workaround, provided by @JamesColeman-AH](https://github.com/leonstafford/wp2static/issues/582#issuecomment-740821555), you may be hosting your dev site with `https` protocol/scheme, but encounter some `http` URLs, leading to crawl issues.

In this case, you can force the `HTTPS` variable on when running from CLI, like so:

`export HTTPS=on`

That hopefully won't be needed much longer, once a proper fix is added to plugin's code.

### WP-CLI examples

---

#### Quickstart: Install and activate WP2Static, set deployment URL and generate static site


 - `wp plugin install --activate static-html-output-plugin `
 - `wp wp2static options set deploymentURL https://example.com`
 - `wp wp2static detect`
 - `wp wp2static crawl`
 - `wp wp2static post_process`

Your static site will now be available at wp-content/uploads/wp2static-processed-site.


Note: the plugin's `slug`, as used within the official wp.org repo is `static-html-output-plugin`,
 not `wp2static`. Because, [reasons](/about/).

---

#### Quickstart: Generate static site and deploy using Netlify CLI tool

This is a good option for very large sites deploying to Netlify, as only changes will be deployed each time.

 - `wp wp2static options set deploymentURL https://example.com`
 - `wp wp2static detect`
 - `wp wp2static crawl`
 - `wp wp2static post_process`
 - `cd wp-content/uploads/wp2static-processed-site`
 - `netlify deploy`

The [Netlify CLI](https://github.com/netlify/cli) will give you an interactive prompt to follow.

---

#### Quickstart: Generate static site and deploy via sFTP

Until there is a dedicated Add-on supporting sFTP, the following commands will work.

 - `wp wp2static options set deploymentURL https://example.com`
 - `wp wp2static detect`
 - `wp wp2static crawl`
 - `wp wp2static post_process`
 - `scp -rp wp-content/uploads/wp2static-processed-site user@server:dest`

---

#### Quickstart: Generate static site and deploy to CloudFlare Workers via Wrangler

Until there is a dedicated Add-on supporting CloudFlare workers, the following commands will work.

 - `wp wp2static options set deploymentURL https://wp2staticv6test.wp2static.workers.dev/`
 - `wp wp2static detect`
 - `wp wp2static crawl`
 - `wp wp2static post_process`
 - `cp -r wp-content/uploads/wp2static-processed-site/* "$MY_WORKER_DIR"/public/`
 - `cd "$MY_WORKER_DIR"`
 - `wrangler publish`

Above example expects you've installed CloudFlare's [Wrangler](https://github.com/cloudflare/wrangler) tool and run `wrangler config` and `wrangler generate --site SITE_NAME`. `MY_WORKER_DIR` above is to be replaced with the actual directory you created with `wrangler generate`.

Your `wrangler.toml` will look similar to this:

```
name = "wp2staticv6test"
type = "webpack"
account_id = "0a5e6f4c0d8a4e4cb4dd08d29e99ddcc"
workers_dev = true

[site]
bucket = "./public"
```

This example shows how to deploy to your `workers.dev` domain. Additional configuration is required to deploy to your own domain name. To be updated.

### WP2Static Core CLI commands explained

### detect

Detects URLs within WordPress site to be used in crawling. Detection levels controlled by core options and any optional detection add-ons.

 - `wp wp2static detect`

Detected URLs go into WP2Static's Crawl Queue.

 - `wp wp2static crawl_queue count # get total number of detected URLs`
 - `wp wp2static crawl_queue list # list all detected URLs`
 - `wp wp2static crawl_queue delete # clear Crawl Queue`

### crawl

Crawls all URLs in the Crawl Queue, generating a static site, identical to your WordPress site, but with URLs like `/some-post/` generating static site compatible folder called `/some-post/`, containing an `index.html` file within.

 - `wp wp2static crawl`

Generates static site to `wp-content/uploads/wp2static-crawled-site`.

Crawl Cache is used to prevent having to re-crawl URLs which haven't changed.

 - `wp wp2static crawl_cache count # get total number of cached crawl URLs`
 - `wp wp2static crawl_cache list # list cached crawl URLs`
 - `wp wp2static crawl_cache delete # rm wp-content/uploads/wp2static-crawled-site`

### post_process

Processes the crawled site, rewriting URLs and optionally performing other actions to prepare static site for deployment.

 - `wp wp2static post_process`

Generates deployable static site files to `wp-content/uploads/wp2static-processed-site`.

### deploy

Triggers a deployment, which signals to any deployment add-ons to perform their specific deployment actions.

 - `wp wp2static deploy`

Triggers post-deployment actions on completion, such as email or webhook notifications.

### process_queue

This will check for any queued jobs with the 'waiting' status and process them.

 - `wp wp2static process_queue`

This is useful when you want to rely on regular CRON job than WP-Cron.

