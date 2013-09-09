# module definition
# ------------------------------------------------------------
angular.module('hoay.calculate', [
  'ajoslin.mobile-navigate'
  'ngRoute'
  'jm.i18next'
  'hoay.dates'
])

# config
# ------------------------------------------------------------
.config([
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
      .when '/',
        controller: 'calculateController',
        templateUrl: 'calculate/calculate.tpl.html'
])

# controller
# ------------------------------------------------------------
.controller 'calculateController',[
  '$window',
  '$scope',
  '$navigate',
  '$log',
  '$i18next',
  'DateModel'
  ($window, $scope, $navigate, $log, $i18next, dateModel)->

    init = ->
      $scope.dateModel = dateModel

    # navigation
    # ------------------------------------------------------------

    $scope.showResult = ->
      $navigate.go '/result'

    $scope.showSettings = ->
      $navigate.go '/settings', 'modal'

    $scope.showInfo = ->
      $navigate.go '/info', 'modal'

    # date handling
    # ------------------------------------------------------------

    $scope.changeStartDate = (event)->
      date = $scope.dateModel.start
      if $window.cordova
        maxMoment = moment($scope.dateModel.end).subtract 'days', 1
        maxDate = new Date maxMoment
        options =
          date: date
          maxDate: maxDate
          mode: 'date'
          doneButtonLabel: $i18next 'common.DONE'
          cancelButtonLabel: $i18next 'common.CANCEL'
          x: event.changedTouches[0].pageX
          y: event.changedTouches[0].pageY

        datePicker.show options, changeStartDateHandler
      else
        #TODO: Add date picker for web

    changeStartDateHandler = (date) ->
      $scope.$apply( ->
        $scope.dateModel.setStart date
      )

    $scope.changeEndDate = (event) ->
      date = $scope.dateModel.end
      if $window.cordova
        minMoment = moment($scope.dateModel.start).add 'days', 1
        minDate = new Date minMoment
        options =
          date: date
          allowOldDates: false
          minDate: minDate
          mode: 'date'
          doneButtonLabel: $i18next 'common.DONE'
          cancelButtonLabel: $i18next 'common.CANCEL'
          x: event.changedTouches[0].pageX
          y: event.changedTouches[0].pageY

        datePicker.show options, changeEndDateHandler
      else
        #TODO: Add date picker for web

    changeEndDateHandler = (date) ->
      $scope.$apply( ->
        $scope.dateModel.setEnd date
      )


    init()
]


