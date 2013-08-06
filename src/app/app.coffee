# module definition
# ------------------------------------------------------------
angular.module('hoay.app', [
  'ajoslin.mobile-navigate'
  'ngMobile'
  'ngCookies'
  'pascalprecht.translate'
  # app related stuff
  'hoay.templates'
  'hoay.version'
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