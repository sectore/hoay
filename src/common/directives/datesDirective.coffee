'use strict'

# module definition
# ------------------------------------------------------------
angular.module('hoay.directives.dates', [])

.directive 'counter', [
  '$log'
  '$timeout'
  ($log, $timeout) ->
    restrict: 'A'
    scope: true
    link: (scope, element, attrs)->

      recount = attrs.counterRestart or false
      max = scope.$eval(attrs.counterMax)

      scope.$watch max, (value)->
        if max isnt undefined
          restart()

      scope.$watch recount, (value)->
        if !!recount
          restart()

      restart = ->
        $timeout animate, 200

      tweenable = new Tweenable()
      animate = ->
#        $log.info "animate #{scope.$eval(attrs.max)}"
        updateElement 0
        tweenable.tween
          from:
            x: 0
          to:
            x: max
          duration: 500
          easing: 'easeOutQuad'
          step:(value)->
            updateElement value.x
          callback:(value)->
            updateElement value.x

      updateElement = (value)->
        $(element)[0].text parseInt(value)

]
