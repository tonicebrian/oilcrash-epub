<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:atom="http://www.w3.org/2005/Atom" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
        <xsl:apply-templates select="/atom:feed"/>
        <xsl:apply-templates select="/atom:feed/atom:entry"/>
  </xsl:template>
  <xsl:template match="/atom:feed">
    <h3>
      <xsl:value-of select="atom:title"/>
    </h3>
  </xsl:template>
  <xsl:template match="atom:entry">
      <h4><xsl:value-of select="atom:title"/></h4>
  </xsl:template>
</xsl:stylesheet>
