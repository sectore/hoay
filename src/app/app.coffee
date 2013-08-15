# module definition
# ------------------------------------------------------------
angular.module('hoay.app', [
  'ajoslin.mobile-navigate'
  'ngMobile'
  'jm.i18next'
  'ngStorage'
  # app related stuff
  'hoay.templates'
  'hoay.version'
  'hoay.helper'
  'hoay.dates'
  'hoay.calculate'
  'hoay.result'
  'hoay.info'
  'hoay.settings'
])

# constants
# ------------------------------------------------------------
.constant 'HOAY.CONSTANTS',
  LANG_DE_DE: 'de-DE'
  LANG_EN_US: 'en-US'
  START_DATE_DEFAULT: new Date 1971, 9, 10
  END_DATE_DEFAULT: new Date()

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
  '$i18nextProvider'
  ($i18nextProvider) ->
    $i18nextProvider.options =
      useCookie: false
      useLocalStorage: false
      detectLngFromHeaders: false
      fallbackLng: false # disabling fallbacks
      load: 'current' # avoid uneeded loading of fallback files
      resGetPath: 'assets/locales/__lng__.json'
])

# controller
# ------------------------------------------------------------
.controller 'appController',[
  '$log',
  '$window'
  '$i18next'
  '$localStorage'
  'HOAY.CONSTANTS'
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