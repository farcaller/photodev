Managing = false

jQuery ->
	$('#manage').click ->
		Managing = !Managing
		$(this).text if Managing then "Done" else "Manage Photos"
		$(this).toggleClass "primary", Managing
		
		if Managing
			$('#photos .photo').unbind("click").click (e)->
				e.preventDefault()
				selected = $(this).hasClass "selected"
				$(this).toggleClass "selected", !selected
		else
			$('#photos .photo').unbind("click").removeClass("selected")
			