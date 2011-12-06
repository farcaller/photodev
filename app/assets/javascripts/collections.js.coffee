jQuery ->
	$("#manage").click (e) ->
		e.preventDefault()
		$(this).hide()
		$("#edit-modes").show()
	
	$("#manage-done").click (e) ->
		e.preventDefault()
		$("#edit-modes").hide()
		$("#manage").show()
	
