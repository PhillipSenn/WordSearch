<!---
http://cfmlblog.adamcameron.me/2014/07/survey-results-scoping-of-variables.html
--->
<cfscript>
var sql=''
var params=[]
var Key=''
var stcKey={}

if (IsDefined('arguments.arg')) {
	if (IsSimpleValue(arg)) {
		if (Right(arg,2) == 'ID' OR Right(arg,4) == 'SORT') {
			if (!IsValid('integer',arg['#arg#'])) {
				echo('newQuery.cfm,1: ' + arg & ' is: ' & arg['#arg#'])
				abort;
			}
		}
	} else {
		for (Key in arguments.arg) {
			if (IsSimpleValue(key)) {
				Key = UCase(Key)
				if (Right(Key,2) == 'ID' OR Right(Key,4) == 'SORT') {
					if (!IsNumeric(arg['#Key#']) AND Len(Key) > 2) {
						echo('newQuery.cfm,2: ' & Key & ' is: ' & arg['#Key#'])
						abort;
					}
				}
			} else {
				stcKey = Key
				for (Key in stcKey) {
					Key = UCase(Key)
					if (Right(Key,2) == 'ID' OR Right(Key,4) == 'SORT') {
						if (!IsValid('integer',arg['#Key#'])) {
							echo('newQuery.cfm,3: ' + Key & ' is: ' & arg['#Key#'])
							abort;
						}
					}
				}
			}
		}
	}
}
var dataSource = request.dataSource
if (IsDefined('Variables.fw.dataSource')) {
	dataSource = Variables.fw.dataSource
}
</cfscript>
