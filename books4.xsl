<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    

    <xsl:template match="/">
        <html>
        <body>
        <xsl:apply-templates mode="nav" />
        <hr/>
        <xsl:apply-templates />
        </body>
        </html>
    </xsl:template>

    <xsl:template match="book" mode="nav">
        <a href="#{title}"><xsl:value-of select="title"/></a><br/>
    </xsl:template>

    <xsl:template match="book">
        <div>
            <h2><a name="{title}"><xsl:value-of select="title"/></a></h2>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="title"/>

    <xsl:template match="author">
      <div><u>Author</u>: <strong><i><xsl:apply-templates/></i></strong></div>
    </xsl:template>

    <xsl:template match="genre">
      <div><u>Genre</u>: <xsl:apply-templates/></div>
    </xsl:template>

    <xsl:template match="price">
      <div><u>Price</u>: <xsl:apply-templates/></div>
    </xsl:template>

    <xsl:template match="publish_date">
      <div><u>Publish date</u>: <xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="description">
      <div><u>Description</u>: <i><xsl:apply-templates/></i></div>
    </xsl:template>    

</xsl:stylesheet>
