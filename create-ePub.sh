#!/bin/bash

mkdir -p target
cd target
#wget http://crashoil.blogspot.com/feeds/posts/default?max-results=300 -O oilcrash.xml
#wget http://crashoil.blogspot.com/feeds/posts/default -O oilcrash-raw.xml
xmllint --noent --format oilcrash-raw.xml > oilcrash-pretty.xml
xsltproc ../atom-to-html.xsl oilcrash-pretty.xml > oilcrash.xhtml
perl -pi -e "s/&lt;/</g" oilcrash.xhtml
perl -pi -e "s/&gt;/>/g" oilcrash.xhtml
perl -pi -e "s/&amp;/&/g" oilcrash.xhtml
perl -pi -e "s/&nbsp;/ /g" oilcrash.xhtml
perl -pi -e "s/<\/span>//g" oilcrash.xhtml
perl -pi -e "s/<span[^>]*>//g" oilcrash.xhtml
tidy -utf8 -asxhtml -m oilcrash.xhtml
ebook-convert oilcrash.xhtml oilcrash.epub

cp oilcrash.epub ..
cd -

