'use strict'

angular.module('hoay', [
  'templates.common'
  'templates.app'
  'ajoslin.mobile-navigate'
  'ngMobile'
  'ngCookies'
  'pascalprecht.translate'
  # app related stuff
  'hoay.services'
  'hoay.filters'
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

    $translateProvider.useLocalStorage()
    $translateProvider.preferredLanguage 'en_US'
])