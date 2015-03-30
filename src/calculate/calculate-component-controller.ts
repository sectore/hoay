/// <reference path='../definitions.d.ts' />
module hoay.calculate {
  'use strict';


  interface CalculateComponentControllerInterface{
    changeStartDate():void;
    changeEndDate():void;
  }

  export class CalculateComponentController implements CalculateComponentControllerInterface{

    public start:Date = new Date(1980, 4, 22);
    public end:Date = new Date(1999, 1, 21);
    public dateFormat:string;

    // @ngInject
    constructor($scope:IMainScope,
                private $translate: ng.translate.ITranslateService,
                $rootScope:ng.IRootScopeService) {

      // Content
      console.log('CalculateComponentController');
      $scope.vm = this;
      //this.dateFormat = 'dd.MM.yyyy';

      $rootScope.$on('$translateChangeSuccess', ():void => {
        this.updateDateFormat();
      });

      this.updateDateFormat();
    }

    updateDateFormat():void {

      this.$translate('common.FORMAT_DATE_SHORT')
        .then((dateFormat:string):void => {
          this.dateFormat = dateFormat;
          console.log('dateFormat', dateFormat);
        });
    }

    changeStartDate():void {
      console.log('changeStartDate aa');
    }

    changeEndDate():void {
      console.log('changeEndDate bb');
    }

  }

  angular.module('hoay.calculate')
    .controller('CalculateComponentController', CalculateComponentController);
}

