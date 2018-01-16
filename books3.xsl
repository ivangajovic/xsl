<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



  <xsl:function name="my:factorial">
        <xsl:param name="number" type="xs:integer"/> 
        <xsl:sequence as="xs:integer" 
        select="if ($number=0) then 1 else $number * my:factorial($number-1)"/>
    </xsl:function>



  <xsl:template match="/">
    <h2><xsl:value-of select="my:factorial(4)"/></h2>

  </xsl:template>



</xsl:stylesheet>