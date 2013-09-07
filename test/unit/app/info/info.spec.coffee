describe 'module hoay.info', ->

  beforeEach module('hoay.info')

  describe '- InfoController', ->
    beforeEach inject ($rootScope, $controller) ->
      @scope = $rootScope.$new()
      @controller = $controller "InfoController", $scope: @scope

    afterEach ->
      @scope = undefined
      @controller = undefined

    it 'should use a valid version number', inject (Version) ->
      expect(@scope.version).toEqual Version

    describe '- routes', ->
      beforeEach inject ($route) ->
        @routes = $route.routes

      afterEach ->
        @routes = undefined

      it 'should define a valid controller', ->
        expect(@routes['/info'].controller).toBe 'InfoController'

      it 'should use a valid template', ->
        expect(@routes['/info'].templateUrl).toEqual 'info/info.tpl.html'

