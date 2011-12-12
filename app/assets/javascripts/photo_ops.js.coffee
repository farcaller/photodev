class PhotoOps
  constructor: (@selectionInfoSelector) ->
    
  enableSelection: =>
    $("#photos .photo").unbind("click").click @toggleSelectPhoto
  
  disableSelection: =>
    $("#photos .photo").unbind("click").removeClass "selected"
    @updateSelectionCount()
  
  toggleSelectPhoto: (e) =>
    e.preventDefault()
    target = $(e.currentTarget)
    selected = $(target).hasClass "selected"
    $(target).toggleClass "selected", !selected
    @updateSelectionCount()
  
  updateSelectionCount: =>
    if @selectionInfoSelector
      count = $("#photos .selected").length
      selectionInfo = $(@selectionInfoSelector)
      switch count
        when 0 then selectionInfo.text ""
        when 1 then selectionInfo.text count + " photo selected"
        else selectionInfo.text count + " photos selected"
  
@PhotoOps = PhotoOps