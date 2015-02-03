<cfscript>
storedproc dataSource=request.dataSource
	procedure='Paper.[get]' {
	procparam cfSqlType='cf_sql_integer' value=session.Usr.UsrID;
	procparam cfSqlType='cf_sql_varchar' value=request.RemoteAddr;
	procparam cfSqlType='cf_sql_integer' value=url.PaperID;
	procresult resultset=1 name='Paper';
	procresult resultset=2 name='Person';
	procresult resultset=3 name='Assignment';
	procresult resultset=4 name='Act';
	procresult resultset=5 name='Scale';
	procresult resultset=6 name='Course';
	procresult resultset=7 name='Term';
	procresult resultset=8 name='Cat';
}
param name='form.MaxRows' defalt=18;
param name='form.MaxCols' default=18;

storedproc dataSource=request.dataSource
	procedure='Guess.WherePaperID' {
	procparam cfSqlType='cf_sql_integer' value=session.Usr.UsrID;
	procparam cfSqlType='cf_sql_varchar' value=request.RemoteAddr;
	procparam cfSqlType='cf_sql_integer' value=Paper.PaperID;
	procresult name='Guess';
}

form.AnswerNames = ValueList(Guess.AnswerName)
form.Questions = ListLen(form.AnswerNames)
request.ShowProgress = true
</cfscript>

<cfoutput query="Act">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="Print.css"  media="print">
<cfinclude template="/Inc/body.cfm">
<div class="row">
	<div class="col-sm-9 table-responsive">
		<table id="Board" class="no-hover no-striped">
			<cfloop from="1" to="#form.MaxRows#" index="row">
				<tr>
				<cfloop from="1" to="#form.MaxCols#" index="col">
					<td>&nbsp;</td>
				</cfloop>
				</tr>
			</cfloop>
		</table>
	</div>
	<div class="col-sm-2">
		<ul class="list-unstyled" id="VerticalWords">
			<cfloop query="Guess">
				<li data-guessid="#GuessID#"<cfif Earned> class="label-success"</cfif>>#AnswerName#</li>
			</cfloop>
		</ul>
	</div>
	<div class="col-sm-1" id="letters">
		<cfloop from="65" to="90" index="I">
			<div id="Chr#I#" class="btn">#Chr(I)#</div>
		</cfloop>
	</div>
</div>
<div id="HorizontalWords">
	<cfloop from="1" to="#form.Questions#" index="I">
		<div class="fl">
			#ListGetAt(form.AnswerNames,I)#
		</div>
	</cfloop>
</div>
<cfinclude template="/Inc/foot.cfm">
<div hidden>
	<div id="AnswerNames">#form.AnswerNames#</div>
	<div id="Points">#Int(100/Questions)#</div>
	<div id="Remainder">#100 - Int(100/Questions) * Questions#</div>
	<div id="MaxCols">#form.MaxCols#</div>
	<div id="MaxRows">#form.MaxRows#</div>
	<div id="PaperID">#Paper.PaperID#</div>
</div>
<script src="#request.home#/Inc/js/fw/int.js"></script>
<!--- todo: I don't think keymaster should be used here --->
<script src="//cdnjs.cloudflare.com/ajax/libs/keymaster/1.6.1/keymaster.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>
