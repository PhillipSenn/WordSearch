window.log = function(arg){
  if(this.console) {
    console.log(arg)
  }
}

;(function() {
    Date.prototype.toYMD = Date_toYMD;
    function Date_toYMD() {
        var year, month, day;
        year = String(this.getFullYear());
        month = String(this.getMonth() + 1);
        if (month.length == 1) {
            month = "0" + month;
        }
        day = String(this.getDate());
        if (day.length == 1) {
            day = "0" + day;
        }
        return year + '-' + month + '-' + day;
    }
})()

;(function() {
    Date.prototype.toHMS = Date_toHMS;
    function Date_toHMS() {
        var hour, minute, second;
        hour = String(this.getHours());
        minute = String(this.getMinutes());
        second = String(this.getSeconds());
        return '' + hour + minute + second;
    }
})()


// http://www.4guysfromrolla.com/webtech/vb2java.shtml
String.prototype.mid = function(start,len) {
	if (start <= 0) return ''
	if (!len) return this.substring(start-1)
	if (len <= 0) return ''
	return this.substring(start-1,start+len-1)
}

String.prototype.UCASE = function() {
	return this.toUpperCase()
}

String.prototype.lcase = function() {
	return this.toLowerCase()
}

function PRINT(arg)	{
	$('body').append(arg + '<br>')
}

function NOT(arg) {
	return !arg
}

function REM() {};

function STR(arg) {
	return arg.toString();
}

String.prototype.len = function(arg) {
	return arg.length
}
/*
function INSTR(str,substring) {
	return str.indexOf(substring)+1;
}
*/
String.prototype.find = function(argStr,argStart) {
	// NOT WORKING YET FOR '' AND MULTIPLE CHARACTERS. 
	// I NEED TO EMULATE CF FIND.
	if (!argStart)	return this.indexOf(argStr)+1
	return this.indexOf(argStr,argStart-1)+1
}

String.prototype.findnocase = function(argStr,argStart) {
	return this.toUpperCase().find(argStr.toUpperCase(),argstart)
}

String.prototype.int = function() {
	var i = parseInt(this,10)
	if (isNaN(i)) return 0
	return i
}

String.prototype.val = function() {
	var f = parseFloat(this)
	if (isNaN(f)) return 0
	return f
}

String.prototype.left = function(n) {
	return this.substr(0,n)
}

String.prototype.right = function(argLength) {
	if (argLength <= 0) return ''
	if (argLength >= this.length) return this
	return this.substring(this.length-argLength)
}


String.prototype.chr = function() { // '32'.chr()
	return String.fromCharCode(this)
}


String.prototype.ascii = function() {
	return this.charCodeAt(0)
}

/*
var CHR = function(X) { // http://jalaj.net/2007/03/08/asc-and-chr-in-javascript/
	return String.fromCharCode(X)
}
var ASC = function(X) { // http://jalaj.net/2007/03/08/asc-and-chr-in-javascript/
	return X.charCodeAt(0);
}

function stringToBoolean(X) {
	switch(X.toLowerCase()){
		case 'true': case 'yes': case '1': return true;
		case 'false': case 'no': case '0': case null: return false;
		default: return Boolean(X);
	}
}

function LTRIM(str) {
	var whitespace = new String(" \t\n\r");
	var s = new String(str);
	if (whitespace.indexOf(s.charAt(0)) != -1) {
		var j=0, i = s.length;
		while (j < i && whitespace.indexOf(s.charAt(j)) != -1) {
			j++;
		}
		s = s.substring(j, i);
	}
	return s;
}

function RTRIM(str) {
	var whitespace = new String(" \t\n\r");
	var s = new String(str);
	if (whitespace.indexOf(s.charAt(s.length-1)) != -1) {
		var i = s.length - 1;
		while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1) {
			i--;
		}
		s = s.substring(0, i+1);
	}
	return s;
}

function TRIM(str) {
	return RTRIM(LTRIM(str));
}

function Extension(filename){
	return UCASE(filename.split('.').pop());
}
*/
