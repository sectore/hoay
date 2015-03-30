/// <reference path='../definitions.d.ts' />
/// <reference path='../definitions.test.d.ts' />

module hoay.info {

  describe('InfoPageController', () => {

    var controller:InfoPageController;
    var scope:any;

    beforeEach(() => {
      angular.mock.module('hoay.info');
    });

    beforeEach(inject(($rootScope:ng.IRootScopeService,
                       $controller:ng.IControllerService) => {

      scope = <any>$rootScope.$new();
      controller = $controller('InfoPageController', {$scope: scope});

    }));

    afterEach(() => {
      controller = undefined;
    });

    it('should be injected', () => {
      chai.expect(controller).to.be.ok;
    });

  });
}
