/// <reference path='../definitions.d.ts' />
module hoay.settings {
  'use strict';

  export function SettingsContentComponent():ng.IDirective {

    var component:ng.IDirective = <ng.IDirective>{};

    component.restrict = 'E';
    component.templateUrl = 'settings/settings-content-component.html';
    component.controller = 'SettingsContentComponentController';
    component.controllerAs = 'ctrl';
    component.bindToController = true;
    component.scope = {};

    return component;

  }

  angular.module('hoay.settings')
    .directive('settingsContent', SettingsContentComponent);
}

