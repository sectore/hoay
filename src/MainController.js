/// <reference path="definitions.d.ts" />
var hoay;
(function (hoay) {
    var MainController = (function () {
        function MainController($scope) {
            this.$scope = $scope;
            console.log('app loaded');
            // 'vm' stands for 'view model'. An additional benefit to this is to prevent primatives getting
            // assigned to the scope directly
            $scope.vm = this;
        }
        return MainController;
    })();
    angular.module('hoay').controller('MainController', MainController);
})(hoay || (hoay = {}));
//# sourceMappingURL=MainController.js.map