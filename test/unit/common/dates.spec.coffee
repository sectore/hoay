describe 'dates', ->

  beforeEach module('hoay.dates')


  describe 'DateModel', ->

    beforeEach inject (_DateModel_) ->
      @model = _DateModel_

    afterEach ->
      @model = undefined

    it 'should be injectable', ->
      expect(@model).toBeDefined()

    it 'should have a start date by default', ->
      expect(@model.start).not.toBeUndefined()

    it 'should have an end date by default', ->
      expect(@model.start).toBeDefined()

    it 'should update a start date', ->
      date = new Date()
      @model.setStart date
      expect(@model.start).toEqual date

    it 'should have an end date by default', ->
      expect(@model.end).not.toBeUndefined()

    it 'should update an end date', ->
      date = new Date()
      @model.setEnd date
      expect(@model.end).toEqual date

    it 'should have days by default', ->
      expect(@model.days).not.toBeUndefined()

    it 'should have total days by default', ->
      expect(@model.totalDays).not.toBeUndefined()

    it 'should have a valid value of days', ->
      start = new Date 2001, 11, 10
      end = new Date 2011, 11, 9
      @model.setStart start
      @model.setEnd end
      expect(@model.days).toEqual 30

    it 'should have a valid value of total days', ->
      start = new Date 2012, 11, 10
      end = new Date 2013, 0, 11
      @model.setStart start
      @model.setEnd end
      expect(@model.totalDays).toEqual 32

    it 'should have months by default', ->
      expect(@model.months).not.toBeUndefined()

    it 'should have a valid value of months', ->
      start = new Date 2001, 11, 10
      end = new Date 2011, 11, 9
      @model.setStart start
      @model.setEnd end
      expect(@model.months).toEqual 11

    it 'should have total months by default', ->
      expect(@model.totalMonths).not.toBeUndefined()

    it 'should have a valid value of total months', ->
      start = new Date 2011, 11, 10
      end = new Date 2013, 0, 9
      @model.setStart start
      @model.setEnd end
      expect(@model.totalMonths).toEqual 12

    it 'should have years by default', ->
      expect(@model.years).not.toBeUndefined()

    it 'should have a valid value of years', ->
      start = new Date 2001, 11, 10
      end = new Date 2011, 11, 9
      @model.setStart start
      @model.setEnd end
      expect(@model.years).toEqual 9

    it 'should have total years by default', ->
      expect(@model.totalYears).not.toBeUndefined()

    it 'should have a valid value of total years', ->
      start = new Date 2001, 11, 10
      end = new Date 2013, 0, 9
      @model.setStart start
      @model.setEnd end
      expect(@model.totalYears).toEqual 11

  describe 'filter', ->

    beforeEach inject ($filter) ->
      @filter = $filter

    afterEach ->
      @filter = undefined

    it 'should have a formatdate filter', ->
      expect(@filter('formatdate')).not.toBeUndefined()

    it 'should format a date using EN format by default', ->
      date = new Date 1980, 4, 22
      result = @filter('formatdate')(date)
      expect(result).toEqual '05/22/1980'

    it 'should format a date using a custom format', ->
      date = new Date 1980, 4, 22
      format = "dd.MM.yyyy"
      result = @filter('formatdate')(date,format)
      expect(result).toEqual '22.05.1980'

