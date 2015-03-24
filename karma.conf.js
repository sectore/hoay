// Karma configuration
// Generated on Tue Dec 30 2014 02:13:52 GMT-0800 (PST)

module.exports = function (config) {
  config.set({

    // base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: './',


    // frameworks to use
    // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: [
      'mocha',
      'chai',
      'sinon'
    ],

    plugins: [
      'karma-mocha',
      'karma-chai',
      'karma-sinon',
      'karma-sourcemap-loader',
      'karma-phantomjs-launcher',
      'karma-chrome-launcher',
      'karma-mocha-reporter'
    ],


    // list of files / patterns to load in the browser
    files: [
      'www/js/lib.js',
      'bower_components/angular-mocks/angular-mocks.js',
      //'node_modules/mocha/mocha.js',
      //'node_modules/sinon/lib/sinon.js',
      //'node_modules/chai/lib/chai.js',
      'www/js/app.js',
      'www/js/templates.js',
      'www/test/unit.js'
    ],


    // list of files to exclude
    exclude: [],


    // preprocess matching files before serving them to the browser
    // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
      '**/*.js': ['sourcemap']
    },


    // test results reporter to use
    // possible values: 'dots', 'progress'
    // available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: [
      'mocha'
    ],

    // https://www.npmjs.com/package/karma-notify-reporter
    notifyReporter: {
      reportEachFailure: true, // Default: false, Will notify on every failed sepc
      reportSuccess: false, // Default: true, Will notify when a suite was successful
    },

    // web server port
    port: 9876,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,


    // start these browsers
    // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: [
      //'Chrome'
      'PhantomJS'
    ],

    // Continuous Integration mode
    // if true, Karma captures browsers, runs the tests and exits
    singleRun: false

  });
};
