#!/bin/bash

#wget http://crashoil.blogspot.com/feeds/posts/default?max-results=300 -O oilcrash.xml
xmllint --format oilcrash.xml > oilcrash-pretty.xml
xsltproc atom-to-html.xsl src/test/scala/oilcrash-pretty.xml > oilcrash.xhtml
perl -pi -e "s/&nbsp;/ /g" oilcrash.xhtml
perl -pi -e "s/<\/span>//g" oilcrash.xhtml
perl -pi -e "s/<span[^>]*>//g" oilcrash.xhtml
tidy -utf8 -asxhtml -m oilcrash.xhtml

