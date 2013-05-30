$(".file.<%= dom_id(@slide) %>").fadeOut 'slow', ->
  $(this).remove()