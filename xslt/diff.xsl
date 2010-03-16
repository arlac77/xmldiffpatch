<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: dependency.xsl 7082 2009-07-02 08:52:49Z markus $ -->

<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xd="http://www.pnp-software.com/XSLTdoc"
  xmlns:diff="http://mfelten.de/xml/diff"
  xmlns="http://mfelten.de/xml/diff"
  exclude-result-prefixes="xs xsi xd diff">


<xd:doc type="stylesheet">
	Diffing generic xml documents
	<xd:author>Markus Felten</xd:author>
	<xd:copyright>Markus Felten 2009</xd:copyright>
	<xd:cvsId>$Id: dependency.xsl 7082 2009-07-02 08:52:49Z markus $</xd:cvsId>
</xd:doc>

<xd:doc>
	<xd:short>main diff entry point</xd:short>
</xd:doc>
<xsl:function name="diff:any" as="node()*">
	<xsl:param name="a"/>
	<xsl:param name="b"/>

	<xsl:apply-templates select="$a" mode="diff">
		<xsl:with-param name="b" select="$b" tunnel="yes"/>
	</xsl:apply-templates>
</xsl:function>

<xsl:template match="text()" mode="diff">
	<xsl:param name="b" as="text()" tunnel="yes"/>

	<xsl:if test=". != $b">
		<diff:text from="{.}" to="{$b}"/>
	</xsl:if>
</xsl:template>

<xsl:template match="element()" mode="diff">
	<xsl:param name="b" as="element()" tunnel="yes"/>

	<xsl:if test="name()!= $b/name()">
		<diff:rename from="{name()}" to="{$b/name()}"/>
	</xsl:if>

	<xsl:for-each select="*">
		<xsl:variable name="p" select="position()"/>
		<xsl:apply-templates select="." mode="diff">
			<xsl:with-param name="b" select="$b/element()[$p = position()]" tunnel="yes"/>
		</xsl:apply-templates>
	</xsl:for-each>

</xsl:template>

</xsl:stylesheet>
