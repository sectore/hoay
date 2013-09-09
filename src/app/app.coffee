# module definition
# ------------------------------------------------------------
angular.module('hoay.app', [
  # angular modules
  'ngRoute'
  'ngTouch'
  # angular libs
  'jm.i18next'
  'ngStorage'
  # hoay modules
  'hoay.dates'
  'hoay.templates'
  'hoay.helper'
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
  'DATE_DEFAULT'
  'LANG_ID'
  ($log, $window, $i18next, $localStorage, DATE_DEFAULT, LANG_ID)->

    init = ->
      # setting default values
      $localStorage.$default
        startDate: DATE_DEFAULT.START
        endDate: DATE_DEFAULT.END
        langID: LANG_ID.EN_US

      # Important note:
      # Set 'lng' of $i18next.options here using localStore or default lang
      # because it is not possible to inject $localStorage earlier into .config()
      $i18next.options.lng = $localStorage.langID or LANG_ID.EN_US

    init()
]