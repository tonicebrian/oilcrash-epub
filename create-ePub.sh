#!/bin/bash

#wget http://crashoil.blogspot.com/feeds/posts/default?max-results=300 -O oilcrash.xml
#wget http://crashoil.blogspot.com/feeds/posts/default -O oilcrash.xml
xmllint --noent --format oilcrash.xml > oilcrash-pretty.xml
xsltproc atom-to-html.xsl src/test/scala/oilcrash-pretty.xml > oilcrash.xhtml
perl -pi -e "s/&lt;/</g" oilcrash.xhtml
perl -pi -e "s/&gt;/>/g" oilcrash.xhtml
perl -pi -e "s/&amp;/&/g" oilcrash.xhtml
perl -pi -e "s/&nbsp;/ /g" oilcrash.xhtml
perl -pi -e "s/<\/span>//g" oilcrash.xhtml
perl -pi -e "s/<span[^>]*>//g" oilcrash.xhtml
tidy -utf8 -asxhtml -m oilcrash.xhtml

