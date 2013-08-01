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
        sum = getSumByDates @start, @end
        @days = sum.days
        @months = sum.months
        @years = sum.years
        @totalDays = getTotalDaysByDates @start, @end
        @totalMonths = getTotalMonthsByDates @start, @end
        @totalYears = getTotalYearsByDates @start, @end


    getTotalDaysByDates =(startDate, endDate) ->
      startTime = startDate.getTime()
      endTime = endDate.getTime()
      parseInt (endTime-startTime)/(24*3600*1000)

    getTotalMonthsByDates =(startDate, endDate) ->
      startYear = startDate.getFullYear()
      endYear = endDate.getFullYear()
      startMonth = startDate.getMonth()
      endMonth = endDate.getMonth()
      (endMonth+12*endYear)-(startMonth+12*startYear)

    getTotalYearsByDates =(startDate, endDate) ->
      startYear = startDate.getFullYear()
      endYear = endDate.getFullYear()
      endYear-startYear


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
