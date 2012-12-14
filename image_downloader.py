#/usr/bin/python

from BeautifulSoup import BeautifulSoup
import sys
import urllib2

def downloadImages(page):
    i=1
    for img in page.findAll('img'):
        try:
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
        except Exception:
            print "Error retrieving "+imgUrl
        i=i+1

def changeInternalLinks(page):
    for link in page.findAll('a'):
        if link['href'].startswith('http://crashoil.blogspot.com/'):
            print "Procesando "+link['href']
            link['href'] = "#" # + link['href'].lstrip('http://crashoil.blogspot.com.es/').replace('/','-').rstrip('.htm[l]?')

fd = open(sys.argv[1],'r')
page = BeautifulSoup(fd)

downloadImages(page)
#changeInternalLinks(page)

fd = open('oilcrash-final.xhtml','w')
fd.write(str(page))
fd.close()
