<cfscript>
storedproc dataSource=request.dataSource
	procedure='Guess.SaveWordSearch' {
	procparam cfSqlType='cf_sql_integer' value=session.Usr.UsrID;
	procparam cfSqlType='cf_sql_varchar' value=session.RemoteAddr;
	procparam cfSqlType='cf_sql_integer' value=form.GuessID;
	procresult name='result';
}
WriteOutput(result.Earned)
</cfscript>
