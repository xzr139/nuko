'use strict'

app.factory "Activity", ['$resource', ($resource) ->
  $resource("/activities/:id ", { id: "@id" }, { update:  { method: 'PATCH' } } )
]
