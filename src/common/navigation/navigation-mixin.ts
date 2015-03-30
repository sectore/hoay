/// <reference path='../../definitions.d.ts' />
module hoay.common.navigation {
  'use strict';


  interface NavigationMixinInterface {
    gotoInfo():void;
    gotoSettings():void;
    gotoResult():void;
  }

  export class NavigationMixin implements NavigationMixinInterface {

    gotoInfo():void {
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
