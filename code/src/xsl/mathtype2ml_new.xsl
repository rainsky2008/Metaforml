<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:File="java:java.io.File"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    exclude-result-prefixes="xs"
    extension-element-prefixes="File">
    
    <xsl:output indent="yes" method="xhtml"/>
    
    
    <xsl:param name="path" select="'/home/maha/Projects/mathtype2mml/math-typeole-to-mathml/xsl/xml'" as="xs:string"/>
    
    <xsl:template match="/">
        <xsl:call-template name="buildFileList">
            <xsl:with-param name="dir" select="$path"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="buildFileList">
        <xsl:param name="dir" as="xs:string"/>
        <xsl:variable name="fileObj" select="File:new($dir)"/>
        <xsl:variable name="files" select="File:list($fileObj)" as="xs:string+"/>
        <xsl:for-each select="$files">
            <xsl:variable name="file" select="File:new(.)"/>
            <xsl:if test="not(File:isDirectory($file))">
                <xsl:variable name="temp" select="File:getName($file)"/>
                <xsl:if test="ends-with($temp,'.xml')">
                    <xsl:variable name="vijay" select="concat($dir,'/',File:getName($file))"></xsl:variable>

		      <xsl:copy-of select="document($vijay)//*"/>

                </xsl:if>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
 