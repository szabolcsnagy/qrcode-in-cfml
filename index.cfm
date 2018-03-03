

<!--- write the qr code as an image to the temp folder --->
<cfset qrcontent="https://github.com/szabolcsnagy/qrcode-in-cfml">
<cfset QRcode=application.qrcodeWriter.encode("#qrcontent#",application.BarcodeFormat.QR_CODE,140,140)>
<cfset image=ImageNew( application.MatrixToImageWriter.toBufferedImage(QRcode))>
<cfset QRImageFilename="#getTempDirectory()#/qrcode.png"> <!--- if you use the temp directory make sure the filename is unique to your application --->
				
<cfimage action="write" source="#image#" format="png" destination="#QRImageFilename#" overwrite="true" quality="1">
				
<!--- provide filename="ticket.pdf" attribute to write this into a pdf. Otherwise coldfusion will render it in the browser --->
<cfdocument format="pdf" localUrl="yes" fontEmbed="Yes" pageType="Letter" marginbottom="0" margintop="0" marginleft="0" marginright="0" overwrite="yes"> 
  <!DOCTYPE html>
		<html lang="en">
			<head>
				<meta charset="UTF-8">
				<title>Tickets</title>
      </head>
      <body>
        <h1>QR Code Test</h1>
        <p>Your ticket to github.com</p>
        <cfoutput>
        <img src="#QRImageFilename#" alt="QR code">
        </cfoutput>
      </body>
    </html>
</cfdocument>