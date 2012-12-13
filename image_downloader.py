#/usr/bin/python

from BeautifulSoup import BeautifulSoup
import sys
import urllib2

fd = open(sys.argv[1],'r')
page = BeautifulSoup(fd)

i=1
for img in page.findAll('img'):
    imgUrl = img['src']
    imgRemote = urllib2.urlopen(imgUrl)
    headers = imgRemote.headers
    ext = headers.getsubtype()
    filename = "%010d.%s" % (i,ext)
    print("Downloading "+imgUrl)
    imgFd = open(filename,'w')
    imgFd.write(imgRemote.read())
    imgFd.close()
    img['src'] = filename
    i=i+1

fd = open('oilcrash-final.xhtml','w')
fd.write(str(page))
fd.close()
