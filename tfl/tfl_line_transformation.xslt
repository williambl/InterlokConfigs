<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/response">
        <html>
            <head>
                <title>TFL Line Status</title>
                <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre.min.css" />
                <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-exp.min.css" />
                <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-icons.min.css" />
            </head>

            <body>
                <h1>TFL Line Status</h1>
                <xsl:for-each select="array-item">
                    <h3><xsl:value-of select="id" /></h3>
                    <h5><xsl:value-of select="modeName" /></h5>

                    <xsl:choose>
                        <xsl:when test="not(disruptions)"><span class="bg-success">No Disruptions</span></xsl:when>
                        <xsl:otherwise>
                            <xsl:for-each select="disruption">
                                <span class="bg-error">Disruption: <xsl:value-of select="summary"></span>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
