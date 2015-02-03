(function() {
	$('td .glyphicon-check').closest('td').addClass('chk')
	$('td .glyphicon-unchecked').closest('td').addClass('chk')

	$(document).on('click','td.chk',tdClicked)
	function tdClicked() {
		var local = {}
		
		local.ItemID = $(this).closest('tr').data('itemid')
		if ($(this).find('.glyphicon-check').length) {
			$(this).find('.glyphicon-check').removeClass('glyphicon-check').addClass('glyphicon-unchecked')
			Post(local.ItemID,0)
		} else if ($(this).find('.glyphicon-unchecked').length) {
			$(this).find('.glyphicon-unchecked').removeClass('glyphicon-unchecked').addClass('glyphicon-check')
			Post(local.ItemID,1)
		}
	}
})()
