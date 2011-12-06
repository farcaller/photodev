updateSelectionCount = ->
	count = $("#photos .selected").length
	selectionInfo = $("#selection-info")
	switch count
		when 0 then selectionInfo.text ""
		when 1 then selectionInfo.text count + " photo selected"
		else selectionInfo.text count + " photos selected"

toggleSelectPhoto = (e) ->
			e.preventDefault()
			selected = $(this).hasClass "selected"
			$(this).toggleClass "selected", !selected
			updateSelectionCount()

removePhotosFromCollection = (e) ->
	e.preventDefault()
	selected_items = $('#photos .selected').map ->
		$(this).data('id')
	$.post $(this).data('remove_photos_path'), {photo_ids: selected_items.get()}, (data) ->
		console.log(data)

jQuery ->
	$("#manage").click (e) ->
		e.preventDefault()
		$(this).hide()
		$("#edit-modes").show()
		
		$("#photos .photo").unbind("click").click toggleSelectPhoto
	
	$("#manage-done").click (e) ->
		e.preventDefault()
		$("#edit-modes").hide()
		$("#manage").show()
	
		$("#photos .photo").unbind("click").removeClass "selected"
	
	$("#remove-photos").unbind("click").click removePhotosFromCollection