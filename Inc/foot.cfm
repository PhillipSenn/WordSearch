</main>
<cfoutput>
<cfif request.js>
	<script src="#request.home#/Inc/js/fw.js"></script>
	<cfif IsDefined('request.bootstrap') AND !request.bootstrap>
	<cfelse>
		<script src="/cdn/Bootstrap/Bootstrap.js"></script>
	</cfif>
	<script src="#request.home#/Inc/js/Lenoir-Rhyne.js"></script>
</cfif>
</cfoutput>
