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
      if @start isnt undefined and @end isnt undefined
        # Based on
        # "Counting from a date to today"
        # http://stackoverflow.com/a/11231806
        days = @end.getDate() - @start.getDate()
        months = @end.getMonth() - @start.getMonth()
        years = @end.getFullYear() - @start.getFullYear()
        $log.info "before.days #{days}"
        $log.info "before.months #{months}"
        $log.info "before.years #{years}"

        if days < 0
          months -= 1
          lastMonthNumber = @end.getMonth() - 1
          if lastMonthNumber < 0
            lastMonthNumber += 12
          daysInLastMonth = new Date(@end.getFullYear(), lastMonthNumber, 0).getDate()
          days += daysInLastMonth

        if months < 0
          years -= 1
          months += 12

        if years < 0
          years = 0

#        diff = new Date( 2012, 0, 1 ).diff( new Date( 2010, 9, 8, 7, 6, 5, 4 ))
        $log.info "diff.days #{days}"
        @days = days
        $log.info "diff.months #{months}"
        @months = months
        $log.info "diff.years #{years}"
        @years = years
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
