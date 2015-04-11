/// <reference path='../definitions.d.ts' />
/// <reference path='../definitions.test.d.ts' />

module hoay.info {

  describe('SettingsPageController', () => {

    var controller:hoay.settings.SettingsPageController;
    var scope:any;

    beforeEach(() => {
      angular.mock.module('hoay.settings');
    });

    beforeEach(inject(($rootScope:angular.IRootScopeService,
                       $controller:angular.IControllerService) => {

      scope = <any>$rootScope.$new();
      controller = $controller('SettingsPageController', {$scope: scope});

    }));

    afterEach(() => {
      controller = undefined;
    });

    it('should be injected', () => {
      chai.expect(controller).to.be.ok;
    });

  });
}
