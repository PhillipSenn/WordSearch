/* Add class="noPaste" to a textarea element */
// http://stackoverflow.com/questions/8365272/disable-copying-on-a-website/22217585?iemail=1&noredirect=1#22217585


/* No Ctrl-V */
// http://stackoverflow.com/questions/2903991/how-to-detect-ctrlv-ctrlc-using-javascript
!function($, window, undefined) {
	var document = window.document;
	var ctrlDown = false,
		ctrlKey = 17, 
		vKey = 86, 
		cKey = 67;
	
	$(document).keydown(function(myEvent) {
		if (myEvent.keyCode === ctrlKey) ctrlDown = true;
	});
	$(document).keyup(function(myEvent) {
		if (myEvent.keyCode === ctrlKey) ctrlDown = false;
	});
		
	$('.noPaste').keydown(function(myEvent) {
		if (ctrlDown && (myEvent.keyCode == vKey || myEvent.keyCode == cKey)) {
			$('.msg').text('Paste has been disabled').addClass('label-danger');
			// <a class="close" data-dismiss="alert" href="#">&times;</a>
			return false;
		}
	});
}(jQuery, window);

// http://stackoverflow.com/questions/441631/how-to-detect-right-mouse-click-paste-using-javascript
$('.noPaste').bind('paste', null, function(myEvent) {
	if(!myEvent.keyCode) {
		return false;
	}
});

