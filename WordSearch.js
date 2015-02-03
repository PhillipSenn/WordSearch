dom.AnswerNames = $('#AnswerNames')
dom.MaxCols = $('#MaxCols')
dom.MaxRows = $('#MaxRows')
dom.Board = $('#Board')

;(function() {
	var Variables = {}
	Variables.Attempts = 0
	SolvePuzzle()
	
	function SolvePuzzle() {
		var local = {}
		dom.Board.find('td').removeClass('label-primary label-warning').text('_')
		arr = dom.AnswerNames.text().split(',')
		Variables.AnswerNamesCount = arr.length // Used to determine if we're done
		for (var i=0; i<arr.length; i++) {
			local.response = SolveWord(arr[i],i)
			if (local.response) {
			} else {
				Variables.Attempts += 1
				if (Variables.Attempts < 30) { // Try x times
					setTimeout(SolvePuzzle,500) // after x delay
				} else {
					alert("I couldn't create a puzzle.")
					dom.msg.text("I couldn't create a puzzle.  Press refresh to try again.").addClass('label-danger')
				}
				return
			}
		}
	}
	
	function SolveWord(argWord,argCounter) {
		var local = {}

		$('.label-warning').removeClass('label-warning').text('_')
		for (var i=0; i<100; i++) { // Try x times to place this word
			do {
				local.Word = argWord
				if (RandRange(0,1)) {
					local.Word = argWord.split('').reverse().join('')
				}
				local.rowDir = RandRange(0,1)
				if (local.rowDir) { // The row is going down (and the word may be reversed)
					local.colDir = RandRange(-1,1) // the column is free to change or it can stay the same, either way is fine.
					local.row = RandRange(0,dom.MaxRows.text() - local.Word.length)
				} else { // The row is not changing, so
					local.colDir = 1 // the column must change
					local.row = RandRange(1,dom.MaxRows.text())-1
				}
				if (local.colDir === 1) {
					local.col = RandRange(0,dom.MaxCols.text() - local.Word.length)
				} else if (local.colDir === -1) {
					local.col = RandRange(local.Word.length,dom.MaxCols.text())-1
				} else {
					// The column's not changing
					local.col = RandRange(1,dom.MaxCols.text())-1
				}
				local.td = dom.Board
					.find('tr:eq(' + local.row + ')')
					.find('td:eq(' + local.col + ')')
				if (local.td.text() == '_') break
				if (local.td.hasClass('label-warning')) break
				if (local.td.text() == local.Word.substr(0,1)) break
			} while(true)
			
			for (var c = 0; c<local.Word.length; c++) { // c=character's index
				local.letter = local.Word.substr(c,1)
				local.td = dom.Board
					.find('tr:eq(' + (local.row + local.rowDir * c) + ')')
					.find('td:eq(' + (local.col + local.colDir * c) + ')')
				if (local.td.hasClass('label-warning')) { // label-warning means it's still open
					local.td.text(local.letter) // This is just so you can watch it
				} else if (local.td.text() === local.letter) { // collision, don't add label-warning
				} else if (local.td.text() == '_') { // empty
					local.td.addClass('label-warning').text(local.letter)
				} else {
					break // bonk.wav
				}
			}
			if (c == local.Word.length) {
				for (var c = 0; c<local.Word.length; c++) {
					local.td = dom.Board
						.find('tr:eq(' + (local.row + local.rowDir * c) + ')')
						.find('td:eq(' + (local.col + local.colDir * c) + ')')
						.removeClass('label-warning')
						.addClass('label-primary')
				}
				if (argCounter == (Variables.AnswerNamesCount-1)) {
					dom.Board.find('td.label-warning').text('_').removeClass('label-warning') // 05/18
					dom.Board.find('td').not('label-primary').each(Cleanup)
					dom.Board.find('.label-primary').removeClass('label-primary')
					
				}
				return true // We were able to place the word! Yay!
			}
		}
		return false
	}
	function Cleanup() {
		var local = {}
		if ($(this).text() == '_') {
			local.R = fw.int(Math.random() * 26) + 65
			$(this).text(String.fromCharCode(local.R))
			// $(this).html('&nbsp;') // Phillip!  Remove this line!
		}
	}
	function RandRange(min, max) { // http://stackoverflow.com/questions/1527803/generating-random-numbers-in-javascript-in-a-specific-range
		 return Math.floor(Math.random() * (max - min + 1)) + min;
	}
})()










dom.MaxCols = $('#MaxCols')
dom.MaxRows = $('#MaxRows')

