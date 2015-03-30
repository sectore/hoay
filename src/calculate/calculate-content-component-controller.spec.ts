/// <reference path='../definitions.d.ts' />
/// <reference path='../definitions.test.d.ts' />

module hoay.calculate {

  describe('CalculateContentComponentController', () => {

    var controller:CalculateContentComponentController;
    var scope:any;

    beforeEach(() => {
      angular.mock.module('hoay.calculate');
      angular.mock.module('pascalprecht.translate');
    });

    beforeEach(inject(($rootScope:ng.IRootScopeService,
                       $controller:ng.IControllerService,
                       $translate:ng.translate.ITranslateService) => {

      scope = <any>$rootScope.$new();
      var rootScope = <any>$rootScope.$new();
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
