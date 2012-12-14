<?xml version="1.0" encoding="utf-8"?>
<!-- This XSLT requires the newest version of Saxon
     since it is using functions from XSLT 2.0 -->
<xsl:stylesheet xmlns:atom="http://www.w3.org/2005/Atom" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:date="http://exslt.org/dates-and-times"
    xmlns="http://www.w3.org/1999/xhtml"
    extension-element-prefixes="date"
    version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
        <xsl:apply-templates select="/atom:feed"/>
        <xsl:apply-templates select="/atom:feed/atom:entry">
            <xsl:sort select="position()" data-type="number" order="descending"/>
        </xsl:apply-templates>
  </xsl:template>
  <xsl:template match="/atom:feed">
    <h2>
      <xsl:value-of select="atom:title"/>
    </h2>
  </xsl:template>
  <xsl:template match="atom:entry">
      <xsl:variable name="trim1" select="substring-after(atom:link[@rel='alternate']/@href,'http://crashoil.blogspot.com/')"/>
      <xsl:variable name="trim2" select="substring-before($trim1,'.htm')"/>
      <xsl:variable name="trim3" select="translate($trim2,'/','-')"/>
      <h2 id="{$trim3}" class="chapter">
          <xsl:value-of select="atom:title"/>
      </h2>
      <p>
      <strong>
          <xsl:value-of select="substring-before(atom:published,'T')"/>
      </strong>
      </p>
      <p><xsl:value-of select="atom:content"/></p>
  </xsl:template>
</xsl:stylesheet>
