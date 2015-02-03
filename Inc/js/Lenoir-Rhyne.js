window.dom = {} // Document Object Model
dom.msg = $('.msg')
dom.main = $('main')

dom.failure = function(svc, SQLError) {
	// dom.msg.text(SQLError.message).addClass('label-danger')
	debugger
}

// todo: fwConstructor.prototype.fail = function()
// Global ajax fail handler
function fail(xhr, status, response) {
	// For some reason, Firefox was throwing this error when I'd refresh the page, but
	// it would sail right through the debugger statement AND an alert box, so I'm just
	// going to ignore errors with empty responseTexts.
	if (response) {
		dom.msg.text(status + ': ' + response).addClass('label-warning')
	}
	if (xhr.responseText) {
		dom.main.html(xhr.responseText)
	}
	debugger
}

/*
window.onerror = function(myError) {
	console.log('window.onerror')
}
*/
/* $('a,button').tooltip() Removed for Monopoly */

/*
;(function() {
	$(document).on('click','a#back',backButton)
	function backButton() {
		window.history.back()
	}
})()

*/
