---
title: How to secure a development WordPress website?
description: Securing a development WordPress website keeps it from the public, malicious bots and prevents indexing by search engines.
weight: 40
---

> Thank you for creating your WP-CLI documentation. Can I ask what an ideal setup would be where the WP install is still accessible on the net somewhere to clients (eg: For content editing) that will still keep it secure and hidden from bots and crawlers while allowing WP2Static to work properly?

---

Hi there,

Thanks!

The simplest method I prefer, is to use http basic authentication (the username/password box you'll sometimes see popup on sites).

This is done at the server level, deeper than the application (WordPress) level, so is usually configured in your Apache, nginx or other web server software configuration.

Depending on your hosting setup, I may be able to give you some concrete steps to try - just let me know your hosting company/plan name or such if you like.

Other methods to lock things down include IP address whitelisting and VPN setups.

Thanks for asking this! I should put it on the site :)

Cheers,

Leon

