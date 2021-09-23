---
title: Contact Forms for Static Websites
weight: 40
---

When taking your WordPress site static, one of the most common changes
you'll need to make are getting your contact forms working.

Why don't WordPress contact forms "just work" on my static site?
-------------------------------------------------------------------

Most contact forms for WordPress, whether installed via a plugin or
included with your theme or pagebuilder, are dependent on server-side
code for submitting the form data. The client (the user's browser)
submits the form data to a PHP script, which handles the mailing, via
your own server or using a service such as MailGun, SendGrid, Postmark,
etc.

Not having these server side scripts available is part of the security &
performance benefits of going static. But it means we need somewhere
else to post our form data. Luckily, we have a multitude of options.

Good news for Contact Form 7 users
----------------------------------

Thanks to the [WP Serverless
Forms](https://wordpress.org/plugins/wp-serverless-forms/) plugin,
enabling any Contact Form 7 form to work is as simple as entering one
line into the plugin's settings.

After installing WP Serverless Forms, go to Settings \> WP Serverless
Forms in your WP admin dashboard and enter your custom "endpoint". This
is just a URL provided by a hosted form submission or API service, such
as [Basin](https://usebasin.com/), [FormSpree](https://formspree.io/),
[FormKeep](https://formkeep.com/), [IFTTH](https://ifttt.com/) or
[Zapier](https://zapier.com/). You then manage how these forms are
delivered to you and how users are redirected via their site.

Netlify makes it dead simple
----------------------------

If you're using Netlify to host your static site, the process to convert
an existing contact form to work on Netlify is also quite simple.

From their [Forms documentation](https://www.netlify.com/docs/form-handling/):

*Code an HTML form into any page on your site, add a netlify attribute
or data-netlify="true" to the*

tag, and you can start receiving submissions in your Netlify site admin
panel.


Embeddable hosted forms
-----------------------

As with any embeddable content, like a map or social media feed,
embeddable contact forms work just the same on your static site as they
do in a regular WordPress site.

 Searching for "embeddable contact form" will yield plenty of results to
review, with different prices and features, such as [Google Forms](https://www.google.com/forms/about/),
[Kontact](https://kontactr.com/) and [Cognito Forms](https://www.cognitoforms.com).

There is also the purely JS + API email form service,
[EmailJS](https://www.emailjs.com/), which can connect to common
transactional email providers.


Self/cloud-hosted form handling services
----------------------------------------

For those wanting to keep everything under their own control, deploying
a form handling script on your own servers or at least your own cloud
instances offers more privacy protection. Whether a custom script or
something like
[Formplug](https://danielireson.github.io/formplug-serverless/) for AWS
Lambda, you can have greater control over your data.

Use no contact form at all
--------------------------

You don't have to use a contact form on your site. A simple mailto link
is still a valid option and you can even improve the UX a bit by
pre-filling the message subject and body: 

    mailto:help@oldwp2staticwww.netlify.com?subject=Question%20about%20contact%20forms&body=Hi%20there%2C%20I%20just%20read%20your%20article%20about%20contact%20forms%20and%20want%20to%20ask%20you%20further%20questions.%20When%27s%20a%20good%20time%20to%20chat%3F

[![](https://oldwp2staticwww.netlify.com/wp-content/uploads/2019/03/clickingadvancedmailto.png)](/contact)

