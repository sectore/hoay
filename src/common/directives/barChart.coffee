'use strict'

# module definition
# ------------------------------------------------------------
angular.module('hoay.directives.charts', [])

.directive 'barchart', [
  '$log',
  '$timeout'
  ($log, $timeout) ->
    restrict: 'E'
    replace: true
    template: '''
      <div class="chart">
        <div class="bar-single" />
      </div>
      '''
    link: (scope, element, attrs)->
      # get bar using Zepto
      bar = $(element[0]).find ".bar-single"
      bar.addClass "bar-#{attrs.ngType}"

      scope.$watch attrs.ngPercentX, (value)->
        unless value is undefined
          bar.css "left", "#{value}%"

      scope.$watch attrs.ngPercentWidth, (value)->
        unless value is undefined
          bar.css "width", "#{value}%"

      scope.$watch attrs.ngPercentHeight, (value)->
        unless value is undefined
          # setting default values
          t = "translate(0,100%) scaleY(0)"
          bar.css getTransform(t)
          # just grabing any css value,
          # which delays starting animate()
          # to avoid layout issues setting default values before
          temp = bar.css "height"
#          $timeout animate, 1
          animate()

      animate = ->
        value = attrs.ngPercentHeight
        t = "translate(0, #{(100-value)/2}%) scaleY(#{value/100})"
        bar.css getTransform(t)


      getTransform = (value)->
        'transform': value
        '-moz-transform': value
        '-webkit-transform': value
        '-ms-transform': value
        '-o-transform': value

]
