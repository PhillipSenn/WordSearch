<cfoutput>
<cfif request.js>
	<cfif FileExists(request.jsName)>
		<script src="#GetFileFromPath(request.jsName)#"></script>
	</cfif>
	<script src="#request.home#/Inc/js/fw/FlashOfUnstyledContent.js"></script>
</cfif>
</cfoutput>
</body>
</html>
