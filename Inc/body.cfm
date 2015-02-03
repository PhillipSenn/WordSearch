</head>
<body>
<cfoutput>
<cfif request.navbar>
	<nav class="navbar navbar-fixed-top">
		<cfif IsDefined("session.Usr")>
			<div class="navbar-inverse">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="##navbar" aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand glyphicon glyphicon-home" href="#request.home#"
						data-toggle="tooltip" data-placement="bottom" title="#session.Course.CourseDesc#"></a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li><a href="#request.home#/Status/Progress.cfm" data-toggle="tooltip" data-placement="bottom" title="Report">Progress</a></li>
							<li><a href="#request.home#/Calendar/Calendar.cfm">Calendar</a></li>
							<cfif session.Usr.isAdmin>
								<li><a href="#request.home#/Admin/Admin.cfm">Admin</a></li>
								<li><a href="#request.home#/DevVsProd.cfm">#request.dataSource#</a></li>
							</cfif>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<a href="##" class="dropdown-toggle" data-toggle="dropdown">#session.Person.FirstName# 
									<span class="UnicodeNumber">&###session.Usr.UnicodeNumber#</span>
								</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#request.home#/Profile/Profile.cfm">Profile</a></li>
									<li class="divider"></li>
									<li><a href="#request.home#/?logout">Logout</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		<cfelse>
			<div class="navbar-inverse">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="##navbar" aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand glyphicon glyphicon-home" href="https://sakai.lampschools.org/portal"
						data-toggle="tooltip" data-placement="bottom" title="LAMP"></a>
					</div>
				</div>
			</div>
		</cfif>
		<cfif request.mod NEQ "none">
			<div class="msg container<cfif request.msg NEQ ''> #request.mod#</cfif>">
				#request.msg#
			</div>
		</cfif>
	</nav>
</cfif>
</cfoutput>

<main role="main" class="<cfif request.container>container<cfelse>container-fluid</cfif>">
	<cfif IsDefined("request.ShowProgress") AND request.ShowProgress>
		<cfif request.container>
			<div class="container progress<cfif Paper.PctComplete GE 100> active progress-striped</cfif>">
				<div class="progress-bar" style="width: <cfoutput>#Int(Paper.PctComplete)#</cfoutput>%"></div>
			</div>
		<cfelse>
			<div class="progress<cfif Paper.PctComplete GE 100> active progress-striped</cfif>">
				<div class="progress-bar" style="width: <cfoutput>#Int(Paper.PctComplete)#</cfoutput>%"></div>
			</div>
		</cfif>
	</cfif>
