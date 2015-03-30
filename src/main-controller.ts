/// <reference path="definitions.d.ts" />
module hoay {
  'use strict';

  interface MainControllerInterface {
    gotoInfo():void;
    gotoSettings():void;
    gotoResult():void;
  }

  class MainController implements MainControllerInterface {

    // @ngInject
    constructor(private $scope:IMainScope) {
      console.log('app loaded');
      // 'vm' stands for 'view model'. An additional benefit to this is to prevent primatives getting
      // assigned to the scope directly
      $scope.vm = this;
    }


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

  angular.module('hoay')
    .controller('MainController', MainController);
}
