<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ext="http://exslt.org/common" exclude-result-prefixes="ext" version="1.0"><xsl:output method="text" omit-xml-declaration="yes" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" /><xsl:strip-space elements="*" /><xsl:template match="/">{"plsql": {<xsl:if test="rows/plsql/with_biztalk !=''">"biztalk":<xsl:value-of select="rows/plsql/with_biztalk"/>,</xsl:if>"gentype": "java","html": "<xsl:value-of select="rows/plsql/package_html"/>","instance": "<xsl:value-of select="rows/plsql/package_instance"/>",<xsl:if test="rows/plsql/with_label !=''">"label":<xsl:value-of select="rows/plsql/with_label"/>,</xsl:if>"package": "<xsl:value-of select="rows/plsql/package_db"/>",<xsl:if test="rows/plsql/with_label !=''">"replace":<xsl:value-of select="rows/plsql/with_replace"/>,</xsl:if>"subversionpath": "","table": "<xsl:value-of select="rows/plsql/table_name"/>"},"rows": [{"columns": [{"containers": [<xsl:call-template name="gen-containers"/>],"size": "col-md-12"}]}]}</xsl:template><xsl:template name="gen-containers"><xsl:variable name="containers" select="rows/content/*[@type and @type!='tabcontent' and @type!='box' and @type!='panels']"/><xsl:variable name="containersCount" select="count($containers)"/><xsl:for-each select="$containers"><xsl:variable name="isField"><xsl:choose><xsl:when test="fields/*"><xsl:value-of select="true()"/></xsl:when><xsl:otherwise><xsl:value-of select="false()"/></xsl:otherwise></xsl:choose></xsl:variable>{"genType": "container","proprieties": {<xsl:call-template name="gen-containers-attributes"/>}<xsl:if test="fields/* or item">,"fields" : [<xsl:if test="fields/*"><xsl:call-template name="gen-fields"/></xsl:if><xsl:if test="item"><xsl:call-template name="gen-items"/></xsl:if><xsl:if test="tools-bar/item">,<xsl:call-template name="gen-items"><xsl:with-param name="items" select="tools-bar/item"/></xsl:call-template></xsl:if><xsl:if test="table/context-menu/item">,<xsl:call-template name="gen-items"><xsl:with-param name="items" select="table/context-menu/item"/></xsl:call-template></xsl:if>]</xsl:if>}<xsl:if test="position() != last()">,</xsl:if></xsl:for-each></xsl:template><xsl:template name="gen-fields"><xsl:for-each select="fields/*">{"properties": { "label": "<xsl:value-of select="label"/>", "tag": "<xsl:value-of select="name()"/>", "name": "<xsl:value-of select="@name"/>", "type": "<xsl:value-of select="@type"/>"<xsl:if test="@required='true' or @required='required'"><xsl:text>,"required": true</xsl:text></xsl:if><xsl:if test="@java-type">,"java-type": "<xsl:value-of select="@java-type"/>"</xsl:if>}}<xsl:if test="position() != last()">,</xsl:if></xsl:for-each></xsl:template><xsl:template name="gen-items"><xsl:param name="items" select="item"/><xsl:for-each select="$items">{"properties": { "label": "<xsl:value-of select="title"/>", "tag": "<xsl:value-of select="@rel"/>", "type": "button", "target" : "<xsl:value-of select="target"/>","action" : "<xsl:value-of select="@action-id"/>",<xsl:call-template name="getImageAndTarget"/>}}<xsl:if test="position() != last()">,</xsl:if></xsl:for-each></xsl:template><xsl:template name="gen-containers-attributes">"tag" : "<xsl:value-of select="name()"/>","type" : "<xsl:value-of select="@type"/>"<xsl:if test="@title">,"title" : "<xsl:value-of select="@title"/>"<xsl:if test="@title != ''">,"hasTitle": true</xsl:if></xsl:if><xsl:if test="table/context-menu/item">,"ctxType":"inl"</xsl:if></xsl:template><xsl:template name="getImageAndTarget"><xsl:param name="list" select="img"/><xsl:choose><xsl:when test="contains($list, '|')">"class":"<xsl:value-of select="substring-before($list,'|')"/>"<xsl:call-template name="getImageAndTarget"><xsl:with-param name="list" select="substring-after($list,'|')"/></xsl:call-template></xsl:when><xsl:otherwise>,"img": "<xsl:value-of select="$list"/>"</xsl:otherwise></xsl:choose></xsl:template></xsl:stylesheet>