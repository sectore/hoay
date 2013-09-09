describe 'module hoay.result', ->

  beforeEach module('hoay.result')

  describe '- resultController', ->
    beforeEach inject(($rootScope, $controller) ->
      @scope = $rootScope.$new()
      @controller = $controller "resultController",
        $scope: @scope
    )

    afterEach ->
      @scope =
      @controller =
      undefined

    it 'should be injectable', ->
      expect(@controller).toBeDefined()

    it 'should have a dateModel', ->
      expect(@scope.dateModel).toBeDefined()

    describe '- view states', ->
      it 'should have default sub view state', inject((RESULT_SUB_VIEW_STATE) ->
        expect(@scope.subViewState).toEqual RESULT_SUB_VIEW_STATE.SUM
      )

      it 'should trigger years total view', inject((RESULT_SUB_VIEW_STATE) ->
        @scope.showTotalYears()
        expect(@scope.subViewState).toEqual RESULT_SUB_VIEW_STATE.YEARS_TOTAL
      )

      it 'should be total years state', ->
        @scope.showTotalYears()
        expect(@scope.isYearsTotalViewState()).toBeTruthy()

      it 'should trigger months total view', inject((RESULT_SUB_VIEW_STATE) ->
        @scope.showTotalMonths()
        expect(@scope.subViewState).toEqual RESULT_SUB_VIEW_STATE.MONTHS_TOTAL
      )

      it 'should be total months state', ->
        @scope.showTotalMonths()
        expect(@scope.isMonthsTotalViewState()).toBeTruthy()

      it 'should trigger months total view', inject((RESULT_SUB_VIEW_STATE) ->
        @scope.showTotalDays()
        expect(@scope.subViewState).toEqual RESULT_SUB_VIEW_STATE.DAYS_TOTAL
      )

      it 'should be total days state', ->
        @scope.showTotalDays()
        console.log "$scope.subViewState #{@scope.subViewState}"
        expect(@scope.isDaysTotalViewState()).toBeTruthy()


    describe '- routes', ->
      beforeEach inject ($route) ->
        @routes = $route.routes

      afterEach ->
        @routes = undefined

      it 'should define resultController', ->
        expect(@routes['/result'].controller).toBe 'resultController'

      it 'should use a valid template', ->
        expect(@routes['/result'].templateUrl).toEqual 'result/result.tpl.html'

