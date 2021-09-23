---
date: 2020-12-19
title: End of 2020 update
description: What's going on in the world of WP2Static
---

Quick update on the status of projects, as we approach the end of 2020.

This year saw WP2Static go through a few major changes:

 - new, extensible, modern codebase for WP2Static
 - continuation of legacy product as *Static HTML Output*
 - move to *pay what you can* type of pricing

Along with these, I launched a few new projects around the static site space, like [Appi.sh](https://appi.sh), [Lokl](https://lokl.dev) and forked Simply Static into [Simpler Static](https://github.com/leonstafford/simplerstatic).

## Thanks for keeping me alive!

First off, thanks for all the donations people have been making. It hasn't quite been enough yet for me to support myself, but thanks to some camping and staying at my parents' and sister's houses recently, it's been enough to allow me to keep working on my projects.

### Dark passengers

WP2Static is not a company, it's a project by me, [Leon Stafford](https://ljs.dev). Not being afraid to own this has been a big change for me this year and helped remove a lot of the stresses I was feeling when posturing as a commercial brand. You'll not find a WP2Static logo anymore, nor it's own GitHub organization. This is more in line with my passions for open source.

Earlier in the year, I'd gone through some unproductive periods and depressive states, which you can read more about on [my website](https://ljs.dev).

That's been overcome now and am once again excited and enthused about my projects and what's to come.

### Bright horizons

It feels to me like the last 6 months to a year have been all maintenance work on WP2Static and the other static site generation plugins. Part of that was due to me fading in and out of productive spurts, but it has been worthwhile. Compared to this time last year, the code quality of the projects is so much better (with a lot of room still for improvement). A super special thanks to [Viktor Szepe](https://github.com/szepeviktor), who has played virtual guardian angel to me and many other open source developers, helping to implement code quality tooling, which he also helps build. Viktor tells me directly when my code needs improving. A special thanks also to [Gulshan Kumar](https://gulshankumar.net), without who, we wouldn't have such a stable version of the Static HTML Output plugin. Gulshan was an absolute unit of a tester to get us to the 6.6.21 version and subsequent Windows comapatibility fixes around January this year. There's still a few functions that need to be fixed in that project, but I've been sleeping better knowing that user and code quality has been stable. That said, my attempt at rushing out a 6.6.23 release required reverting, but I've just discovered a new tool by the Automattic team, which Viktor has been helping on, [WorDBless](https://github.com/Automattic/wordbless), which should aid in increasing unit test coverage and avoid the type of bug I introduced from now on.

WP2Static has only recently been seeing some update releases published, which ensure that the addons get registered properly. Not all deployment addons are published, neither are things like Algolia or my long overdue Woo to Snipcart addon. Snipcart generously donated about $600 at the start of the year and I'd promised to help promote them and get my addon for them out, so that's still something I want to get out ASAP.

WP2Static has also been updated to be PHP 8 comptible and all addons are in the process of getting the same treatments. I'm also planning to fork all plugins and start working on PHP 8 optimized versions (which won't be backwards compatible). This will allow for some improvements to the development process and continued improvements to quality and performance. 

[Simpler Static](https://github.com/leonstafford/simplerstatic) hasn't seen any updates for a while, but I was reminded this morning by a generous donor about it, inspiring this update blog post. Earlier in the year (or was it end of 2019?), I started Simpler Static as a fork of the long abandoned Simply Static. The developer of Simply Static, Scott, did an amazing job with Simply Static, with quality code that meant users could continue to use it even without maintenance updates for a long time. I took the last version of that and added some of the code quality tooling from my projects and fixed an issue that was blocking some users (incompatibility with a WP update, IIRC). I haven't done anything else to it since then, but do have plans still to add deployment options within it. I did make some minor improvements to UI/functionality as I was updating the code to pass tests. A Dutch agency had forked Simply Static earlier than Simpler Static, without the same kind of rewriting to use namespaces and static analysis tools as I had, but with great work to implement AWS S3 deployment functionality and recently, I noticed them building in the ability to selectively deploy just one page, which is a common request for agencies looking to do landing pages. Here's an article about the plugin by [grrr.tech](https://grrr.tech/posts/2020/wordpress-static-site-generator-and-deployment-via-simply-static-deploy/). If you're using Simpler Static and want S3 deployments today, you can use the AWS CLI tools to do an `aws s3 sync` (which is how I deploy most of my Hugo-powered websites).

This leads nicely into talking about one of the projects I've been most excited about.

### Don't you know I'm Lokl?

OK, so this is the coolest thing for me this year. It's a project which isn't well known yet, but a few users have discovered it and are enjoying it. I'm putting some final touches on the next release and then really need to muster up the confidence to share some videos about it. [Lokl](https://lokl.dev) not only works great in its own role as a local WordPress development environment, but it comes bundled with WP2Static, Static HTML Output, Simpler Static and a bunch of other useful tools for static site generation and local WordPress development.

It serves an additional purpose, as a quick testing and increasingly a development environment for me, which all the plugins benefit from. The latest release will offer both PHP 7 and 8 environments, helping to test your sites for PHP 8 readiness and for those already up to date, they should see great performance improvements for their local dev and static site exports.

It already includes things like the ability to quickly launch 100's of WordPress sites on mac, Win and Linux (good news this week, that the new ARM-powered macs should now work, too!), easy wizard for things like checking server logs or SSH'ing into the website's local server and taking backups. There's currently PHPMyAdmin baked-in, too, with plans to add a nice browser-based editor.

Lokl serendipitously came about one day when I had a thought to try out a technical approach to a problem I'd pondered for years - how to get the simplest "WordPress in a box" that would work across all popular desktop operating systems. It's the perfect environment to run local WP sites, with the intent to publish them statically, providing everything needed with the least amount of friction. I was never happy with other options, like MAMP, XAMPP, Local by FlyWheel, DevilBox, etc. All had some cool features, but all led to frustration for me, so I could never recommend them wholeheartedly to my plugins' users.

I'll rave more about this when I publish a video walkthrough of it.

## Really, thank you all!

Again, a big thanks to all users, bug reporters, donors, license holders and all the open source developers, whose code is the foundation of all of my projects. 

WP2Static has been around in some form for over 10 years. Without corporate/shareholder pressures to be first to market at expense of quality, I'm confident now in the slow and steady progress things are making. I'm also not deaf to the many user requests and huge backlog of GitHub Issues we've got. Suprisingly, there aren't many competing projects in the same space, besides SaaS based options, like Strattic, Shifter, etc, all doing great things. I'd love to see more competing options. Though, probably not greatly commercial viable, as long as mine remain free and open source, I still believe this is the best way to deal with WordPress' security and performance problems. All of my projects use [The Unlicense](https://unlicense.org), meaning you can use any parts of it in your own free or commercial forks - I'd be happy to help you spitball ideas, too!

Of note, I'm in discussion to join the upcoming [StaticWeb.io](https://staticweb.io) team in some capacity, which is a new entrant to the group of SaaS solutions to static WordPress. Their lead developer, [John Shaffer](https://github.com/john-shaffer), used WP2Static behind the scenes, whilst contributing some great improvements to it back to the community. John's architected a brilliant solution for a really easy way to spin up WP dev sites and publish to S3/CloudFront (without restrictions to deploy anywhere else you want). The SaaS offerings are great when you can't just run Lokl on your own machine (say, you need to collaborate on the dev sites with large teams or change machines a lot). Being broke asides from donor support, I'm also applying to some fulltime dev gigs in Australia at the moment, but working on something like StaticWeb would be more beneficial to WP2Static and friends, where I'd have a large feedback pool of users/sites to improve the plugins against.

That's it for now, stay tuned for more project updates in coming weeks (but keep in mind my complete inability to predict deadlines!).

 -- Leon
