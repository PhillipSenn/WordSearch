<cfscript>
storedproc dataSource=request.dataSource
	procedure='Paper.[Create]' {
	procparam cfSqlType='cf_sql_integer' value=session.Usr.UsrID;
	procparam cfSqlType='cf_sql_varchar' value=request.RemoteAddr;
	procparam cfSqlType='cf_sql_integer' value=url.AssignmentID;
	procresult resultset=1 name='Paper';
//	procresult resultset=2 name='Person';
//	procresult resultset=3 name='Assignment';
//	procresult resultset=4 name='Act';
//	procresult resultset=5 name='Scale';
//	procresult resultset=6 name='Course';
//	procresult resultset=7 name='Term';
//	procresult resultset=8 name='Cat';
}

if (!Paper.recordCount) {
	WriteOutput('Paper not created for Assignment ' & url.AssignmentID)
	abort;
}

storedproc dataSource=request.dataSource
	procedure='Guess.[Create]' {
	procparam cfSqlType='cf_sql_integer' value=session.Usr.UsrID;
	procparam cfSqlType='cf_sql_varchar' value=request.RemoteAddr;
	procparam cfSqlType='cf_sql_integer' value=Paper.PaperID;
	procresult resultset=1 name='Guess';
//	procresult resultset=2 name='Paper'; The chat assignment doesn't create any rows, so use the PaperID from Paper up above.
	procresult resultset=3 name='Person';
	procresult resultset=4 name='Assignment';
	procresult resultset=5 name='Act';
	procresult resultset=6 name='Scale';
	procresult resultset=7 name='Course';
	procresult resultset=8 name='Term';
	procresult resultset=9 name='Cat';
	procresult resultset=10 name='Answer';
	procresult resultset=11 name='Question';
	procresult resultset=12 name='Act';
}
storedproc dataSource=request.dataSource
	procedure='Paper.CreateAttendance' {
	procparam cfSqlType='cf_sql_integer' value=session.Usr.UsrID;
	procparam cfSqlType='cf_sql_varchar' value=request.RemoteAddr;
	procparam cfSqlType='cf_sql_integer' value=Paper.PaperID;
	procresult name='AttendancePaper';
}
if (AttendancePaper.PaperID) {
	storedproc dataSource=request.dataSource
		procedure='Guess.CreateAttendance' {
		procparam cfSqlType='cf_sql_integer' value=session.Usr.UsrID;
		procparam cfSqlType='cf_sql_varchar' value=request.RemoteAddr;
		procparam cfSqlType='cf_sql_integer' value=AttendancePaper.PaperID;
	}
}
</cfscript>