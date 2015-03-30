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
    constructor(private $state) {
      console.log('state', $state);
    }
    gotoInfo():void {
      this.$state.go('info');
      console.log('goto info');
    }

    gotoSettings():void {
      console.log('goto settings');
    }

    gotoResult():void {
      console.log('goto result');
    }
  }

}
