hoay = hoay or {}
hoay.bootstrap = (->

  deviceReadyHandler = (event) =>
    document.removeEventListener 'deviceready', deviceReadyHandler, false
    boot()

  boot = ->
    angular.bootstrap(document, ["hoay.app"])

  init: ->
    if window.cordova
      document.addEventListener 'deviceready', deviceReadyHandler, false
    else
      $ boot()
)()