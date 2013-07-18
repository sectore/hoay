# Custom filter to format Date using pattern defined in locales
# Locales are handled by angular-translate ($translate)
angular.module('hoay.filters', [])
.filter 'shortdate', [
  '$filter',
  '$translate',
  ($filter, $translate)->
    (data)->
      format = $translate 'common.FORMAT_DATE_SHORT'
      result = $filter('date')(data, format)
      result
]