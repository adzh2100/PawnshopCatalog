<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
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
                Pawnshop Catalog FMI
              </fo:block>
              <!-- <fo:external-graphic src="url('pictures/pharmacy.png')" content-height="500" content-width="360" margin-left="5cm" margin-bottom="15mm"></fo:external-graphic> -->
            </fo:block>
          </fo:block-container>
        </fo:flow>
      </fo:page-sequence>

      <!--===========================ContentPage===============================-->

      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container position="absolute" top="10px" left="10px">
            Available Products
            <fo:block position="absolute" text-align="left" font-weight="bold" font-family="Monotype Corsiva" font-size="24px" color="black" margin-bottom="20px">
              <fo:block>
                Jewellery:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/jewellery/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="normal" font-style="italic" font-size="18px" color="black" padding-before="10px" margin-left="10px">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>

            <fo:block position="relative" text-align="left" font-weight="bold" font-family="Monotype Corsiva" font-size="24px" color="black" margin-bottom="24px">
              <fo:block>
                Electronics:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/electronics/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="normal" font-style="italic" font-size="18px" color="black" padding-before="10px" margin-left="10px">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>


            <fo:block position="relative" text-align="left" font-weight="bold" font-family="Monotype Corsiva" font-size="24px" color="black" margin-bottom="24px">
              <fo:block>
                Antiques:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/antiques/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="normal" font-style="italic" font-size="18px" color="black" padding-before="10px" margin-left="10px">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>


            <fo:block position="relative" text-align="left" font-weight="bold" font-family="Monotype Corsiva" font-size="24px" color="black" margin-bottom="24px">
              <fo:block>
                Art:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/art/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="normal" font-style="italic" font-size="18px" color="black" padding-before="10px" margin-left="10px">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>


            <fo:block position="relative" text-align="left" font-weight="bold" font-family="Monotype Corsiva" font-size="24px" color="black" margin-bottom="24px">
              <fo:block>
                Precious Metals:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/precious_metals/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="normal" font-style="italic" font-size="18px" color="black" padding-before="10px" margin-left="10px">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>

            <fo:block position="relative" text-align="left" font-weight="bold" font-family="Monotype Corsiva" font-size="24px" color="black" margin-bottom="24px">
              <fo:block margin-bottom="10px">
                Vehicles:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/vehicles/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="normal" font-style="italic" font-size="18px" color="black" padding-before="10px" margin-left="10px">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>


          </fo:block-container>
        </fo:flow>
      </fo:page-sequence>
      <xsl:call-template name="jewellery" />
    </fo:root>
  </xsl:template>


  <!--      Images      -->
  <xsl:template match="image">
    <fo:external-graphic src="{unparsed-entity-uri(@href)}" content-height="200" content-width="245" />
  </xsl:template>

  <!--      Jewellery      -->
  <xsl:template name="jewellery">
    <xsl:for-each select="pawnshop/resources/resource">
      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container position="relative" wrap-option="wrap">
            <fo:block position="absolute" text-align="center" padding-before="10px" margin-left="10px" font-family="Arial" font-size="40px" color="black" margin-bottom="20px">
              <xsl:value-of select="name" />
            </fo:block>
          </fo:block-container>

          <fo:table>
            <fo:table-column column-width="60%" />
            <fo:table-column column-width="40%" />

            <fo:table-body>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block-container position="relative">
                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18px" color="black" padding-before="10px">
                      Price:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16px">
                        <xsl:value-of select="pawnshop_evaluation/currency" />
                        <xsl:value-of select="pawnshop_evaluation/value" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18px" color="black" padding-before="10px">
                      Model:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16px">
                        <xsl:value-of select="model" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18px" color="black" padding-before="10px">
                      Manufacturer:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16px">
                        <xsl:value-of select="manufacturer" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18px" color="black" padding-before="10px">
                      Description:
                      <fo:block position="relative" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="description" />
                      </fo:block>
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block-container position="absolute" top="0" left="10px">
                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="0mm">
                      <xsl:apply-templates select="image" />
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

          <fo:block-container position="relative" font-style="italic" top="12.5cm" left="0" margin-top="100px">
            <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="20px" color="black" padding-before="10px">
            Additional details of the pawn this product is associated with:
          </fo:block>
            <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18px" color="black" padding-before="10px">
              Term:
              <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16px">
                <xsl:value-of select="id(pawn_ref/@ref)/term" />
              </fo:inline>
            </fo:block>

            <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18px" color="black" padding-before="10px">
              Amount given to client:
              <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16px">
                <xsl:value-of select="id(pawn_ref/@ref)/amount_given/currency" />
                <xsl:value-of select="id(pawn_ref/@ref)/amount_given/value" />
              </fo:inline>
            </fo:block>

            <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18px" color="black" padding-before="10px">
              Submitter:
              <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16px">
                <xsl:value-of select="id(pawn_ref/@ref)/submitter/name" />
                <xsl:text></xsl:text>
                <xsl:value-of select="id(pawn_ref/@ref)/submitter/surname" />
              </fo:inline>
            </fo:block>

            <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18px" color="black" padding-before="10px">
              Recipient employee:
              <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16px">
                <xsl:value-of select="id(pawn_ref/@ref)/recipient_employee/name" />
                <xsl:text></xsl:text>
                <xsl:value-of select="id(pawn_ref/@ref)/recipient_employee/surname" />
              </fo:inline>

              <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18px" color="black" padding-before="10px">
                Creation date:
                <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16px">
                  <xsl:value-of select="id(pawn_ref/@ref)/created_at" />
                </fo:inline>
              </fo:block>

              <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18px" color="black" padding-before="10px">
                Last updated:
                <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16px">
                  <xsl:value-of select="id(pawn_ref/@ref)/updated_at" />
                </fo:inline>
              </fo:block>
            </fo:block>
          </fo:block-container>

        </fo:flow>
      </fo:page-sequence>
    </xsl:for-each>
  </xsl:template>


</xsl:stylesheet>