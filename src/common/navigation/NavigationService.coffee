angular.module('hoay.services', [])

.factory 'navigationService', ['$navigate',($navigate) ->
  goto = (path,type) ->
    $navigate.go(path,type)
  back = ->
    $navigate.back()


  {
    goto
    back
  }
]

