---
title: Safely going static
linkTitle: Safely going static
slug: safely-going-static
weight: 40
---

Safely going static
===================

**Have fun!**

Please don't be intimidated by new concepts or lack confidence because you're "*not a developer"*. I have been tinkering with computers since I was very young and still deal with all sorts of anxiety from time to time. It's ridiculous and we can do so much more if we silence those doubts!

**Safety first!**

Being confident and being reckless are two different things. By having backups of data and a (tested) plan to undo any changes can give us confidence to try more things, click more buttons and experiment!

### How things should look when you're preparing to go static

These diagrams give an example of how you can set things up for safely transitioning to go static.

**Testing without interrupting your live site**

Here, we see your current live site, example.com. We don't change that at all while testing our static generation. We simply make a clone of our live site, putting it into a new WordPress installation, which can be on our own computer or a remote server. For the staging server, we want this to be as close to our intended new production server as possible, so if you're planning to use S3, Cloudflare, Netlify, etc for your new static site hosting, use the same for your staging server. This exposes you to more possible issues during testing, so you're not putting out fires when you first deploy to production.

Note: I've used subdomains in the examples here, because you're likely to already have one domain, so should be able to freely create subdomains. If you have spare, unused domains or can create some free/cheap ones for testing, that will be even better to use as your staging site's URL, due to the slight differences in configuring static hosting for subdomains or the "naked" domain.

*Example using remote server*

```
Live site example.com --> clone --> Dev site dev.example.com

Dev site --> deploy -> Staging site staging.example.com
```

*Example using a local dev server*

```
Live site example.com --> clone --> Dev site localhost

Dev site --> deploy -> Staging site staging.example.com
```

### How things should look once you've gone live with your static site

Most users only maintain their dev server and live site once they go static. This is fine, especially if you have a quick and reliable way to rollback to a previous deployment (Netlify is a great deployment option due to this). However, if you're nervous about rolling out a big change or it's mission-critical, maintaining a stating server and deploying your static site their first for quality-checking is recommended, as shown in the last diagram.

Of course, your static site should look identical to your development WordPress site, so including an additional staging server here is more to test any issues specific to the static generation/post-processing.

*Example using remote server*

```
Dev site dev.example.com --> deploy -> Live site example.com
```

*Example using a local dev server*

```
Dev site localhost --> deploy -> Live site example.com
```

*Example using a local dev server, maintaining staging server*

```
Dev site localhost --> deploy -> Staging site staging.example.com
     |
     V
verify staging looks OK
     |
     V
Dev site localhost --> deploy -> Live site example.com
```
