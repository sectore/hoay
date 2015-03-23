/// <reference path='../definitions.d.ts' />
module hoay.result {
  'use strict';

  export class ResultPageController {

    constructor(private $scope:IMainScope) {
      // Content
      console.log('ResultPageController');
      $scope.vm = this;
    }
  }

  angular.module('hoay.result')
    .controller('ResultPageController', ResultPageController);
}

