<?xml version="1.0" encoding="utf-8"?>
<!-- This XSLT requires the newest version of Saxon
     since it is using functions from XSLT 2.0 -->
<xsl:stylesheet xmlns:atom="http://www.w3.org/2005/Atom" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/1999/xhtml"
    version="2.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
        <xsl:apply-templates select="/atom:feed"/>
        <xsl:apply-templates select="/atom:feed/atom:entry"/>
  </xsl:template>
  <xsl:template match="/atom:feed">
    <h2>
      <xsl:value-of select="atom:title"/>
    </h2>
  </xsl:template>
  <xsl:template match="atom:entry">
      <xsl:variable name="trim1" select="substring-before(replace(substring-after(atom:link[@rel='alternate']/@href,'http://crashoil.blogspot.com/'),'/','-'),'.html')"/>
      <h2 id="{$trim1}" class="chapter">
          <xsl:value-of select="atom:title"/>
      </h2>
      <p><xsl:value-of select="atom:content"/></p>
  </xsl:template>
</xsl:stylesheet>
