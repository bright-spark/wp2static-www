---
title: Extending WP2Static
linkTitle: Extending WP2Static
weight: 20
---

WP2Static aims to be as extensible as possible, while maintaining a minimal, solid core.

[WP-CLI commands](/developers/wp-cli) allow for easily piping WP2Static commands into your own scripted workflows and programmatic access to execute and modify WP2Static behaviour.

### Filters and actions

In lieu of comprehensive documentation about each action/hook/filter available in WP2Static and its Add-ons, I'll just dump the current available actions and filters from within the core WP2Static plugin's codebase.

Below list is derived from running `git grep  -e do_action --or -e apply_filter`. If you're looking for a specific action/filter, please search the source code of the core WP2Static plugin or its Add-ons. If there's a a hook/filter you need added, please [contact](/contact) me to request or send a diff with the code if you've you've already figured out how to add it.

**Actions**

 - `wp2static_crawling_complete`
 - `wp2static_process_html`
 - `wp2static_process_html_complete`
 - `wp2static_process_css`
 - `wp2static_process_js`
 - `wp2static_process_xml`
 - `wp2static_post_process_complete`
 - `wp2static_deploy`
 - `wp2static_post_deploy_trigger`
 - `wp2static_addon_ui_save_options`
 - `wp2static_addon_ui_save_job_options`


**Filters**

 - `wp2static_add_menu_items`
 - `wp2static_curl_port`
 - `wp2static_curl_user_agent`
 - `wp2static_set_destination_url`
 - `wp2static_set_wordpress_site_url`
 - `wp2static_detect_parent_theme`
 - `wp2static_detect_child_theme`
 - `wp2static_detect_plugin_assets`
 - `wp2static_detect_wpinc_assets`
 - `wp2static_detect_vendor_cache`
 - `wp2static_detect_posts_pagination`
 - `wp2static_detect_archives`
 - `wp2static_detect_categories`
 - `wp2static_detect_category_pagination`
 - `wp2static_modify_initial_crawl_list`
 - `wp2static_render_jobs_page_vars`

If it's not apparent what these actions/filters do when you look at the surrounding code, [let me know](/contact) and I'll add/expand comments. These docs can't be relied upon to be as up to date as the code.

