/// <reference path='../definitions.d.ts' />

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
      $controller('CalculatePageController', {$scope: scope});

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
