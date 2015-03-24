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

  });
}
