'use strict'
angular.module('hoay.dates', [])

#  models
# ------------------------------------------------------------
#  DateModel to store date data
#  It is acting as a domain model
#  to share date beetween controllers
#  It provides some helper methods
.service('DateModel', [
  '$log',
  ($log) ->

    @setStart = (date)->
      @start = date
      @updateDifferences()

    @setEnd = (date)->
      @end = date
      @updateDifferences()

    @updateDifferences = ->
      if @start isnt undefined or @end isnt undefined
        startMoment = moment @start
        endMoment = moment @end
        @days = endMoment.diff startMoment, 'days', true
        @months = endMoment.diff startMoment, 'months', true
        @years = endMoment.diff startMoment, 'years', true
])

#  filters
# ------------------------------------------------------------
#  Custom filter to format Date
#  using pattern defined in locales
#  Locales are handled by
#  angular-translate ($translate)
.filter('shortdate', [
  '$filter',
  '$translate',
  ($filter, $translate)->
    (data)->
      format = $translate 'common.FORMAT_DATE_SHORT'
      result = $filter('date')(data, format)
      result
])
