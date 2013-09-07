describe 'module hoay.calculate', ->

  beforeEach module('hoay.calculate')

  describe '- CalculateController', ->

    beforeEach inject ($rootScope, $controller) ->
      @scope = $rootScope.$new()
      @windowMock = {
        cordova: true
      }
      @controller = $controller "calculateController",
                      $scope: @scope
                      $window: @windowMock

    afterEach ->
      @scope = undefined
      @controller = undefined

    it 'should be injectable', ->
      expect(@controller).toBeDefined()

    it 'should have a dateModel', ->
      expect(@scope.dateModel).toBeDefined()

    describe '- datePicker (PhoneGap)', ->

      beforeEach ->
        @datePickerMock = show: ->
        @eventMock = {changedTouches: [{pageX: 0, pageY: 0}]}
        window.datePicker = @datePickerMock
      afterEach ->
        @datePickerMock =
        @eventMock =
        window.datePicker =
        undefined

      it 'should be shown changing start date', ->
        spy = sinon.spy @datePickerMock, "show"
        @scope.changeStartDate @eventMock
        expect(spy.calledOnce).toBeTruthy()

      it 'should be shown changing end date', ->
        spy = sinon.spy @datePickerMock, "show"
        @scope.changeEndDate @eventMock
        expect(spy.calledOnce).toBeTruthy()

    describe '- routes', ->

      beforeEach inject ($route) ->
        @routes = $route.routes

      afterEach ->
        @routes = undefined

      it 'should uses calculateController', ->
        expect(@routes['/'].controller).toBe 'calculateController'

      it 'should have a valid templateUrl', ->
        expect(@routes['/'].templateUrl).toEqual 'calculate/calculate.tpl.html'

