component {
this.Name = 'Lenoir-Rhyne2015Spring101022015'
this.dataSource = 'LR2015Spring1'
this.SessionManagement = true
this.sessionTimeout = CreateTimeSpan(0,0,45,0)
this.ScriptProtect = 'all'
this.currentTemplatePath = GetCurrentTemplatePath()
this.directoryFromPath   = GetDirectoryFromPath(this.currentTemplatePath)
this.mappings['Inc'] = this.directoryFromPath & 'Inc' /* Without a trailing slash */
this.mappings['com'] = this.directoryFromPath & 'com'

function onSessionStart() {
	session.msg = ''
	session.mod = 'label-danger'
	// For Ajax calls:
	session.dataSource = this.dataSource 
	session.RemoteAddr = getPageContext().getRequest().getRemoteAddr()
}

function onRequestStart(LogCFCName) {
	var Usr = {}
	
	setting showDebugOutput=false;
	if (IsDefined('url.onApplicationStart')) {
		onApplicationStart()
		onSessionStart()
	}
	if (IsDefined('url.onSessionStart')) {
		onSessionStart()
	}
	request.msg = session.msg
	request.mod = session.mod
	request.dataSource = session.dataSource
	request.RemoteAddr = session.RemoteAddr

	request.name='Lenoir-Rhyne University'
	request.home = '/2015Spring1' /* without a trailing slash todo: use a variable here. */
	request.css = true
	if (IsDefined('url.css')) {
		request.css = url.css
	}
	request.js = true
	if (IsDefined('url.js')) {
		request.js = url.js
	}
//	request.jQueryUI = 'ui-lightness' // black-tie,blitzer,cupertino,dark-hive,dot-luv,eggplant,excite-bike,flick,hot-sneaks,humanity,le-frog,mint-choc,overcast,pepper-grinder,redmond,smoothness,south-street,start,sunny,swanky-purse,trontastic,ui-darkness,ui-lightness,vader
//	request.bootstrap = true
	request.try = false
	if (IsDefined('url.try')) {
		request.try = url.try
	}
	request.navbar = true
	request.container = true
	request.cgiName = Left(cgi.SCRIPT_NAME,Len(cgi.SCRIPT_NAME)-4)
	request.cssName = request.cgiName & '.css'
	request.jsName  = request.cgiName & '.js'
	if (IsDefined('url.logout')) {
		StructDelete(session,'Usr')
	}
	if (IsDefined('form.GloballyUniqueIdentifier') AND !IsDefined('url.ID')) {
		url.ID = form.GloballyUniqueIdentifier
	}
	if (IsDefined('url.ID')) {
		StructDelete(session,'Usr')
		if (Len(url.ID) != 36) {
			request.msg = 'ID must be a length of 36'
		} else if (Mid(url.ID,09,1) != '-') {
			request.msg = 'Position 9 has to be a dash character.'
		} else if (Mid(url.ID,14,1) != '-') {
			request.msg = 'Position 14 has to be a dash character.'
		} else if (Mid(url.ID,19,1) != '-') {
			request.msg = 'Position 19 has to be a dash character.'
		} else if (Mid(url.ID,24,1) != '-') {
			request.msg = 'Position 24 has to be a dash character.'
		} else if (Find('--',url.ID)) {
			request.msg = 'Two dashes? Really?'
		} else {
			for (var i=1; i <= Min(36,Len(url.ID)); i++) {
				if (!Find(Mid(url.ID,i,1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-')) {
					request.msg = Mid(url.ID,i,1) & ' says what?'
				}
			}
		}
		if (request.msg == '') {
			storedproc dataSource=request.dataSource
				procedure='Usr.WhereGloballyUniqueIdentifier' {
				procparam cfSqlType='cf_sql_varchar' value=request.RemoteAddr;
				procparam cfSqlType='cf_sql_varchar' value=url.ID;
				procresult resultset=1 name='local.Usr';
				procresult resultset=2 name='local.Person';
				procresult resultset=3 name='local.Course';
				procresult resultset=4 name='local.Term';
			}
	
			if (IsDefined('local.Usr')) {
				if (local.Usr.recordCount) {
					session.Usr = Duplicate(local.Usr)
					session.Person = Duplicate(local.Person)
					session.Course = Duplicate(local.Course)
					session.Term = Duplicate(local.Term)
				} else {
					request.msg = url.ID & ' not found.'
				}
			}
		}
	}
	if (IsDefined('session.Usr')) {
		if (session.Usr.isAdmin) {
		} else if (FindNoCase('/Admin/',getPageContext().getRequest().getServletPath())) {
			location(request.home & '/Nedry/Nedry.cfm',false)
		}
		request.StudentPath = request.home & '/Students/' 
			& session.Course.CourseName
			& '.' & session.Course.CourseID
			& '/' & Replace(session.Usr.UsrName,' ','','all')
	} else {
//		request.StudentPath = request.home
		if (request.msg == '') {
			request.msg = 'You have been logged out.'
			request.mod = 'label-danger'
		}
		include '/Inc/Login.cfm'
		return false
	}
}

function onRequestEnd(LogCFCName) {
	session.msg = ''
	session.mod = 'label-danger' // or 'none'
}
}
