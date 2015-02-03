<cfscript>
StudentPath = request.home & '/Students/' 
	& Paper.CourseName
	& '.' & Paper.CourseSort
	& '/' & Replace(Paper.PersonName,' ','','all')
</cfscript>
