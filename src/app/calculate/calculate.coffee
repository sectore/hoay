# module definition
# ------------------------------------------------------------
angular.module('hoay.calculate', [])

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
  '$translate',
  'DateModel'
  ($scope, $navigate, $log, $translate, dateModel)->

    init = ->
      $scope.dateModel = dateModel

    $scope.showResult = ->
      $navigate.go '/result'

    $scope.showSettings = ->
      $navigate.go '/settings', 'modal'

    $scope.showInfo = ->
      $navigate.go '/info', 'modal'


    $scope.showError = ->
      $scope.errorMessage = $translate 'common.EROR_ENDDATE_BEFORE_STARTDATE'

    $scope.hideError = ->
      $scope.errorMessage = ''

    $scope.hasError = ->
      $scope.errorMessage isnt undefined and $scope.errorMessage isnt ''


    init()
]


