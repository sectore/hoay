'use strict'

# module definition
# ------------------------------------------------------------
angular.module('hoay.directives.charts', [])

.directive 'barchart', [
  '$log',
  ($log) ->
    restrict: 'E'
    replace: true
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
      bar.attr "x", attrs.ngX
      bar.attr "width", attrs.ngWidth
      bar.attr "height", attrs.ngHeight

]
