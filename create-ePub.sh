#!/bin/bash

cd target
wget http://crashoil.blogspot.com/feeds/posts/default?max-results=300 -O oilcrash.xml
xmllint --format oilcrash.xml > oilcrash-pretty.xml

cd -
