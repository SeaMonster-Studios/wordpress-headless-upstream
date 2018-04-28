# SeaMonster Studios Headless Pantheon Upstream

## Setup

1.  Create a new site in Pantheon with this upstream
2.  Run the `install.sh` script (at the root directory of the repo) with the following terminal command: `bash install.sh -d client-domain.com`

* Running the install will do the following:
  1.  Install all headless-related plugins
  2.  Install child theme, which is customizable per each site's needs.
  3.  Rename the child theme per the domain name you provide (so it's related to the client)
  4.  Update wp-config to use the production domain name to force HTTPS

3.  Run the WP install in the WP Admin
4.  Install all the plugins

### Running `install.sh`

* You can do this one of two places.
  * A. You can clone the pantheon repo locally, run the terminal command, commit the changes, and then push back to pantheon.
  * B. You can SSH into the pantheon server, run the command, and then commit the changes in the terminal or the pantheon dashboard.

### But I don't want to run anything in the terminal...

No problem, just do the following via SFTP:

1.  Get plugins and child theme from the following repos:

* Plugins: https://github.com/SeaMonster-Studios/wordpress-headless-plugins
* Child theme: https://github.com/SeaMonster-Studios/wordpress-headless-childtheme
  * With this one, make sure you also head over to the style.css file and change the theme name to match the client.

2.  Head over to the `wp-config.php` file and replace all instances of `www.yoursite.com` with the client's live URL that'll be used when going live.

## Usage Notes

* Do not edit anything within the parent them or WP Core. This will cause upstream conflicts for the site.
* You add whatever functionality you need within the child theme.
* ACF all the things!
