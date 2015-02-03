<cfscript>
include '/Inc/Paper.cfm'
</cfscript>

<cfoutput query="Act">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<p>#ActDesc#</p>
<p>The word search uses the words that are in each chapter.
They are listed on the right-hand side.
When you find a word, drag your mouse over it and it will turn green.
Words can be backwards or forwards or diagonal.
</p>
<p>Click and drag to highlight the word or phrase - <em>simple</em>!</p>
<p>
<cfif now() LT Assignment.AssignmentStart>
	<cfif session.Usr.isAdmin>
		<a class="btn-warning" href="WordSearch.cfm?PaperID=#Paper.PaperID#">Assignment begins 
		#DayOfWeekAsString(DayOfWeek(Assignment.AssignmentStart))#
		#DateFormat(Assignment.AssignmentStart,"mm/dd")#
		</a>
	<cfelse>
		<a class="btn-warning" href="#request.home#">Assignment begins 
		#DayOfWeekAsString(DayOfWeek(Assignment.AssignmentStart))#
		#DateFormat(Assignment.AssignmentStart,"mm/dd")#</a>
	</cfif>
<cfelse>
	<a class="btn-primary" href="WordSearch.cfm?PaperID=#Paper.PaperID#">Ready!</a>
</cfif>
</p>
<p>
	<button class="btn-info" type="button" data-toggle="modal" data-target=".modal">Pedagogy</button>
</p>
<div class="modal fade" data-backdrop="false">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header label-primary">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Pedagogy for this assignment</h4>
		</div>
		<div class="modal-body">
		<p>This one's a little harder to justify over a crossword puzzle where the names
		<strong>and</strong> definitions are given.
		I was just looking at the list of primary terms and secondary terms, trying to think
		of how I could make it "fun".
		</p>
		<p>I was in Barnes &amp; Noble when I saw an entire shelf devoted to word search books.
		Clearly it must be a popular pastime.
		</p>
		</div>
		<div class="modal-footer">
		<button type="button" data-dismiss="modal">Close</button>
		</div>
		</div>
	</div>
</div>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
