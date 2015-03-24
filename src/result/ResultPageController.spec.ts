/// <reference path='../definitions.d.ts' />
/// <reference path='../definitions.test.d.ts' />

module hoay.result {

  describe('ResultPageController', () => {

    var controller:ResultPageController;
    var scope:any;

    beforeEach(() => {
      angular.mock.module('hoay.result');
    });

    beforeEach(inject(($rootScope:ng.IRootScopeService,
                       $controller:ng.IControllerService) => {

      scope = <any>$rootScope.$new();
      controller = $controller('ResultPageController', {$scope: scope});

    }));

    afterEach(() => {
      controller = undefined;
    });

    it('should be injected', () => {
      chai.expect(controller).to.be.ok;
    });

  });
}