#!/bin/bash

rm -rf ./target
mkdir -p target
cd target

# Uncomment one of the wget. The first one is for the whole blog and the second one 
# downloads posts from a given year.
#wget http://crashoil.blogspot.com/feeds/posts/default?max-results=300 -O oilcrash-raw.xml
wget "http://crashoil.blogspot.com/feeds/posts/default?published-min=2012-01-01T00:00:00&published-max=2012-12-31T23:59:59" -O oilcrash-raw.xml

xsltproc ../atom-to-html.xsl oilcrash-raw.xml > oilcrash.xhtml
perl -pi -e "s/&lt;/</g" oilcrash.xhtml
perl -pi -e "s/&gt;/>/g" oilcrash.xhtml
perl -pi -e "s/&amp;/&/g" oilcrash.xhtml
perl -pi -e "s/&nbsp;/ /g" oilcrash.xhtml
perl -pi -e "s/<\/span>//g" oilcrash.xhtml
perl -pi -e "s/<span[^>]*>//g" oilcrash.xhtml
perl -pi -e "s/<\/w:[^>]+>//g" oilcrash.xhtml
perl -pi -e "s/<w:[^>]*>//g" oilcrash.xhtml
perl -pi -e "s/<\/o:[^>]+>//g" oilcrash.xhtml
perl -pi -e "s/<o:[^>]*>//g" oilcrash.xhtml
perl -pi -e 's/http:\/\/crashoil.blogspot.com.es\/(\d+)\/(\d+)\/([^.]+).htm[l]?/#\1-\2-\3/g' oilcrash.xhtml
tidy -i -utf8 -asxhtml -m oilcrash.xhtml

python ../image_downloader.py oilcrash.xhtml 

# Componer el eBook
wget http://altermon.files.wordpress.com/2012/11/crude1.jpg
LANG=C ebook-convert oilcrash-final.xhtml oilcrash.epub --authors "Antonio Turiel" --language es --title "The Oil Crash blog" --cover crude1.jpg

cp oilcrash.epub ..
cd -

