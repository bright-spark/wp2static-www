---
title: Your privacy
linkTitle: Your privacy
slug: your-privacy
---

WP2Static creator, Leon Stafford (me), idealistically wishes for a free and open internet. I put in effort not to abuse your privacy.

Here, I'll try to inform you of any ways I store your data and any 3rd parties that are likely to see your data along the way.

### Update 2021 March 20th

I've added Snipcart back into the Download page, this should be the only 3rd party script loaded, necessary for checkout. I'll update the wording here with more details.

### TL;DR - I don't want any of your info!

I used to at least ask for user's emails, in order to manage software licenses, try to beg for donations or to send product updates. Even that was too much of your data for my liking, so now there is no data I ask for at all when you visit this site (unless you make a donation). 

### On this website

As noted above, there's nothing on *this* website, `wp2static.com`, that is asking for your info or tracking. No cookies, no 3rd party hosted fonts or scripts, etc.

We try to avoid using any 3rd party hosted fonts, to prevent those companies getting another tracking metric on you. I encourage you to do the same on your websites, in respect of your users.

There are no other 3rd party resources being used on this site. If you discover any, please contact us and we'll either update this doc or remove the resources.

This site is hosted via AWS S3 + CloudFront + Lamda@Edge. I'd love to roll my own server with great speeds to users globally, but don't have an affordable way to do this (yet!).

### On other sites

Calls for donations are directed to my personal website, `https://ljs.dev`, which uses a few 3rd parties to accept donations, like Stripe and PayPal.

The support forum lives at `https://staticword.press` and is a self-hosted Discourse server on a Vultr VPS in one of their Sydney datacenters.

All source code is publicly hosted at GitHub. Self-hosting was dabbled with, for additional privacy and inclusiveness to countries blocked by GitHub. I'd like to revisit that, but for collaboration with other open source developers, GitHub is a compromise I've accepted for now.


MermaidJS is a JavaScript library for rendering diagrams on the site. We should bring this on-site, but for now, it's being pulled from UNPKG. *(This info may be out of date, I have a feeling I'm not using Mermaid anymore)*


### Internally

For early users who gave email and other contact information, I'll still have that in a few places, such as Stripe, Freemius, Google Sheets, but will be actively purging any such info as I tidy things up.

WP2Static email is currently hosted by MailFence, as is my own.


### Phoning home

When you install WP2Static on your server, it does not "phone home" or make any external requests outside of deployments to your chosen provider. As a WordPress plugin, we cannot vouch for WordPress's current or future policies regarding how they treat your privacy. If you have broader concerns about how to lock down WordPress from making outside calls or tracking you, please contact me and I'll try to advise ways to really lock things down.

### Don't send me sensitive information!


In the case that I'm helping a user troubleshoot an issue with their website, I encourage them to send me only credentials for a non-critical server or to cycle the credentials after I've finished troubleshooting.

### Worst case scenario

By not requiring user credentials, in a data leak, we should be limited to just email addresses and names. Order information can include address information, but as a digital product vendor, this is something we really don't need and will avoid storing it outside of our ecommerce and payment provider platforms.

### Requesting data removal

Should you be concerned about what data you have stored with us, please contact us to either request a copy or to remove what we have stored for your account.

### Compliance

I've not applied for ceritification from any industry providers. If you're looking to incorporate WP2Static into a corporate environment with strict requirements, please let us know and we'll try to help, but I expect this would be your team helping to do code review and suggesting any changes, corporate support is not my priority.
