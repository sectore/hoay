# module definition
# ------------------------------------------------------------
angular.module('hoay.app', [
  # angular modules
  'ngRoute'
  'ngTouch'
  # angular libs
  'ajoslin.mobile-navigate'
  'jm.i18next'
  'ngStorage'
  # hoay modules
  'hoay.templates'
  'hoay.version'
  'hoay.helper'
  'hoay.dates'
  'hoay.calculate'
  'hoay.result'
  'hoay.info'
  'hoay.settings'
])

# config
# ------------------------------------------------------------
.config([
  '$routeProvider',
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $routeProvider.otherwise
      redirectTo: '/'

    # html5Mode (deactivated by using cordova)
    $locationProvider.html5Mode !window.cordova
])

.config([
  '$i18nextProvider'
  ($i18nextProvider) ->
    $i18nextProvider.options =
      useCookie: false
      useLocalStorage: false
      detectLngFromHeaders: false
      fallbackLng: false # disabling fallbacks
      load: 'current' # avoid uneeded loading of fallback files
      getAsync: false
      resGetPath: 'assets/locales/__lng__.json'
])

# controller
# ------------------------------------------------------------
.controller 'appController',[
  '$log',
  '$window'
  '$i18next'
  '$localStorage'
  'HOAYCONSTANTS'
  ($log, $window, $i18next, $localStorage, hoayConstants)->

    init = ->
      # setting default values
      $localStorage.$default
        startDate: hoayConstants.START_DATE_DEFAULT
        endDate: hoayConstants.END_DATE_DEFAULT
        langID: hoayConstants.LANG_EN_US

      # Important note:
      # Set 'lng' of $i18next.options here using localStore or default lang
      # because it is not possible to inject $localStorage earlier into .config()
      $i18next.options.lng = $localStorage.langID or hoayConstants.LANG_EN_US

    init()
]