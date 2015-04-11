/// <reference path='../definitions.d.ts' />
module hoay.info {
  'use strict';

  export function InfoContentComponent():angular.IDirective {

    var component:angular.IDirective = <angular.IDirective>{};

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

