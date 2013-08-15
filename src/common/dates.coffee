angular.module('hoay.dates', [
  'ngStorage'
  'jm.i18next'
])

#  models
# ------------------------------------------------------------
#  DateModel to store date data
#  It is acting as a domain model
#  to share date beetween controllers
#  It provides some helper methods
.service('DateModel', [
  '$log',
  '$localStorage'
  'HOAY.CONSTANTS'
  ($log, $localStorage, hoayConstants) ->

    @setStart = (date)->
      @start = date
      $localStorage.startDate = @start
      @updateDifferences()

    @setEnd = (date)->
      @end = date
      $localStorage.endDate = @end
      @updateDifferences()

    @updateDifferences = ->
      if @start isnt undefined and @end isnt undefined
        sum = getSumByDates @start, @end
        @days = sum.days
        @months = sum.months
        @years = sum.years
        @totalDays = getTotalDaysByDates @start, @end
        @totalMonths = getTotalMonthsByDates @start, @end
        @totalYears = getTotalYearsByDates @start, @end

    getTotalDaysByDates =(startDate, endDate) ->
      startMoment = moment startDate
      endMoment = moment endDate
      endMoment.diff startMoment, 'days'

    getTotalMonthsByDates =(startDate, endDate) ->
      startMoment = moment startDate
      endMoment = moment endDate
      endMoment.diff startMoment, 'months'

    getTotalYearsByDates =(startDate, endDate) ->
      startMoment = moment startDate
      endMoment = moment endDate
      endMoment.diff startMoment, 'years'

    getSumByDates = (startDate, endDate) ->
      # Based on
      # "Counting from a date to today"
      # http://stackoverflow.com/a/11231806
      days = endDate.getDate() - startDate.getDate()
      months = endDate.getMonth() - startDate.getMonth()
      years = endDate.getFullYear() - startDate.getFullYear()

      if days < 0
        months -= 1
        lastMonthNumber = endDate.getMonth() - 1
        if lastMonthNumber < 0
          lastMonthNumber += 12
        daysInLastMonth = new Date(endDate.getFullYear(), lastMonthNumber, 0).getDate()
        days += daysInLastMonth

      if months < 0
        years -= 1
        months += 12

      if years < 0
        years = 0

      {
        days
        months
        years
      }

    init = =>
      startStored = $localStorage.startDate
      endStored = $localStorage.endDate
      @start = if startStored then new Date(startStored) else hoayConstants.START_DATE_DEFAULT
      @end = if endStored then new Date(endStored) else hoayConstants.END_DATE_DEFAULT
      @updateDifferences()

    init()

])

#  filters
# ------------------------------------------------------------
#  Custom filter to format Date
#  using pattern defined in locales
#  Locales are handled by
#  angular-translate ($translate)
.filter('translatedate', [
  '$filter',
  '$i18next',
  ($filter, $i18next)->
    (data)->
      format = $i18next 'common.FORMAT_DATE_SHORT'
      result = $filter('date')(data, format)
      result
])

# directives
# ------------------------------------------------------------
.directive 'counter', [
  '$log'
  '$timeout'
  ($log, $timeout) ->
    restrict: 'A'
    scope: true
    link: (scope, element, attrs)->

      recount = attrs.counterRestart or false
      max = scope.$eval(attrs.counterMax)
      timeoutPromise = null

      scope.$watch max, (value)->
        if max isnt undefined
          restart()

      scope.$watch recount, (value)->
        if !!recount
          restart()

      restart = ->
        timeoutPromise = $timeout animate, 200

      tweenable = new Tweenable()
      animate = ->
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

      element.bind '$destroy', ->
        # cancel timeout
        $timeout.cancel timeoutPromise
        # cancel tween
        tweenable.stop()


]
