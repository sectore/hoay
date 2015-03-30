/// <reference path='../../definitions.d.ts' />
module hoay.calculate {
  'use strict';

  export function DateButtonComponent():ng.IDirective {

    var component:ng.IDirective = <ng.IDirective>{};

    component.restrict = 'E';
    component.templateUrl = 'calculate/date-button.html';
    component.controller = 'DateButtonComponentController';
    component.controllerAs = 'ctrl';
    component.bindToController = true;

    component.scope = {
      subLabel: '@',
      label: '@'
    };

    return component;

  }

  angular.module('hoay.calculate')
    .directive('dateButton', DateButtonComponent);
}

