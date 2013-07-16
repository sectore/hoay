'use strict'

angular.module('hoay', [
  'templates.common'
  'templates.app'
  'ajoslin.mobile-navigate'
  'ngMobile'
  'pascalprecht.translate'
  # app related stuff
  'hoay.services'
  'hoay.calculate'
  'hoay.result'
  'hoay.info'
  'hoay.settings'
])

.config([
  '$routeProvider',
  '$locationProvider',
  ($routeProvider, $locationProvider) ->
    $routeProvider.otherwise
      redirectTo: '/'
    # html5Mode
    $locationProvider.html5Mode true
])

.config([
  '$translateProvider'
  ($translateProvider) ->
    $translateProvider.useStaticFilesLoader
      prefix: 'assets/locales/'
      suffix: '.json'

    $translateProvider.preferredLanguage 'de_DE'
])