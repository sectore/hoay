/// <reference path='../../definitions.d.ts' />
var hoay;
(function (hoay) {
    var common;
    (function (common) {
        var services;
        (function (services) {
            var SampleData = (function () {
                function SampleData($log) {
                    this.$log = $log;
                }
                SampleData.prototype.getData = function () {
                    this.$log.log('getData() called');
                    return 'LoremIpsum';
                };
                SampleData.$inject = ['$log'];
                return SampleData;
            })();
            services.SampleData = SampleData;
            services.app = services.app || angular.module('hoay.common.services', ['ionic']);
            services.app.service('SampleDataService', SampleData);
        })(services = common.services || (common.services = {}));
    })(common = hoay.common || (hoay.common = {}));
})(hoay || (hoay = {}));
//# sourceMappingURL=SampleData.js.map