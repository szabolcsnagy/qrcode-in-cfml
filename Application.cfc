<cfcomponent>
  <cfset this.name="qrcode_generator">

  <!--- tell coldfusion where to find the java libraries --->
  <cfset this.javaSettings = {LoadPaths = ["qrcodelib/"],reloadOnChange=true,watchInterval=30}/>

  <cffunction name="onApplicationStart" access="public" output="false">
    
	  <cfset application.BarcodeFormat = createObject("java","com.google.zxing.BarcodeFormat")>
	  <cfset application.MatrixToImageWriter = createObject("java","com.google.zxing.client.j2se.MatrixToImageWriter")>
    <cfset application.qrcodeWriter = createObject("java","com.google.zxing.qrcode.QRCodeWriter").init()>
	  
  </cffunction>
</cfcomponent>