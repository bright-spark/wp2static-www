---
title: Preparing to go static with WordPress
linkTitle: Preparing to go static with WordPress
slug: preparing-to-go-static-with-wordpress
weight: 10
---

Preparing to go static with WordPress
=====================================

We'll give some recommendations for designing your ideal WordPress to
static hosting setup.

The first thing to decide is whether to host your WordPress site locally
or on the internet. We're talking about your WordPress development site
here. As opposed to the resulting static site, which you'll likely host
online. Of course, it's up to you to find the ideal setup, you may even
use WP2Static for generating websites for offline use or behind a
company or school's intranet. WP2Static aims to provide as much
flexibility to you, while keeping the plugin optimized for the core use
cases.


Local or remote WordPress development server?
---------------------------------------------

How to decide what's right for me


You should go local when you...
--------------------------------

- are the only one developing the site
- don't want to pay for hosting
- want to use the full power of your personal computer
- are paranoid about security

You should host online when you...
-----------------------------------

- work with others to develop the site
- need to give your client access to the WP dashboard
- have external services adding content to your site
- are prepared to secure your dev site from the public/bots

Migrating an existing live site to a development server
-------------------------------------------------------

Whether you'll choose a local or online development server, you'll need
to follow a similar process before you can start publishing statically.
These steps are described below.

- Setup a new development server
- Clone your live site to the development server
- Adjust WordPress URLs to the new server's

Setting up a new development server
-----------------------------------

Be sure to check the [System Requirements](/docs/getting-started/system-requirements) for
WP2Static when setting up your new development server. We'll give
examples or recommended solutions for both local and online WordPress
development servers. If you need more help deciding what's right for
you, please [Contact Us](/contact) and describe your use case for more
recommendations.


### Recommeneded hosting options for your development server

*Update:* I used to maintain a list of possible local WordPress development options and recommended VPS providers. This is going to change on a daily basis and it's not a good use of my time to be trying out every option vs building the software and adding more static site hosting options for your live site.

> Does it work with **tool X, Y or Z**?

Answer: Probably! Try it out and ask on the [forum](https://www.staticword.press/c/wordpress-static-site-generators/wp2static/) if you have issues. If there are common issues/workarounds for certain local dev environments/remote hosting providers, that's the best place to search/ask.



Cloning your current live site to your new development server
-------------------------------------------------------------

With many guides already written and recorded for cloning a WordPress
site, we'll just share you a few links for now, so we can continue to
build the essential documentation for WP2Static.

- [How to Clone a WordPress Site in 7 Easy Steps](https://www.wpbeginner.com/wp-tutorials/how-to-clone-a-wordpress-site-in-7-easy-steps/)
- [How to clone your WordPress site](https://getflywheel.com/layout/clone-your-wordpress-site-how-to/)
- [Migrating WordPress via the Command Line](https://www.conetix.com.au/blog/migrating-wordpress-command-line)


Correcting your new WordPress site's URLs
------------------------------------------

If your migration process didn't include an option to update WordPress's
URLs to the new site's, you'll need to do that at this point. Again, we
reference an external guide to help you with this.
