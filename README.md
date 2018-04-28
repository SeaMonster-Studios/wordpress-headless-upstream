# SeaMonster Studios Headless Pantheon Upstream

## Setup

1.  Create a new site in Pantheon with this upstream
2.  Run the `install.sh` script (at the root directory of the repo) with the following terminal command:

```
bash install.sh -d client-domain.com
```

This will do two things:

1.  Install all headless-related plugins
2.  Install child theme, which is customizable per each site's needs.

### Running `install.sh`

* You can do this one of two places.
  * A. You can clone the pantheon repo locally, run the terminal command, commit the changes, and then push back to pantheon.
  * B. You can SSH into the pantheon server, run the command, and then commit the changes in the terminal or the pantheon dashboard.

### But I don't want to run anything in the terminal...

* No problem, just do the following via SFTP:

1.  Get plugins and child theme from the following repos:

* Plugins: https://github.com/SeaMonster-Studios/wordpress-headless-plugins
* Child theme: https://github.com/SeaMonster-Studios/wordpress-headless-childtheme
  * With this one, make sure you also head over to the style.css file and change the theme name to match the client.

2.  Head over to the `wp-config.php` file and replace all instances of `www.yoursite.com` with the client's live URL that'll be used when going live.

## Architecture
