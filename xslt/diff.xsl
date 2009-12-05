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
<xsl:function name="diff:any" as="element()*">
	<xsl:param name="a"/>
	<xsl:param name="b"/>

	<xsl:variable name="nameA" as="xs:string" select="name($a)"/>
	<xsl:variable name="nameB" as="xs:string" select="name($b)"/>
	<xsl:sequence select="$nameA != $nameB"/>
</xsl:function>

</xsl:stylesheet>
