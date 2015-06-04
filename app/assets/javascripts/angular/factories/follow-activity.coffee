'use strict'

app.factory "FollowActivity", ['$resource', ($resource) ->
  $resource("/followers", { user_id: "@user_id" }, { update: { method: 'PATCH' } } )
]
