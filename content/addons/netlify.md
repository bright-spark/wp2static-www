---
title: Netlify Deployment Add-On
linkTitle: Netlify
weight: 35
slug: netlify
---

Auto-deploy your generated static site to Netlify.

### Configuration

#### via UI

Input your Netlify connection settings via the WP2Static > Netlify menu.

#### via WP-CLI

`wp wp2static netlify options set name value`


|Available option | Example input                          |
| --------------- |:--------------------------------------:|
| siteID          | ID or domain                           |
| accessToken     | your personal access token (see below) |


### Troubleshooting

 - check WP2Static's Logs for any errors
 - check webserver/PHP's error logs on server
 - test your Netlify access token:
   - via CLI (should return info about your site):
```
curl -H "Authorization: Bearer PERSONAL_ACCESS_TOKEN" https://api.netlify.com/api/v1/sites/SITE_ID
```
 - use the ZIP deployment add-on and do a manual deploy of your site via their web UI (drag and drop ZIP)
 - use the [Netlify CLI tool](https://docs.netlify.com/cli/get-started) to deploy your generated static site files
 - check the Deploys screen for your site in the Netlify UI or CLI tool. If it appears one or more deploys are stuck, you can safely cancel them and redploy. Even if no files need to be uploaded, this can sometimes help force a new deploy to go live.
 - download and check the deployed artifacts from Netlify UI
 - clear all of WP2Static's caches and try to redeploy

### How it works

This add-on deploys your static site to Netlify via their API. It uses their "digest method", which first downloads information about all the files already on Netlify's servers for your site, then compares against the files WP2Static has generated. It then only transfers the files which have changed, saving time on large sites.

#### What is my Netlify Site ID?

From the [Netlify docs](https://docs.netlify.com/api/get-started/#get-sites):

> Whenever the API requires a :site_id, you can either use the id of a site obtained through the API, or the domain of the site (for example, \mysite.netlify.com or \www.example.com). These two are interchangeable whenever they're used in API paths.

#### Where do I get my Netlify Personal Access Token?

You can generate a new personal access token from your Netlify profile's [Applications page](https://app.netlify.com/user/applications).

#### Rolling back a failed deploy

Netlify's UI (and probably CLI client) offer easy ways to rollback to a previously good deploy. In the web UI, just choose the previous deployment and hit "Publish deploy"

#### Downloading deployment artifacts from Netlify

For any deployment done to Netlify, you can download an archive of the deployed files. Go to the specific deployments page and next to the date, there is a little download icon.

#### Handling redirects and custom headers

Netlify supports setting [custom headers](https://docs.netlify.com/routing/headers) or [redirects](https://docs.netlify.com/routing/redirects/).

#### Form processing on Netlify

You can easily adjust any contact or other forms in your WordPress site to work with Netlify by adjusting the form's HTML markup. See Netlify's forms docs. WP2Static should have a specialised Forms add-on to automatically handle this in the future or you can write your own custom code/plugin to integrate with WP2Static via our hooks/filters.

#### Serverless functions

Netlify also has their own [Functions](https://docs.netlify.com/functions/overview/) which can allow adding dynamic functionality or advanced processing to your static site hosted with them.

#### A warning on vendor lock-in

Whilst Netlify's Forms and Functions are very convenient and relatively simple to use compared to some alternatives, please be mindful of putting all your eggs in one basket. The beauty of static sites is that they will "run anywhere". You can use Netlify for your static site hosting and still choose other vendors or your own custom serverless functions for forms, comments, etc.

#### A note on performance

Netlify uses multiple CDNs behind the scenes to deliver your static site. These are generally fast globally, but they also offer a premium tier with faster speeds. In preliminary testing, I've found AWS S3 + CloudFront to be globally faster and there's a high chance that Cloudflare edge-caching may also be faster. I recommend you do your own testing, considering your target global audience.

#### A note on usability

Netlify continues to be one of the easiest deployment options, giving a great balance of price (usually free!), ease of management and generally good performance. I recommend Netlify as the easiest deployment option to get startd with, even if just for testing/staging if not production. Their simple drag and drop UI to deploy a ZIP'd static site is brilliant and ability to do quick deployment rollbacks removes a lot of anxiety! Compared to something like AWS, you get real, knowledgable support people to interact with.

#### Mixed-content warning notifications from Netlify

A useful feature of Netlify, is that they will notify you (email) of any mixed-content detected during their build & deploy process. This is great, but often gives false positives when we're deploying to a new site.

ie, if we have set out Destination URL as `https://example.com` but we first deploy to Netlify without our custom domain set to our Netlify site (ie, `https://somenewsite.netlify.app`), we'll get those warnings.

If you're still receiving those warnings and think you shouldn't - check your site for actual mixed content (ie, http links on an https site). An easy way to find these is in your browser's console > Network tab. Open that up, then refresh the page to see any URLs with warnings or check the Console tab, which may also show any issues.


