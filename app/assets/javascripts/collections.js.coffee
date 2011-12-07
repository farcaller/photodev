photoOps = new PhotoOps("#selection-info")

removePhotosFromCollection = (e) ->
	e.preventDefault()
	selected_items = $('#photos .selected').map ->
		$(this).data('id')
	$.post $(this).data('remove_photos_path'), {photo_ids: selected_items.get()}, (data) ->
		$("#photos").replaceWith(Mustache.to_html($("#photo_template").html(), data))
		photoOps.enableSelection()

jQuery ->
	$("#manage").click (e) ->
		e.preventDefault()
		$(this).hide()
		$("#edit-modes").show()
		
		photoOps.enableSelection()
	
	$("#manage-done").click (e) ->
		e.preventDefault()
		$("#edit-modes").hide()
		$("#manage").show()
	
		photoOps.disableSelection()
	
	$("#remove-photos").unbind("click").click removePhotosFromCollection