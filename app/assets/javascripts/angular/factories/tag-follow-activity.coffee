'use strict'

app.factory "TagFollowActivity", ['$resource', ($resource) ->
  $resource("/tags/:target_id/follow", { target_id: "@target_id" }, { update: { method: 'PATCH' } } )
]
