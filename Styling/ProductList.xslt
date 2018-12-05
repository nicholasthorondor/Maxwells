<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:param name="category"/>
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="Styling/AppCSSStyling.css" />
        <title><xsl:value-of select="$category"/> Products</title>
      </head>
      <body>
        <img id="categoryBanner">
          <xsl:attribute name="src">
            Images/<xsl:value-of select="$category"/>.jpg
          </xsl:attribute>
        </img>
        <!-- Breadcrumbs -->
        <a class="breadcrumbLink" href="home.aspx">Home</a>
        <p class="breadcrumbSeperator">&gt;</p>
        <a class="breadcrumbLink">
          <xsl:attribute name="href">
            CategoryProductList.aspx?category=<xsl:value-of select="$category"/>
          </xsl:attribute>
          <xsl:value-of select="$category"/>
        </a>
        <div class="productContainer">
          <!-- Loops through each product, looking at the products category and displaying only those that match the category the user clicked on the home page -->
          <xsl:for-each select="//product[category = $category]">
            <div class="productBox">
              <xsl:apply-templates select="image"/>
              <xsl:apply-templates select="name"/>
              <xsl:apply-templates select="price"/>
              <!-- More info button functionality -->
              <a class="infoLink">
                <xsl:attribute name="href">
                  DetailedProductListing.aspx?productName=<xsl:value-of select="name"/>&amp;price=<xsl:value-of select="price"/>&amp;image=<xsl:value-of select="image"/>&amp;code=<xsl:value-of select="code"/>&amp;description=<xsl:value-of select="description"/>&amp;fromCategory=<xsl:value-of select="category"/>
                </xsl:attribute>
                <input id="Info" class="infoButton cartButton" type="button" value="More Info" />
              </a>
              <!-- Add to cart functionality -->
              <a class="infoLink">
                <xsl:attribute name="href">
                  ShoppingCart.aspx?productName=<xsl:value-of select="name"/>&amp;price=<xsl:value-of select="price"/>&amp;image=<xsl:value-of select="image"/>&amp;code=<xsl:value-of select="code"/>&amp;description=<xsl:value-of select="description"/>&amp;fromCategory=<xsl:value-of select="category"/>
                </xsl:attribute>
                <input ID="addToCart" class="cartButton" type="button" value="Add To Cart" />
              </a>
            </div>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>

  <!-- Product name format and styling template -->
  <xsl:template match="name">
      <h3>
        <xsl:value-of select="."/>
      </h3>
  </xsl:template>

  <!-- Product price format and styling template -->
  <xsl:template match="price">
      <h3 class="price">
          $<xsl:value-of select="."/>
      </h3>
  </xsl:template>

  <!-- Product image format and styling template -->
  <xsl:template match="image">
        <a>
          <xsl:attribute name="href">
            DetailedProductListing.aspx?productName=<xsl:value-of select="../name"/>&amp;price=<xsl:value-of select="../price"/>&amp;image=<xsl:value-of select="../image"/>&amp;code=<xsl:value-of select="../code"/>&amp;description=<xsl:value-of select="../description"/>&amp;fromCategory=<xsl:value-of select="../category"/>
          </xsl:attribute>
          <img class="productImageMed">
            <xsl:attribute name="src">
              Images/<xsl:value-of select="."/>
            </xsl:attribute>
          </img>
        </a>
  </xsl:template>

  <!-- Add to Cart Button format and styling template -->
  <xsl:template match="cart">
      
  </xsl:template>
  
</xsl:stylesheet>
