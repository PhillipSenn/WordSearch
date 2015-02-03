fw.checkAll = function() {
	$(document).on('click','#checkAll',clicked)
	function clicked() {
		if ($(this).is(':checked')) {
			$(this).closest('table').find('input:checkbox').prop('checked',true)
		} else {
			$(this).closest('table').find('input:checkbox').removeAttr('checked')
		}
	}
}
fw.checkAll()
