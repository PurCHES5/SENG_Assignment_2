<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" />
    <xsl:template match="cars">
	    <html>
		    <head>	
                <title>Cars information</title>		
                <meta charset="UTF-8" />	
                <style>
                    li.menu {
                        margin: 0;
                    }

                    #nav {
                    box-shadow: rgb(222 222 222 / 40%) 0px 0px 0px 3px; 
                    font-family: Arial;
                    list-style-type: none;
                    margin: 0;
                    padding: 0;
                    overflow: hidden;
                    position: fixed;
                    background-color: white;
                    top: 0;
                    width: 100%;
                    height: 63px;
                    font-size: 20px;
                    float: left;
                    transition: top 0.3s;
                    }

                    #nav li {
                        font-size: 20px;
                        float: left;
                    }
                    
                    #nav li a {
                    display: block;
                    color: black;
                    text-align: center;
                    padding: 20px 25px;
                    text-decoration: none;
                    }

                    #nav li a:hover:not(.active) {
                    font-weight: bold;
                    background-color: lightgray;
                    font-size: 22px;
                    text-decoration-line: underline;
                    transition: 0.3s;
                    }

                    #nav li a:visited {
                        color: lightcoral;
                    }

                    h1 {
                        margin-top: 100px;
                        font-size: 50px;
                        font-family: Arial;
                        margin-left: 1cm;
                    }

                    h2 {
                        font-size: 30px;
                        font-family: Arial;
                        margin-left: 1cm;
                    }
                    
                    li {
                        margin: 10px 0 0 1cm;
                    }

                    .car-image {
                        margin: 50px;
                        width: 500px;
                    }
                </style>
		    </head>

		    <body>
            <ul id="nav">
                <li class="menu">
                    <span style="display: block; color:orangered; text-align: center; padding: 20px 370px 0 100px; text-shadow: 1px 1px gold; font-weight: bold;">
                        JIM'S CARS
                    </span>
                </li>
                <li class="menu"><a href="index.html">Homepage</a></li>
                <li class="menu"><a href="data-collection.html">Data Collection</a></li>
                <li class="menu"><a href="XML_document_1.xml">SUV</a></li>
                <li class="menu"><a href="XML_document_2.xml">Luxury</a></li>
                <li class="menu"><a href="privacy-policy.html">Privacy Policy</a></li>
                <li class="menu"><a href="terms-and-conditions.html">Terms &amp; Conditions</a></li>
                <li class="menu"><a href="about-us.html">About Us</a></li>
                <li class="menu"><a href="contact-us.html">Contact us</a></li>
            </ul>
			    <h1>All listed <xsl:value-of select="@car-type" /> cars:</h1>

                <xsl:apply-templates select="car"/>
		    </body>
	    </html>
    </xsl:template>
    
	<xsl:template match="car">
        <h2><xsl:value-of select="car-model" /></h2>
        <ul>
            <li>Description: <xsl:value-of select="description" /></li>
            <li>Price: <xsl:value-of select="cost" /></li>
            <li>Make: <xsl:value-of select="make" /></li>
            <li>Safety rating: <xsl:value-of select="safety-rating/@rating" /></li>
            <li>Extras: 
                <xsl:apply-templates select="extras" />
            </li>
            <li>Reviews: 
                <xsl:apply-templates select="reviews" />
            </li>
            <li>Manufacturer Promo Url: 
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="manufacturer-promo-url" />
                    </xsl:attribute>
                    <xsl:value-of select="manufacturer-promo-url" />
                </a>
            </li>
            <img class="car-image" alt="car-image">
                <xsl:attribute name="src">
                    <xsl:value-of select="promo-pic-path" />
                </xsl:attribute>
            </img>
        </ul>
	</xsl:template>

    <xsl:template match="extras">
        <li><xsl:value-of select="option" />: <xsl:value-of select="additional-cost" /></li>
	</xsl:template>

    <xsl:template match="reviews">
        <li><xsl:value-of select="." /></li>
	</xsl:template>
	
</xsl:stylesheet> 
