fw.right = function(str,n) {
	if (n <= 0) return ''
	if (n >= str.length) return str
	return str.substring(str.length-n)
}

