---
date: 2020-05-10
title: Easier Add-on development
description: Easily develop custom add-ons for the WP2Static static site generator
---

Thanks to those who have been testing the pre-release builds of WP2Static Version 7. There's been some great detection of bugs that help justify taking a cautious approach to V7 before pushing an official release up to wp.org.

Already, there have been some great user-contributed fixes and improvements. There's even great progress on a new GitHub deployment add-on coming from one of the community, an exciting first for WP2Static!

### Centralized Add-ons Page

As part of making it an easier path for developers in the community to build their own WP2Static Add-ons, I've spent some time this week reimagining how Add-ons integrate with the core WP2Static plugin.

[![New Add-ons view in WP2Static](/images/blog/new-addons-view.png)](/images/blog/new-addons-view.png)

The above shows a new WP2Static > Add-ons screen, where all official and 3rd party Add-ons will appear. This simplifies knowing which add-ons are going to affect your workflow, with the ability to Enable/Disable them from a centralized location vs having to activate/deactivate the whole plugin. Behind the scenes, it should now allow us to avoid having 2 deployment add-ons running simulataneously.

I can see this turning into more, with a browsable Add-ons "marketplace" within WP2Static.

### Multiple deploy configs (staging/production)

Some users, myself included, have expressed the desire to to configure both a staging and production deployment within WP2Static, without having to change options between deployments. I de-scoped this from the V7.0 roadmap a while back due to the complexity and changes required, but now I can see an easier possible solution.

[Matt Vanderpol @bookwyrm](https://github.com/bookwyrm) has come up with an elegant solution to manage the DeployCache for multiple deployment add-ons. As soon as this is merged in, this will allow for having your staging and production deploys on different deployment add-ons.

This makes me ponder a hacky solution that should allow for 2 x the same deployment options (ie, 2 x Netlify or 2 x Cloudflare deployment configs), copying one of the add-ons and renaming it in a few places, ie `wp2static-addon-cloudflare` becomes `wp2static-addon-cloudflare-staging`. It's not elegant, but it should work and allow for some easier workflow setups for those requiring staging/production deploys.

### Boilerplate Add-on plugin for developers

By "developers" here, I mean anyone who wants to extend WP2Static. We've had some early success with users extending the URL detection and Post Processing phases of the WP2Static V7 workflow by adding a custom function to their (child) theme's `functions.php` or combining with other commands when running via WP-CLI.

This has either been on their own initiative or with some chats with me over email/Telegram/forum. The aim with this boilerplate plugin, is to populate it with *working* examples of all the ways to extend WP2Static and moving those conversations to a more accessible place. It currently builds, installs and runs, logging info into WP2Static > Logs.

I'll be using this myself when I start a new Add-on, whether for extending crawling, URL detection, post processing or deployment. Until now, I've been copy pasting whichever Add-on I was last working on or most similar to the new one, so this will also benefit me as much as others extending WP2Static.

[![WP2Static Boilerplate Add-on Options](/images/blog/boilerplate-options.png)](/images/blog/boilerplate-options.png)

```sh
x230$ wp wp2static boilerplate options list 
+-------------------+--------------+
| name              | value        |
+-------------------+--------------+
| aRegularOption    | Ohai there   |
| anEncryptedOption | youcantseeme |
+-------------------+--------------+
```


You can follow the [WP2Static/wp2static-addon-boilerplate](https://github.com/WP2Static/wp2static-addon-boilerplate) repo on GitHub and feel free to contribute code or create Issues there when you need an example on how to do something not covered already.

Speaking of GitHub, I've stopped just using it as a mirror of my self-hosted repositories and back to using it as primary hosting for WP2Static's repos. I have some feels about why *not* to use GitHub, but for now, it's the least painful path for many developers wanting to contribute code to WP2Static, so I'm choosing not to let the project die on this hill.

Having community developers spend their own time to contribute/review code you've written can be very humbling/embarrassing/energizing experiences. Many thanks again to all of you [Contributors](/contributors/) - that means any of you reading this - thank you!

 -- Leon