;(function() {
	var Variables ={}
	Variables.col = -1
	Variables.row = -1
	Variables.MouseDown = false
	Variables.Earned = 0
	Variables.Remainder = $('#Remainder').text() /* todo: calculate */
	Variables.Remainder = fw.int(Variables.Remainder)
	Variables.Points = $('#Points').text()
	Variables.Points = fw.int(Variables.Points)
	
	$('#Board').on('mousedown','td',tdmousedown)
	$('#Board').on('mouseup','td',tdmouseup)
	$('#Board').on('mousemove','td',tdmousemove)
	function tdmousedown(myEvent) {
		$('.label-info').removeClass('label-info')
		$(this).removeClass('label-success').addClass('label-primary')
		Variables.col = $(this).index()
		Variables.row = $(this).parent().index()
		Variables.StartingCol = Variables.col
		Variables.StartingRow = Variables.row
		Variables.MouseDown = true
		dom.msg.empty().removeClass('label-danger label-info')
	}
	function tdmouseup(myEvent) {
		var local = {}
		Variables.col = -1
		Variables.row = -1
		Variables.MouseDown = false
		Variables.Forwards = ''
		for (local.row = 0; local.row < dom.MaxCols.text(); local.row++) {
			local.tr = $('#Board').find('tr:eq(' + local.row + ')')
			for (local.col = 0; local.col < dom.MaxRows.text(); local.col++) {
				local.td = $(local.tr).find('td:eq(' + local.col + ')')
				if (local.td.hasClass('label-primary')) {
					Variables.Forwards += local.td.text().trim()
				}
			}
		}
		Variables.Backwards = Variables.Forwards.split('').reverse().join('')
		$('#VerticalWords li').each(EachWord)
		$('td.label-primary').removeClass('label-primary')
	}
	function EachWord(index, element) {
		var local = {}
		local.Word = $(this).text().toUpperCase()
		if (local.Word === Variables.Forwards) {
			correct(element)
		} else if (local.Word === Variables.Backwards) {
			correct(element)
		} else {
		}
	}
	function correct(argElement) {
		var local = {}

		$('td.label-primary').addClass('label-success')
		local.type = 'POST'
		local.url = 'WordSearch.Save.cfm'
		local.context = argElement
		local.dataType = 'text' // json
		local.data = {}
		local.data.GuessID = $(argElement).data('guessid')
		local.Promise = $.ajax(local)
		local.Promise.done(done)
		local.Promise.fail(fail)
	}

	function done(response) {
		response = parseInt(response,10)
		$(this).addClass('label-success')
		$('.progress-bar').css({width: response + '%'})
		$('.progress-bar').parent().addClass('active progress-striped')
		if (response >= 100) {
			$('.label-success').removeClass('label-success').addClass('btn-primary')
			setTimeout(Finished,1000)
		} else {
			setTimeout(RemoveActive,900)
		}
	}
	function Finished() {
		window.location = '../Fireworks'
	}
	function RemoveActive() {
		$('.progress-bar').parent().removeClass('active progress-striped')
	}

	function tdmousemove(myEvent) {
		var local = {}
		if (Variables.MouseDown) {
			local.col = $(this).index() // This is the column they are currently highlighting
			local.row = $(this).parent().index() // This is the row they are currently highlighting
			if (local.row !== Variables.row || local.col !== Variables.col) {
				Variables.col = local.col
				Variables.row = local.row
				$('.label-primary').removeClass('label-primary')
				if (local.row === Variables.StartingRow 
				 || local.col === Variables.StartingCol
				) { // or diagonal!
					for (local.r = Math.min(Variables.StartingRow,local.row); local.r <= Math.max(Variables.StartingRow,local.row); local.r++) {
						local.tr = $('table').find('tr:eq(' + local.r + ')')
						for (local.c = Math.min(Variables.StartingCol,local.col); local.c <= Math.max(Variables.StartingCol,local.col); local.c++) {
							local.td = $(local.tr).find('td:eq(' + local.c + ')')
							$(local.td).removeClass('label-success').addClass('label-primary')
						}
					}
				} else if (Math.abs(local.row-Variables.StartingRow) === Math.abs(local.col-Variables.StartingCol)) { // Diagonal
					local.c = Variables.StartingCol
					local.r = Variables.StartingRow
					for (var i=Math.min(Variables.StartingRow,local.row); i <= Math.max(Variables.StartingRow,local.row); i++) {
						local.tr = $('table').find('tr:eq(' + local.r + ')')
						local.td = $(local.tr).find('td:eq(' + local.c + ')')
						$(local.td).removeClass('label-success').addClass('label-primary')
						if (local.row > Variables.StartingRow) {
							local.r += 1
						} else {
							local.r -= 1
						}
						if (local.col > Variables.StartingCol) {
							local.c += 1
						} else {
							local.c -= 1
						}
					}
				}
			}
		}
	}
})()


;(function() {
	$('#letters').on('mousedown','.btn',btnMouseDown)
	function btnMouseDown() {
		var Variables = {}
		Variables.text = $(this).text()
		Variables.text = $.trim(Variables.text)
		$('#Board td').each(function(index, element) {
			if ($.trim($(this).text()) === Variables.text) {
				$(this).addClass('label-info')
			}
		})
		$('#wordList li').each(function(index, element) {
			var local = {}
			local.text = $.trim($(this).text())
			// local.text = local.text.toUpperCase()
			local.str = ''
			for (var i=0; i< local.text.length; i++) {
				if (local.text.substr(i,1).toUpperCase() === Variables.text) {
					local.str += '<span class="label-info">' + local.text.substr(i,1) + '</span>'
				} else {
					local.str += local.text.substr(i,1)
				}
			}
			$(this).html(local.str)
		})
	}
	key('A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,0,1,2,3,4,5,6,7,8,9',myKeyMaster)
	function myKeyMaster(myEvent, handler) {
		LetterChosen(handler.key)
	}
	function LetterChosen(argLetter) {
		$('#Board td').each(function(index, element) {
			if ($.trim($(this).text()) === argLetter) {
				$(this).addClass('label-info')
				// setTimeout(btnMouseUp,1000)
			}
		})
		$('#wordList li').each(function(index, element) {
			var local = {}
			local.text = $.trim($(this).text())
			local.text = local.text.toUpperCase()
			local.str = ''
			for (var i=0; i< local.text.length; i++) {
				if (local.text.substr(i,1) === argLetter) {
					local.str += '<span class="label-info">' + argLetter + '</span>'
				} else {
					local.str += local.text.substr(i,1)
				}
			}
			$(this).html(local.str)
		})
	}
})()

