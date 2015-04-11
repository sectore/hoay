/// <reference path='../definitions.d.ts' />
module hoay.calculate {
  'use strict';


  interface CalculateContentComponentControllerInterface {
    changeStartDate():void;
    changeEndDate():void;
  }

  export class CalculateContentComponentController implements CalculateContentComponentControllerInterface {

    public dateFormat:string;

    // @ngInject
    constructor(private $scope:IMainScope,
                private $translate:angular.translate.ITranslateService,
                private $rootScope:angular.IRootScopeService,
                private $state:angular.ui.IStateService,
                public dateModel:hoay.common.date.DateModel) {

      // ng-translate
      $rootScope.$on('$translateChangeSuccess', ():void => {
        this.updateDateFormat();
      });

      this.updateDateFormat();
    }

    updateDateFormat():void {

      this.$translate('common.FORMAT_DATE_SHORT')
        .then((dateFormat:string):void => {
          this.dateFormat = dateFormat;
        });
    }

    changeStartDate():void {
      var date = this.dateModel.start;
      console.log('changeStartDate');
    }

    changeEndDate():void {
      console.log('changeEndDate');
    }

  }


  hoay.common.util.applyMixins(CalculateContentComponentController, [
    hoay.common.navigation.NavigationMixin
  ]);

  angular.module('hoay.calculate')
    .controller('CalculateContentComponentController', CalculateContentComponentController);
}

