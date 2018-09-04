<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="email/subject" /></title>
                <link href="email-style.css" rel="stylesheet" />
            </head>
            <body>
                <h1>Email</h1>
                <hr />
                <h3>From:</h3>
                <p><xsl:value-of select="email/sender/name" /> (<xsl:value-of select="email/sender/address" />)</p>
                <h3>To:</h3>
                <p><xsl:value-of select="email/recipients/to/name" /> (<xsl:value-of select="email/recipients/to/address" />)</p>
                <h3>CC:</h3>
                <ul>
                    <xsl:for-each select="email/recipients/cc">
                        <li><xsl:value-of select="name" /> (<xsl:value-of select="address" />)</li>
                    </xsl:for-each>
                </ul>
                <hr />
                <h3>Subject: <xsl:value-of select="email/subject" /></h3>

                <hr />
                <h3>Message:</h3>
                <xsl:value-of select="email/message" />

                <hr />

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
