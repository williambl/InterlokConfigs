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
                <link rel="stylesheet" href="file:///home/william/dev/Interlok/interlok-configs/tfl/disruption_page/tfl-disruption.css" />
            </head>

            <body>
                <h1 class="title">TFL Line Status</h1>
                <table class="disruption-table">
                <xsl:for-each select="array-item">
                    <tr>
                        <td class="line-name"><xsl:value-of select="name" /></td>

                        <xsl:choose>
                            <xsl:when test="not(disruptions)"><td class="bg-success no-disruptions s-rounded">No Disruptions</td></xsl:when>
                            <xsl:otherwise>
                                <xsl:for-each select="disruption">
                                    <td class="bg-error disruption s-rounded">Disruption: <xsl:value-of select="summary" /></td>
                                </xsl:for-each>
                            </xsl:otherwise>
                        </xsl:choose>

                    </tr>
                </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
