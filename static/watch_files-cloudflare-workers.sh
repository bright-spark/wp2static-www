#!/bin/sh

# usage: run `sh this_script.sh` in its own shell

# set your project and WP plugin dirs
WP2STATIC_ADDON_CFWORKERS_DIR=~/gitprojects/wp2static-addon-cloudflare-workers
WP_PLUGIN_DIR=/var/www/htdocs/wp-content/plugins

cd "$WP2STATIC_ADDON_CFWORKERS_DIR"

# initial sync of files
openrsync --rsync-path /usr/bin/openrsync --del -var "$WP2STATIC_ADDON_CFWORKERS_DIR" "$WP_PLUGIN_DIR"/

while true; do
  # doesn't watch ignore files, but will sync whole dir
  ag -al --path-to-ignore "$WP2STATIC_ADDON_CFWORKERS_DIR/.gitignore" | entr -d openrsync --rsync-path /usr/bin/openrsync --del -var "$WP2STATIC_ADDON_CFWORKERS_DIR" "$WP_PLUGIN_DIR"/
done
