'use strict'

app.factory "Like", ['$resource', ($resource) ->
  $resource("/comments/:id/like", { id: "@id" }, { update: { method: 'PATCH' } } )
]
