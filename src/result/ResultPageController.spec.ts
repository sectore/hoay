/// <reference path='../definitions.d.ts' />

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
      $controller('ResultPageController', {$scope: scope});

    }));

    afterEach(() => {
      controller = undefined;
    });

    it('should be injected', () => {
      //expect(controller).to.be.ok;
      expect(controller).not.toBeNull();

    });

  });
}
