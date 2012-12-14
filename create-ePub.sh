#!/bin/bash

SAXON_PATH=/home/tcebrian/software/saxon9he.jar

mkdir -p target
cd target
wget http://crashoil.blogspot.com/feeds/posts/default?max-results=300 -O oilcrash-raw.xml
#wget http://crashoil.blogspot.com/feeds/posts/default -O oilcrash-raw.xml
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
cp ../Portada.xhtml .
LANG=C ebook-convert oilcrash-final.xhtml oilcrash.epub --authors "Antonio Turiel" --language es --title "The Oil Crash blog" --cover crude1.jpg

cp oilcrash.epub ..
cd -

