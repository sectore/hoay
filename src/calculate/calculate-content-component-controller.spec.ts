/// <reference path='../definitions.d.ts' />
/// <reference path='../definitions.test.d.ts' />

module hoay.calculate {

  describe('CalculateContentComponentController', () => {

    var controller:CalculateContentComponentController;

    beforeEach(() => {
      angular.mock.module('hoay.calculate');
      angular.mock.module('pascalprecht.translate');
    });

    beforeEach(inject(($rootScope:angular.IRootScopeService,
                       $controller:angular.IControllerService,
                       $translate:angular.translate.ITranslateService) => {

      var scope:any = <any>$rootScope.$new();
      var rootScope:any = <any>$rootScope.$new();
      controller = $controller('CalculateContentComponentController', {
        $scope: scope,
        $translate: $translate,
        $rootScope: rootScope
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
