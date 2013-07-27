'use strict'

# module definition
# ------------------------------------------------------------
angular.module('hoay.app', [
  'templates.common'
  'templates.app'
  'ajoslin.mobile-navigate'
  'ngMobile'
  'ngCookies'
  'pascalprecht.translate'
  # app related stuff
  'hoay.directives.charts'
  'hoay.dates'
  'hoay.calculate'
  'hoay.result'
  'hoay.info'
  'hoay.settings'
])

# configurations
# ------------------------------------------------------------
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