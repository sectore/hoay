describe 'module hoay.settings', ->

  beforeEach module('hoay.settings')

  describe '- settingsController', ->
    beforeEach inject(($rootScope, $controller) ->
      @scope = $rootScope.$new()
      @storageMock = langID: ''
      @i18Mock = options:
        lng: ''
      @controller = $controller "settingsController",
        $scope: @scope
        $localStorage: @storageMock
        $i18next: @i18Mock
    )

    afterEach ->
      @scope =
      @controller =
      @i18Mock =
      @storageMock =
      undefined

    it 'should update local storage to German', inject((LANG_ID) ->
      @scope.setGerman()
      expect(@storageMock.langID).toEqual LANG_ID.DE_DE
    )

    it 'should update local storage to ENGLISH', inject((LANG_ID) ->
      @scope.setEnglish()
      expect(@storageMock.langID).toEqual LANG_ID.EN_US
    )

    it 'should update i18 lib to German', inject((LANG_ID) ->
      @scope.setGerman()
      expect(@i18Mock.options.lng).toEqual LANG_ID.DE_DE
    )

    it 'should update i18 lib to English', inject((LANG_ID) ->
      @scope.setEnglish()
      expect(@i18Mock.options.lng).toEqual LANG_ID.EN_US
    )

    it 'should be English', inject((LANG_ID) ->
      @i18Mock.options.lng = LANG_ID.EN_US
      expect(@scope.isEnglish()).toBeTruthy()
    )

    it 'should not be English', ->
      @i18Mock.options.lng = 'any-other-language'
      expect(@scope.isEnglish()).toBeFalsy()

    it 'should be German', inject((LANG_ID) ->
      @i18Mock.options.lng = LANG_ID.DE_DE
      expect(@scope.isGerman()).toBeTruthy()
    )

    it 'should not be German', ->
      @i18Mock.options.lng = 'any-other-language'
      expect(@scope.isGerman()).toBeFalsy()

    describe '- routes', ->
      beforeEach inject ($route) ->
        @routes = $route.routes

      afterEach ->
        @routes = undefined

      it 'should define settingsController', ->
        expect(@routes['/settings'].controller).toBe 'settingsController'

      it 'should use a valid template', ->
        expect(@routes['/settings'].templateUrl).toEqual 'settings/settings.tpl.html'

