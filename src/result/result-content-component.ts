/// <reference path='../definitions.d.ts' />
module hoay.calculate {
  'use strict';

  export function ResultContentComponent():angular.IDirective {

    var component:angular.IDirective = <angular.IDirective>{};

    component.restrict = 'E';
    component.templateUrl = 'result/result-content-component.html';
    component.controller = 'ResultContentComponentController';
    component.controllerAs = 'ctrl';
    component.bindToController = true;
    component.scope = {};

    return component;

  }

  angular.module('hoay.result')
    .directive('resultContent', ResultContentComponent);
}

