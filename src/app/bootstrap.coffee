hoay = hoay or {}
hoay.bootstrap = (->

  deviceReadyHandler = (event) =>
    document.removeEventListener 'deviceready', deviceReadyHandler, false
    boot()

  boot = ->
    # adding appController 'by hand'
    $('body').attr 'ng-controller', 'appController'
    # bootstrap angular
    angular.bootstrap(document, ["hoay.app"])

  init: ->
    if window.cordova
      document.addEventListener 'deviceready', deviceReadyHandler, false
    else
      $ boot()
)()