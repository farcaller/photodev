//= require photo_ops

class SortableOps
  constructor: ->
    
  enableSorting: =>
    $("#photos").sortable
      update: @updateOrder
    $("#photos").sortable 'option', 'disabled', false
  disableSorting: =>
    $("#photos").sortable 'option', 'disabled', true
  updateOrder: (evt, ui) =>
    item = $(ui.item)
    dstIndex = item.index()
    ++dstIndex
    @postRequest item.find('a').attr('href')+'.json', 'PUT'
      position: dstIndex
  postRequest: (url, type, data) =>
    @disableSorting()
    $.ajax
      dataType: 'json'
      type: type
      url: url
      data: if data then data else ''
      complete: =>
        @enableSorting()
      success: (data, textStatus, jqXHR) =>
        $("#photos").replaceWith(Mustache.to_html($("#photo_template").html(), data))
        photoOps.enableSelection()

photoOps = new PhotoOps("#selection-info")
sortableOps = new SortableOps()

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
    $("#operations").show()
    
    photoOps.enableSelection()
    sortableOps.enableSorting()
  
  $("#manage-done").click (e) ->
    e.preventDefault()
    $("#edit-modes").hide()
    $("#manage").show()
    $("#operations").hide()
  
    photoOps.disableSelection()
    sortableOps.disableSorting()
  
  $("#remove-photos").unbind("click").click removePhotosFromCollection