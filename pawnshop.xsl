<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="xml" version="1.0" indent="yes" />
  <xsl:template match="/">
    <fo:root>

      <!--===========================PageSettings===============================-->

      <fo:layout-master-set>
        <fo:simple-page-master page-height="297mm" page-width="210mm" margin="5mm 25mm 5mm 25mm" master-name="page">
          <fo:region-body margin="20mm 0mm 20mm 0mm" />
        </fo:simple-page-master>
      </fo:layout-master-set>

      <!--===========================HeaderPage===============================-->

      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">
            <fo:block position="absolute" text-align="center" font-weight="bold" margin-left="2cm" font-family="Monotype Corsiva" font-size="56pt" padding-before="50mm" color="black">
              <fo:block margin-bottom="10mm">
                Каталог на заложна къща ФМИ/
              </fo:block>
              <!-- <fo:external-graphic src="url('pictures/pharmacy.png')" content-height="500" content-width="360" margin-left="5cm" margin-bottom="15mm"></fo:external-graphic> -->
            </fo:block>
          </fo:block-container>
        </fo:flow>
      </fo:page-sequence>

      <!--===========================ContentPage===============================-->

      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">

            <fo:block position="absolute" text-align="left" font-weight="bold" margin-left="2cm" font-family="Monotype Corsiva" font-size="30pt" padding-before="40mm" color="black">
              <fo:block margin-bottom="5mm">
                Jewellery:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/jewellery/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="5mm" margin-left="2cm">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>

            <fo:block position="relative" text-align="left" font-weight="bold" margin-left="2cm" font-family="Monotype Corsiva" font-size="30pt" padding-before="15mm" color="black">
              <fo:block margin-bottom="5mm">
                Electronics:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/electronics/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="5mm" margin-left="2cm">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>

            <fo:block position="relative" text-align="left" font-weight="bold" margin-left="2cm" font-family="Monotype Corsiva" font-size="30pt" padding-before="15mm" color="black">
              <fo:block margin-bottom="5mm">
                Antiques:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/antiques/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="5mm" margin-left="2cm">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>

            <fo:block position="relative" text-align="left" font-weight="bold" margin-left="2cm" font-family="Monotype Corsiva" font-size="30pt" padding-before="15mm" color="black">
              <fo:block margin-bottom="5mm">
                Art:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/art/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="5mm" margin-left="2cm">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>

            <fo:block position="relative" text-align="left" font-weight="bold" margin-left="2cm" font-family="Monotype Corsiva" font-size="30pt" padding-before="15mm" color="black">
              <fo:block margin-bottom="5mm">
                Precious Metals:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/precious_metals/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="5mm" margin-left="2cm">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>

            <fo:block position="relative" text-align="left" font-weight="bold" margin-left="2cm" font-family="Monotype Corsiva" font-size="30pt" padding-before="15mm" color="black">
              <fo:block margin-bottom="5mm">
                Vehicles:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/vehicles/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="5mm" margin-left="2cm">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>

          </fo:block-container>
        </fo:flow>
      </fo:page-sequence>
      <xsl:call-template name = "jewellery"/>
    </fo:root>
  </xsl:template>


  <!--      Images      -->
  <xsl:template match="image">
    <fo:external-graphic src="{unparsed-entity-uri(@href)}" content-height="200" content-width="245" />
  </xsl:template>

  <!--      Jewellery      -->
  <xsl:template name="jewellery">
    <xsl:for-each select="pawnshop/resources/resource[@classification='Jewellery']">
      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container position="absolute" top="0cm" left="-2.5cm">
            <fo:block position="absolute" text-align="center" padding-before="12mm" margin-left="2cm" font-family="Monotype Corsiva" font-size="40pt" color="black">
              <xsl:value-of select="name" />
            </fo:block>
          </fo:block-container>

          <fo:block-container position="absolute" top="3cm" left="8cm">
            <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="0mm">
              <xsl:apply-templates select="image" />
            </fo:block>

            <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="1mm" text-align="left" margin-left="0.5cm">
              Цена:
              <fo:inline position="relative" padding-left="1mm" font-weight="normal" font-size="16pt">
                <xsl:value-of select="price" />
                (
                <xsl:value-of select="stock" />
                )
              </fo:inline>
            </fo:block>

            <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="0mm" text-align="left" margin-left="0.5cm">
              Съдържание:
              <fo:inline position="relative" padding-left="1mm" font-weight="normal" font-size="16pt">
                <xsl:value-of select="quantity" />
              </fo:inline>
            </fo:block>

          </fo:block-container>

          <fo:block-container position="absolute" top="3cm" left="-2.5cm" right="9cm">

            <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="5mm" margin-left="2cm">
              Цена:
              <fo:inline position="relative" padding-left="1mm" font-weight="normal" font-size="16pt">
                <xsl:value-of select="pawnshop_evaluation/currency" />
                <xsl:value-of select="pawnshop_evaluation/value" />
              </fo:inline>
            </fo:block>

            <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="5mm" margin-left="2cm">
              Model: 
              <xsl:value-of select="model" />
            </fo:block>

            <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="5mm" margin-left="2cm">
              Manufacturer: 
              <xsl:value-of select="manufacturer" />
            </fo:block>

          </fo:block-container>

          <fo:block-container position="absolute" top="12.5cm" left="-2.5cm">
            <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="5mm" margin-left="2cm">
              Description:
              <fo:block position="relative" font-weight="normal" font-size="16pt">
                <xsl:value-of select="description" />
              </fo:block>
            </fo:block>
          </fo:block-container>
        </fo:flow>
      </fo:page-sequence>
    </xsl:for-each>
  </xsl:template>


</xsl:stylesheet>