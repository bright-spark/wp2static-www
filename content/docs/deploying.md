---
title: Deploying your static website
linkTitle: Deploying
description: Deploying your WordPress static website
slug: deploying
weight: 50
---

Deploying is the part of the process which takes place once your static site has been generated.


```
URL Detection
   |
Crawling    
   |
Post Processing
   |
Deployment  <--- here
```

<br>

The core WP2Static plugin generates your static site ready for deployment. The post-processed files are stored on your server in the `/wp-content/uploads/wp2static-processed-site` directory. If you are using our [WP-CLI commands](/developers/wp-cli), this is convenient for you to deploy using any command line tools.

To get more deployment options, such as auto-deployments via API (S3, Cloudflare, Netlify, etc), sFTP or ZIP archive, choose one of the deployment [Add-ons](/addons/).

### Deployment options

Refer to each deployment add-on's documentation for options specific to that deployment method.

Within the core WP2Static plugin, we have deployment 2 options available for configuration:

![Deployment options](/images/deploying/deployment-options.png)

**Completion Email**

Convenient for team notifications, WP2Static can deliver deployment notifications via email - just enter the intended recipient in WP2Static's options.

If you don't have your server configured to send emails or are blocked by your hosting provider, you can use a plugin, such as [WP Mail SMTP](https://github.com/awesomemotive/WP-Mail-SMTP). I'll sometimes also use something like this when I need to test email functionality, along with a tool like [mailtrap](https://mailtrap.io) to test deliverability. WP Mail SMTP offers integration with several large ESPs, such as MailGun and AWS SES.

**Completion Webhook**

Webhooks provide an easy way to connect various network-connected services. WP2Static can trigger a webhook to be sent to an endpoint/service of your choosing upon completion of a deployment Job. This may be useful for very large sites that take a long time to process and you want to trigger another step in your development workflow when WP2Static deployment completes. A service like [Zapier](https://zapier.com) may give you ideas of how you can integrate other services into your WordPress development workflow (ie, launch your end to end test suite to start when you deploy to a staging server!).

Enter the URL of the endpoint you wish to send a deployment confirmation webhook to. Choose from `POST` or `GET` http methods to deliver your request. The webhook's response status code will be logged into WP2Static -> Logs.

`GET` requests will send `?message=WP2Static deployment complete!` and `POST` requests will send the body as `WP2Static deployment complete!`.

If you want to quickly test the functionality out, you can use a quick http request testing service like [RequestBin]( http://requestbin.net/ )


> My server doesn't allow emails or blocks my webhook URL

You may be able to workaround this by using a service like [Zapier](https://zapier.com) to accept an email and forward to a webhook or vice-versa. Zapier is given as an example, but you could also write your own small web applications in PHP, CGI or a serverless function provider.


### Where can I deploy my static site to?

See [WP2Static Add-ons](/addons/) for official and 3rd party deployment options.
