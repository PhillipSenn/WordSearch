window.log = function(arg) {
	if (this.console) {
		// console.log(Array.prototype.slice.call(arguments)) //paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog
		console.log(arg)
	}
}

/* 
http://www.thinkful.com/learn/javascript-best-practices-1/Avoid-Globals
Revealing Module Pattern: Keep consistent syntax and mix and match what to make global.
*/
function fwConstructor() {
	var result = {}

	$(document).on('mouseenter', 'button[name="Delete"]', function() {
		$(this).addClass('btn-danger')
	})
	$(document).on('mouseleave', 'button[name="Delete"]', function() {
		$(this).removeClass('btn-danger')
	})
	$('table').not('.no-table').addClass('table')
	$('table').not('.no-table,.no-hover').addClass('table-hover')
	$('table').not('.no-table,.no-striped').addClass('table-striped')
	$('table').not('.no-table,.no-bordered').addClass('table-bordered')
	$('table').not('.no-table,.no-condensed').addClass('table-condensed')
	$('table').not('.no-sortable').addClass('sortable')	
	$('textarea,input:text,input:password,input[type=email],select').addClass('form-control')
	$('form').attr('role','form')
	$('form>div').addClass('form-group')

	$('button,.btn-lg,.btn-block,.btn-default,.btn-primary,.btn-success,.btn-info,.btn-warning,.btn-danger,.btn-link').addClass('btn')
	$('.btn').addClass('btn-lg')
	$('.no-lg').addClass('btn').removeClass('btn-lg')
	$('#Save,button[name=Save]').addClass('btn-primary')
	$('.btn').not('.btn-success,.btn-primary,.btn-info,.btn-warning,.btn-danger').addClass('btn-default')

	$('header,section,article,footer').addClass('row')

	// $('table').not('.no-table').addClass('table').wrap('<div class="table-responsive"></div>')
	// $('img').not('[hidden]').addClass('img-responsive') // img-rounded
	if (!$('form').attr('method')) {
		  $('form').attr('method','post')
	}

	function Railo() { // (pronounced Rhylo)
		$('a[name=cfdebug_templates]').find('font').hide()
		$('table.cfdebug').addClass('table table-striped table-hover table-bordered table-condensed')
	}
	result.Railo = Railo
	return result
}
window.fw = fwConstructor()
// todo fwConstructor.prototype.Railo = function()
setTimeout(fw.Railo,100) /* After the page loads, style the Railo debugging output */
