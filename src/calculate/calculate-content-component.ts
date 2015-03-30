/// <reference path='../definitions.d.ts' />
module hoay.calculate {
  'use strict';

  export function CalculateComponent():ng.IDirective {

    var component:ng.IDirective = <ng.IDirective>{};

    component.restrict = 'E';
    component.templateUrl = 'calculate/calculate-content-component.html';
    component.controller = 'CalculateContentComponentController';
    component.controllerAs = 'ctrl';
    component.bindToController = true;
    component.scope = {};

    return component;

  }

  angular.module('hoay.calculate')
    .directive('calculate', CalculateComponent);
}

