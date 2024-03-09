<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <!--created by Dr. Campbell to autonumber chapters and paragraphs .--> 
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="chapter">
        <chapter n="{count(preceding-sibling::chapter) + 1}" roman="{data(@roman)}">
            <xsl:apply-templates/>
        </chapter>
    </xsl:template>
    
    <xsl:template match="para">
        <para n="{count(preceding-sibling::para) + 1}">
            <xsl:apply-templates/>
        </para>
    </xsl:template>
    
</xsl:stylesheet>