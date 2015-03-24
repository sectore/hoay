/// <reference path='../definitions.d.ts' />
/// <reference path='../definitions.test.d.ts' />

module hoay.calculate {

  describe('CalculatePageController', () => {

    var controller:CalculatePageController;
    var scope:any;

    beforeEach(() => {
      angular.mock.module('hoay.calculate');
    });

    beforeEach(inject(($rootScope:ng.IRootScopeService,
                       $controller:ng.IControllerService) => {

      scope = <any>$rootScope.$new();
      controller = $controller('CalculatePageController', {
        $scope: scope
      });

    }));

    afterEach(() => {
      controller = undefined;
    });

    it('should be injected', () => {

      chai.expect(controller).to.be.ok;

    });

  });
}
