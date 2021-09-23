---
title: Search Options for Static Sites
weight: 50
---

Another consideration when moving to a static WordPress site is what to
do with your site's search functionality. Not all sites have enough
content to warrant a full-site search. If this is your case and you've
just left the search box there because it came with your theme, now may
be a good time to hide it, as it won't work out of the box when you
publish statically.

For those with sites that benefit from offering search functionality,
read on for a quick overview of how searching works in regular WordPress
and how to keep it functioning when publishing statically.

How searching works in regular WordPress
----------------------------------------

Behind the scenes, WordPress stores all your site's content in a
MySQL-compatible database, usually MySQL or the more open source
friendly MariaDB. Your user submits a search term via the client
(browser), which triggers some PHP code running on the server to query
the database when retrieving, inserting, updating or deleting content.

With our statically published site, we have no PHP scripts or MySQL
database to query when a user makes a request, so we must handle search
in a different fashion. Here, we'll describe some patterns for search
implementation on your statically published WordPress site.

Search implementations for your static WordPress site
-----------------------------------------------------

Choose from any of these methods of static site search when going
static. Which you choose will depend on your needs, technical comfort
and budget.

Algolia
-------



As one of the most popular hosted search solutions for both static and
dynamic sites, with a free entry-level plan suitable for most WordPress
sites, we start with a guide to implementing Algolia's search on your
static site. We use it here on WP2Static and found implementation to be
very quick.

### Install Algolia's official WordPress plugin

Update: Algolia no longer maintains thier WP plugin, but [WebDevStudios](https://webdevstudios.com) are maintaining a [fork](https://github.com/WebDevStudios/wp-search-with-algolia), which is also available via [wp.org](https://wordpress.org/plugins/wp-search-with-algolia/).

### Configure the plugin

Follow the plugin's documentation for setting up your API keys in the plugin.

### Modify the plugin's code to use your static site's URL

By default, Algolia's plugin assumes a regular WordPress setup and will
use the link from your development site in its search results. While
WP2Static plans to release a seamless Add-on to handle this for you, in
the meantime, we just need to change a few lines of code to get it
working.

This is not a long-term solution. Updating
Algolia's plugin from within WordPress will wipe away these changes and
they'll need to be re-applied. It works, but please be aware of
this!

The following 3 files will need to be modified. Below is a diff which
can be applied as at version 2.11.3 of the plugin, else read the diff to
see what changes you should make  -- replace the hardcoded devsite and
livesite URLs to your own.

```
    diff --git a/includes/indices/class-algolia-posts-index.php b/includes/indices/class-algolia-posts-index.php
    index 69b8af1..ec7755f 100644
    --- a/includes/indices/class-algolia-posts-index.php
    +++ b/includes/indices/class-algolia-posts-index.php
    @@ -148,7 +148,14 @@ final class Algolia_Posts_Index extends Algolia_Index {

                    $shared_attributes['images'] = Algolia_Utils::get_post_images( $post->ID );

    -               $shared_attributes['permalink']      = get_permalink( $post );
    +        $permalink = get_permalink( $post );
    +        $permalink = str_replace(
    +            'http://mydevsite.com',
    +            'https://mylivesite.com',
    +            $permalink
    +        );
    +
    +               $shared_attributes['permalink']      = $permalink;
                    $shared_attributes['post_mime_type'] = $post->post_mime_type;

                    // Push all taxonomies by default, including custom ones.
    diff --git a/includes/indices/class-algolia-searchable-posts-index.php b/includes/indices/class-algolia-searchable-posts-index.php
    index 86754f4..3c39efc 100644
    --- a/includes/indices/class-algolia-searchable-posts-index.php
    +++ b/includes/indices/class-algolia-searchable-posts-index.php
    @@ -143,7 +143,14 @@ final class Algolia_Searchable_Posts_Index extends Algolia_Index {

                    $shared_attributes['images'] = Algolia_Utils::get_post_images( $post->ID );

    -               $shared_attributes['permalink']      = get_permalink( $post );
    +        $permalink = get_permalink( $post );
    +        $permalink = str_replace(
    +            'http://mydevsite.com',
    +            'https://mylivesite.com',
    +            $permalink
    +        );
    +
    +               $shared_attributes['permalink']      = $permalink;
                    $shared_attributes['post_mime_type'] = $post->post_mime_type;

                    // Push all taxonomies by default, including custom ones.
    diff --git a/includes/indices/class-algolia-terms-index.php b/includes/indices/class-algolia-terms-index.php
    index bb78a70..8aa66d8 100644
    --- a/includes/indices/class-algolia-terms-index.php
    +++ b/includes/indices/class-algolia-terms-index.php
    @@ -57,9 +57,24 @@ final class Algolia_Terms_Index extends Algolia_Index {
                    $record['slug']        = $item->slug;
                    $record['posts_count'] = (int) $item->count;
                    if ( function_exists( 'wpcom_vip_get_term_link' ) ) {
    +            $permalink = wpcom_vip_get_term_link( $item );
    +            $permalink = str_replace(
    +                'http://mydevsite.com',
    +                'https://mylivesite.com',
    +                $permalink
    +            );
    +
                            $record['permalink'] = $permalink;
                    } else {
    -                       $record['permalink'] = get_term_link( $item );
    +            $permalink = get_term_link( $item );
    +            $permalink = str_replace(
    +                'http://mydevsite.com',
    +                'https://mylivesite.com',
    +                $permalink
    +            );
    +
    +                       $record['permalink'] = $permalink;
                    }

                    $record = (array) apply_filters( 'algolia_term_record', $record, $item );
```

### Re-index and push your settings to Algolia

From your admin dashboard, go to Algolia Search > Autocomplete and
check which posts you want indexed. Most cases can just check "All
Posts". Click "Save Changes" at the bottom of the page, then, next to
your checked option, click "Re-index" and "Push settings". Your content
should now be available for searching with auto-completion.

You can test any search page on your development site, which should now
return results with URLs rewritten to your live site. With the Algolia
plugin activated, it also inserts the required CSS and JS to override
the built-in search functionality. You can now deploy your static
WordPress site with a nice modern search functionality.


Other search implementations
----------------------------

We'll continue to add more search options for statically published
WordPress sites here. For now, an easy alternative is to use Google
Custom Search, as per this external guide (just remember to set your
live site as the URL to be searched, not your development site's):

[Add a Google Custom Search to Your WordPress Site](https://www.codeinwp.com/blog/add-a-google-custom-search-to-your-wordpress-site/)
