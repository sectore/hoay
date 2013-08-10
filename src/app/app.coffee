# module definition
# ------------------------------------------------------------
angular.module('hoay.app', [
  'ajoslin.mobile-navigate'
  'ngMobile'
  'ngCookies'
  'jm.i18next'
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
      useCookie: true
      useLocalStorage: false
      detectLngFromHeaders: false
      fallbackLng: 'en-US'
      resGetPath: 'assets/locales/__lng__.json'
])

# controller
# ------------------------------------------------------------
.controller 'appController',[
  '$log',
  '$window'
  '$i18next'

  ($log, $window, $i18next)->

    init = ->
      # Important note:
      # Set 'lng' of $i18next.options using i18n directly
      # because $i18next provides not an api
      # to get the current lang at the moment...
      if $i18next.options.lng is undefined
        $i18next.options.lng = $window.i18n.lng()

    init()
]