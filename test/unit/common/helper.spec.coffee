describe 'helper', ->

  beforeEach module('hoay.helper')

  describe 'openExternal directive', ->

    it 'should be a valid directive', inject(($compile, $rootScope) ->
      html = "<open-external url='http://websector.de'>WEBSECTOR.DE</open-external>"
      expect( ->
        $compile(html)($rootScope)
      ).not.toThrow()
    )

    it 'should have _blank target by default', inject(($compile, $rootScope, $window) ->
      url = "http://anyurl.com"
      html = "<open-external url=#{url}>link</open-external>"
      element = $compile(html)($rootScope)
      scope = element.scope()
      spy = sinon.spy $window, 'open'

      scope.openUrl()
      expect(spy.calledWith(url, '_blank')).toBeTruthy()
      $window.open.restore()
    )

    it 'should have _system target for using Cordova', inject(($compile, $rootScope, $window) ->
      url = "http://anyurl.com"
      html = "<open-external url=#{url}>link</open-external>"
      # Note: mocking cordova before calling $compile()
      $window.cordova = {}
      element = $compile(html)($rootScope)
      scope = element.scope()
      spy = sinon.spy $window, 'open'

      scope.openUrl()
      expect(spy.calledWith(url, '_system')).toBeTruthy()
      $window.cordova = undefined
    )


