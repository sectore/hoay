'use strict'
angular.module('hoay.dates', [
  'ngCookies'
  'pascalprecht.translate'
])

#  models
# ------------------------------------------------------------
#  DateModel to store date data
#  It is acting as a domain model
#  to share date beetween controllers
#  It provides some helper methods
.service('DateModel', [
  '$log',
  '$cookies'
  ($log, $cookies) ->

    @setStart = (date)->
      @start = date
      $cookies.startDate = @start
      @updateDifferences()

    @setEnd = (date)->
      @end = date
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
      # init default values
      if $cookies.startDate is undefined
        @setStart new Date(1971, 9, 10)

      @setEnd new Date()

    init()


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
