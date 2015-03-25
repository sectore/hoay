/// <reference path='../../definitions.d.ts' />
/// <reference path='../../definitions.test.d.ts' />

module hoay.common.date {

  describe('DateModel', () => {

    var model;

    beforeEach(function () {
      angular.mock.module('hoay.common.date');
    });

    beforeEach(inject((_DateModel_) => {
      model = _DateModel_;
    }));

    afterEach(() => {
      model = undefined;
    });

    it('should be injectable', () => {
      chai.expect(model).to.exist;
    });

    it('should have a start date by default', () => {
      chai.expect(model.start).to.exist;
    });

    it('should have an end date by default', () => {
      chai.expect(model.start).to.exist;
    });

    it('should update a start date', () => {
      var date = new Date();
      model.setStart(date);
      chai.expect(model.start).to.equal(date);
    });

    it('should have an end date by default', () => {
      chai.expect(model.end).to.exist;
    });

    it('should update an end date', () => {
      var date = new Date();
      model.setEnd(date);
      chai.expect(model.end).to.be.equal(date);
    });

    it('should have days by default', () => {
      chai.expect(model.days).to.exist;
    });

    it('should have total days by default', () => {
      chai.expect(model.totalDays).to.exist;
    });

    it('should have a valid value of days', () => {
      var start = new Date(2001, 11, 10);
      var end = new Date(2011, 11, 9);
      model.setStart(start);
      model.setEnd(end);
      chai.expect(model.days).to.be.equal(30);
    });

    it('should have a valid value of total days', () => {
      var start = new Date(2012, 11, 10);
      var end = new Date(2013, 0, 11);
      model.setStart(start);
      model.setEnd(end);
      chai.expect(model.totalDays).to.be.equal(32);
    });


    it('should have months by default', () => {
      chai.expect(model.months).to.exist;
    });

    it('should have a valid value of months', () => {
      var start = new Date(2001, 11, 10);
      var end = new Date(2011, 11, 9);
      model.setStart(start);
      model.setEnd(end);
      chai.expect(model.months).to.be.equal(11);
    });

    it('should have total months by default', () => {
      chai.expect(model.totalMonths).to.exist;
    });

    it('should have a valid value of total months', () => {
      var start = new Date(2011, 11, 10);
      var end = new Date(2013, 0, 9);
      model.setStart(start);
      model.setEnd(end);
      chai.expect(model.totalMonths).to.be.equal(12);
    });

    it('should have years by default', () => {
      chai.expect(model.years).to.exist;
    });

    it('should have a valid value of years', () => {
      var start = new Date(2001, 11, 10);
      var end = new Date(2011, 11, 9);
      model.setStart(start);
      model.setEnd(end);
      chai.expect(model.years).to.be.equal(9);
    });

    it('should have total years by default', () => {
      chai.expect(model.totalYears).to.exist;
    });

    it('should have a valid value of total years', () => {
      var start = new Date(2001, 11, 10);
      var end = new Date(2013, 0, 9);
      model.setStart(start);
      model.setEnd(end);
      chai.expect(model.totalYears).to.be.equal(11);
    });

  });
}
