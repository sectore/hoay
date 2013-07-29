'use strict'

# module definition
# ------------------------------------------------------------
angular.module('hoay.directives.charts', [])

.directive 'barchart', [
  '$log',
  ($log) ->
    restrict: 'E'
    replace: false
    template: '''
      <svg class="chart" xmlns="http://www.w3.org/2000/svg" version="1.1">
        <rect class="bg" width="100%" height="100%"/>
        <rect class="bar-single" />
      </svg>
      '''
    link: (scope, element, attrs)->
      # Important note:
      # Attributes of SVG has to be set "by hand" (not by using {{}}) to avoid JS errors
      # @see: https://github.com/angular/angular.js/issues/1050

      # get bar using Zepto
      bar = $(element[0]).find ".bar-single"
      bar.addClass "bar-#{attrs.ngType}"

      scope.$watch attrs.ngPercentX, (value)->
        unless value is undefined
          bar.attr "x", "#{value}%"

      scope.$watch attrs.ngPercentWidth, (value)->
        unless value is undefined
          bar.attr "width", "#{value}%"

#      scope.$watch attrs.ngPercentHeight, (value)->
#        $log.info "watching ngPercentHeight #{value}"

      updateHeight = (value)->
        unless value is undefined
          bar.attr "height", "#{value}%"
          bar.attr "y", "#{100-value}%"


      myTweenable = new Tweenable()
      animate = ->
#        $log.info "animate #{attrs.ngPercentWidth}"
        myTweenable.tween
          from:
            x: 0
          to:
            x: attrs.ngPercentWidth
          duration: 500
          easing: 'easeOutQuad'
          step:(value)->
            updateHeight value.x
          callback:(value)->
            updateHeight value.x

      updateHeight 0
      animate()

]
