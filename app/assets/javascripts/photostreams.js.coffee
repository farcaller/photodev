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
			items.push('<a class="btn" style="display: block;" href="#" title="' + val.title + '" id="collection_' + val.id + '">' + val.title + '</a>')

		$("#collections").html(items.join(''))

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
	
