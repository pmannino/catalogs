<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gco="http://www.isotc211.org/2005/gco">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <RncProductCatalogChartCatalogs>
            <Header>
                <title>
                    <xsl:value-of select="//gmd:MD_Metadata/gmd:fileIdentifier/gco:CharacterString"/>
                </title>
                <date_created>
                    <xsl:value-of select="substring-before(//gmd:MD_Metadata/gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:date/gmd:CI_Date/gmd:date/gco:DateTime, 'T')"/>
                </date_created>
                <time_created>
                    <xsl:value-of select="substring-before(substring-after(//gmd:MD_Metadata/gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:date/gmd:CI_Date/gmd:date/gco:DateTime, 'T'), '.')"/>
                </time_created>
                <date_valid>
                    <xsl:value-of select="substring-before(//gmd:MD_Metadata/gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:date/gmd:CI_Date/gmd:date/gco:DateTime, 'T')"/>
                </date_valid>
                <time_valid>
                    <xsl:value-of select="substring-before(substring-after(//gmd:MD_Metadata/gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:date/gmd:CI_Date/gmd:date/gco:DateTime, 'T'), '.')"/>
                </time_valid>
                <dt_valid>
                    <xsl:value-of select="//gmd:MD_Metadata/gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:date/gmd:CI_Date/gmd:date/gco:DateTime"/>
                </dt_valid>
                <ref_spec>
                    <xsl:value-of select="//gmd:MD_Metadata/gmd:distributionInfo/gmd:MD_Distribution/gmd:distributionFormat/gmd:MD_Format/gmd:name/gco:CharacterString"/>
                </ref_spec>
                <ref_spec_vers>
                    <xsl:value-of select="//gmd:MD_Metadata/gmd:distributionInfo/gmd:MD_Distribution/gmd:distributionFormat/gmd:MD_Format/gmd:version/gco:CharacterString"/>
                </ref_spec_vers>
                <s62AgencyCode>0</s62AgencyCode>
            </Header>
            <xsl:for-each select="//gmd:DS_Series/gmd:composedOf/gmd:DS_DataSet">
                <chart>
                    <number>
                        <xsl:value-of select="gmd:has/gmd:MD_Metadata/gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString"/>
                    </number>
                    <title>
                        <xsl:value-of select="gmd:has/gmd:MD_Metadata/gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:alternateTitle/gco:CharacterString"/>
                    </title>
                    <format>
                        <xsl:value-of select="gmd:has/gmd:MD_Metadata/gmd:identificationInfo/gmd:MD_DataIdentification/gmd:abstract/gco:CharacterString"/>
                    </format>
                    <zipfile_location>
                        <xsl:value-of select="gmd:has/gmd:MD_Metadata/gmd:distributionInfo/gmd:MD_Distribution/gmd:transferOptions/gmd:MD_DigitalTransferOptions/gmd:onLine/gmd:CI_OnlineResource/gmd:linkage/gmd:URL"/>
                    </zipfile_location>
                    <xsl:for-each select="gmd:has/gmd:MD_Metadata/gmd:dateStamp/gco:DateTime">
                        <zipfile_datetime>
                            <xsl:value-of select="concat(substring(., 1, 4), substring(., 6, 2), substring(., 9, 2), '_000000')"/>
                        </zipfile_datetime>
                    </xsl:for-each>
                    <!-- <zipfile_datetime>
                        <xsl:value-of select="replace(concat(substring-before(gmd:has/gmd:MD_Metadata/gmd:dateStamp/gco:DateTime, 'T'), '_000000'),'-','')"/>
                    </zipfile_datetime> -->
                    <zipfile_datetime_iso8601>
                        <xsl:value-of select="gmd:has/gmd:MD_Metadata/gmd:dateStamp/gco:DateTime"/>
                    </zipfile_datetime_iso8601>
                    <target_filename>
                        <xsl:value-of select="concat(gmd:has/gmd:MD_Metadata/gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString, '.zip')"/>
                    </target_filename>
                </chart>
            </xsl:for-each>
        </RncProductCatalogChartCatalogs>
    </xsl:template>
</xsl:stylesheet>