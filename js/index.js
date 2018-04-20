algo = 'kmp'

function dynamicText() {
	$('.media-text').each((index, item) => {
		let ln = $.trim($(item).text()).length

		if (ln < 40) {
			$(item).css('font-size','35px')
		} else if (ln < 80) {
			$(item).css('font-size','20px')
		}
	})
}

function highlight(text, index) {
	let newText = ''
	let ih = 0;
	for (let i=0; i<text.length; i++) {
		if (ih < index.length && i == index[ih].start) {
			newText += '<span class=\'highlight\'>'
		}
		newText += text[i]
		if (ih < index.length && i == index[ih].stop) {
			ih++
			newText += '</span>'
		}
	}
	return newText
}

function renderResult(data) {
	$('#result').html('')
	if (data.result.length > 0) {
		data.result.forEach((item, index) => {
			let text = ''
			text += '<a href=\'' + item.link + '\'>\n'
			text += '  <div class=\'media\'>\n'
			text += '     <div class=\'media-image\'>\n'
			text += '       <img src=\'' + item.profpic + '\'>\n'
			text += '     </div>\n'
			text += '     <div class=\'media-content\'>\n'
			text += '       <div class=\'media-title\'>\n'
			text += '         ' + item.name + '\n'
			text += '       </div>\n'
			text += '       <div class=\'media-text\'>\n'
			text += '         ' + highlight(item.tweet, item.index) + '\n'
			text += '       </div>\n'
			text += '     </div>\n'
			text += '  </div>\n'
			text += '</a>'
			$('#result').append(text)
		})
		dynamicText()
	} else {
		$('#result').html('Tidak ada hasil pencarian.')
	}
}

function search() {
	let url = './search.jsp'

	if ($('#keyword').val().length == 0) {
		$('#keyword').addClass('error')
	} else {
		$.ajax(url, {
			method: 'POST',
			data: {
				algo: algo,
				keyword: $('#keyword').val()
			},
			success: (data, status) => {
				renderResult(data)
			}
		})
	}
}

function trigger() {
	$('.search').on('click', (event) => {
		let newAlgo = $(event.currentTarget).attr('id')
		algo = newAlgo
		updateAlgo()
		search()
	})
	$('#keyword').on('keyup', (event) => {
		$(event.currentTarget).removeClass('error')
		search()
	})
}

function updateAlgo() {
	if (algo == 'kmp') { $('.search#kmp').addClass('active') }
	else { $('.search#kmp').removeClass('active') }

	if (algo == 'boyer') { $('.search#boyer').addClass('active') }
	else { $('.search#boyer').removeClass('active') }

	if (algo == 'regex') { $('.search#regex').addClass('active') }
	else { $('.search#regex').removeClass('active') }
}

$(document).ready(() => {
	dynamicText()
	trigger()
	updateAlgo()
})
