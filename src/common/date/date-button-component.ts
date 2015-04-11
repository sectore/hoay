/// <reference path='../../definitions.d.ts' />
module hoay.calculate {
  'use strict';

  export function DateButtonComponent():angular.IDirective {

    var component:angular.IDirective = <angular.IDirective>{};

    component.restrict = 'E';
    component.templateUrl = 'common/date/date-button.html';
    component.controller = 'DateButtonComponentController';
    component.controllerAs = 'ctrl';
    component.bindToController = true;

    component.scope = {
      subLabel: '@',
      label: '@'
    };

    return component;

  }

  angular.module('hoay.common.date')
    .directive('dateButton', DateButtonComponent);
}

