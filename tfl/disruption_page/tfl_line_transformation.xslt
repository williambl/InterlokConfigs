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
                        <td class="line-name">
                            <xsl:value-of select="name" />
                            <xsl:choose>
                                <xsl:when test="modeName='tube'"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Underground.svg/594px-Underground.svg.png" alt="Underground" title="Underground" class="mode-icon" /></xsl:when>
                                <xsl:when test="modeName='overground'"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Overground_roundel.svg/592px-Overground_roundel.svg.png" alt="Overground" title="Overground" class="mode-icon" /></xsl:when>
                                <xsl:when test="modeName='dlr'"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/DLR_roundel.svg/593px-DLR_roundel.svg.png" alt="DLR" title="DLR" class="mode-icon" /></xsl:when>
                                <xsl:when test="modeName='tflrail'"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/TFL_Rail_roundel.svg/594px-TFL_Rail_roundel.svg.png" alt="TFL Rail" title="TFL Rail" class="mode-icon" /></xsl:when>
                                <xsl:when test="modeName='national-rail'"><img src="https://upload.wikimedia.org/wikipedia/en/thumb/d/da/NationalRail.svg/480px-NationalRail.svg.png" alt="National Rail" title="National Rail" class="mode-icon" /></xsl:when>
                            </xsl:choose>
                        </td>

                        <xsl:choose>
                            <xsl:when test="not(disruptions)"><td class="bg-success no-disruptions s-rounded">No Disruptions</td></xsl:when>
                            <xsl:otherwise>
                            <td class="bg-error disruption s-rounded">
                                <xsl:for-each select="disruption">
                                    <span class="disruption-text">Disruption: <xsl:value-of select="summary" /></span>
                                </xsl:for-each>
                            </td>
                            </xsl:otherwise>
                        </xsl:choose>

                    </tr>
                </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
