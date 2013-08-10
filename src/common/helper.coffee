angular.module('hoay.helper', [
])

# directives
# ------------------------------------------------------------

# Directive to handle links opening a new Window (Desktop only)
# or system browser (Phonegap: Safari)
# based on a directive called 'openExternal' (http://tech.pro/tutorial/1357/phonegap-and-angularjs-in-app-browser)
.directive 'openExternal', [
  '$log'
  '$window'
  ($log, $window) ->
    restrict: 'E'
    scope:
      url: "@url"
    transclude: true
    template: '''
        <a
          href=''
          class='btn'
          ng-click='openUrl()'
          ng-transclude>
        </a>
      '''
    controller: ($scope) ->
      target = if $window.cordova then "_system" else "_blank"
      $scope.openUrl = ->
        $log.info "target #{target}"
        $log.info "url #{$scope.url}"
        window.open $scope.url, target


]