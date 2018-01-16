<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- trying some function, but can't work -->
  <!-- <xsl:function name="custom:test">
      <xsl:param name="str"/>
      <xsl:value-of select="substring($str,1,1)"/>
      <b>
        <xsl:value-of select="substring($str,2)"/>
      </b>
    </xsl:function> -->

    <xsl:template match="/">
        <html>
        <body>
        <!-- <h3>
          <xsl:sequence select="custom:test('AB')"/>
        </h3> -->
        <h1>Contents</h1>
        <xsl:apply-templates mode="nav" />
        <hr/>
        <xsl:apply-templates/>
        <br/><br/>
         <!-- <xsl:param name="title"/>
        <xsl:param name="publish_date"/> -->
        <h4>Call This Template Here</h4>
        <xsl:for-each select="catalog/book">
        <xsl:call-template name="show-info">          
            <xsl:with-param name="titlez" select="title"/>
            
            <xsl:with-param name="publish_date" select="publish_date"/>          
          </xsl:call-template>
        </xsl:for-each>
        </body>
        </html>
    </xsl:template>


    <xsl:template match="book[@id]" mode="nav">
        <a href="#{title}"><xsl:value-of select="title"/></a><br/>
    </xsl:template>

    <xsl:template match="book[@*]">
        <div>
            <h2><a name="{title}"><xsl:value-of select="title"/></a></h2>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

<!-- Don't display title information. -->
    <xsl:template match="title"/>

    <xsl:template match="author">
      <div><u>Author</u>: <strong><i><xsl:apply-templates/></i></strong></div>
    </xsl:template>

    <xsl:template match="genre[text()]">
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

    <!-- call this template -->
          <xsl:template name="show-info">
            <xsl:param name="titlez"/>
            <xsl:param name="publish_date"/>            
            <div>
              Title: <xsl:value-of select="$titlez"/><br/>
              Release date: <xsl:value-of select="$publish_date"/><br/>
              --------------------------------------------
            </div>
          </xsl:template>
        

</xsl:stylesheet>
