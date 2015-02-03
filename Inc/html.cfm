<cfoutput>
<!doctype html>
<html lang="en" class="no-js">
<head>
<title>#request.name#</title>
<cfif request.css>
	<meta charset="utf-8">
	<meta content="Phillip Senn" name="author">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimal-ui">
	<cfif IsDefined('request.bootstrap') AND !request.bootstrap>
	<cfelse>
		<link rel="stylesheet" type="text/css" href="/cdn/Bootstrap/Bootstrap.css">
		<link rel="stylesheet" type="text/css" href="/cdn/Bootstrap/Bootstrap-theme.css">
	</cfif>
	<link rel="stylesheet" href="#request.home#/Inc/css/fw.css">
	<link rel="stylesheet" href="#request.home#/Inc/css/Lenoir-Rhyne.css">
	<cfif FileExists(request.cssName)>
		<link rel="stylesheet" href="#request.cssName#">
	</cfif>
</cfif>
<cfif request.js>
	<script src="/cdn/Modernizr.js"></script>
	<script src="/cdn/jQuery.js"></script>
	<cfif IsDefined('request.jQueryUI') AND request.jQueryUI NEQ "">
		<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1/themes/#request.jQueryUI#/jquery-ui.css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.2/jquery.ui.touch-punch.min.js"></script>
	</cfif>
</cfif>
</cfoutput>