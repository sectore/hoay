# module definition
# ------------------------------------------------------------
angular.module('hoay.calculate', [
  'jm.i18next'
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
  '$scope',
  '$navigate',
  '$log',
  '$i18next',
  'DateModel'
  ($scope, $navigate, $log, $i18next, dateModel)->

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

    $scope.changeStartDate = ->
      options =
        date: $scope.dateModel.start
        mode: 'date'

      datePicker.show options, changeStartDateHandler

    changeStartDateHandler = (date) ->
      # TODO: check selected date
      $scope.$apply( ->
        $scope.dateModel.setStart date
      )

    $scope.changeEndDate = ->
      options =
        date: $scope.dateModel.end
        mode: 'date'

      datePicker.show options, changeEndDateHandler

    changeEndDateHandler = (date) ->
      # TODO: check selected date
      $scope.$apply( ->
        $scope.dateModel.setEnd date
      )

    # error handling
    # ------------------------------------------------------------

    $scope.showError = ->
      $scope.errorMessage = $i18next 'common.EROR_ENDDATE_BEFORE_STARTDATE'

    $scope.hideError = ->
      $scope.errorMessage = ''

    $scope.hasError = ->
      $scope.errorMessage isnt undefined and $scope.errorMessage isnt ''


    init()
]


