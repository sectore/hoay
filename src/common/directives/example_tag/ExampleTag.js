/// <reference path='../../../definitions.d.ts' />
var hoay;
(function (hoay) {
    var common;
    (function (common) {
        var directives;
        (function (directives) {
            var ExampleTagDirective = (function () {
                function ExampleTagDirective() {
                    this.restrict = 'E';
                    this.templateUrl = 'common/directives/example_tag/index.html';
                    this.controller = 'ExampleTagDirectiveController';
                    this.scope = {};
                }
                return ExampleTagDirective;
            })();
            directives.ExampleTagDirective = ExampleTagDirective;
            var ExampleTagDirectiveController = (function () {
                function ExampleTagDirectiveController($scope) {
                    this.$scope = $scope;
                    $scope.vm = this;
                }
                return ExampleTagDirectiveController;
            })();
            directives.ExampleTagDirectiveController = ExampleTagDirectiveController;
            // this module is re-declared per directive
            directives.app = directives.app || angular.module('hoay.common.directives', ['templates', 'ionic']);
            directives.app.directive('exampleTag', function () { return new ExampleTagDirective(); });
            directives.app.controller('ExampleTagDirectiveController', ExampleTagDirectiveController);
        })(directives = common.directives || (common.directives = {}));
    })(common = hoay.common || (hoay.common = {}));
})(hoay || (hoay = {}));
//# sourceMappingURL=ExampleTag.js.map