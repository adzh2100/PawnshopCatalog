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
                Каталог на заложна къща ФМИ
              </fo:block>
              <fo:external-graphic src="url('images/pawnshop.png')" content-height="500" content-width="360" margin-left="5cm" margin-bottom="15mm"></fo:external-graphic>
            </fo:block>
          </fo:block-container>
        </fo:flow>
      </fo:page-sequence>

      <!--===========================ContentPage===============================-->

      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container position="absolute" top="10px" left="10px">
            <fo:block margin-bottom="24pt">
              Налични продукти в каталога:
            </fo:block>
            <fo:block position="absolute" text-align="left" font-weight="bold" font-family="Monotype Corsiva" font-size="24pt" color="black" margin-bottom="20pt">
              <fo:block>
                Бижута:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/jewellery/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="normal" font-style="italic" font-size="18pt" color="black" padding-before="10px" margin-left="10px">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>

            <fo:block position="relative" text-align="left" font-weight="bold" font-family="Monotype Corsiva" font-size="24pt" color="black" margin-bottom="20pt">
              <fo:block>
                Електроника:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/electronics/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="normal" font-style="italic" font-size="18pt" color="black" padding-before="10px" margin-left="10px">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>


            <fo:block position="relative" text-align="left" font-weight="bold" font-family="Monotype Corsiva" font-size="24pt" color="black" margin-bottom="20pt">
              <fo:block>
                Антики:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/antiques/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="normal" font-style="italic" font-size="18pt" color="black" padding-before="10px" margin-left="10px">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>


            <fo:block position="relative" text-align="left" font-weight="bold" font-family="Monotype Corsiva" font-size="24pt" color="black" margin-bottom="20pt">
              <fo:block>
                Изкуство:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/art/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="normal" font-style="italic" font-size="18pt" color="black" padding-before="10px" margin-left="10px">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>


            <fo:block position="relative" text-align="left" font-weight="bold" font-family="Monotype Corsiva" font-size="24pt" color="black" margin-bottom="20pt">
              <fo:block>
                Ценни метали:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/precious_metals/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="normal" font-style="italic" font-size="18pt" color="black" padding-before="10px" margin-left="10px">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>

            <fo:block position="relative" text-align="left" font-weight="bold" font-family="Monotype Corsiva" font-size="24pt" color="black" margin-bottom="20pt">
              <fo:block>
                Автомобили:
              </fo:block>

              <xsl:for-each select="pawnshop/classification/vehicles/resource_ref">
                <fo:block position="relative" font-family="Arial" font-weight="normal" font-style="italic" font-size="18pt" color="black" padding-before="10px" margin-left="10px">
                  -
                  <xsl:value-of select="." />
                </fo:block>
              </xsl:for-each>
            </fo:block>


          </fo:block-container>
        </fo:flow>
      </fo:page-sequence>
      <xsl:call-template name="jewellery" />
      <xsl:call-template name="electronics" />
      <xsl:call-template name="antiques" />
      <xsl:call-template name="art" />
      <xsl:call-template name="precious-metals" />
      <xsl:call-template name="vehicles" />

    </fo:root>
  </xsl:template>


  <!--      Images      -->
  <xsl:template match="image">
    <fo:external-graphic src="{unparsed-entity-uri(@href)}" content-height="300" content-width="345" border="4px solid black" />
  </xsl:template>

  <!--      Jewellery      -->
  <xsl:template name="jewellery">
    <xsl:for-each select="pawnshop/resources/resource[@classification='Jewellery']">
      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container position="relative" wrap-option="wrap">
            <fo:block position="absolute" text-align="center" padding-before="10px" margin-left="10px" font-family="Arial" font-size="40pt" color="black" margin-bottom="20px">
              <xsl:value-of select="name" />
            </fo:block>
          </fo:block-container>

          <fo:table>
            <fo:table-column column-width="50%" />
            <fo:table-column column-width="50%" />

            <fo:table-body>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block-container position="relative">
                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Цена:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="pawnshop_evaluation/currency" />
                        <xsl:value-of select="pawnshop_evaluation/value" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Производител:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="manufacturer" />
                      </fo:inline>
                    </fo:block>


                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Описание:
                      <fo:block position="relative" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="description" />
                      </fo:block>
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>

                <fo:table-cell>
                  <fo:block-container position="relative">
                    <fo:block position="relative" margin-left="20pt">
                      <xsl:apply-templates select=" image" />
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>

              </fo:table-row>
            </fo:table-body>
          </fo:table>
          "
          <xsl:call-template name="additional-info"></xsl:call-template>
        </fo:flow>
      </fo:page-sequence>
    </xsl:for-each>
  </xsl:template>

  <!--    Electronics   -->
  <xsl:template name="electronics">
    <xsl:for-each select="pawnshop/resources/resource[@classification='Electronics']">
      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container position="relative" wrap-option="wrap">
            <fo:block position="absolute" text-align="center" padding-before="10px" margin-left="10px" font-family="Arial" font-size="40pt" color="black" margin-bottom="20px">
              <xsl:value-of select="name" />
            </fo:block>
          </fo:block-container>

          <fo:table>
            <fo:table-column column-width="50%" />
            <fo:table-column column-width="50%" />

            <fo:table-body>
              <fo:table-row>

                <fo:table-cell>
                  <fo:block-container position="relative">
                    <fo:block position="relative" margin-right="20pt">
                      <xsl:apply-templates select="image" />
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>

                <fo:table-cell>
                  <fo:block-container position="relative">
                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Цена:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="pawnshop_evaluation/currency" />
                        <xsl:value-of select="pawnshop_evaluation/value" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Модел:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="model" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Производител:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="manufacturer" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Описание:
                      <fo:block position="relative" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="description" />
                      </fo:block>
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>


              </fo:table-row>
            </fo:table-body>
          </fo:table>
          <xsl:call-template name="additional-info"></xsl:call-template>
        </fo:flow>
      </fo:page-sequence>
    </xsl:for-each>
  </xsl:template>

  <!--    Antiques   -->
  <xsl:template name="antiques">
    <xsl:for-each select="pawnshop/resources/resource[@classification='Antiques']">
      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container position="relative" wrap-option="wrap">
            <fo:block position="absolute" text-align="center" padding-before="10px" margin-left="10px" font-family="Arial" font-size="40pt" color="black" margin-bottom="20px">
              <xsl:value-of select="name" />
            </fo:block>
          </fo:block-container>

          <fo:table>
            <fo:table-column column-width="50%" />
            <fo:table-column column-width="50%" />

            <fo:table-body>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block-container position="relative">
                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Цена:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="pawnshop_evaluation/currency" />
                        <xsl:value-of select="pawnshop_evaluation/value" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Описание:
                      <fo:block position="relative" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="description" />
                      </fo:block>
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>

                <fo:table-cell>
                  <fo:block-container position="relative">
                    <fo:block position="relative" margin-left="20pt">
                      <xsl:apply-templates select=" image" />
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>

              </fo:table-row>
            </fo:table-body>
          </fo:table>
          "
          <xsl:call-template name="additional-info"></xsl:call-template>
        </fo:flow>
      </fo:page-sequence>
    </xsl:for-each>
  </xsl:template>

  <!--    Art    -->
  <xsl:template name="art">
    <xsl:for-each select="pawnshop/resources/resource[@classification='Art']">
      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container position="relative" wrap-option="wrap">
            <fo:block position="absolute" text-align="center" padding-before="10px" margin-left="10px" font-family="Arial" font-size="40pt" color="black" margin-bottom="20px">
              <xsl:value-of select="name" />
            </fo:block>
          </fo:block-container>

          <fo:table>
            <fo:table-column column-width="50%" />
            <fo:table-column column-width="50%" />

            <fo:table-body>
              <fo:table-row>

                <fo:table-cell>
                  <fo:block-container position="relative">
                    <fo:block position="relative" margin-right="20pt">
                      <xsl:apply-templates select="image" />
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>

                <fo:table-cell>
                  <fo:block-container position="relative">
                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Цена:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="pawnshop_evaluation/currency" />
                        <xsl:value-of select="pawnshop_evaluation/value" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Автор:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="author" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Описание:
                      <fo:block position="relative" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="description" />
                      </fo:block>
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>

              </fo:table-row>
            </fo:table-body>
          </fo:table>
          "
          <xsl:call-template name="additional-info"></xsl:call-template>
        </fo:flow>
      </fo:page-sequence>
    </xsl:for-each>
  </xsl:template>

  <!--    Precious Metals    -->
  <xsl:template name="precious-metals">
    <xsl:for-each select="pawnshop/resources/resource[@classification='Precious_Metals']">
      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container position="relative" wrap-option="wrap">
            <fo:block position="absolute" text-align="center" padding-before="10px" margin-left="10px" font-family="Arial" font-size="40pt" color="black" margin-bottom="20px">
              <xsl:value-of select="name" />
            </fo:block>
          </fo:block-container>

          <fo:table>
            <fo:table-column column-width="50%" />
            <fo:table-column column-width="50%" />

            <fo:table-body>
              <fo:table-row>

                <fo:table-cell>
                  <fo:block-container position="relative">
                    <fo:block position="relative" margin-right="20pt">
                      <xsl:apply-templates select="image" />
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>

                <fo:table-cell>
                  <fo:block-container position="relative">
                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Цена:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="pawnshop_evaluation/currency" />
                        <xsl:value-of select="pawnshop_evaluation/value" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Цена:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="pawnshop_evaluation/currency" />
                        <xsl:value-of select="pawnshop_evaluation/value" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Производител:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="manufacturer" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Количество:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="quantity" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Описание:
                      <fo:block position="relative" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="description" />
                      </fo:block>
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>

              </fo:table-row>
            </fo:table-body>
          </fo:table>
          "
          <xsl:call-template name="additional-info"></xsl:call-template>
        </fo:flow>
      </fo:page-sequence>
    </xsl:for-each>
  </xsl:template>

  <!--    Vehicles    -->
  <xsl:template name="vehicles">
    <xsl:for-each select="pawnshop/resources/resource[@classification='Vehicles']">
      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container position="relative" wrap-option="wrap">
            <fo:block position="absolute" text-align="center" padding-before="10px" margin-left="10px" font-family="Arial" font-size="40pt" color="black" margin-bottom="20px">
              <xsl:value-of select="name" />
            </fo:block>
          </fo:block-container>

          <fo:table>
            <fo:table-column column-width="50%" />
            <fo:table-column column-width="50%" />

            <fo:table-body>
              <fo:table-row>

                <fo:table-cell>
                  <fo:block-container position="relative">
                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Цена:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="pawnshop_evaluation/currency" />
                        <xsl:value-of select="pawnshop_evaluation/value" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Производител:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="manufacturer" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Модел:
                      <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="model" />
                      </fo:inline>
                    </fo:block>

                    <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
                      Описание:
                      <fo:block position="relative" font-weight="normal" font-size="16pt">
                        <xsl:value-of select="description" />
                      </fo:block>
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>

                <fo:table-cell>
                  <fo:block-container position="relative">
                    <fo:block position="relative" margin-right="20pt">
                      <xsl:apply-templates select="image" />
                    </fo:block>
                  </fo:block-container>
                </fo:table-cell>

              </fo:table-row>
            </fo:table-body>
          </fo:table>
          "
          <xsl:call-template name="additional-info"></xsl:call-template>
        </fo:flow>
      </fo:page-sequence>
    </xsl:for-each>
  </xsl:template>


  <!-- Additional info -->
  <xsl:template name="additional-info">
    <fo:block-container position="relative" font-style="italic" top="12cm" left="0" margin-top="50pt">
      <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="20pt" color="black" padding-before="10px">
            Допълнителна информация за залога, асоцииран с този продукт:
      </fo:block>
      <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
        Срок:
        <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
          <xsl:value-of select="id(pawn_ref/@ref)/term" />
        </fo:inline>
      </fo:block>

      <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
        Сума дадена на клиента:
        <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
          <xsl:value-of select="id(pawn_ref/@ref)/amount_given/currency" />
          <xsl:value-of select="id(pawn_ref/@ref)/amount_given/value" />
        </fo:inline>
      </fo:block>

      <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
        Подал залога:
        <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
          <xsl:value-of select="id(pawn_ref/@ref)/submitter/name" />
        </fo:inline>
        <fo:inline position="relative" font-weight="normal" font-size="16pt">
          <xsl:value-of select="id(pawn_ref/@ref)/submitter/surname" />
        </fo:inline>
        <fo:block font-style="italic" font-weight="normal" font-size="14pt">
          Контакти:
          <xsl:value-of select="id(pawn_ref/@ref)/submitter/permanent_address" />
          <xsl:text>, </xsl:text>
          <xsl:value-of select="id(pawn_ref/@ref)/submitter/phone_number" />
        </fo:block>
      </fo:block>

      <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
        Приел залога:
        <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
          <xsl:value-of select="id(pawn_ref/@ref)/recipient_employee/name" />
        </fo:inline>
        <fo:inline position="relative" font-weight="normal" font-size="16pt">
          <xsl:value-of select="id(pawn_ref/@ref)/recipient_employee/surname" />
        </fo:inline>
        <fo:block font-style="italic" font-weight="normal" font-size="14pt">
          Работен идектификатор:
          <xsl:value-of select="id(pawn_ref/@ref)/recipient_employee/employee_id" />
        </fo:block>
      </fo:block>

      <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
        Дата на създаване:
        <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
          <xsl:value-of select="id(pawn_ref/@ref)/created_at" />
        </fo:inline>
      </fo:block>

      <fo:block position="relative" font-family="Arial" font-weight="bold" font-size="18pt" color="black" padding-before="10px">
        Дата на последна промяна:
        <fo:inline position="relative" padding-left="3px" font-weight="normal" font-size="16pt">
          <xsl:value-of select="id(pawn_ref/@ref)/updated_at" />
        </fo:inline>
      </fo:block>
    </fo:block-container>
  </xsl:template>


</xsl:stylesheet>