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
        <xsl:apply-templates>
        <xsl:for-each select="book">
          <xsl:call-template name="show_price">
            <xsl:with-param name="price" select="price"/>
          </xsl:call-template>
        </xsl:for-each>
        </xsl:apply-templates>
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

    <!-- <xsl:template name="show_price" >
    <xsl:param name="price"/>
      <div><u>Price</u>: <xsl:apply-templates select="$price"/></div>
    </xsl:template> -->

    <xsl:template match="publish_date">
      <div><u>Publish date</u>: <xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="description">
      <div><u>Description</u>: <i><xsl:apply-templates/></i></div>
    </xsl:template>

    <!-- <xsl:template name="show_price">
      <xsl:param name="price"/>
      <p>Price: <xsl:value-of select="$price"/></p>
    </xsl:template> -->

</xsl:stylesheet>
