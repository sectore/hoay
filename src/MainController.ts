/// <reference path="definitions.d.ts" />
module hoay {

  class MainController {
    constructor(private $scope:IMainScope) {
      console.log('app loaded');
      // 'vm' stands for 'view model'. An additional benefit to this is to prevent primatives getting
      // assigned to the scope directly
      $scope.vm = this;
    }
  }

  angular.module('hoay')
    .controller('MainController', MainController);
}
