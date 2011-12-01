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

updateCollectionsList = ->
	$.getJSON "/collections.json", (data) ->
		items = []
		
		$.each data, (key, val) ->
			items.push('<a data-append_photos_path="/collections/' + val.id + '/append_photos.json" data-id="' + val.id + '" class="btn collection-btn" style="display: block;" href="#" title="' +
				val.title + '" id="collection_' + val.id + '">' + val.title + '</a>')

		$("#collections").html(items.join(''))
		$(".collection-btn").click(addPhotosToCollection)

addPhotosToCollection = (e) ->
	e.preventDefault()
	selected_items = $('#photos .selected').map ->
		$(this).data('id')
	$.post $(this).data('append_photos_path'), {photo_ids: selected_items.get()}, (data) ->
				

jQuery ->
	$("#manage").click (e) ->
		e.preventDefault()
		$(this).hide()
		$("#manage-done").show()

		updateCollectionsList()
		$("#photos .photo").unbind("click").click toggleSelectPhoto
	
	$("#manage-done").click (e) ->
		e.preventDefault()
		$(this).hide()
		$("#manage").show()
		
		$("#photos .photo").unbind("click").removeClass "selected"
		updateSelectionCount()
		$("#collections").html("")
	
