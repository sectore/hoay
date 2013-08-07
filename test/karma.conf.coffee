# Karma configuration
module.exports = (karma) ->
  karma.set

    # base path, that will be used to resolve files and exclude
    basePath: '../'

    frameworks: [
      'jasmine'
    ]

#    plugins: [
#      "karma-jasmine"
#      "karma-phantomjs-launcher"
#      "karma-phantomjs-launcher"
#    ]

    # list of files / patterns to load in the browser
    files: [
      'bin-debug/js/hoay.lib.js'
      'bin-debug/js/hoay.tmpl.js'
      'bin-debug/js/hoay.js'
      'test/tmp/hoay.spec.js'
    ]

    # list of files to exclude
    exclude: []

    # test results reporter to use
    # possible values: dots || progress || growl
    reporters: [
      'progress'
      'dots'
    ]

    # web server port
    port: 8080

    # cli runner port
    runnerPort: 9100

    # enable / disable colors in the output (reporters and logs)
    colors: true

    # level of logging
    # possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    logLevel: karma.LOG_INFO

    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: false

    # Start these browsers, currently available:
    # - Chrome
    # - ChromeCanary
    # - Firefox
    # - Opera
    # - Safari (only Mac)
    # - PhantomJS
    # - IE (only Windows)
    browsers: [
#      'Firefox'
      'PhantomJS'
    ]

    # If browser does not capture in given timeout [ms], kill it
    captureTimeout: 5000

    # Continuous Integration mode
    # if true, it capture browsers, run tests and exit
    singleRun: true