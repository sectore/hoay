/// <reference path='../../definitions.d.ts' />
/// <reference path='../../definitions.test.d.ts' />

module hoay.common.date {

  describe('DateModel', () => {

    var filter;

    beforeEach(function () {
      angular.mock.module('hoay.common.date');
    });

    beforeEach(inject(($filter) => {
      filter = $filter;
    }));

    afterEach(() => {
      filter = undefined;
    });

    it('should have a formatdate filter', () => {
      chai.expect(filter('dateFilter')).to.exist;
    });

    it('should format a date using EN format by default', () => {
      var date = new Date(1980, 4, 22);
      var result = filter('dateFilter')(date);
      chai.expect(result).to.be.equal('05/22/1980');
    });

    it('should format a date using a custom format', () => {
      var date = new Date(1980, 4, 22);
      var format = 'dd.MM.yyyy';
      var result = filter('dateFilter')(date, format);
      chai.expect(result).to.be.equal('22.05.1980');
    });


  });
}
