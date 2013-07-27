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
        @days = endMoment.diff startMoment, 'days'
        @months = endMoment.diff startMoment, 'months'
        @years = endMoment.diff startMoment, 'years'
        # percent values relative to all days
        @percentYears = 100
        # 100/12 = x/8
        @percentMonths = Math.round(100 * @months / 12)
        @percentDays = Math.round(100 * @days / 30)
        $log.info "@percentDays #{@percentDays}"
        $log.info "@percentMonths #{@percentMonths}"
        $log.info "@percentYears #{@percentYears}"
        # days = 100%
        # months / 30 = monthsDays
        # 100*monthsDays/days/ = monthsPercent
        # years / 356 = yearsDays
        # 100*yearsDays/days/ = yearsPercent
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
