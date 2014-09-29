$ ->
  $(".block.activity").click ->
    activityId = $(this).attr('data-activity-id')
    current = this

    $.ajax
      url: "/activities/" + activityId
      type: "PATCH"
      complete: (data) ->
        $(current).removeClass("unread")
