module hoay.common.date {
  'use strict';

  // @ngInject
  export function dateFilter($filter:angular.IFilterService):Function {

    return function(data:any, format:string) {
      var result = $filter('date')(data, format || 'MM/dd/yyyy');
      return result;
    };
  }

  angular.module('hoay.common.date')
    .filter('dateFilter', dateFilter);
}
