<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:res="http://www.esri.com/metadata/res/" xmlns:esri="http://www.esri.com/metadata/" xmlns:msxsl="urn:schemas-microsoft-com:xslt" >

<!-- An XSLT template for displaying metadata in ArcGIS stored in the ArcGIS metadata format.
     Copyright (c) 2014, Esri, Inc. All rights reserved.
     Revision History: Created 5/20/2014 avienneau
-->

  <xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'" />
  <xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

<xsl:template name="arcgis" >

<div class="box arcgis">

  <!-- BUILD THE DISPLAY - ADD SECTIONS -->

  <div><a name="TopArcGIS" id="TopArcGIS"/></div>

  <xsl:if test="/metadata/dataIdInfo[1]/tpCat | /metadata/dataIdInfo[1]/discKeys | /metadata/dataIdInfo[1]/placeKeys | /metadata/dataIdInfo[1]/stratKeys | /metadata/dataIdInfo[1]/tempKeys | /metadata/dataIdInfo[1]/themeKeys | /metadata/dataIdInfo[1]/productKeys | /metadata/dataIdInfo[1]/subTopicCatKeys | /metadata/dataIdInfo[1]/otherKeys | /metadata/dataIdInfo[1]/taxonKeys | /metadata/dataIdInfo[1]/dataCentreKeys | /metadata/dataIdInfo[1]/featureTypeKeys | /metadata/dataIdInfo[1]/instrumentKeys | /metadata/dataIdInfo[1]/platformKeys | /metadata/dataIdInfo[1]/processKeys | /metadata/dataIdInfo[1]/projectKeys | /metadata/dataIdInfo[1]/serviceKeys | /metadata/Esri/DataProperties/itemProps/imsContentType">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('TopicsAndKeywords')" /></xsl:variable>
    <xsl:variable name="elements1" select="/metadata/dataIdInfo[1]/tpCat | /metadata/dataIdInfo[1]/discKeys | /metadata/dataIdInfo[1]/placeKeys | /metadata/dataIdInfo[1]/stratKeys | /metadata/dataIdInfo[1]/tempKeys | /metadata/dataIdInfo[1]/themeKeys | /metadata/dataIdInfo[1]/productKeys | /metadata/dataIdInfo[1]/subTopicCatKeys | /metadata/dataIdInfo[1]/otherKeys | /metadata/dataIdInfo[1]/taxonKeys | /metadata/dataIdInfo[1]/dataCentreKeys | /metadata/dataIdInfo[1]/featureTypeKeys | /metadata/dataIdInfo[1]/instrumentKeys | /metadata/dataIdInfo[1]/platformKeys | /metadata/dataIdInfo[1]/processKeys | /metadata/dataIdInfo[1]/projectKeys | /metadata/dataIdInfo[1]/serviceKeys | /metadata/Esri/DataProperties/itemProps/imsContentType"/>
    <xsl:variable name="elements1b" select="/metadata/Esri/DataProperties/itemProps/imsContentType"/>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(msxsl:node-set($elements1)/*[not(thesaName)][1]) or generate-id(msxsl:node-set($elements1b))" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/tpCat" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/Esri/DataProperties/itemProps/imsContentType" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/themeKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/placeKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/tempKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/discKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/stratKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/productKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/subTopicCatKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/taxonKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/dataCentreKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/featureTypeKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/instrumentKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/platformKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/processKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/projectKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/serviceKeys" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/otherKeys[not(thesaName/@uuidref='723f6998-058e-11dc-8314-0800200c9a66')]" mode="arcgis"/>
      <!-- <xsl:apply-templates select="/metadata/dataIdInfo[1]/descKeys[not(./thesaName/@uuidref = '723f6998-058e-11dc-8314-0800200c9a66')]" mode="arcgis"/> -->
    </div>
  </xsl:if>

  <xsl:for-each select="/metadata/dataIdInfo[1]/idCitation">
    <xsl:call-template name="tocSectionArcGIS">
      <xsl:with-param name="sectionHeading"><xsl:value-of select="res:str('idCitation')"/></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  
  <xsl:if test="/metadata/dataIdInfo[1]/idCitation/citRespParty">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('CitationContacts')"/></xsl:variable>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(/metadata/dataIdInfo[1]/idCitation/citRespParty[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/idCitation/citRespParty" mode="arcgis"/>
    </div>
  </xsl:if>

  <xsl:for-each select="/metadata/Esri/locales">
    <xsl:call-template name="tocSectionArcGIS">
      <xsl:with-param name="sectionHeading"><xsl:value-of select="res:str('ESRILocales')"/></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>

  <xsl:if test="/metadata/Esri/DataProperties/itemProps | /metadata/dataIdInfo[1]/dataLang | /metadata/dataIdInfo[1]/dataChar | /metadata/dataIdInfo[1]/idStatus | /metadata/dataIdInfo[1]/spatRpType | /metadata/dataIdInfo[1]/dsFormat | /metadata/dataIdInfo[1]/dataScale | /metadata/dataIdInfo[1]/graphOver | /metadata/dataIdInfo[1]/suppInfo | /metadata/dataIdInfo[1]/envirDesc | /metadata/dataIdInfo[1]/idCredit | /metadata/dataIdInfo[1]/idSpecUse">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('ResourceDetails')" /></xsl:variable>
    <xsl:variable name="elements4" select="/metadata/Esri/DataProperties/itemProps | /metadata/dataIdInfo[1]/dataLang | /metadata/dataIdInfo[1]/dataChar | /metadata/dataIdInfo[1]/idStatus | /metadata/dataIdInfo[1]/spatRpType | /metadata/dataIdInfo[1]/dsFormat | /metadata/dataIdInfo[1]/dataScale | /metadata/dataIdInfo[1]/graphOver | /metadata/dataIdInfo[1]/suppInfo | /metadata/dataIdInfo[1]/envirDesc | /metadata/dataIdInfo[1]/idCredit | /metadata/dataIdInfo[1]/idSpecUse"/>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(msxsl:node-set($elements4)/node()[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:for-each select="/metadata/dataIdInfo[1][dataLang | dataChar | idStatus | spatRpType | dsFormat | dataScale | graphOver | suppInfo | envirDesc | idCredit | idSpecUse]">
        <xsl:call-template name="resourceDetails"/>
      </xsl:for-each>
      <xsl:apply-templates select="/metadata/Esri/DataProperties/itemProps" mode="arcgis" />
    </div>
  </xsl:if>

  <xsl:if test="/metadata/dataIdInfo[1]/svType | /metadata/dataIdInfo[1]/svTypeVer | /metadata/dataIdInfo[1]/svAccProps | /metadata/dataIdInfo[1]/svCouplRes | /metadata/dataIdInfo[1]/svCouplType | /metadata/dataIdInfo[1]/svOper | /metadata/Esri/Server | /metadata/Esri/Service | /metadata/Esri/ServiceType | /metadata/Esri/ServiceFCType | /metadata/Esri/ServiceFCName">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('ServiceDetails')" /></xsl:variable>
    <xsl:variable name="elements8" select="/metadata/dataIdInfo[1]/svType | /metadata/dataIdInfo[1]/svTypeVer | /metadata/dataIdInfo[1]/svAccProps | /metadata/dataIdInfo[1]/svCouplRes | /metadata/dataIdInfo[1]/svCouplType | /metadata/dataIdInfo[1]/svOper | /metadata/Esri/Server | /metadata/Esri/Service | /metadata/Esri/ServiceType | /metadata/Esri/ServiceFCType | /metadata/Esri/ServiceFCName"/>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(msxsl:node-set($elements8)/node()[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:for-each select="/metadata/dataIdInfo[1][svType | svTypeVer | svAccProps | svCouplRes | svCouplType | svOper]">
        <xsl:call-template name="serviceDetails"/>
      </xsl:for-each>
      <xsl:for-each select="/metadata/Esri[Server | Service | ServiceType | ServiceFCType | ServiceFCName]">
        <xsl:call-template name="ArcIMSserviceProperties"/>
      </xsl:for-each>
    </div>
  </xsl:if>

  <xsl:if test="/metadata/dataIdInfo[1]/dataExt | /metadata/Esri/DataProperties/itemProps/nativeExtBox">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('Extents')"/></xsl:variable>
    <xsl:variable name="elements7" select="/metadata/dataIdInfo[1]/dataExt | /metadata/Esri/DataProperties/itemProps/nativeExtBox"/>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(msxsl:node-set($elements7)/node()[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/dataExt[count(exDesc) + count(*/*) - count(geoEle/GeoBndBox[@esriExtentType = 'decdegrees']) - count(geoEle/GeoBndBox[@esriExtentType = 'native']) &gt; 0]" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/Esri/DataProperties/itemProps/nativeExtBox" mode="arcgis"/>
    </div>
  </xsl:if>
  
  <xsl:if test="/metadata/dataIdInfo[1]/idPoC">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('ResourcePointsOfContact')"/></xsl:variable>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(/metadata/dataIdInfo[1]/idPoC[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/idPoC" mode="arcgis"/>
    </div>
  </xsl:if>

  <xsl:if test="/metadata/dataIdInfo[1]/resMaint">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('ResourceMaintenance')"/></xsl:variable>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(/metadata/dataIdInfo[1]/resMaint[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/resMaint" mode="arcgis"/>
    </div>
  </xsl:if>

  <xsl:if test="/metadata/dataIdInfo[1]/resConst">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('ResourceConstraints')"/></xsl:variable>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(/metadata/dataIdInfo[1]/resConst[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/resConst/*" mode="arcgis"/>
    </div>
  </xsl:if>

  <xsl:if test="/metadata/refSysInfo | /metadata/Esri/DataProperties/coordRef">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('ReferenceSystem')"/></xsl:variable>
    <xsl:variable name="elements6" select="/metadata/refSysInfo | /metadata/Esri/DataProperties/coordRef"/>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(msxsl:node-set($elements6)/node()[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/Esri/DataProperties/coordRef" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/refSysInfo" mode="arcgis"/>
    </div>
  </xsl:if>
  
  <xsl:if test="/metadata/spatRepInfo | /metadata/spdoinfo/ptvctinf/esriterm | /metadata/Esri/DataProperties/topoinfo | /metadata/Esri/DataProperties/Terrain | /metadata/spdoinfo/netinfo | /metadata/Esri/DataProperties/NetworkDiagram | /metadata/Esri/Locator | /metadata/Esri/DataProperties/RasterProperties">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('SpatialRepresentation')"/></xsl:variable>
    <xsl:variable name="elements5" select="/metadata/spatRepInfo | /metadata/spdoinfo/ptvctinf/esriterm | /metadata/Esri/DataProperties/topoinfo | /metadata/Esri/DataProperties/Terrain | /metadata/spdoinfo/netinfo | /metadata/Esri/DataProperties/NetworkDiagram | /metadata/Esri/Locator | /metadata/Esri/DataProperties/RasterProperties"/>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(msxsl:node-set($elements5)/node()[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/spatRepInfo/*[not(name() = 'GridSpatRep')]" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/spatRepInfo/GridSpatRep[count(.//*/text()) - count(.//*[text() and@Sync]) &gt; 0]" mode="arcgis"/>
      <xsl:if test="/metadata/spdoinfo/ptvctinf/esriterm">
        <xsl:call-template name="esriFeatureClass" />
      </xsl:if>
      <xsl:apply-templates select="/metadata/Esri/DataProperties/topoinfo" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/Esri/DataProperties/Terrain" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/spdoinfo/netinfo" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/Esri/DataProperties/NetworkDiagram" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/Esri/Locator" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/Esri/DataProperties/RasterProperties" mode="arcgis"/>
    </div>
  </xsl:if>
  
  <xsl:if test="/metadata/contInfo[not(name(*) = 'ContInfo')]">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('ContentInformation')"/></xsl:variable>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(/metadata/contInfo[not(name(*) = 'ContInfo')][1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/contInfo/*[not(name() = 'ContInfo')]" mode="arcgis"/>
    </div>
  </xsl:if>
  
  <xsl:if test="/metadata/dqInfo/dqScope | /metadata/dqInfo/report">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('DataQuality')"/></xsl:variable>
    <xsl:variable name="elements9" select="/metadata/dqInfo/*[not(dataLineage)][1]"/>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(msxsl:node-set($elements9))" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/dqInfo" mode="arcgis"/>
    </div>
  </xsl:if>
  
  <xsl:if test="/metadata/dqInfo/dataLineage">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('dataLineage')"/></xsl:variable>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(/metadata/dqInfo/dataLineage[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/dqInfo/dataLineage" mode="arcgis"/>
    </div>
  </xsl:if>
  
  <xsl:for-each select="/metadata/Esri/DataProperties/lineage">
    <xsl:call-template name="tocSectionArcGIS">
      <xsl:with-param name="sectionHeading"><xsl:value-of select="res:str('ESRIGeoprocessingHistory')"/></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  
  <xsl:for-each select="/metadata/distInfo">
    <xsl:call-template name="tocSectionArcGIS">
      <xsl:with-param name="sectionHeading"><xsl:value-of select="res:str('DistributionInformation')"/></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  
  <xsl:for-each select="/metadata/eainfo">
    <xsl:call-template name="tocSectionArcGIS">
      <xsl:with-param name="sectionHeading"><xsl:value-of select="res:str('ESRIFieldsAndSubtypes')"/></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  
  <xsl:if test="/metadata/dataIdInfo[1]/aggrInfo | /metadata/appSchInfo | /metadata/porCatInfo/portCatCit">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('References')"/></xsl:variable>
    <xsl:variable name="elements3" select="/metadata/dataIdInfo[1]/aggrInfo | /metadata/appSchInfo | /metadata/porCatInfo/portCatCit"/>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(msxsl:node-set($elements3)/node()[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/dataIdInfo[1]/aggrInfo" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/porCatInfo/portCatCit" mode="arcgis"/>
      <xsl:apply-templates select="/metadata/appSchInfo" mode="arcgis"/>
    </div>
  </xsl:if>

  <xsl:if test="/metadata/mdFileID | /metadata/metadataID | /metadata/mdLang | /metadata/mdChar | /metadata/mdParentID | /metadata/parentMdCit | /metadata/mdHrLv | /metadata/mdHrLvName | /metadata/mdDateSt | /metadata/mdTimeSt | /metadata/dateInfo | /metadata/dataSetURI | /metadata/dataSetFn | /metadata/altMdReference | /metadata/mdLinkage | /metadata/Esri/ArcGISFormat | /metadata/Esri/ArcGISstyle | /metadata/Esri/ArcGISProfile | /metadata/Esri/CreaDate | /metadata/Esri/CreaTime | /metadata/Esri/ModDate | /metadata/Esri/ModTime | /metadata/Esri/SyncDate | /metadata/Esri/SyncTime | /metadata/Esri/SyncOnce | /metadata/Esri/MapLyrSync | /metadata/Esri/Sync | /metadata/Esri/Identifier | /metadata/Esri/PublishedDocID | /metadata/Esri/PublishStatus | /metadata/Esri/DataProperties/copyHistory">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('MetadataDetails')"/></xsl:variable>
    <xsl:variable name="elements2" select="/metadata/mdFileID | /metadata/metadataID | /metadata/mdLang | /metadata/mdChar | /metadata/mdParentID | /metadata/parentMdCit | /metadata/mdHrLv | /metadata/mdHrLvName | /metadata/mdDateSt | /metadata/mdTimeSt | /metadata/dateInfo | /metadata/dataSetURI | /metadata/dataSetFn | /metadata/altMdReference | /metadata/mdLinkage | /metadata/Esri/ArcGISFormat | /metadata/Esri/ArcGISstyle | /metadata/Esri/ArcGISProfile | /metadata/Esri/CreaDate | /metadata/Esri/CreaTime | /metadata/Esri/ModDate | /metadata/Esri/ModTime | /metadata/Esri/SyncDate | /metadata/Esri/SyncTime | /metadata/Esri/SyncOnce | /metadata/Esri/MapLyrSync | /metadata/Esri/Sync | /metadata/Esri/Identifier | /metadata/Esri/PublishedDocID | /metadata/Esri/PublishStatus | /metadata/Esri/DataProperties/copyHistory"/>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(msxsl:node-set($elements2)/node()[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:call-template name="metadataDetails"/>
      <xsl:call-template name="ArcGISmetadata" />
    </div>
  </xsl:if>
  
  <xsl:if test="/metadata/mdContact">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('MetadataContacts')"/></xsl:variable>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(/metadata/mdContact[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/mdContact" mode="arcgis"/>
    </div>
  </xsl:if>
  
  <xsl:if test="/metadata/mdMaint">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('MetadataMaintenance')"/></xsl:variable>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(/metadata/mdMaint[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/mdMaint" mode="arcgis"/>
    </div>
  </xsl:if>

  <xsl:if test="/metadata/mdConst">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('MetadataConstraints')"/></xsl:variable>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(/metadata/mdConst[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/mdConst/*" mode="arcgis"/>
    </div>
  </xsl:if>
  
  <xsl:if test="/metadata/mdExtInfo">
    <xsl:variable name="sectionHeading"><xsl:value-of select="res:str('MetadataExtensions')"/></xsl:variable>
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(/metadata/mdExtInfo[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
      <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:value-of select="$sectionHeading" />&#160;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a>
    </h3>
    <div class="show" id="{$eleID}">
      <xsl:apply-templates select="/metadata/mdExtInfo" mode="arcgis"/>
    </div>
  </xsl:if>
  
  <xsl:for-each select="/metadata/Binary">
    <xsl:call-template name="tocSectionArcGIS">
      <xsl:with-param name="sectionHeading"><xsl:value-of select="res:str('ESRIThumbnailsAndEnclosures')"/></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>

</div>
</xsl:template>


<!-- TEMPLATES FOR TABLE OF CONTENTS -->

<xsl:template name="tocSectionArcGIS">
  <xsl:param name="sectionHeading" />
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(.)" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <h3>
    <a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
      <xsl:value-of select="$sectionHeading" />&#160;
      <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
    </a>
    </h3>
    <div class="show" id="{$eleID}">
    <xsl:apply-templates select="." mode="arcgis"/>
  </div>
</xsl:template>


<!-- CENTRAL TEMPLATES - CONTENT USED BY MANY SECTIONS/PAGES -->

<!-- Date Information (B.3.2.3 CI_Date) -->
<xsl:template match="date | dateInfo | maintDate" mode="arcgis">
  <xsl:for-each select="*">
    <xsl:call-template name="arcgisDate">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:if test="position() = last()"><br /></xsl:if>
</xsl:template>

<!-- Online Resource Information (B.3.2.4 CI_OnLineResource - line396) -->
<xsl:template match="cntOnlineRes | onLineSrc | extOnRes | svConPt | citOnlineRes | mdLinkage | bgLinkage | graFileOnline | swFileOnline" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="linkage">
      <xsl:call-template name="arcgisUrl">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="orName | protocol">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="orFunct | orDesc">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="appProfile | protocolRequest">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </dl></dd><br/>
</xsl:template>

<!-- Identifier Information (B.2.7.2 MD_Identifier - line205) -->
<xsl:template match="geoId | refSysID | srcRefSys | RS_Identifier | citId | svResCitId | imagQuCode | prcTypCde | measId | aggrDSIdent | metadataID | medId | partyId" mode="arcgis">
  <xsl:choose>
    <xsl:when test="(name() = 'geoId') or (name() = 'citId') or (name() = 'svResCitId') or (name() = 'imagQuCode') or (name() = 'prcTypCde') or (name() = 'measId') or (name() = 'aggrDSIdent') or (name() = 'refSysID') or (name() = 'srcRefSys') or (name() = 'metadataID') or (name() = 'medId') or (name() = 'partyId')">
      <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
    </xsl:when>
  </xsl:choose>
  <dd><dl>
    <xsl:if test="(name() = 'refSysID') or (name() = 'srcRefSys')">
      <xsl:for-each select="../@dimension[. != '']">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:if>
    <xsl:for-each select="identCode">
      <xsl:choose>
      <xsl:when test="(name(..) = 'refSysID')">
        <dt><span class="ElementLabel">
            <xsl:call-template name="elementText">
              <xsl:with-param name="ele" select="@code" />
            </xsl:call-template>
          </span>&#x2003;<xsl:if test="@Sync = 'TRUE'">
          <span class="sync">&#8660;</span>&#x2009;</xsl:if><xsl:value-of select="@code"/></dt>
      </xsl:when>
      <xsl:when test="(@code != '')">
        <dt><span class="ElementLabel">
            <xsl:call-template name="elementText">
              <xsl:with-param name="ele" select="@code" />
            </xsl:call-template>
          </span>&#x2003;<xsl:if test="@Sync = 'TRUE'">
          <span class="sync">&#8660;</span>&#x2009;</xsl:if><xsl:value-of select="@code"/></dt>
      </xsl:when>
      <xsl:when test="(. != '')">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      </xsl:choose>
    </xsl:for-each>
    <xsl:for-each select="idCodeSpace | idVersion | idDescription">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="(identCode | idCodeSpace | idVersion | idDescription)"><br /></xsl:if>
    
    <xsl:apply-templates select="identAuth" mode="arcgis"/>
    </dl></dd>
</xsl:template>

<!-- Resolution Information (B.2.2.4 MD_Resolution - line59) -->
<xsl:template match="dataScale | srcResol" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:apply-templates select="equScale" mode="arcgis"/>
    
    <xsl:for-each select="scaleDist | verticalDist | angularDist">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
        <!-- value will be shown regardless of any subelement present: Integer, Real, or Decimal -->
        <xsl:for-each select="value">
          <xsl:call-template name="arcgisMeasures">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <xsl:if test="(value)"><br /></xsl:if>
      </dl></dd>
    </xsl:for-each>
    <xsl:for-each select="levelOfDetail">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    </dl></dd>
</xsl:template>

<!-- Representative Fraction Information (B.2.2.3 MD_RepresentativeFraction - line56) -->
<xsl:template match="equScale | srcScale" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="rfDenom">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </dl></dd>
</xsl:template>

<!-- Scope Description Information (B.2.5.1 MD_ScopeDescription - line149) -->
<xsl:template match="scpLvlDesc | upScpDesc" mode="arcgis">
  <xsl:if test="position() = 1">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
  </xsl:if>
  <dd><dl>
    <xsl:for-each select="attribSet | featSet | featIntSet | attribIntSet | datasetSet | other">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </dl></dd>
</xsl:template>

<!-- Units of Measurement Types (from ISO 19103 information in 19115 DTD) -->

<!-- Units of Measurement (from ISO 19103 information in 19115 DTD) -->
<xsl:template match="UOM" mode="arcgis">
  <dd><dl>
    <xsl:for-each select="unitSymbol">
      <xsl:call-template name="arcgisTypedElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
        <xsl:with-param name="type" select="@codeSpace"></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="unitQuanType">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="unitQuanRef">
      <xsl:call-template name="arcgisUrl">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="(unitSymbol | unitQuanType | unitQuanRef)" ><br /></xsl:if>
    
    <xsl:if test="(@gmlID != '') or (gmlDesc != '') or (gmlDescRef != '') or (gmlIdent != '') or (gmlName != '') or (gmlRemarks != '')">
      <xsl:call-template name="gmlAttributes" />
      <br />
    </xsl:if>
  </dl></dd>
</xsl:template>

<!-- GML object attributes -->
<xsl:template name="gmlAttributes">
   <dt><span class="SubContentHeader"><res:gmlAttributes /></span></dt>
   <dd><dl>
    <xsl:for-each select="@gmlID | gmlDesc">
       <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="gmlDescRef">
       <xsl:call-template name="arcgisUrl">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="gmlIdent | gmlName">
      <xsl:call-template name="arcgisTypedElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
        <xsl:with-param name="type" select="@codeSpace"></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="gmlRemarks">
        <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </dl></dd>
</xsl:template>

<!-- Member Names (from ISO 19103 information in 19115 DTD) -->

<!-- Type Name -->
<xsl:template match="TypeName | svValType" mode="arcgis">
    <dd><dl>
    <xsl:for-each select="aName">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    </dl></dd>
</xsl:template>

<!-- Member Name -->
<xsl:template match="MemberName | seqID | svParName" mode="arcgis">
  <xsl:for-each select="aName">
    <xsl:call-template name="arcgisElement">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:if test="attributeType">
    <xsl:for-each select="attributeType/aName">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:if><br />
</xsl:template>


<!-- OVERVIEW TOPICS AND KEYWORDS PAGE -->

<!-- Topic Categories (B.2.2.1 topicCategory - line41)-->
<xsl:template match="tpCat[1]" mode="arcgis">
  <xsl:call-template name="arcgisCodeMany">
    <xsl:with-param name="ele" select="../tpCat"></xsl:with-param>
  </xsl:call-template>
  <br />
</xsl:template>

<!-- ArcIMS Metadata Service Content Types - used by Geoportal -->
<xsl:template match="imsContentType[. != '']" mode="arcgis">
  <xsl:call-template name="arcgisCode">
    <xsl:with-param name="ele" select="."></xsl:with-param>
  </xsl:call-template>
  <xsl:if test="(@export != '')">
    <dd><dl>
        <xsl:for-each select="@export">
          <xsl:call-template name="arcgisBoolean">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
    </dl></dd>
  </xsl:if>
  <br /><xsl:if test="(@export = '') or not(@export)"><br /></xsl:if>
</xsl:template>

<!-- Keyword Information (B.2.2.2 MD_Keywords - line52)-->
<xsl:template match="discKeys | placeKeys | stratKeys | tempKeys | themeKeys | otherKeys[not(thesaName/@uuidref='723f6998-058e-11dc-8314-0800200c9a66')] | productKeys | subTopicCatKeys | taxonKeys | dataCentreKeys | featureTypeKeys | instrumentKeys | platformKeys | processKeys | projectKeys | serviceKeys" mode="arcgis">
  <xsl:call-template name="arcgisElementMany">
    <xsl:with-param name="ele" select="keyword[(. != '001') and (. != '002') and (. != '003') and (. != '004') and (. != '005') and (. != '006') and (. != '007') and (. != '008') and (. != '009') and (. != '010') and (. != '011') and (. != '012') and (. != '013') and (. != '014') and (. != '015') and (. != '016') and (. != '017') and (. != '018')]"></xsl:with-param>
  </xsl:call-template>
    <dd><dl>
      <xsl:if test="thesaName/* or thesaLang"><br /></xsl:if>
      <xsl:for-each select="thesaLang">
        <xsl:call-template name="arcgisLangCntry">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
      </xsl:for-each>
      <xsl:apply-templates select="thesaName[*]" mode="arcgis"/>
      <xsl:apply-templates select="keywordClass" mode="arcgis"/>
      <xsl:if test="not(thesaName/* or thesaLang or keywordClass)"><br /></xsl:if>
    </dl></dd>
</xsl:template>
<xsl:template match="keywordClass[. != '']" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
    <xsl:with-param name="ele" select="."></xsl:with-param>
  </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="className | conceptId">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:apply-templates select="ontology" mode="arcgis"/>
  </dl></dd>
  <xsl:if test="not(ontology/* or className or conceptId)"><br /></xsl:if>
</xsl:template>


<!-- CITATION INFORMATION - OVERVIEW CITATION PAGE, ALSO REFERENCED BY OTHER SECTIONS/PAGES -->

<!-- Citation Information (B.3.2 CI_Citation - line359) -->
<xsl:template match="idCitation | thesaName | identAuth | srcCitatn | evalProc | conSpec | paraCit | portCatCit | catCitation | asName | aggrDSName | parentMdCit | altMdReference | ontology | additionalDoc | usrIssues | metadataRef | referenceDoc | reportReference | srcMetadata | evalReferenceDoc | fmtSpecCitation | medCitation | svOperDataset | svProfile | svStandard | svResourceRef" mode="arcgis">
  <xsl:choose>
    <xsl:when test="(name() = 'idCitation')">
      <xsl:call-template name="citationInformation" />
    </xsl:when>
    <xsl:when test="(name() != 'idCitation') and (./*)">
      <xsl:variable name="eleID"><xsl:value-of select="generate-id(./*[1])" /></xsl:variable>
      <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
      <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
      <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:call-template name="arcgisElementNameExpander">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a></dt>
      <div class="show" id="{$eleID}">
        <dd><dl>
          <xsl:call-template name="citationInformation" />
        </dl></dd>
      </div>
    </xsl:when>
  </xsl:choose>
</xsl:template>
<xsl:template name="citationInformation">
  <xsl:for-each select="resTitle">
    <xsl:call-template name="arcgisElement">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:if test="resAltTitle">
    <xsl:call-template name="arcgisElementMany">
      <xsl:with-param name="ele" select="resAltTitle"></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
  <xsl:apply-templates select="date" mode="arcgis"/>
  <xsl:if test="(resTitle or resAltTitle) and not(date)"><br /></xsl:if>
  
  <xsl:for-each select="resEd">
    <xsl:call-template name="arcgisElement">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:for-each select="resEdDate">
    <xsl:call-template name="arcgisDate">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:if test="resEd | resEdDate"><br /></xsl:if>
  
  <xsl:if test="presForm[PresFormCd]">
    <xsl:call-template name="arcgisCodeMany">
      <xsl:with-param name="ele" select="presForm[PresFormCd]"></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
  <xsl:if test="presForm/fgdcGeoform">
    <xsl:call-template name="arcgisElementMany">
      <xsl:with-param name="ele" select="presForm/fgdcGeoform"></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
  <xsl:if test="presForm/PresFormCd | presForm/fgdcGeoform"><br /></xsl:if>
  
  <xsl:apply-templates select="datasetSeries" mode="arcgis"/>
  <xsl:for-each select="collTitle">
    <xsl:call-template name="arcgisElement">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template><br/><br/>
  </xsl:for-each>

  <xsl:for-each select="isbn | issn">
    <xsl:call-template name="arcgisElement">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:if test="isbn | issn"><br /></xsl:if>
  <xsl:for-each select="citId">
    <xsl:if test="./*">
      <xsl:apply-templates select="." mode="arcgis"/>
    </xsl:if>
  </xsl:for-each>

  <xsl:for-each select="otherCitDet">
    <xsl:call-template name="arcgisTextWithUrls">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
    <br />
  </xsl:for-each>
  
  <xsl:if test="(name() != 'idCitation')">
    <xsl:apply-templates select="citRespParty" mode="arcgis"/>
    <xsl:apply-templates select="citOnlineRes" mode="arcgis"/>
  </xsl:if>

  <xsl:if test="not (text()) and not(*)"><br /></xsl:if>
</xsl:template>

<!-- Series Information (B.3.2.5 CI_Series - line403) -->
<xsl:template match="datasetSeries" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="*">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    </dl></dd>
</xsl:template>


<!-- CONTACT INFORMATION - OVERVIEW CITATION CONTACTS, METADATA CONTACTS, RESOURCE POINTS OF CONTACT PAGES, AND OTHER SECTIONS -->

<!-- Responsible Party Information (B.3.2 CI_ResponsibleParty - line374) -->
<xsl:template match="mdContact | idPoC | usrCntInfo | stepProc | distorCont | citRespParty | extEleSrc | maintCont | responsibleParty | addressee" mode="arcgis">
  <dt><span class="SubContentHeader">
      <xsl:call-template name="elementText">
        <xsl:with-param name="ele" select="." />
      </xsl:call-template>&#160;-&#160;<xsl:call-template name="CI_RoleCode">
        <xsl:with-param name="code" select="role/RoleCd/@value" />
      </xsl:call-template>
    </span>&#x2003;<xsl:if test="@Sync = 'TRUE'">
    <span class="sync">&#8660;</span>&#x2009;</xsl:if></dt>
  <dd><dl>
    <xsl:apply-templates select="partyExt" mode="arcgis"/>
    <xsl:call-template name="contactInformation" />
    <xsl:for-each select="extraOrg">
      <xsl:variable name="eleID"><xsl:value-of select="generate-id(extraOrg)" /></xsl:variable>
      <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
      <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
      <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:call-template name="arcgisElementNameExpander">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a></dt>
      <div class="show" id="{$eleID}">
        <xsl:call-template name="contactInformation" />
      </div>
    </xsl:for-each>
    <xsl:for-each select="extraIndividual">
      <xsl:variable name="eleID"><xsl:value-of select="generate-id(extraIndividual)" /></xsl:variable>
      <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
      <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
      <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:call-template name="arcgisElementNameExpander">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a></dt>
      <div class="show" id="{$eleID}">
        <xsl:call-template name="contactInformation" />
      </div>
    </xsl:for-each>
  </dl></dd>
</xsl:template>

<xsl:template name="contactInformation">
  <xsl:if test="rpIndName | rpOrgName | rpPosName | role | rpCntInfo/*">
    <xsl:for-each select="rpIndName | rpOrgName | rpPosName">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <br />
    <dd><dl>
    <xsl:if test="(rpCntInfo/* != '')">
    <xsl:for-each select="rpCntInfo[* != '']">
      <xsl:variable name="eleID"><xsl:value-of select="generate-id(rpCntInfo)" /></xsl:variable>
      <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
      <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
      <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:call-template name="arcgisElementNameExpander">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a></dt>
      <div class="show" id="{$eleID}">
        <xsl:apply-templates select="." mode="arcgis"/>
      </div>
    </xsl:for-each>
    </xsl:if>
    <xsl:if test="(extraCntInfo/* != '')">
    <xsl:for-each select="extraCntInfo[* != '']">
      <xsl:variable name="eleID"><xsl:value-of select="generate-id(extraCntInfo)" /></xsl:variable>
      <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
      <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
      <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:call-template name="arcgisElementNameExpander">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a></dt>
      <div class="show" id="{$eleID}">
        <xsl:apply-templates select="." mode="arcgis"/>
      </div>
    </xsl:for-each>
    </xsl:if>
    <xsl:apply-templates select="partyId" mode="arcgis"/>
    <xsl:apply-templates select="logo" mode="arcgis"/>
    <xsl:for-each select="individual">
      <xsl:variable name="eleID"><xsl:value-of select="generate-id(individual)" /></xsl:variable>
      <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
      <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
      <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:call-template name="arcgisElementNameExpander">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a></dt>
      <div class="show" id="{$eleID}">
        <dd><dl>
          <xsl:call-template name="contactInformation" />
        </dl></dd>
      </div>
    </xsl:for-each>
    </dl></dd>
  </xsl:if>
</xsl:template>

<!-- Contact Information (B.3.2.2 CI_Contact - line387) -->
<xsl:template match="rpCntInfo | extraCntInfo" mode="arcgis">
    <dd><dl>
    <xsl:apply-templates select="cntPhone" mode="arcgis"/>
    <xsl:apply-templates select="cntAddress" mode="arcgis"/>
    <xsl:apply-templates select="extraAddress" mode="arcgis"/>
    <xsl:apply-templates select="cntOnlineRes" mode="arcgis"/>
    
    <xsl:for-each select="cntHours">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="cntInstr">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="contactType">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    </dl></dd>
</xsl:template>

<!-- Telephone Information (B.3.2.6 CI_Telephone - line407) -->
<xsl:template match="cntPhone" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="voiceNum | faxNum | smsNum">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    </dl></dd>
</xsl:template>

<!-- Address Information (B.3.2.1 CI_Address - line380) -->
<xsl:template match="cntAddress | extraAddress" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="@addressType | delPoint | city | adminArea | postCode | country">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="eMailAdd">
      <xsl:call-template name="arcgisEmail">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    </dl></dd>
</xsl:template>


  <!-- OVERVIEW LOCALES PAGE -->

  <!--   MULTI-LINGUAL TITLE AND DESCRIPTION IN ONE METADATA DOCUMENT -->
  <xsl:template match="/metadata/Esri/locales" mode="arcgis">
    <xsl:for-each select="locale">
      <dt><xsl:call-template name="arcgisLangCntry">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
    <xsl:if test="(resTitle != '') or (idAbs != '')">
      <dd><dl>
        <xsl:for-each select="resTitle">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="idAbs">
          <xsl:call-template name="arcgisTextWithUrls">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </dl></dd>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<!-- METADATA DETAILS PAGE -->

<!-- Metadata Information (B.2.1 MD_Metadata - line1) -->
<xsl:template name="metadataDetails">
  <xsl:for-each select="/metadata/mdLang">
    <xsl:call-template name="arcgisLangCntry">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:for-each select="/metadata/mdChar">
    <xsl:call-template name="arcgisCode">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:if test="(/metadata/mdLang | /metadata/mdChar)"><br /></xsl:if>

  <xsl:for-each select="/metadata/mdFileID">
    <xsl:call-template name="arcgisElement">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:if test="/metadata/metadataID">
    <dd><dl>
      <xsl:apply-templates select="/metadata/metadataID" mode="arcgis"/>
    </dl></dd>
  </xsl:if>
  <xsl:for-each select="/metadata/mdParentID">
    <xsl:call-template name="arcgisElement">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:if test="/metadata/parentMdCit">
    <dd><dl>
      <xsl:apply-templates select="/metadata/parentMdCit" mode="arcgis"/>
    </dl></dd>
  </xsl:if>
  <xsl:apply-templates select="/metadata/altMdReference" mode="arcgis"/>
  <xsl:apply-templates select="/metadata/mdLinkage" mode="arcgis"/>
  <xsl:for-each select="/metadata/dataSetURI">
    <xsl:call-template name="arcgisElement">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:for-each select="/metadata/dataSetFn">
    <xsl:call-template name="arcgisCode">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:if test="(/metadata/mdFileID | /metadata/mdParentID | /metadata/dataSetURI | /metadata/dataSetFn)"><br /></xsl:if>

    
  <xsl:if test="/metadata/mdHrLv">
    <xsl:call-template name="arcgisCodeMany">
      <xsl:with-param name="ele" select="/metadata/mdHrLv"></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
  <xsl:if test="/metadata/mdHrLvName">
    <xsl:call-template name="arcgisElementMany">
      <xsl:with-param name="ele" select="/metadata/mdHrLvName"></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
  <xsl:if test="(/metadata/mdHrLv | /metadata/mdHrLvName)"><br /></xsl:if>
 
  <xsl:for-each select="/metadata/mdDateSt">
    <xsl:call-template name="arcgisSeparateDateTime">
      <xsl:with-param name="dateEle" select="." />
      <xsl:with-param name="timeEle" select="../mdTimeSt" />
    </xsl:call-template><br />
  </xsl:for-each>
  <xsl:for-each select="/metadata/dateInfo">
    <xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="." />
    </xsl:call-template>
    <dd><dl>
      <xsl:apply-templates select="." mode="arcgis"/>
    </dl></dd>
  </xsl:for-each>
</xsl:template>

<!--   ESRI METADATA AND ITEM PROPERTIES NOT AVAILABLE IN EDITOR -->

<xsl:template name="ArcGISmetadata">
  <xsl:for-each select="/metadata/Esri">
    <dt><span class="SubContentHeader"><res:Properties /></span></dt>
    <dd><dl>
      <dt><span class="ElementLabel"><res:metadataFormat /></span>&#x2003;<xsl:choose>
          <xsl:when test="(ArcGISFormat != '')"><res:ArcGISFormat />&#x2008;<xsl:value-of select="ArcGISFormat" /></xsl:when>
          <xsl:otherwise><res:ESRIISOFormat /></xsl:otherwise>
        </xsl:choose>
      </dt>
      <xsl:for-each select="ArcGISstyle | ArcGISProfile">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <br />
  
      <xsl:if test="CreaDate | CreaTime">
        <xsl:for-each select="CreaDate">
          <xsl:call-template name="arcgisSeparateDateTime">
            <xsl:with-param name="dateEle" select="."></xsl:with-param>
            <xsl:with-param name="timeEle" select="../CreaTime"></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="ModDate | ModTime">
        <xsl:for-each select="ModDate">
          <xsl:call-template name="arcgisSeparateDateTime">
            <xsl:with-param name="dateEle" select="."></xsl:with-param>
            <xsl:with-param name="timeEle" select="../ModTime"></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="(CreaDate | CreaTime | ModDate | ModTime)"><br /></xsl:if>
      
      <xsl:if test="SyncDate | SyncTime | SyncOnce | MapLyrSync">
        <dt><span class="SubContentHeader"><res:Sync /></span></dt>
        <dd><dl>
          <!-- can't use boolean template for SyncOnce because value means the opposite of what it is -->
          <xsl:for-each select="SyncOnce">
            <dt><span class="ElementLabel"><xsl:call-template name="elementText">
                <xsl:with-param name="ele" select="." />
              </xsl:call-template></span>&#x2003;<xsl:if test="(. = 'FALSE')">
                <res:boolTrue /></xsl:if><xsl:if test="(. = 'TRUE')"><res:boolFalse /></xsl:if></dt>
          </xsl:for-each>
          <xsl:if test="SyncDate | SyncTime">
            <xsl:for-each select="SyncDate">
              <xsl:call-template name="arcgisSeparateDateTime">
                <xsl:with-param name="dateEle" select="."></xsl:with-param>
                <xsl:with-param name="timeEle" select="../SyncTime"></xsl:with-param>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:if>
          <xsl:for-each select="MapLyrSync">
            <xsl:call-template name="arcgisBoolean">
              <xsl:with-param name="ele" select="."></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
        </dl></dd>
      </xsl:if>
      
      <xsl:for-each select="Identifier | PublishedDocID | PublishStatus">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:if test="(Identifier | PublishedDocID | PublishStatus)"><br /></xsl:if>
      
      <xsl:apply-templates select="DataProperties/copyHistory" mode="arcgis" />
      </dl></dd>
  </xsl:for-each>
</xsl:template>

<xsl:template match="/metadata/Esri/DataProperties/itemProps" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>      
    <xsl:for-each select="itemName | itemSize">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <!-- native type, not the same as data element type -->
    <xsl:for-each select="itemLocation/linkage">
      <xsl:call-template name="arcgisUrl">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="itemLocation/protocol">
      <dd><dl>
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </dl></dd>
    </xsl:for-each>
  </dl></dd>
</xsl:template>

<xsl:template name="ArcIMSserviceProperties">
  <xsl:for-each select="/metadata/Esri[Server | Service | ServiceType | ServiceFCType | ServiceFCName]">
    <dt><span class="SubContentHeader"><res:ServiceInfo /></span></dt>
    <dd><dl> 
      <xsl:for-each select="Server | Service | ServiceType | ServiceFCType | ServiceFCName">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </dl></dd>
  </xsl:for-each>
</xsl:template>

<xsl:template match="/metadata/Esri/DataProperties/copyHistory" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
    <xsl:with-param name="ele" select="."></xsl:with-param>
  </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="copy">
      <xsl:call-template name="arcgisSeparateDateTime">
        <xsl:with-param name="dateEle" select="@date"></xsl:with-param>
        <xsl:with-param name="timeEle" select="@time"></xsl:with-param>
      </xsl:call-template>
      <dd><dl>
        <xsl:for-each select="@source | @dest">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </dl></dd>
    </xsl:for-each>
  </dl></dd>
</xsl:template>

<!-- METADATA EXTENSION ELEMENT INFO - NOT AVAILABLE IN EDITOR -->
<!-- THIS SHOULD GENERALLY NOT EXIST EXCEPT IN CUSTOM SCENARIOS -->

<!-- Metadata Extension Information (B.2.11 MD_MetadataExtensionInformation - line303) -->
<xsl:template match="mdExtInfo" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(./*[1])" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
    <xsl:call-template name="arcgisElementNameExpander">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
      <xsl:apply-templates select="extOnRes" mode="arcgis"/>
      <xsl:apply-templates select="extEleInfo" mode="arcgis"/>
    </dl></dd>
  </div>
</xsl:template>

<!-- Extended Element Information (B.2.11.1 MD_ExtendedElementInformation - line306) -->
<xsl:template match="extEleInfo" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="extEleName | extShortName | extDomCode | extEleDef">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="extEleName | extShortName | extDomCode | extEleDef"><br /></xsl:if>
    
    <xsl:for-each select="extEleOb">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="extEleCond | extEleMxOc">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="eleDataType">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="extEleDomVal">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="extEleOb | extEleCond | extEleMxOc | eleDataType | extEleDomVal"><br /></xsl:if>
    
    <xsl:for-each select="extEleParEnt | extEleRule | extEleRat">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="extEleParEnt | extEleRule | extEleRat"><br /></xsl:if>
    
    <xsl:apply-templates select="extEleSrc" mode="arcgis"/>
    </dl></dd>
</xsl:template>
 

<!-- CONSTRAINTS INFORMATION - METADATA CONSTRAINTS AND RESOURCE CONSTRAINTS PAGES  -->

<!-- General Constraint Information (B.2.3 MD_Constraints - line67) -->
<xsl:template match="Consts" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
      <xsl:for-each select="useLimit">
        <xsl:call-template name="arcgisEscapedHtml">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:apply-templates select="applicationScope" mode="arcgis"/>
      <xsl:apply-templates select="constsGraphic" mode="arcgis"/>
      <xsl:apply-templates select="referenceDoc" mode="arcgis"/>
      <xsl:apply-templates select="releasability" mode="arcgis"/>
      <xsl:apply-templates select="responsibleParty" mode="arcgis"/>
    </dl></dd>
</xsl:template>

<xsl:template match="releasability" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
    <xsl:with-param name="ele" select="."></xsl:with-param>
  </xsl:call-template></dt>
  <dd><dl>
    <xsl:apply-templates select="addressee" mode="arcgis"/>
    <xsl:for-each select="statement">
      <xsl:call-template name="arcgisEscapedHtml">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="disseminationConsts">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
      <xsl:apply-templates select="Consts" mode="arcgis"/>
      <xsl:apply-templates select="LegConsts" mode="arcgis"/>
      <xsl:apply-templates select="SecConsts" mode="arcgis"/>
      </dl></dd>
    </xsl:for-each>
  </dl></dd>
</xsl:template>


<!-- Legal Constraint Information (B.2.3 MD_LegalConstraints - line69) -->
<xsl:template match="LegConsts" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="useLimit">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>

    <xsl:if test="accessConsts">
      <xsl:call-template name="arcgisCodeMany">
        <xsl:with-param name="ele" select="accessConsts"></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="useConsts">
      <xsl:call-template name="arcgisCodeMany">
        <xsl:with-param name="ele" select="useConsts"></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="accessConsts | useConsts"><br /></xsl:if>
    
    <xsl:for-each select="inspirePublicAccessLimits">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="inspireAccessUseConditions">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="inspirePublicAccessLimits | inspireAccessUseConditions"><br /></xsl:if>
    
    <xsl:for-each select="othConsts">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    </dl></dd>
</xsl:template>

<!-- Security Constraint Information (B.2.3 MD_SecurityConstraints - line73) -->
<xsl:template match="SecConsts" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="class">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="classSys">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="(class | classSys)"><br /></xsl:if>
    
    <xsl:for-each select="handDesc | userNote">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    
    <xsl:for-each select="useLimit">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    </dl></dd>
</xsl:template>


<!-- MAINTENANCE INFORMATION - METADATA MAINTENANCE AND RESOURCE MAINTENANCE PAGES -->

<!-- Maintenance Information (B.2.5 MD_MaintenanceInformation - line142) -->
<xsl:template match="mdMaint | resMaint" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="dateNext">
      <xsl:call-template name="arcgisDate">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="maintDate">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
        <xsl:apply-templates select="." mode="arcgis"/>
      </dl></dd>
    </xsl:for-each>
    <xsl:for-each select="maintFreq">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:apply-templates select="usrDefFreq" mode="arcgis"/>
    <xsl:if test="(dateNext | maintDate | maintFreq | usrDefFreq)"><br /></xsl:if>
    
    <xsl:if test="maintScp">
      <xsl:call-template name="arcgisCodeMany">
        <xsl:with-param name="ele" select="maintScp"></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:apply-templates select="upScpDesc" mode="arcgis"/>
    <xsl:apply-templates select="maintScpExt" mode="arcgis"/>
    <xsl:if test="(maintScp) and not (upScpDesc or maintScpExt)"><br /></xsl:if>

    <xsl:for-each select="maintNote">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    
    <xsl:apply-templates select="maintCont" mode="arcgis"/>
    </dl></dd>
</xsl:template>

<!-- Time Period Information (from 19103 information in 19115 DTD) -->
<xsl:template match="usrDefFreq" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="duration">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </dl></dd>
</xsl:template>


<!-- RESOURCE DETAILS PAGE -->

<!-- Resource Identification Information (B.2.2 MD_Identification - line23, including MD_DataIdentification - line36) -->
<xsl:template name="resourceDetails">
  <xsl:if test="dataLang">
    <xsl:call-template name="arcgisLangCntryMany">
      <xsl:with-param name="ele" select="dataLang"></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
  <xsl:if test="dataChar">
    <xsl:call-template name="arcgisCodeMany">
      <xsl:with-param name="ele" select="dataChar"></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
  <xsl:if test="(dataLang | dataChar)"><br /></xsl:if>
  
  <xsl:if test="idStatus">
    <xsl:call-template name="arcgisCodeMany">
      <xsl:with-param name="ele" select="idStatus"></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
  <xsl:if test="spatRpType">
    <xsl:call-template name="arcgisCodeMany">
      <xsl:with-param name="ele" select="spatRpType"></xsl:with-param>
    </xsl:call-template>
  </xsl:if>
  <xsl:if test="(idStatus | spatRpType)"><br /></xsl:if>

  <xsl:apply-templates select="dataScale" mode="arcgis"/>
  <xsl:apply-templates select="graphOver" mode="arcgis"/>
  
  <xsl:for-each select="suppInfo">
    <xsl:call-template name="arcgisTextWithUrls">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  
  <xsl:for-each select="envirDesc">
    <xsl:call-template name="arcgisElement">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
    <br />
  </xsl:for-each>
  <xsl:for-each select="idCredit">
    <xsl:call-template name="arcgisEscapedHtml">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  
  <xsl:apply-templates select="idSpecUse" mode="arcgis"/>
  <xsl:apply-templates select="dsFormat" mode="arcgis"/>
</xsl:template>

<!-- Browse Graphic Information (B.2.2.1 MD_BrowGraph - line48) -->
<xsl:template match="graphOver | constsGraphic | logo" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
    <xsl:with-param name="ele" select="."></xsl:with-param>
  </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="bgFileName">
      <xsl:call-template name="arcgisUrl">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="bgFileType | bgFileDesc">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="bgConsts">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
      <xsl:apply-templates select="Consts" mode="arcgis"/>
      <xsl:apply-templates select="LegConsts" mode="arcgis"/>
      <xsl:apply-templates select="SecConsts" mode="arcgis"/>
      </dl></dd>
    </xsl:for-each>
    <xsl:apply-templates select="bgLinkage" mode="arcgis"/>
    </dl></dd><br />
</xsl:template>

<!-- Usage Information (B.2.2.5 MD_Usage - line62) -->
<xsl:template match="idSpecUse" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="usageDate">
      <xsl:call-template name="arcgisDate">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="usageDateGml">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
        <xsl:call-template name="gmlAttributes" />
      </dl></dd><br />
    </xsl:for-each>
    <xsl:for-each select="usageDateTime">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
        <xsl:apply-templates select="TM_Instant" mode="arcgis"/>
        <xsl:apply-templates select="TM_Period" mode="arcgis"/>
      </dl></dd><br />
    </xsl:for-each>
    <xsl:for-each select="specUsage">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="(usageDate | specUsage)"><br /></xsl:if>
    
    <xsl:for-each select="usrDetLim | usrResponse">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    
    <xsl:apply-templates select="additionalDoc" mode="arcgis"/>
    <xsl:apply-templates select="usrIssues" mode="arcgis"/>
    <xsl:apply-templates select="usrCntInfo" mode="arcgis"/>
    </dl></dd>
</xsl:template>


<!-- RESOURCE SERVICES PAGE -->

<!-- SERVICE IDENTIFICATION (from ISO 19119) -->
<!-- older custom editors may have used this separate element; ArcGIS metadata blends service content into dataIdInfo -->

<!-- Service Identification Information (B.2.2 MD_Identification - line23, including MD_DataIdentification - line36) -->
<xsl:template name="serviceDetails">
  <xsl:for-each select="svType/genericName">
    <xsl:call-template name="arcgisTypedElement">
      <xsl:with-param name="ele" select="."></xsl:with-param>
      <xsl:with-param name="type" select="@codeSpace"></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:for-each select="svTypeVer">
    <xsl:call-template name="arcgisElement">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:if test="(svType or svTypeVer)"><br /></xsl:if>

  <xsl:apply-templates select="svAccProps" mode="arcgis"/>

  <xsl:for-each select="svCouplType">
    <xsl:call-template name="arcgisCode">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
    <br />
  </xsl:for-each>
  <xsl:for-each select="svCouplRes">
    <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
    <dd><dl>
      <xsl:for-each select="svOpName">
        <xsl:call-template name="arcgisTextWithUrls">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:apply-templates select="svOperDefinition" mode="arcgis"/>
      <xsl:apply-templates select="svResCitId" mode="arcgis"/>
      <xsl:apply-templates select="svResourceRef" mode="arcgis"/>
    </dl></dd>
  </xsl:for-each>

  <xsl:apply-templates select="svOperDataset" mode="arcgis"/>
  <xsl:apply-templates select="svOper" mode="arcgis"/>
  <xsl:for-each select="svOperChain">
    <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
    <dd><dl>
      <xsl:for-each select="svChainName | svChainDesc">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="svOperOrdered">
        <dt><xsl:call-template name="arcgisElementName">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template></dt>
        <dd><dl>
          <xsl:apply-templates select="svOper" mode="arcgis"/>
        </dl></dd>
      </xsl:for-each>
    </dl></dd>
  </xsl:for-each>

  <xsl:apply-templates select="svProfile" mode="arcgis"/>
  <xsl:apply-templates select="svStandard" mode="arcgis"/>
</xsl:template>

<!-- Service Operation Metadata -->
<xsl:template match="svOper | svOperDefinition | svOperOrdered" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(.)" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
    <xsl:call-template name="arcgisElementNameExpander">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
      <xsl:for-each select="@order">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="svOpName | svDesc | svInvocName">
        <xsl:call-template name="arcgisTextWithUrls">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="svDCP">
        <xsl:call-template name="arcgisCode">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
  
      <xsl:apply-templates select="svConPt" mode="arcgis"/>
      <xsl:apply-templates select="svParams" mode="arcgis"/>
      <xsl:apply-templates select="svOper" mode="arcgis"/>
    </dl></dd>
  </div>
</xsl:template>

<xsl:template match="svOperOn" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(.)" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
    <xsl:call-template name="arcgisElementNameExpander">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
      <xsl:apply-templates select="idCitation" mode="arcgis"/>
      
      <xsl:apply-templates select="tpCat" mode="arcgis"/>
      
      <xsl:apply-templates select="/metadata/Esri/DataProperties/itemProps/imsContentType" mode="arcgis"/>
      
      <xsl:for-each select="searchKeys[keyword/text() and (keyword != '001') and (keyword != '002') and (keyword != '003') and (keyword != '004') and (keyword != '005') and (keyword != '006') and (keyword != '007') and (keyword != '008') and (keyword != '009') and (keyword != '010')]">
        <xsl:call-template name="arcgisElementMany">
          <xsl:with-param name="ele" select="keyword[(. != '001') and (. != '002') and (. != '003') and (. != '004') and (. != '005') and (. != '006') and (. != '007') and (. != '008') and (. != '009') and (. != '010')]"></xsl:with-param>
        </xsl:call-template>
        <br />
      </xsl:for-each>
      
      <xsl:apply-templates select="discKeys | stratKeys | placeKeys | tempKeys | themeKeys | otherKeys[not(thesaName/@uuidref='723f6998-058e-11dc-8314-0800200c9a66')] | productKeys | subTopicCatKeys | taxonKeys | dataCentreKeys | featureTypeKeys | instrumentKeys | platformKeys | processKeys | projectKeys | serviceKeys" mode="arcgis"/>
      
      <xsl:for-each select="idAbs | idPurp">
        <xsl:call-template name="arcgisEscapedHtml">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      
      <xsl:if test="dataLang | dataChar | idStatus | spatRpType | dsFormat | dataScale | graphOver | suppInfo | envirDesc | idCredit | idSpecUse">
        <xsl:call-template name="resourceDetails"/>
      </xsl:if>
      <xsl:if test="svType | svTypeVer | svAccProps | svCouplRes | svCouplType | svOper">
        <xsl:call-template name="serviceDetails"/>
      </xsl:if>
    
      <xsl:apply-templates select="resMaint" mode="arcgis"/>
    
      <xsl:for-each select="resConst">
        <dt><xsl:call-template name="arcgisElementName">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template></dt>
        <dd><dl>
        <xsl:apply-templates select="Consts" mode="arcgis"/>
        <xsl:apply-templates select="LegConsts" mode="arcgis"/>
        <xsl:apply-templates select="SecConsts" mode="arcgis"/>
        </dl></dd>
      </xsl:for-each>
      
      <xsl:apply-templates select="dataExt" mode="arcgis"/>
      
      <xsl:for-each select="idCredit">
        <xsl:call-template name="arcgisEscapedHtml">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    
      <xsl:apply-templates select="idPoC" mode="arcgis"/>
      
      <xsl:apply-templates select="aggrInfo" mode="arcgis"/>
    </dl></dd>
  </div>
</xsl:template>

<!-- Service Operation Parameters -->
<xsl:template match="svParams" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
    <dd><dl>
    <xsl:apply-templates select="svParName" mode="arcgis"/>
    
    <xsl:for-each select="svDesc">
        <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="svParDir">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="svParOpt | svRepeat">
        <xsl:call-template name="arcgisBoolean">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="svValType">
      <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="svValType"></xsl:with-param>
      </xsl:call-template></dt>
      <xsl:apply-templates select="svValType"  mode="arcgis"/>
    </xsl:if>
    </dl></dd>
</xsl:template>


<!-- EXTENTS PAGE - ALSO REFERENCED BY OTHER PAGES/SECTIONS -->

<!-- Extent Information (B.3.1 EX_Extent - line334) -->
<xsl:template match="dataExt | scpExt | srcExt | maintScpExt | partyExt" mode="arcgis">
  <dt>
  <xsl:choose>
    <xsl:when test="(name(.) = 'dataExt') or (name(.) = 'scpExt') or (name(.) = 'srcExt') or (name(.) = 'partyExt') or (name(.) = 'maintScpExt')">
      <xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:when>
  </xsl:choose>
  </dt>
    <dd><dl>
    <xsl:for-each select="exDesc">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    
    <xsl:for-each select="geoEle[count(*) - count(GeoBndBox[@esriExtentType = 'decdegrees']) - count(GeoBndBox[@esriExtentType = 'native']) &gt; 0]">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
        <xsl:apply-templates select="GeoBndBox[not(@esriExtentType = 'decdegrees') and not(@esriExtentType = 'native')]" mode="arcgis"/>
        <xsl:apply-templates select="GeoDesc" mode="arcgis"/>
        <xsl:apply-templates select="BoundPoly" mode="arcgis"/>
      </dl></dd>
      <xsl:if test="not (*)"><br /></xsl:if>
    </xsl:for-each>
    
    <xsl:for-each select="tempEle">
      <xsl:apply-templates select="TempExtent[count(exTemp/*) - count(exTemp/TM_GeometricPrimitive) &gt; 0]" mode="arcgis"/>
      <xsl:apply-templates select="SpatTempEx" mode="arcgis"/>
    </xsl:for-each>
    
    <xsl:apply-templates select="vertEle" mode="arcgis"/>
    </dl></dd>
</xsl:template>

<!-- Bounding Polygon Information (B.3.1.1 EX_BoundingPolygon - line341) -->
<xsl:template match="BoundPoly" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="exTypeCode">
      <xsl:call-template name="arcgisBoolean">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="polygon[exterior | interior]">
      <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
      <dd><dl>
        <xsl:for-each select="exterior | interior">
          <dt><xsl:call-template name="arcgisElementName">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template></dt>
          <dd><dl>
            <xsl:for-each select="pos">
              <xsl:call-template name="arcgisElement">
                <xsl:with-param name="ele" select="."></xsl:with-param>
              </xsl:call-template>
              <xsl:if test="position() = last()"><br /></xsl:if>
            </xsl:for-each>
            <xsl:for-each select="posList">
              <xsl:call-template name="arcgisElement">
                <xsl:with-param name="ele" select="."></xsl:with-param>
              </xsl:call-template>
              <br />
            </xsl:for-each>
          </dl></dd>
        </xsl:for-each>
        <xsl:if test="@gmlID | gmlDesc | gmlDescRef | gmlIdent | gmlName | gmlRemarks">
           <xsl:call-template name="gmlAttributes" />
           <br />
        </xsl:if>
      </dl></dd>
    </xsl:for-each>
    </dl></dd>
</xsl:template>

<!-- Bounding Box Information (B.3.1.1 EX_GeographicBoundingBox - line343) -->
<xsl:template match="GeoBndBox[not(@esriExtentType = 'decdegrees') and not(@esriExtentType = 'native')] | Esri/DataProperties/itemProps/nativeExtBox" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="@esriExtentType[. = 'search']">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template><res:attExtentSearch /></dt>
    </xsl:for-each>
    <xsl:for-each select="westBL | eastBL | northBL | southBL">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="exTypeCode">
      <xsl:call-template name="arcgisBoolean">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    </dl></dd><br />
</xsl:template>

<!-- Geographic Description Information (B.3.1.1 EX_GeographicDescription - line348) -->
<xsl:template match="GeoDesc" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:apply-templates select="geoId" mode="arcgis"/>
    <xsl:for-each select="exTypeCode">
      <xsl:call-template name="arcgisBoolean">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
      <br />
    </xsl:for-each>
    <xsl:if test="(exTypeCode) and not (geoId)"><br /></xsl:if>
    </dl></dd>
</xsl:template>

<!-- Temporal Extent Information (B.3.1.2 EX_TemporalExtent - line350) -->
<xsl:template match="TempExtent[count(exTemp/*) - count(exTemp/TM_GeometricPrimitive) &gt; 0]" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:apply-templates select="exTemp/TM_Instant" mode="arcgis"/>
    <xsl:apply-templates select="exTemp/TM_Period" mode="arcgis"/>
  </dl></dd><br />
</xsl:template>

<!-- temporal extent Information from ISO 19103 as defined is DTD -->
<xsl:template match="exTemp/TM_Instant | TM_Instant" mode="arcgis">
  <xsl:for-each select="tmPosition">
    <xsl:call-template name="arcgisDate">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
</xsl:template>
<xsl:template match="exTemp/TM_Period | TM_Period | stepDateTimePeriod" mode="arcgis">
    <xsl:for-each select="tmBegin | tmEnd">
        <xsl:call-template name="arcgisDate">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
    </xsl:for-each>
</xsl:template>

<!-- Spatial Temporal Extent Information (B.3.1.2 EX_SpatialTemporalExtent - line352) -->
<xsl:template match="SpatTempEx" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="exTemp">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
        <xsl:apply-templates select="TM_Instant" mode="arcgis"/>
        <xsl:apply-templates select="TM_Period" mode="arcgis"/>
      </dl></dd><br />
    </xsl:for-each>
    
    <xsl:for-each select="exSpat">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
        <xsl:apply-templates select="GeoBndBox[not(@esriExtentType = 'decdegrees') and not(@esriExtentType = 'native')]" mode="arcgis"/>
        <xsl:apply-templates select="GeoDesc" mode="arcgis"/>
        <xsl:apply-templates select="BoundPoly" mode="arcgis"/>
      </dl></dd>
    </xsl:for-each>
    
    <xsl:apply-templates select="exVert" mode="arcgis"/>
    </dl></dd>
</xsl:template>

<!-- Vertical Extent Information (B.3.1.3 EX_VerticalExtent - line354) -->
<xsl:template match="vertEle | exVert" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="vertMinVal | vertMaxVal">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="(vertMinVal | vertMaxVal)"><br /></xsl:if>
    </dl></dd>
  <xsl:if test="not (*)"><br /></xsl:if>
</xsl:template>


<!-- REFERENCE SYSTEM PAGE -->

<!-- Reference System Information (B.2.7 MD_ReferenceSystem - line186) -->
<xsl:template match="refSysInfo" mode="arcgis">
  <xsl:apply-templates select="RefSystem" mode="arcgis"/>
</xsl:template>

<!-- Reference System Information (B.2.7 MD_ReferenceSystem - line186) -->
<xsl:template match="RefSystem" mode="arcgis">
  <xsl:apply-templates select="refSysID" mode="arcgis"/>
  <xsl:for-each select="refSysType">
    <xsl:call-template name="arcgisCode">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <br />
</xsl:template>

<!--   ESRI SPATIAL PROPERTIES NOT AVAILABLE IN EDITOR ADDED BY SYNCHRONIZATION -->

<xsl:template match="coordRef" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="type | projcsn | geogcsn">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="peXml">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <xsl:choose>
        <xsl:when test="function-available('esri:decodenodeset')">
          <xsl:variable name="pestring" select="esri:decodenodeset(.)" />
          <dd><dl>
            <xsl:apply-templates select="msxsl:node-set($pestring)" mode="pexml" />
          </dl></dd>
        </xsl:when>
        <xsl:otherwise><xsl:value-of select="res:str('peXmlNotDecoded')"/></xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </dl></dd><br />
</xsl:template>

<xsl:template match="ProjectedCoordinateSystem | GeographicCoordinateSystem" mode="pexml">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="WKID">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="*[not((name() = 'WKT') or (name() = 'WKID'))]">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="WKT">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </dl></dd>
</xsl:template>


<!-- SPATIAL DATA REPRESENTATION PAGE -->

<!-- Grid Information (B.2.6  MD_GridSpatialRepresentation - line157, 
    MD_Georectified - line162, and MD_Georeferenceable - line170) -->
<xsl:template match="GridSpatRep[count(.//*/text()) - count(.//*[text() and@Sync]) &gt; 0] | Georect | Georef" mode="arcgis">
  <xsl:if test="(./*)">
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(./*[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
      <xsl:call-template name="arcgisElementNameExpander">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
    </a></dt>
    <div class="show" id="{$eleID}">
      <dd><dl>
        <xsl:for-each select="numDims">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
          <br />
        </xsl:for-each>
      
        <xsl:apply-templates select="axisDimension" mode="arcgis"/>

        <xsl:if test="(numDims) and not (axisDimension)"><br /></xsl:if>
      
          <xsl:for-each select="cellGeo | ptInPixel">
          <xsl:call-template name="arcgisCode">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
          </xsl:for-each>
          <xsl:if test="cellGeo | ptInPixel"><br /></xsl:if>
      
        <xsl:for-each select="tranParaAv">
          <xsl:call-template name="arcgisBoolean">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="transDimDesc | transDimMap">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
        </xsl:for-each>
        <xsl:if test="tranParaAv | transDimDesc | transDimMap"><br /></xsl:if>
        
        <xsl:for-each select="chkPtAv">
          <xsl:call-template name="arcgisBoolean">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="chkPtDesc">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <xsl:if test="chkPtAv | chkPtDesc"><br /></xsl:if>
    
        <xsl:if test="cornerPts/pos">
        <dt><xsl:call-template name="arcgisElementName">
            <xsl:with-param name="ele" select="cornerPts"></xsl:with-param>
          </xsl:call-template>
        </dt>
        <dd><dl>
          <xsl:for-each select="cornerPts">
            <xsl:for-each select="pos">
              <xsl:call-template name="arcgisElement">
                <xsl:with-param name="ele" select="."></xsl:with-param>
              </xsl:call-template>
            </xsl:for-each>
            <xsl:choose>
              <xsl:when test="@gmlID | gmlDesc | gmlDescRef | gmlIdent | gmlName | gmlRemarks">
                <dd><dl>
                   <xsl:call-template name="gmlAttributes" />
                </dl></dd>
              </xsl:when>
              <xsl:otherwise><br /></xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </dl></dd>
        </xsl:if>
        <xsl:for-each select="centerPt">
          <xsl:for-each select="pos">
            <xsl:call-template name="arcgisElement">
              <xsl:with-param name="ele" select="."></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
          <xsl:choose>
            <xsl:when test="@gmlID | gmlDesc | gmlDescRef | gmlIdent | gmlName | gmlRemarks">
              <dd><dl>
                 <xsl:call-template name="gmlAttributes" />
              </dl></dd>
            </xsl:when>
            <xsl:otherwise><br /></xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
    
        <xsl:for-each select="ctrlPtAv | orieParaAv">
          <xsl:call-template name="arcgisBoolean">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="orieParaDs">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <xsl:if test="ctrlPtAv | orieParaAv | orieParaDs"><br /></xsl:if>
    
        <xsl:for-each select="georefPars">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <xsl:apply-templates select="paraCit" mode="arcgis"/>
        <xsl:if test="(georefPars) and not (paraCit)"><br /></xsl:if>
      
        <xsl:apply-templates select="infoScope" mode="arcgis"/>
      </dl></dd>
    </div>
  </xsl:if>
</xsl:template>

<!-- Dimension Information (B.2.6.1 MD_Dimension - line179) -->
<xsl:template match="axisDimension" mode="arcgis">
  <dt><span class="SubContentHeader">
      <xsl:call-template name="elementText">
        <xsl:with-param name="ele" select="." />
      </xsl:call-template>&#160;-&#160;<xsl:call-template name="MD_DimensionNameTypeCode">
        <xsl:with-param name="code" select="@type" />
      </xsl:call-template>
    </span>&#x2003;<xsl:if test="@Sync = 'TRUE'">
    <span class="sync">&#8660;</span>&#x2009;</xsl:if></dt>
    <dd><dl>
    <!--
    <xsl:for-each select="./@type">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    -->
    <xsl:for-each select="dimSize">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="dimResol/value">
      <xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
        <dd><dl><dd><xsl:value-of select="."/><xsl:for-each select="./@uom">&#160;<xsl:call-template name="ucum_units">
            <xsl:with-param name="unit" select="." />
          </xsl:call-template>
        </xsl:for-each></dd></dl></dd>
    </xsl:for-each>
    <xsl:for-each select="dimTitle | dimDescription">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    </dl></dd><br/>
</xsl:template>

<!-- Vector Information (B.2.6  MD_VectorSpatialRepresentation - line176) -->
<xsl:template match="VectSpatRep" mode="arcgis">
  <xsl:if test="(./*)">
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(./*[1])" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
      <xsl:call-template name="arcgisElementNameExpander">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
    </a></dt>
    <div class="show" id="{$eleID}">
      <dd><dl>
        <xsl:for-each select="topLvl">
          <xsl:call-template name="arcgisCode">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
          <br />
        </xsl:for-each>
        <xsl:apply-templates select="geometObjs" mode="arcgis"/>
        <xsl:apply-templates select="infoScope" mode="arcgis"/>
      </dl></dd>
    </div>
  </xsl:if>
</xsl:template>

<!-- FGDC Indirect Spatial Referencing -->
<xsl:template match="Indref" mode="arcgis">
    <xsl:call-template name="arcgisTextWithUrls">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
</xsl:template>

<!-- Geometric Object Information (B.2.6.2 MD_GeometricObjects - line183) -->
<xsl:template match="geometObjs" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="@Name">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="geoObjTyp">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="geoObjCnt">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    </dl></dd>
</xsl:template>

<!-- ESRI EXTENDED ELEMENTS NOT AVAILABLE IN EDITOR ADDED BY SYNCHRONIZATION -->

<!--   ESRI RASTER PROPERTIES -->

<xsl:template match="/metadata/Esri/DataProperties/RasterProperties" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(.)" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
    <xsl:call-template name="arcgisElementNameExpander">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
      <xsl:for-each select="General">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
        <xsl:for-each select="*[not(name() = 'HasColormap') and not(name() = 'HasPyramids') and (. != '')]">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="HasColormap | HasPyramids">
          <xsl:call-template name="arcgisBoolean">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <br />
      </dl></dd>
      </xsl:for-each>
      <xsl:for-each select="Properties">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
        <xsl:for-each select="*[(. != '')]">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <br />
      </dl></dd>
      </xsl:for-each>
      <xsl:for-each select="Functions">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
        <xsl:for-each select="Function">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="@Name"></xsl:with-param>
          </xsl:call-template>
          <dd><dl>
            <xsl:call-template name="arcgisElement">
              <xsl:with-param name="ele" select="@Description"></xsl:with-param>
            </xsl:call-template>
            <xsl:for-each select="Arguments">
              <dt><xsl:call-template name="arcgisElementName">
                  <xsl:with-param name="ele" select="."></xsl:with-param>
                </xsl:call-template></dt>
              <dd><dl>
                <xsl:for-each select=".//*[(. != '')]">
                  <xsl:call-template name="arcgisElement">
                    <xsl:with-param name="ele" select="."></xsl:with-param>
                  </xsl:call-template>
                </xsl:for-each>
                <br />
              </dl></dd>
            </xsl:for-each>
            <xsl:if test="not(Arguments)"><br /></xsl:if>
          </dl></dd>
        </xsl:for-each>
      </dl></dd>
      </xsl:for-each>
    </dl></dd>
  </div>
</xsl:template>

<!--   ESRI TOPOLOGY PROPERTIES -->

<xsl:template match="/metadata/Esri/DataProperties/topoinfo" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(./*[1])" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
    <xsl:call-template name="arcgisElementNameExpander">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
      <xsl:for-each select="topoProps">
        <xsl:for-each select="topoName | clusterTol | trustedArea/trustedPolygon | notTrusted | maxErrors">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
        </xsl:for-each>
      <br />
      </xsl:for-each>
      
      <xsl:for-each select="topoRule">
        <dt><xsl:call-template name="arcgisElementName">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template><span class="SubContentHeader"><xsl:value-of select="position()" /></span></dt>
        <dd><dl>
          <xsl:for-each select="topoRuleName[. != ''] | topoRuleID | topoRuleType">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
          </xsl:for-each>
          <xsl:if test="(topoRuleName[. != ''] | topoRuleID | topoRuleType)"><br /></xsl:if>
        
          <xsl:for-each select="topoRuleOrigin | topoRuleDest">
          <dt><xsl:call-template name="arcgisElementName">
                <xsl:with-param name="ele" select="."></xsl:with-param>
              </xsl:call-template></dt>
          <dd><dl>
            <xsl:for-each select="fcname | stcode | stname | allOriginSubtypes | allDestSubtypes">
              <xsl:call-template name="arcgisElement">
                <xsl:with-param name="ele" select="."></xsl:with-param>
              </xsl:call-template>
            </xsl:for-each>
          </dl></dd>
          </xsl:for-each>
        </dl></dd>
      </xsl:for-each>
    </dl></dd>
  </div>
</xsl:template>

<!--   ESRI TERRAIN PROPERTIES -->

<xsl:template match="/metadata/Esri/DataProperties/Terrain" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(./*[1])" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
    <xsl:call-template name="arcgisElementNameExpander">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
      <xsl:for-each select="totalPts">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each><br/><br/>
    </dl></dd>
  </div>
</xsl:template>

<!--   ESRI NETWORK PROPERTIES -->

<xsl:template match="/metadata/spdoinfo/netinfo" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(.)" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
    <xsl:call-template name="arcgisElementNameExpander">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
          <xsl:for-each select="nettype">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
            <br />
          </xsl:for-each>
          <xsl:for-each select="connrule">
            <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
            <dd><dl>
              <xsl:for-each select="ruletype | rulecat | rulehelp">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
              </xsl:for-each>
              <xsl:if test="(ruletype | rulecat | rulehelp)"><br /></xsl:if>

              <xsl:for-each select="rulefeid | rulefest | ruleteid | ruletest">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
              </xsl:for-each>
              <xsl:if test="(rulefeid | rulefest | ruleteid | ruletest)"><br /></xsl:if>
              
              <xsl:for-each select="ruledjid | ruledjst">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
              </xsl:for-each>
              <xsl:if test="(ruledjid | ruledjst)"><br /></xsl:if>

              <xsl:for-each select="rulejunc">
                <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
                <dd><dl>
                  <xsl:for-each select="junctid | junctst">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
                  </xsl:for-each>
                </dl></dd>
              </xsl:for-each>
              <xsl:if test="(rulefeid | rulefest) and not (rulejunc)"><br /></xsl:if>

              <xsl:for-each select="ruleeid | ruleest | ruleemnc | ruleemxc">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
              </xsl:for-each>
              <xsl:if test="(ruleeid | ruleest | ruleemnc | ruleemxc)"><br /></xsl:if>

              <xsl:for-each select="rulejid | rulejst | rulejmnc">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
              </xsl:for-each>
              <xsl:if test="(rulejid | rulejst | rulejmnc | rulejmxc)"><br /></xsl:if>
            </dl></dd>
          </xsl:for-each>
    </dl></dd>
  </div>
</xsl:template>

<!--   ESRI NETWORK DIAGRAM PROPERTIES -->

<xsl:template match="/metadata/Esri/DataProperties/NetworkDiagram" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(./*[1])" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
    <xsl:call-template name="arcgisElementNameExpander">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
      <xsl:for-each select="templateName">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="createdBy">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="lastUpdatedBy">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </dl></dd>
  </div>
</xsl:template>

<!--   ESRI LOCATOR PROPERTIES -->

<xsl:template match="/metadata/Esri/Locator" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(./*[1])" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
    <xsl:call-template name="arcgisElementNameExpander">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
      <xsl:for-each select="Style">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
        <br />
      </xsl:for-each>
      <xsl:for-each select="Properties">
        <xsl:if test="FieldAliases[text()]">
          <dt><xsl:call-template name="arcgisElement">
              <xsl:with-param name="ele" select="FieldAliases"></xsl:with-param>
            </xsl:call-template></dt>
          <dd><dl>
          <xsl:for-each select="FieldAliases">
            <dt><span class="ElementLabel">-</span>&#x2003;<xsl:value-of select="."/></dt>
          </xsl:for-each>
          </dl></dd>
        </xsl:if>
        <xsl:if test="(FileMAT | FileSTN | IntFileMAT | IntFileSTN)">
          <br />
          <dt><span class="SubContentHeader"><res:RuleBases /></span></dt>
          <dd><dl>
          <xsl:for-each select="FileMAT | FileSTN | IntFileMAT | IntFileSTN">
            <xsl:call-template name="arcgisElement">
              <xsl:with-param name="ele" select="."></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
          </dl></dd>
        </xsl:if>
        <xsl:for-each select="Fallback">
          <br />
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:for-each>
    </dl></dd>
  </div>
</xsl:template>

<!--   ESRI FEATURE CLASS PROPERTIES -->

<xsl:template name="esriFeatureClass">
  <xsl:for-each select="/metadata/spdoinfo/ptvctinf/esriterm">
    <xsl:variable name="eleID"><xsl:value-of select="generate-id(.)" /></xsl:variable>
    <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
    <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
    <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
      <xsl:call-template name="arcgisElementNameExpander">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
    </a></dt>
    <div class="show" id="{$eleID}">
      <dd><dl>
        <xsl:apply-templates select="." mode="arcgis" />
      </dl></dd>
    </div>
  </xsl:for-each>
</xsl:template>

<xsl:template match="/metadata/spdoinfo/ptvctinf/esriterm" mode="arcgis">
  <xsl:call-template name="arcgisElement">
    <xsl:with-param name="ele" select="@Name"></xsl:with-param>
  </xsl:call-template>
  <dd><dl>
    <xsl:for-each select="efeatyp">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="efeageom">
      <xsl:choose>
        <xsl:when test="@code">
        <dt><span class="ElementLabel">
            <xsl:call-template name="elementText">
              <xsl:with-param name="ele" select="@code" />
            </xsl:call-template>
          </span>&#x2003;<xsl:if test="@Sync = 'TRUE'">
          <span class="sync">&#8660;</span>&#x2009;</xsl:if><xsl:call-template name="GeometryTypeCode">
            <xsl:with-param name="code" select="@code" />
          </xsl:call-template></dt>
        </xsl:when>
        <xsl:when test="number(.)">
        <dt><xsl:call-template name="arcgisElementName">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template><xsl:call-template name="GeometryTypeCode">
            <xsl:with-param name="code" select="." />
          </xsl:call-template>
        </dt>
        </xsl:when>
        <xsl:when test="(. != '')">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
    <xsl:for-each select="esritopo | efeacnt | spindex | linrefer | netwrole | featdesc">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="(@Name | efeatyp | efeageom | esritopo | efeacnt | spindex | linrefer | linrefer | netwrole | featdesc) and (XYRank | ZRank | topoWeight | validateEvents | partTopoRules)"><br /></xsl:if>
    
    <xsl:for-each select="XYRank | ZRank | topoWeight | validateEvents">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="partTopoRules">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="partTopoRules"></xsl:with-param>
        </xsl:call-template><xsl:for-each select="partTopoRules/topoRuleID">
          <xsl:value-of select="."/><xsl:if test="not(position() = last())">, </xsl:if>
        </xsl:for-each>
      </dt>
    </xsl:if>
  </dl></dd><br/>
</xsl:template>


<!-- CONTENT PAGE -->

<!-- Content Information (B.2.8 MD_ContentInformation ABSTRACT - line232) -->

<!-- Feature Catalogue Description (B.2.8 MD_FeatureCatalogueDescription - line233) -->
<xsl:template match="FetCatDesc" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="incWithDS | compCode">
      <xsl:call-template name="arcgisBoolean">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="(incWithDS | compCode)"><br /></xsl:if>
    
    <xsl:for-each select="catLang">
      <xsl:call-template name="arcgisLangCntry">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
      <xsl:for-each select="CharSetCd">
        <dd><dl>
          <xsl:call-template name="arcgisCode">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </dl></dd><br/>
      </xsl:for-each>
    </xsl:for-each>
    <xsl:if test="catLang"><br /></xsl:if>
    
    <xsl:for-each select="catFetTyps/genericName">
      <xsl:call-template name="arcgisTypedElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
        <xsl:with-param name="type" select="@codeSpace"></xsl:with-param>
      </xsl:call-template>
      <xsl:if test="not(@codeSpace)"><br/></xsl:if>
    </xsl:for-each>
    
    <xsl:apply-templates select="catCitation" mode="arcgis"/>
  </dl></dd>
</xsl:template>

<!-- Coverage Description (B.2.8 MD_CoverageDescription - line239) -->
<xsl:template match="CovDesc" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="contentTyp">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="attDesc">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="attDesc | contentTyp"><br /></xsl:if>
    
    <xsl:apply-templates select="covDim" mode="arcgis"/>
    <xsl:apply-templates select="prcTypCde" mode="arcgis"/>
  </dl></dd>
</xsl:template>

<!-- Range dimension Information (B.2.8.1 MD_RangeDimension - line256) -->
<xsl:template match="covDim/*" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="dimDescrp">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="seqID">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
        <xsl:apply-templates select="."  mode="arcgis"/>
      </dl></dd>
    </xsl:for-each>
    <xsl:if test="(*/dimDescrp) and not (*/seqID)"><br /></xsl:if>
    
    <xsl:for-each select="maxVal | minVal | meanVal | stdDeviation">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="valUnit/UOM[*]">
      <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
      <xsl:apply-templates select="." mode="arcgis"/>
    </xsl:for-each>
    <xsl:if test="(maxVal | minVal | meanVal | stdDeviation) and not (valUnit/UOM)"><br /></xsl:if>
    
    <xsl:for-each select="boundMaxVal | boundMinVal">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="boundValUnit/UOM[*]">
      <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
      <xsl:apply-templates select="." mode="arcgis"/>
    </xsl:for-each>
    <xsl:if test="(boundMaxVal | boundMinVal) and not (boundValUnit/UOM)"><br /></xsl:if>
    
    <xsl:for-each select="numberOfValues | pkResp | otherPropertyType | otherProperty">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="(numberOfValues | pkResp | otherPropertyType | otherProperty)"><br /></xsl:if>
    
    <xsl:for-each select="bitsPerVal | toneGrad | sclFac | offset">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="bitsPerVal | toneGrad | sclFac | offset"><br /></xsl:if>
    </dl></dd>
</xsl:template>

<!-- Image Description (B.2.8 MD_ImageDescription - line243) -->
<xsl:template match="ImgDesc" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="contentTyp">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="attDesc">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="attDesc | contentTyp"><br /></xsl:if>
    
    <xsl:apply-templates select="covDim" mode="arcgis"/>
    
    <xsl:for-each select="illElevAng | illAziAng">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="imagCond">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="cloudCovPer">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="illElevAng | illAziAng | imagCond | cloudCovPer"><br /></xsl:if>
    
    <xsl:apply-templates select="imagQuCode" mode="arcgis"/>
    
    <xsl:apply-templates select="prcTypCde" mode="arcgis"/>
    
    <xsl:for-each select="cmpGenQuan">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="trianInd | radCalDatAv | camCalInAv | filmDistInAv | lensDistInAv">
      <xsl:call-template name="arcgisBoolean">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="cmpGenQuan | trainInd | radCalDatAv | camCalInAv | filmDistInAv | lensDistInAv"><br /></xsl:if>
  </dl></dd>
</xsl:template>


<!-- DATA QUALITY PAGE -->

<!-- Data Quality Information  (B.2.4 DQ_DataQuality - line78) -->
<xsl:template match="metadata/dqInfo" mode="arcgis">
    <xsl:apply-templates select="dqScope" mode="arcgis"/>

    <!-- <xsl:apply-templates select="dataLineage" mode="arcgis"/> -->

    <xsl:for-each select="report[@type] | dqReport[@type]">
      <xsl:variable name="eleID"><xsl:value-of select="generate-id(.)" /></xsl:variable>
      <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
      <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
      <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
        <xsl:call-template name="codeText">
          <xsl:with-param name="ele" select="@type" />
        </xsl:call-template>&#x2003;
        <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
      </a></dt>
      <div class="show" id="{$eleID}">
        <dd><dl>
          <xsl:call-template name="DQElement" />
        </dl></dd>
      </div>
    </xsl:for-each>
    
    <xsl:apply-templates select="standaloneReport" mode="arcgis"/>
</xsl:template>

<!-- Scope Information (B.2.4.4 DQ_Scope - line138) -->
<xsl:template match="dqScope | applicationScope | infoScope | lvlScope | resultScope" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(./*[1])" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
    <xsl:call-template name="arcgisElementNameExpander">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
      <xsl:for-each select="scpLvl">
        <xsl:call-template name="arcgisCode">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:apply-templates select="scpLvlDesc" mode="arcgis"/>
      <xsl:if test="(scpLvl) and not (scpLvlDesc)"><br /></xsl:if>
      
      <xsl:apply-templates select="scpExt" mode="arcgis"/>
    </dl></dd>
  </div>
</xsl:template>

<!-- Data Quality Element Information (B.2.4.2 DQ_Element - line99) -->
<xsl:template name="DQElement">
  <xsl:for-each select="@reportID[. != '']">
    <xsl:call-template name="arcgisElement">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
    <br />
  </xsl:for-each>
  <xsl:for-each select="@dimension[. != '']">
    <xsl:call-template name="arcgisElement">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
    <br />
  </xsl:for-each>
  <xsl:for-each select="reportDateTime">
    <xsl:call-template name="arcgisDate">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
  <xsl:if test="((measName != '') or (measDesc != '') or (measId != ''))">
    <dt><span class="SubContentHeader"><xsl:value-of select="res:str('DataQualityMeasure')"/></span></dt>
    <dd><dl>
      <xsl:for-each select="measName">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="measDesc">
        <xsl:call-template name="arcgisTextWithUrls">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:if test="(measName) and not(measDesc)"><br /></xsl:if>
      <xsl:apply-templates select="measId" mode="arcgis"/>
    </dl></dd>
  </xsl:if>

  <xsl:if test="((measDateTm != '') or (evalMethType//@value != '') or (evalMethDesc != '') or (evalProc != '') or (evalReferenceDoc != '') or (inspectionType/@type != '') or (sampleInspection != '') or (indirectInfo != ''))">
    <dt><span class="SubContentHeader"><xsl:value-of select="res:str('DataQualityEvaluationMethod')"/></span></dt>
    <dd><dl>
      <xsl:for-each select="inspectionType">
        <xsl:call-template name="arcgisCode">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="measDateTm">
        <xsl:call-template name="arcgisDate">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
        <xsl:if test="position() = last()"><br /></xsl:if>
      </xsl:for-each>
      <xsl:for-each select="evalMethType">
        <xsl:call-template name="arcgisCode">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="evalMethDesc">
        <xsl:call-template name="arcgisTextWithUrls">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:apply-templates select="evalProc" mode="arcgis"/>
      <xsl:apply-templates select="evalReferenceDoc" mode="arcgis"/>
      <xsl:for-each select="sampleInspection">
        <xsl:for-each select="samplingScheme">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="lotDescription">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="samplingRatio">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:for-each>
      <xsl:for-each select="indirectInfo/deductiveSource">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </dl></dd>
  </xsl:if>

  <xsl:for-each select="measResult">
    <xsl:apply-templates select="QuanResult" mode="arcgis"/>
    <xsl:apply-templates select="ConResult" mode="arcgis"/>
    <xsl:apply-templates select="DescriptiveResult" mode="arcgis"/>
    <xsl:apply-templates select="CoverageResult" mode="arcgis"/>
  </xsl:for-each>

    <xsl:for-each select="standaloneQualityReportDetails">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>

    <xsl:for-each select="derivedElement[@type] | relatedElement[@type]">
      <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
      <dd><dl>
        <dt><xsl:call-template name="codeText">
          <xsl:with-param name="ele" select="@type" />
        </xsl:call-template></dt>
        <dd><dl>
          <xsl:call-template name="DQElement" />
        </dl></dd>
      </dl></dd>
    </xsl:for-each>
    <xsl:for-each select="derivedElement[@uuidref] | relatedElement[@uuidref]">
      <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
      <dd><dl>
        <xsl:for-each select="@uuidref">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </dl></dd>
    </xsl:for-each>

</xsl:template>

<xsl:template match="standaloneReport" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:apply-templates select="reportReference" mode="arcgis"/>
    
    <xsl:for-each select="abstract">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="abstract"><br /></xsl:if>
    
    <xsl:for-each select="elementReport[@type]">
      <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
      <dd><dl>
        <dt><xsl:call-template name="codeText">
          <xsl:with-param name="ele" select="@type" />
        </xsl:call-template></dt>
        <dd><dl>
          <xsl:call-template name="DQElement" />
        </dl></dd>
      </dl></dd>
    </xsl:for-each>
    <xsl:for-each select="elementReport[@uuidref]">
      <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
      <dd><dl>
        <xsl:for-each select="@uuidref">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </dl></dd>
    </xsl:for-each>
  </dl></dd><br/>
</xsl:template>

<!-- Conformance Result Information (B.2.4.3 DQ_ConformanceResult - line129) -->
<xsl:template match="ConResult" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="resultDateTime">
      <xsl:call-template name="arcgisDate">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:apply-templates select="resultScope" mode="arcgis"/>
    <xsl:for-each select="conPass">
      <xsl:call-template name="arcgisBoolean">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="conExpl">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="(conPass) and not(conExpl)"><br /></xsl:if>
    
    <xsl:apply-templates select="conSpec" mode="arcgis"/>
  </dl></dd>
</xsl:template>

<!-- Quantitative Result Information (B.2.4.3 DQ_QuantitativeResult - line133) -->
<xsl:template match="QuanResult" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="resultDateTime">
      <xsl:call-template name="arcgisDate">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:apply-templates select="resultScope" mode="arcgis"/>
    <xsl:if test="quanValue | quanVal">
      <xsl:for-each select="quanVal | quanValue">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
      </xsl:for-each>
    </xsl:if>
    <xsl:for-each select="quanValUnit">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <xsl:apply-templates select="UOM" mode="arcgis"/>
    </xsl:for-each>
    <xsl:if test="(quanVal or qualValue) and not (quanValUnit)"><br /></xsl:if>
  
    <xsl:for-each select="quanValType">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  
    <xsl:for-each select="errStat">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
      <br />
    </xsl:for-each>
  </dl></dd>
</xsl:template>

<xsl:template match="DescriptiveResult" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="resultDateTime">
      <xsl:call-template name="arcgisDate">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:apply-templates select="resultScope" mode="arcgis"/>
    <xsl:for-each select="statement">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </dl></dd>
</xsl:template>

<xsl:template match="CoverageResult" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="resultDateTime">
      <xsl:call-template name="arcgisDate">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="spatRpType">
      <xsl:call-template name="arcgisCodeMany">
        <xsl:with-param name="ele" select="spatRpType"></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:apply-templates select="resultScope" mode="arcgis"/>
    <xsl:apply-templates select="spatRepInfo" mode="arcgis"/>
    <xsl:apply-templates select="contInfo" mode="arcgis"/>
    <xsl:apply-templates select="resultFile" mode="arcgis"/>
    <xsl:apply-templates select="resultFormat" mode="arcgis"/>
  </dl></dd>
</xsl:template>

<xsl:template match="resultFile" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="mxFileName">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="mxFileDesc">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="mxFileType">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
      <xsl:for-each select="@value">
        <dd><dl>
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
        </dl></dd>
      </xsl:for-each>
    </xsl:for-each>
    <!-- must pick up codespace attribute -->
    <xsl:for-each select="mxFeatType">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:apply-templates select="mxFileFormat" mode="arcgis"/>
    <xsl:if test="abstract"><br /></xsl:if>
  </dl></dd><br/>
</xsl:template>


<!-- LINEAGE PAGE -->

<!-- Lineage Information (B.2.4.1 LI_Lineage - line82) -->
<xsl:template match="dataLineage" mode="arcgis">
    <xsl:for-each select="statement">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>

    <xsl:apply-templates select="prcStep" mode="arcgis"/>
    <xsl:apply-templates select="dataSource" mode="arcgis"/>
    <xsl:apply-templates select="infoScope" mode="arcgis"/>
    <xsl:apply-templates select="additionalDoc" mode="arcgis"/>
</xsl:template>

<!-- Process Step Information (B.2.4.1.1 LI_ProcessStep - line86) -->
<xsl:template match="prcStep | srcStep" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(./*[1])" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
    <xsl:call-template name="arcgisElementNameExpander">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
      <xsl:for-each select="stepDateTm">
        <xsl:call-template name="arcgisDate">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:for-each select="stepDateTmGml">
        <dt><xsl:call-template name="arcgisElementName">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template></dt>
        <dd><dl>
          <xsl:call-template name="gmlAttributes" />
        </dl></dd><br />
      </xsl:for-each>
      <!-- there can be only one datetime or time period provided -->
      <xsl:for-each select="stepDateTimePeriod">
        <dt><xsl:call-template name="arcgisElementName">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template></dt>
        <dd><dl>
          <xsl:apply-templates select="." mode="arcgis"/>
        </dl></dd><br />
      </xsl:for-each>
      <xsl:for-each select="stepDesc | stepRat">
        <xsl:call-template name="arcgisTextWithUrls">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:if test="(stepDateTm) and not(stepDesc or stepRat)"><br /></xsl:if>
    
      <xsl:apply-templates select="stepProc" mode="arcgis"/>
      <xsl:apply-templates select="infoScope" mode="arcgis"/>
      <xsl:apply-templates select="referenceDoc" mode="arcgis"/>
      <xsl:apply-templates select="stepSrc" mode="arcgis"/>
    </dl></dd>
  </div>
</xsl:template>

<!-- Source Information (B.2.4.1.2 LI_Source - line92) -->
<xsl:template match="dataSource | stepSrc" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(./*[1])" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
    <xsl:call-template name="arcgisElementNameExpander">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
      <xsl:if test="(name() = 'stepSrc') and (@type != '')">
        <xsl:for-each select="@type">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
          <br />
        </xsl:for-each>
      </xsl:if>
      <xsl:for-each select="srcDesc">
        <xsl:call-template name="arcgisTextWithUrls">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      
      <xsl:for-each select="srcMedName">
        <xsl:call-template name="arcgisCode">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:apply-templates select="srcScale" mode="arcgis"/>
      <xsl:apply-templates select="srcResol" mode="arcgis"/>
      <xsl:if test="(srcMedName | srcScale | srcResol)"><br /></xsl:if>

      <xsl:apply-templates select="srcCitatn" mode="arcgis"/>
      <xsl:apply-templates select="srcRefSys" mode="arcgis"/>
      <xsl:for-each select="srcRefSysType">
        <xsl:call-template name="arcgisCode">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template><br/>
      </xsl:for-each>
      <xsl:apply-templates select="srcExt" mode="arcgis"/>
      <xsl:apply-templates select="srcMetadata" mode="arcgis"/>
      <xsl:apply-templates select="lvlScope" mode="arcgis"/>
      <xsl:apply-templates select="srcStep" mode="arcgis"/>
    </dl></dd>
  </div>
</xsl:template>


<!-- DISTRIBUTION PAGE -->

<!-- Distribution Information (B.2.10 MD_Distribution - line270) -->
<xsl:template match="metadata/distInfo" mode="arcgis">
    <xsl:for-each select="distDescription">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template><br />
    </xsl:for-each>
  <xsl:apply-templates select="distributor" mode="arcgis"/>
  <xsl:apply-templates select="distFormat" mode="arcgis"/>
  <xsl:apply-templates select="distTranOps" mode="arcgis"/>
</xsl:template>


<!-- Distributor Information (B.2.10.2 MD_Distributor - line279) -->
<xsl:template match="distributor | formatDist" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(./*[1])" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
    <xsl:call-template name="arcgisElementNameExpander">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
      <xsl:apply-templates select="distorCont" mode="arcgis"/>
      <xsl:apply-templates select="distorFormat" mode="arcgis"/>
      <xsl:apply-templates select="distorOrdPrc" mode="arcgis"/>
      <xsl:apply-templates select="distorTran" mode="arcgis"/>
    </dl></dd>
  </div>
</xsl:template>

<!-- Format Information (B.2.10.3 MD_Format - line284) -->
<xsl:template match="dsFormat | distorFormat | distFormat | resultFormat | mxFileFormat | distFormat" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="formatName | formatVer | formatAmdNum | formatSpec">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:apply-templates select="fmtSpecCitation" mode="arcgis"/>
    <xsl:if test="(formatName | formatVer | formatAmdNum | formatSpec) and not(fmtSpecCitation)"><br /></xsl:if>
  
    <xsl:for-each select="fileDecmTech | formatInfo | formatTech">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="formatInfo | formatTech | fileDecmTech"><br /></xsl:if>
  
    <xsl:apply-templates select="medium" mode="arcgis"/>
    <xsl:apply-templates select="formatDist" mode="arcgis"/>
  </dl></dd>
</xsl:template>

<!-- Standard Order Process Information (B.2.10.5 MD_StandardOrderProcess - line298) -->
<xsl:template match="distorOrdPrc | svAccProps" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="resFees">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template><xsl:if test="(@units != '')">&#160;(<xsl:value-of select="@units" />)</xsl:if>
    </xsl:for-each>
    <xsl:if test="resFees"><br /></xsl:if>
    <xsl:for-each select="planAvDtTm">
      <xsl:call-template name="arcgisDate">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="planAvTmPd">
      <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
      <dd><dl>
        <xsl:for-each select="tmBegin | tmEnd">
          <xsl:call-template name="arcgisDate">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </dl></dd>
    </xsl:for-each>
    <xsl:for-each select="ordTurn | ordInstr">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="ordOptionsType | ordOptions">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="ordOptionsType | ordOptions"><br /></xsl:if>
  </dl></dd>
</xsl:template>

<!-- Digital Transfer Options Information (B.2.10.1 MD_DigitalTransferOptions - line274) -->
<xsl:template match="distorTran | distTranOps" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="transSize | unitsODist | transFreq">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="transSize | unitsODist | transFreq"><br /></xsl:if>
    <xsl:apply-templates select="onLineSrc" mode="arcgis"/>
    <xsl:apply-templates select="distFormat" mode="arcgis"/>
    <xsl:apply-templates select="offLineMed" mode="arcgis"/>
  </dl></dd>
</xsl:template>

<!-- Medium Information (B.2.10.4 MD_Medium - line291) -->
<xsl:template match="offLineMed | medium" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="medName">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:apply-templates select="medCitation" mode="arcgis"/>
    <xsl:apply-templates select="medId" mode="arcgis"/>
    <xsl:for-each select="medVol">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="medName | medVol"><br /></xsl:if>
  
    <xsl:for-each select="medFormat">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="medDensity | medDenUnits">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="medDensity | medDenUnits | medFormat"><br /></xsl:if>
  
    <xsl:for-each select="medNote">
      <xsl:call-template name="arcgisTextWithUrls">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </dl></dd>
</xsl:template>


<!-- REFERENCES PAGE -->

<!-- Aggregate Information (B.2.2.7 MD_AggregateInformation - line66.1) -->
<xsl:template match="aggrInfo" mode="arcgis">
    <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:for-each select="assocType | initType">
      <xsl:call-template name="arcgisCode">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="assocType | initType"><br /></xsl:if>

    <xsl:apply-templates select="aggrDSName" mode="arcgis"/>
    <xsl:apply-templates select="aggrDSIdent" mode="arcgis"/>
    <xsl:apply-templates select="metadataRef" mode="arcgis"/>
    </dl></dd>
</xsl:template>

<!-- Portrayal Catalogue Reference (B.2.9 MD_PortrayalCatalogueReference - line268) -->
<xsl:template match="porCatInfo" mode="arcgis">
    <xsl:apply-templates select="portCatCit" mode="arcgis"/>
</xsl:template>

<!-- Application schema Information (B.2.12 MD_ApplicationSchemaInformation - line320) -->
<xsl:template match="appSchInfo" mode="arcgis">
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dd><dl>
    <xsl:apply-templates select="asName" mode="arcgis"/>
    <xsl:for-each select="asSchLang | asCstLang">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="asSchLang | asCstLang"><br /></xsl:if>
    
    <xsl:for-each select="asAscii">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template><br />
    </xsl:for-each>
    <xsl:for-each select="asGraFile">
      <xsl:call-template name="arcgisTypedElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
        <xsl:with-param name="type" select="@src"></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:apply-templates select="graFileOnline" mode="arcgis"/>
    <xsl:for-each select="asSwDevFile">
      <xsl:call-template name="arcgisTypedElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
        <xsl:with-param name="type" select="@src"></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:apply-templates select="swFileOnline" mode="arcgis"/>
    <xsl:for-each select="asSwDevFiFt">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="asAscii | asGraFile | asSwDevFile | asSwDevFiFt"><br /></xsl:if>
    </dl></dd>
</xsl:template>


<!-- FIELDS PAGE -->

<!-- Entity and Attribute -->
<xsl:template match="/metadata/eainfo" mode="arcgis">
    <xsl:for-each select="detailed">
    <xsl:variable name="objectName">
      <xsl:choose>
        <xsl:when test="@Name[. != '']"><xsl:value-of select="@Name"/></xsl:when>
        <xsl:when test="enttyp/enttypl[. != '']"><xsl:value-of select="enttyp/enttypl"/></xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="attr or subtype">
        <xsl:variable name="eleID"><xsl:value-of select="generate-id(.)" /></xsl:variable>
        <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
        <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
        <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
          <xsl:call-template name="arcgisElementValueExpander">
              <xsl:with-param name="ele" select="." />
              <xsl:with-param name="value" select="$objectName" />
            </xsl:call-template>
          <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
        </a></dt>
        <div class="show" id="{$eleID}">
          <dd><dl>
            <xsl:for-each select="enttyp/enttypt | enttyp/enttypc">
            <xsl:call-template name="arcgisElement">
              <xsl:with-param name="ele" select="."></xsl:with-param>
            </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="enttyp/enttypd | enttyp/enttypds">
            <xsl:call-template name="arcgisTextWithUrls">
              <xsl:with-param name="ele" select="."></xsl:with-param>
            </xsl:call-template>
            </xsl:for-each>
            <xsl:if test="(enttyp/enttypt | enttyp/enttypc) and not(enttyp/enttypd | enttyp/enttypds)"><br /></xsl:if>
            
            <xsl:call-template name="fieldsAndSubtypes" />
          </dl></dd>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <dt><xsl:call-template name="arcgisElementName">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template><xsl:value-of select="$objectName"/></dt>&#160;
        <dd><dl>
          <xsl:for-each select="enttyp/enttypt | enttyp/enttypc">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
          </xsl:for-each>
          <xsl:for-each select="enttyp/enttypd | enttyp/enttypds">
          <xsl:call-template name="arcgisTextWithUrls">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
          </xsl:for-each>
        </dl></dd>
      </xsl:otherwise>
    </xsl:choose>
    </xsl:for-each>
    
    <xsl:for-each select="overview">
      <xsl:variable name="eleID"><xsl:value-of select="generate-id(.)" /></xsl:variable>
      <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
      <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
        <xsl:for-each select="eaover | eadetcit">
          <xsl:call-template name="arcgisTextWithUrls">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </dl></dd>
    </xsl:for-each>

    <xsl:apply-templates select="detailed/relinfo" mode="arcgis"/>
</xsl:template>

<!-- Fields and Subtypes -->
<xsl:template name="fieldsAndSubtypes">
  <xsl:for-each select="attr">
  <xsl:variable name="fieldName">
    <xsl:choose>
      <xsl:when test="attrlabl"><xsl:value-of select="attrlabl"/></xsl:when>
      <xsl:when test="not(attrlabl) and ./@Name"><xsl:value-of select="./@Name"/></xsl:when>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(.)" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><a class="expander" onclick="hideShow('{$eleID}')" href="#{$eleID}">
      <xsl:call-template name="arcgisElementValueExpander">
          <xsl:with-param name="ele" select="." />
          <xsl:with-param name="value" select="$fieldName" />
        </xsl:call-template>
    <span id="{$show}" class="hide">&#9660;</span><span id="{$hide}" class="show">&#9658;</span>
  </a></dt>
  <div class="show" id="{$eleID}">
    <dd><dl>
      <xsl:for-each select="attalias | attrtype | attwidth | atprecis | attscale | atoutwid | atnumdec | atindex">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
      </xsl:for-each>
      <xsl:if test="(attalias | attrtype | attwidth | atprecis | attscale | atoutwid | atnumdec | atindex)"><br /></xsl:if>
  
      <xsl:for-each select="attrdef | attrdefs">
        <xsl:call-template name="arcgisTextWithUrls">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
  
      <xsl:choose>
      <xsl:when test="attrdef"></xsl:when>
      <xsl:when test="not(attrdef or attrdefs) and (../subtype[stfield/stfldnm = $fieldName]) and attrdomv"><br /></xsl:when>
      <xsl:when test="not(attrdef or attrdefs) and not(../subtype[stfield/stfldnm = $fieldName]) and attrdomv"><br /></xsl:when>
      <xsl:when test="not(attrdef or attrdefs) and (../subtype[stfield/stfldnm = $fieldName])and not(attrdomv)"><br /></xsl:when>
      <xsl:when test="not(attrdef) and not(../subtype[stfield/stfldnm = $fieldName]) and not(attrdomv)"><br /></xsl:when>
      </xsl:choose>
  
      <xsl:for-each select="../subtype[stfield/stfldnm = $fieldName]">
        <xsl:if test="position() = 1"><dt><xsl:call-template name="arcgisElementName">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template></dt>
        </xsl:if>
        <dd><dl>
          <dd><dl class="subtype">
          <xsl:if test="position() = 1">
            <dt class="header"><xsl:call-template name="arcgisElementName">
                <xsl:with-param name="ele" select="stname"></xsl:with-param>
              </xsl:call-template></dt>
            <dd class="header"><xsl:call-template name="arcgisElementName">
                <xsl:with-param name="ele" select="stflddv"></xsl:with-param>
              </xsl:call-template></dd>
          </xsl:if>
          <dt><xsl:value-of select="stname"/> (<xsl:value-of select="stcode"/>)</dt>
          <xsl:choose>
            <xsl:when test="stfield[stfldnm = $fieldName]/stflddv">
              <xsl:for-each select="stfield[stfldnm = $fieldName]/stflddv">
                <dd><xsl:value-of select="."/></dd>
              </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
              <dd><res:subtypeNoDefaultValue /></dd>
            </xsl:otherwise>
          </xsl:choose>
          </dl></dd>
        </dl></dd>
  
        <xsl:if test="(position() = last())"><br /></xsl:if>
        <xsl:if test="(position() = last()) and (stfield[stfldnm = $fieldName]/stflddd)">
        <dd><dl>
          <xsl:for-each select="stfield[stfldnm = $fieldName]/stflddd">
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="domname"></xsl:with-param>
          </xsl:call-template>
          <dd><dl>
            <xsl:for-each select="domtype | domdesc | mrgtype | splttype">
            <xsl:call-template name="arcgisElement">
              <xsl:with-param name="ele" select="."></xsl:with-param>
            </xsl:call-template>
            </xsl:for-each>
          </dl></dd>
          </xsl:for-each>
        </dl></dd>
        </xsl:if>
      </xsl:for-each>
      
      <xsl:for-each select="attrdomv/edom">
        <xsl:if test="(position() = 1)">
          <dt><xsl:call-template name="arcgisElementName">
              <xsl:with-param name="ele" select="."></xsl:with-param>
            </xsl:call-template></dt>
        </xsl:if>
        <dd><dl>
          <xsl:for-each select="edomv | edomvd | edomvds | attr">
            <xsl:call-template name="arcgisElement">
              <xsl:with-param name="ele" select="."></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
        </dl></dd><br />
      </xsl:for-each>
  
      <xsl:for-each select="attrdomv/rdom">
        <dt><xsl:call-template name="arcgisElementName">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template></dt>
        <dd><dl>
          <xsl:for-each select="rdommin | rdommax | rdommean | rdomstdv | attrunit | attrmres | attr">
            <xsl:call-template name="arcgisElement">
              <xsl:with-param name="ele" select="."></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
        </dl></dd><br />
      </xsl:for-each>
  
      <xsl:for-each select="attrdomv/codesetd">
        <dt><xsl:call-template name="arcgisElementName">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template></dt>
        <dd><dl>
          <xsl:for-each select="codesetn | codesets">
            <xsl:call-template name="arcgisElement">
              <xsl:with-param name="ele" select="."></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
        </dl></dd><br />
      </xsl:for-each>
  
      <xsl:for-each select="attrdomv/udom">
        <xsl:call-template name="arcgisTextWithUrls">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
  
      <xsl:for-each select="begdatea | enddatea">
        <xsl:call-template name="arcgisDate">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
      <xsl:if test="(begdatea | enddatea)"><br /></xsl:if>
  
      <xsl:for-each select="attrvai">
      <dt><xsl:call-template name="arcgisElementName">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template></dt>
      <dd><dl>
        <xsl:for-each select="attrva">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="attrvae">
        <xsl:call-template name="arcgisTextWithUrls">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
        </xsl:for-each>
      </dl></dd>
      </xsl:for-each>
      <xsl:for-each select="attrmfrq">
        <xsl:call-template name="arcgisCode">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
        <br />
      </xsl:for-each>
    </dl></dd>
  </div>
  </xsl:for-each>
</xsl:template>

<!-- Relationship Class Properties -->
<xsl:template match="/metadata/eainfo/detailed/relinfo" mode="arcgis">
  <xsl:variable name="eleID"><xsl:value-of select="generate-id(./*[1])" /></xsl:variable>
  <xsl:variable name="show"><xsl:value-of select="concat($eleID, 'Show')" /></xsl:variable>
  <xsl:variable name="hide"><xsl:value-of select="concat($eleID, 'Hide')" /></xsl:variable>
  <dt><xsl:call-template name="arcgisElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
  <dd><dl>
    <xsl:for-each select="reldesc | relcard | relattr | relcomp | relnodir">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="(reldesc | relcard | relattr | relcomp | relnodir)"><br /></xsl:if>

    <dt><span class="SubContentHeader"><res:otfc /></span></dt>
    <dd><dl>
      <xsl:for-each select="otfcname | otfcpkey | otfcfkey">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </dl></dd>
    
    <dt><span class="SubContentHeader"><res:dtfc /></span></dt>
    <dd><dl>
      <xsl:for-each select="dtfcname | dtfcpkey | dtfcfkey">
        <xsl:call-template name="arcgisElement">
          <xsl:with-param name="ele" select="."></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </dl></dd>

    <xsl:for-each select="relflab | relblab">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="(relflab | relblab)"><br /></xsl:if>
  </dl></dd>
</xsl:template>


<!-- GEOPROCESSING HISTORY PAGE -->

<!--   ESRI EXTENDED ELEMENTS ADDED BY GP SYSTEM AFTER TOOLS RUN -->

<xsl:template match="/metadata/Esri/DataProperties/lineage" mode="arcgis">
      <xsl:for-each select="Process">
        <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
        <dd><dl>
          <xsl:if test="@Name">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="@Name"></xsl:with-param>
      </xsl:call-template>
          </xsl:if>
          <xsl:if test="@Date">
      <xsl:call-template name="arcgisSeparateDateTime">
        <xsl:with-param name="dateEle" select="@Date"></xsl:with-param>
        <xsl:with-param name="timeEle" select="@Time"></xsl:with-param>
      </xsl:call-template>
          </xsl:if>
          <xsl:if test="@ToolSource">
      <xsl:call-template name="arcgisElement">
        <xsl:with-param name="ele" select="@ToolSource"></xsl:with-param>
      </xsl:call-template>
          </xsl:if>
          <dt><span class="SubContentHeader"><res:ProcessCommandIssued /></span></dt>
          <dd><dl>
        <dt><span class="code"><xsl:value-of select="."/></span></dt>
      </dl></dd>
      <xsl:choose>
        <xsl:when test="(@export != '')">
        <xsl:call-template name="arcgisBoolean">
          <xsl:with-param name="ele" select="@export"></xsl:with-param>
        </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
        <dt><span class="ElementLabel"><res:ProcessExport/></span>&#x2003;No</dt>
        </xsl:otherwise>
      </xsl:choose>
          <br />
        </dl></dd>
      </xsl:for-each>
</xsl:template>


<!-- ESRI EXTENDED ELEMENTS - BINARY INFORMATION: THUMBNAILS, ENCLOSURES -->

<!-- Thumbnail -->
<xsl:template match="/metadata/Binary/Thumbnail/img[@src]" mode="arcgis">
  <xsl:variable name="label" select="res:str('Thumbnail')" />
    <img id="thumbnail" alt="{$label}" title="{$label}">
        <xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
    </img>
</xsl:template>

<!-- Enclosures -->
<xsl:template match="Binary" mode="arcgis">
  <xsl:for-each select="Thumbnail">
    <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
      <dd><dl>
      <xsl:for-each select="img">
        <!-- show thumbnail format... only know at display time in ArcMap from file extension, but can't know from file extension in Pro
        <dt>
          <xsl:call-template name="arcgisElement">
            <xsl:with-param name="ele" select="."></xsl:with-param>
          </xsl:call-template>
          <xsl:choose>
            <xsl:when test="(@src != '') and (substring(@src,string-length(@src) - 2) = 'bmp')">BMP</xsl:when>
            <xsl:when test="(@src != '') and (substring(@src,string-length(@src) - 2) = 'jpg')">JPG</xsl:when>
          </xsl:choose>
        </dt>
        -->

        <xsl:choose>
          <xsl:when test="(translate(@OriginalFileName, $upper, $lower) = 'thumbnail.jpg')">
            <dt><xsl:call-template name="arcgisElementName">
                <xsl:with-param name="ele" select="."></xsl:with-param>
              </xsl:call-template></dt>
            <dd><dl><dd>JPG&#160;<res:Image /></dd></dl></dd>
          </xsl:when>
          <xsl:when test="/metadata/tool">
            <dt><xsl:call-template name="arcgisElementName">
                <xsl:with-param name="ele" select="."></xsl:with-param>
              </xsl:call-template></dt>
            <dd><dl><dd><res:toolThumbnail /></dd></dl></dd>
          </xsl:when>
          <xsl:otherwise>
            <dt><xsl:call-template name="arcgisElementName">
                <xsl:with-param name="ele" select="."></xsl:with-param>
              </xsl:call-template></dt>
            <dd><dl><dd><res:Image /></dd></dl></dd>
          </xsl:otherwise>
        </xsl:choose>
            <xsl:for-each select="@OriginalFileName">
              <dt><xsl:call-template name="arcgisElement">
                  <xsl:with-param name="ele" select="."></xsl:with-param>
                </xsl:call-template></dt>
            </xsl:for-each>
            <xsl:for-each select="../Descript">
              <dt><xsl:call-template name="arcgisElement">
                  <xsl:with-param name="ele" select="."></xsl:with-param>
                </xsl:call-template></dt>
            </xsl:for-each>
        <!--<xsl:if test="not(/metadata/tool)">
          <dd><dl>
            <img class="enclosed">
              <xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
              <xsl:attribute name="id"><xsl:value-of select="@OriginalFileName"/></xsl:attribute>
              <xsl:choose>
                <xsl:when test="(../Descript != '')">
                  <xsl:attribute name="title"><xsl:value-of select="../Descript"/></xsl:attribute>
                  <xsl:attribute name="alt"><xsl:value-of select="../Descript"/></xsl:attribute>
                </xsl:when>
                <xsl:when test="(@OriginalFileName != '')">
                  <xsl:attribute name="title"><xsl:value-of select="@OriginalFileName"/></xsl:attribute>
                  <xsl:attribute name="alt"><xsl:value-of select="@OriginalFileName"/></xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:variable name="label" select="res:str('Thumbnail')" />
                  <xsl:attribute name="title"><xsl:value-of select="$label"/></xsl:attribute>
                  <xsl:attribute name="alt"><xsl:value-of select="$label"/></xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
            </img>
          </dl></dd>
        </xsl:if>-->
      </xsl:for-each>
    </dl></dd>
    <br/>
  </xsl:for-each>

  <xsl:for-each select="Enclosure">
    <dt><xsl:call-template name="arcgisElementName">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template></dt>
    <dd><dl>
      <xsl:choose>
        <xsl:when test="Data">
          <xsl:for-each select="Data/@EsriPropertyType">
            <dt><xsl:call-template name="arcgisElementName">
                <xsl:with-param name="ele" select="."></xsl:with-param>
              </xsl:call-template>
            </dt>
            <dd><dl><dd>
              <xsl:choose>
                <xsl:when test="(. = 'Base64')"><res:Base64 /></xsl:when>
                <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
              </xsl:choose>
            </dd></dl></dd>
          </xsl:for-each>
          <xsl:choose>
            <xsl:when test="Data/@SourceMetadata">
              <xsl:for-each select="Descript | Data/@SourceMetadata | Data/@SourceMetadataSchema">
                <dt><xsl:call-template name="arcgisElement">
                    <xsl:with-param name="ele" select="."></xsl:with-param>
                  </xsl:call-template></dt>
              </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
              <xsl:for-each select="Data/@OriginalFileName | Descript">
                <dt><xsl:call-template name="arcgisElement">
                    <xsl:with-param name="ele" select="."></xsl:with-param>
                  </xsl:call-template></dt>
              </xsl:for-each>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="img">
          <xsl:for-each select="img">
            <xsl:choose>
              <xsl:when test="(translate(@OriginalFileName, $upper, $lower) = 'thumbnail.jpg')">
                <dt><xsl:call-template name="arcgisElement">
                    <xsl:with-param name="ele" select="."></xsl:with-param>
                  </xsl:call-template></dt>
                  <dd><dl><dd>JPG&#160;<res:idSidePanelIllus /></dd></dl></dd>
              </xsl:when>
              <xsl:otherwise>
                <dt><xsl:call-template name="arcgisElement">
                    <xsl:with-param name="ele" select="."></xsl:with-param>
                  </xsl:call-template></dt>
                  <dd><dl><dd><res:Image /></dd></dl></dd>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each select="@OriginalFileName">
              <dt><xsl:call-template name="arcgisElement">
                  <xsl:with-param name="ele" select="."></xsl:with-param>
                </xsl:call-template></dt>
            </xsl:for-each>
            <xsl:for-each select="../Descript">
              <dt><xsl:call-template name="arcgisElement">
                  <xsl:with-param name="ele" select="."></xsl:with-param>
                </xsl:call-template></dt>
            </xsl:for-each>
            <xsl:if test="not(/metadata/tool)">
              <dd>
                <br />
                <img class="enclosed">
                  <xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
                  <xsl:attribute name="id"><xsl:value-of select="@OriginalFileName"/></xsl:attribute>
                  <xsl:choose>
                    <xsl:when test="(../Descript != '')">
                      <xsl:attribute name="title"><xsl:value-of select="../Descript"/></xsl:attribute>
                      <xsl:attribute name="alt"><xsl:value-of select="../Descript"/></xsl:attribute>
                    </xsl:when>
                    <xsl:when test="(@OriginalFileName != '')">
                      <xsl:attribute name="title"><xsl:value-of select="@OriginalFileName"/></xsl:attribute>
                      <xsl:attribute name="alt"><xsl:value-of select="@OriginalFileName"/></xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:variable name="label" select="res:str('Thumbnail')" />
                      <xsl:attribute name="title"><xsl:value-of select="$label"/></xsl:attribute>
                      <xsl:attribute name="alt"><xsl:value-of select="$label"/></xsl:attribute>
                    </xsl:otherwise>
                  </xsl:choose>
                </img>
              </dd>
            </xsl:if>
          </xsl:for-each>
        </xsl:when>
      </xsl:choose>
    </dl></dd>
    <br/>
  </xsl:for-each>
</xsl:template>


<!-- TEMPLATES FOR FEATURE CATALOGUE CONTENT THAT WAS REMOVED FROM FINAL ISO 19115 -->

<!-- Spatial Attribute Supplement Information (B.2.12.2 MD_SpatialAttributeSupplement - line332) -->
<!-- ESRI-ISO supported storing feature catalog details that were never included in the final version of ISO 19115 -->
<!--
<xsl:template match="featCatSup" mode="arcgis">
    <dt><xsl:call-template name="oldEsriElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dl>
    <dd>
    <xsl:apply-templates select="featTypeList" mode="arcgis"/>
    </dd>
    </dl>
</xsl:template>
-->

<!-- Feature Type List Information (B.2.12.1 MD_FeatureTypeList - line329 -->
<!-- ESRI-ISO supported storing feature catalog details that were never included in the final version of ISO 19115 -->
<!--
<xsl:template match="featTypeList" mode="arcgis">
    <dt><xsl:call-template name="oldEsriElementName">
      <xsl:with-param name="ele" select="."></xsl:with-param>
    </xsl:call-template></dt>
    <dl>
    <dd>
    <xsl:for-each select="spatObj | spatSchName">
      <xsl:call-template name="oldEsriElement">
        <xsl:with-param name="ele" select="."></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    </dd>
    </dl>
</xsl:template>
-->
 
</xsl:stylesheet>