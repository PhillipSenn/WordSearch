fw.selectSubmit = function() {
	$(document).on('change','select',change)
	
	function change() {
		$(this).closest('form').submit()
	}
}
fw.selectSubmit()
