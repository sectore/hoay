/// <reference path='../../definitions.d.ts' />
module hoay.common.navigation {
  'use strict';


  interface NavigationMixinInterface {
    gotoInfo():void;
    gotoSettings():void;
    gotoResult():void;
  }

  export class NavigationMixin implements NavigationMixinInterface {

    // @ngInject
    constructor(private $state:angular.ui.IStateService) {
      console.log('state', $state);
    }

    gotoInfo():void {
      this.$state.go('info');
    }

    gotoSettings():void {
      this.$state.go('settings');
    }

    gotoResult():void {
      console.log('gotoResult');
      this.$state.go('result');
    }
  }

}
