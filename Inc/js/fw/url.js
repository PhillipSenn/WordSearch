fw.url = function(arg) {
	var result = ''
		,url
		,i
		,hashes = location.href.slice(
			location.href.indexOf('?') + 1
		)
	hashes = hashes.split('&')
	for(i = 0; i < hashes.length; i++)	{
		url = hashes[i].split('=')
		if (url[0].toUpperCase() === arg.toUpperCase()) {
			result = url[1]
		}
	}
	return result
}