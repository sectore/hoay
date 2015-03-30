/// <reference path='../definitions.d.ts' />
module hoay.calculate {
  'use strict';

  export function InfoContentComponent():ng.IDirective {

    var component:ng.IDirective = <ng.IDirective>{};

    component.restrict = 'E';
    component.templateUrl = 'info/info-content-component.html';
    component.controller = 'InfoContentComponentController';
    component.controllerAs = 'ctrl';
    component.bindToController = true;
    component.scope = {};

    return component;

  }

  angular.module('hoay.info')
    .directive('infoContent', InfoContentComponent);
}

