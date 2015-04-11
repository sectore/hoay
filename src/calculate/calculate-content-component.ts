/// <reference path='../definitions.d.ts' />
module hoay.calculate {
  'use strict';

  export function CalculateContentComponent():angular.IDirective {

    var component:angular.IDirective = <angular.IDirective>{};

    component.restrict = 'E';
    component.templateUrl = 'calculate/calculate-content-component.html';
    component.controller = 'CalculateContentComponentController';
    component.controllerAs = 'ctrl';
    component.bindToController = true;
    component.scope = {};

    return component;

  }

  angular.module('hoay.calculate')
    .directive('calculateContent', CalculateContentComponent);
}

