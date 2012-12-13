<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet xmlns:atom="http://www.w3.org/2005/Atom" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head/>
      <body>
        <xsl:apply-templates select="/atom:feed/atom:head"/>
        <xsl:apply-templates select="/atom:feed"/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="atom:feed/atom:head">
    <h3>
      <xsl:value-of select="atom:title"/>
    </h3>
  </xsl:template>
  <xsl:template match="/atom:feed">
    <h3>
      <xsl:value-of select="atom:title"/>
    </h3>
  </xsl:template>
  <xsl:template match="atom:entry">
    <li>
        <a href="{atom:link[@rel='related']/@href}" title="{substring(atom:published, 0, 11)}">
        <xsl:value-of select="atom:title"/>
        </a>
      <xsl:choose>
        <xsl:when test="atom:content != ''">
          <p>
            <xsl:value-of select="atom:content" disable-output-escaping="yes"/>
          </p>
        </xsl:when>
        <xsl:otherwise>
          <p>
            <xsl:value-of select="atom:summary" disable-output-escaping="yes"/>
          </p>
        </xsl:otherwise>
      </xsl:choose>
    </li>
  </xsl:template>
</xsl:stylesheet>
