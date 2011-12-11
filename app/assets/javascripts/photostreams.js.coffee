photoOps = new PhotoOps("#selection-info")

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
		photoOps.enableSelection()
	
	$("#manage-done").click (e) ->
		e.preventDefault()
		$(this).hide()
		$("#manage").show()
		
		photoOps.disableSelection()
		$("#collections").html("")
	
