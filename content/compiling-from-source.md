---
title: Compiling from source code
linkTitle: Compiling from source code
slug: compiling-from-source
description: Compile WP2Static plugin from source code..
---

I make a point to keep the source code to my projects open source, available to all and with no restrictions on how you may use them.

For WP2Static's core WordPress plugin and complimentary add-ons, these are currently hosted on the GitHub website. If you're blocked from accessing GitHub for any reason, please reach out to me via the [support forum](https://staticword.press) and I'll send you a copy of the source.

Find the source code for WP2Static and other projects within [my GitHub profile](https://github.com/leonstafford).

For my WordPress plugins, I use the great [Composer](https://getcomposer.org) dependency manager to help organize code. In conjunction with some thin shell scripts, I also provide an easy way to *build/compile* zip installers of each plugin, which may be a preferred installation method for you.. 

### Building zip installers of plugins

 - acquire the source code
 - ensure [Composer](https://getcomposer.org) is installed
 - from the source code directory, run `composer install`
 - from same directory, run `composer build ZIP_NAME`, where *ZIP_NAME* is a friendly name, such as `wp2static-addon-s3`. 

If all goes well, this will put a zip file for easy installation of the plugin into your `$HOME/Downloads` directory. You can now install this to your WordPress site via the dashboard's *Plugins > Add Plugins > Upload Plugin* area.

### I don't want to have to compile the plugin from source code!

Please [make a donation to Leon](https://ljs.dev), this project's maintainer, for access to pre-compiled, easy to install zip files.

*[Already donated or have a license?](/thanks-for-donating/)*


### I got an error when activating WP2Static!

> Looks like you're trying to activate WP2Static from source code, without compiling it first. Please see https://wp2static.com/compiling-from-source for assistance.

Seeing the above error when trying to activate the plugin? This usually means that the dependent libraries haven't been installed by Composer. If you were trying to build the plugin yourself via source code, please retry the steps above. If you want to just run the plugin in-place, you can try running just `composer install` from within the source code's directory and trying to activate again.

