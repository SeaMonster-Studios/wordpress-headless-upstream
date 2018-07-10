domain_found=0

while getopts ":d:" opt; do
domain_found=1
case $opt in
	d)
		domain=$OPTARG
		name_raw="${OPTARG%%.*}"
		name=$(echo $name_raw | sed -e 's/\-/_/g')
		name_title=$(echo $name | awk 'BEGIN{split("a the to at in on with and but or",w); for(i in w)nocap[w[i]]}function cap(word){return toupper(substr(word,1,1)) tolower(substr(word,2))}{for(i=1;i<=NF;++i){printf "%s%s",(i==1||i==NF||!(tolower($i) in nocap)?cap($i):tolower($i)),(i==NF?"\n":" ")}}') #https://stackoverflow.com/questions/35006611/how-to-convert-text-following-title-case-rules-in-bash
		Cyan='\033[0;36m'
		NC='\033[0m' # No Color

		# Update URL in force HTTPS within wp-config
		sed -i "" "s|www.yoursite.com|$domain|" wp-config.php

		# Get Seamonster Upstream Plugins
		rm -rf ./wp-content/plugins/ && git clone git@github.com:SeaMonster-Studios/wordpress-headless-plugins.git ./wp-content/plugins/ && rm -rf ./wp-content/plugins/ && rm -rf ./wp-content/plugins/.git

		# Remove attachement to plugins repo
		rm -rf wp-content/plugins/.git

		# Get Seamonster Upstream Child Theme
		git clone git@github.com:SeaMonster-Studios/wordpress-headless-childtheme.git ./wp-content/themes/wordpress-headless-childtheme/

		# Rename wordpress-headless-childtheme to match project name, Update project name in style.css
		mv ./wp-content/themes/wordpress-headless-childtheme ./wp-content/themes/$name_raw
		rm -rf wp-content/themes/$name_raw/.git # remove childtheme attachement to git
		cd wp-content/themes/$name_raw
		sed -i "" "s|ChildThemeName|$name_title|" style.css

		;;
	\?)
		echo "Invalid option: -$OPTARG" >&2
		exit 1
		;;
	:)
		echo "Option -$OPTARG requires an argument." >&2
		exit 1
		;;
esac
done

if ((!domain_found)); then
  echo "You must provide the DOMAIN (including TLD) that will be used by this project when pushed live. Do this by using the -d flag followed by the domain name."
fi
