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
                    <div>
                        <h3 class="line-name"><xsl:value-of select="name" /></h3>
                        <span class="mode-name"><xsl:value-of select="modeName" /></span>
                        <br />

                        <xsl:choose>
                            <xsl:when test="not(disruptions)"><span class="bg-success no-disruptions">No Disruptions</span></xsl:when>
                            <xsl:otherwise>
                                <xsl:for-each select="disruption">
                                    <span class="bg-error disruption">Disruption: <xsl:value-of select="summary" /></span>
                                </xsl:for-each>
                            </xsl:otherwise>
                        </xsl:choose>

                    </div>
                    <hr />
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
