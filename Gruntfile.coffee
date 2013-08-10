module.exports = (grunt) ->

  path = require 'path'
  pkg = require './package.json'

  grunt.initConfig(

    # pathes
    # ------------------------------------------------------------
    pathes:
      vendor: 'vendor'
      src: 'src'
      tmpl: 'src/tmpl'
      tmp: 'src/_tmp'
      assets: 'src/assets'
      coffeeapp: 'src/app/**/*.coffee'
      coffeecommon: 'src/common/**/*.coffee'
      coffeetest: 'test/**/*.coffee'
      sass: 'src/sass'
      debug: 'bin-debug'
      release: 'bin-release'
      phonegap: 'phonegap/www'
      test: 'test'

    meta:
      banner: '''
        /*!
        app: <%= pkg.name %> - <%= pkg.description %>
        version: <%= pkg.version %>
        date: <%= grunt.template.today("yyyy-mm-dd") %>
        author: <%= pkg.author %>
        */
        '''

    # package
    # ------------------------------------------------------------
    pkg: pkg

    # clean
    # ------------------------------------------------------------
    clean:
      version: [
        '<%= pathes.src %>/app/version.coffee'
      ]
      debug: [
        '<%= pathes.debug %>/*'
      ]
      release: [
        '<%= pathes.release %>/*'
      ]
      test: [
        '<%= pathes.test %>/_tmp/*'
      ]
      tmp: [
        '<%= pathes.tmp %>/*'
      ]
      phonegap: [
        '<%= pathes.phonegap %>/css/'
        '<%= pathes.phonegap %>/img/'
        '<%= pathes.phonegap %>/styles/'
        '<%= pathes.phonegap %>/js/'
        '<%= pathes.phonegap %>/spec/'
        '<%= pathes.phonegap %>/res/'
        '<%= pathes.phonegap %>/*.html'
        '<%= pathes.phonegap %>/config.xml'
      ]

    # replace
    # ------------------------------------------------------------
    replacer:
      version:
        files: [
          src: '<%= pathes.tmpl %>/version.tmpl.coffee'
          dest: '<%= pathes.src %>/app/version.coffee'
        ]
        options:
          replace:
            '@@version': '<%= pkg.version %>'

    #  references for index.html
    # ------------------------------------------------------------

    htmlrefs:
      release:
        src: '<%= pathes.src %>/app/index.html'
        dest: '<%= pathes.release %>/'
        options:
          version: '<%= pkg.version %>'


    # copy
    # ------------------------------------------------------------
    copy:
      debugassets:
        # assets
        files: [
          expand: true
          cwd: '<%= pathes.src %>/'
          src: [
            'assets/**'
          ]
          dest: '<%= pathes.debug %>/'
        ]
      debugjs:
        # all js (incl. source maps related files)
        files:[
          expand: true,
          cwd: '<%= pathes.tmp %>/js/'
          src: [
            '**'
          ],
          dest: '<%= pathes.debug %>/js/'
          filter: 'isFile'
        ]
      debugcss:
      # css
        files:[
          expand: true,
          cwd: '<%= pathes.tmp %>/styles/'
          src: [
            '*.css'
          ],
          dest: '<%= pathes.debug %>/styles/'
          filter: 'isFile'
        ]
      debugindex:
        # index.html
        files:[
          expand: true,
          cwd: '<%= pathes.src %>/app/'
          src: [
            'index.html'
          ],
          dest: '<%= pathes.debug %>/',
          filter: 'isFile'
        ]
      debugfontawesome:
        # font awesome
        files: [
          expand: true,
          cwd: '<%= pathes.vendor %>/font-awesome/'
          src: [
            'font/*.*'
          ],
          dest: '<%= pathes.debug %>/'
        ]
      releaseassets:
        # assets
        files: [
          expand: true
          cwd: '<%= pathes.src %>/'
          src: [
            'assets/**'
          ]
          dest: '<%= pathes.release %>/'
        ]
      releasefontawesome:
        # font awesome
        files: [
          expand: true,
          cwd: '<%= pathes.vendor %>/font-awesome/'
          src: [
            'font/*.*'
          ],
          dest: '<%= pathes.release %>/'
        ]

      debugpphonegapwww:
        files: [
          expand: true,
          cwd: '<%= pathes.debug %>/'
          src: [
            '**/*.*'
            '!index.html'
          ],
          dest: '<%= pathes.phonegap %>/'
        ]
      debugphoneassets:
        files:[
          expand: true,
          cwd: '<%= pathes.src %>/phonegap/'
          src: [
            '**/**'
          ],
          dest: '<%= pathes.phonegap %>/'
        ]


    # coffee
    # ------------------------------------------------------------
    coffee:
      app:
        options:
          join: true
          bare: true
          sourceMap: true
        files:
          '<%= pathes.tmp %>/js/<%= pkg.name %>.js': [
            '<%= pathes.src %>/app/version.coffee'
            '<%= pathes.src %>/common/**/**.coffee'
            '<%= pathes.src %>/app/calculate/**/**.coffee'
            '<%= pathes.src %>/app/info/**/**.coffee'
            '<%= pathes.src %>/app/result/**/**.coffee'
            '<%= pathes.src %>/app/settings/**/**.coffee'
            '<%= pathes.src %>/app/app.coffee'
            '<%= pathes.src %>/app/bootstrap.coffee'
          ]

      test:
        options:
          join: true
          bare: true
        files:
          '<%= pathes.test %>/_tmp/<%= pkg.name %>.spec.js': [
            '<%= pathes.test %>/unit/**/**.coffee'
          ]

    # html2js
    # ------------------------------------------------------------
    html2js:
      app:
        options:
          base: 'src/app'
        src: [
          '<%= pathes.src %>/app/**/*.tpl.html'
        ]
        dest: '<%= pathes.tmp %>/js/<%= pkg.name %>.tmpl.js'
        module: 'hoay.templates'

    # concat
    # ------------------------------------------------------------
    concat:
      jslib:
        src: [
          '<%= pathes.vendor %>/zepto/zepto.js'
          '<%= pathes.vendor %>/shifty/dist/shifty.js'
          '<%= pathes.vendor %>/momentjs/moment.js'
          '<%= pathes.vendor %>/i18next/release/i18next-1.6.3.js'
          '<%= pathes.vendor %>/angular/angular.js'
          '<%= pathes.vendor %>/angular/angular-mocks.js'
          '<%= pathes.vendor %>/angular/angular-mobile.js'
          '<%= pathes.vendor %>/angular/angular-cookies.js'
          '<%= pathes.vendor %>/angular/i18n/angular-locale_en-us.js'
          '<%= pathes.vendor %>/angular/i18n/angular-locale_de-de.js'
          '<%= pathes.vendor %>/angular-mobile-nav/mobile-nav.js'
          '<%= pathes.vendor %>/ui-router/angular-ui-router.js'
          '<%= pathes.vendor %>/angular-translate/angular-translate.js'
          '<%= pathes.vendor %>/angular-translate-loader-static-files/angular-translate-loader-static-files.js'
          '<%= pathes.vendor %>/angular-translate-storage-cookie/angular-translate-storage-cookie.js'
          '<%= pathes.vendor %>/angular-translate-storage-local/angular-translate-storage-local.js'
          '<%= pathes.vendor %>/ng-i18next/dist/ng-i18next.js'
          ]
        dest:
          '<%= pathes.tmp %>/js/<%= pkg.name %>.lib.js'

      csslib:
        src: [
          'vendor/normalize-css/normalize.css'
          'vendor/angular-mobile-nav/mobile-nav.css'
          'vendor/font-awesome/css/font-awesome.css'
        ]
        dest:
          '<%= pathes.tmp %>/styles/<%= pkg.name %>.lib.css'

    # sass
    # ------------------------------------------------------------
    sass:
      debug:
        options:
          trace: true
          quiet: false
          debugInfo: true
          lineNumbers: true
        files:
          '<%= pathes.debug %>/styles/<%= pkg.name %>.css':'<%= pathes.sass %>/main.scss'

      release:
        options:
          trace: true
          quiet: false
        files:
          '<%= pathes.tmp %>/styles/<%= pkg.name %>.css':'<%= pathes.sass %>/main.scss'

    # connect
    # ------------------------------------------------------------
    connect:
      options:
        port: 9001
      debug:
        options:
          base: 'bin-debug'
      release:
        options:
          keepalive: true
          base: 'bin-release'

    # lint
    # ------------------------------------------------------------
    coffeelint:
      options:
        'max_line_length':
          'value': 80,
          'level': 'warn'
      app:
        files:
          src: [
            '<%= pathes.coffeeapp %>'
            '<%= pathes.coffeecommon %>'
          ]
      test:
        files:
          src: [
            '<%= pathes.coffeetest %>'
          ]
      grunt:
        files:
          src: 'Gruntfile.coffee'

    # cssmin
    # ------------------------------------------------------------
    cssmin:
      options:
        banner: '<%=meta.banner%>'
        keepSpecialComments: '*'
      release:
        files:
          '<%= pathes.release %>/styles/<%= pkg.name %>.<%= pkg.version %>.min.css': [
            '<%= pathes.tmp %>/styles/<%= pkg.name %>.lib.css'
            '<%= pathes.tmp %>/styles/<%= pkg.name %>.css'
          ]

    # uglify
    # ------------------------------------------------------------
    uglify:
      options:
        banner: '<%=meta.banner%>'
        compress:
          dead_code: false
          unused: false
          if_return: true
          warnings: true
      release:
        files:
          '<%= pathes.release %>/js/<%= pkg.name %>.<%= pkg.version %>.min.js': [
            '<%= pathes.tmp %>/js/<%= pkg.name %>.lib.js'
            '<%= pathes.tmp %>/js/<%= pkg.name %>.tmpl.js'
            '<%= pathes.tmp %>/js/<%= pkg.name %>.js'
          ]

    # watch
    # ------------------------------------------------------------
    watch:
      options:
        livereload: true
      coffee:
        files: [
          '<%= pathes.coffeeapp %>'
          '<%= pathes.coffeecommon %>'
        ],
        tasks: [
          'coffee:app'
          'copy:debugjs'
        ]
      grunt:
        files: [
          'Gruntfile.coffee'
        ],
        tasks: [
          'coffeelint:grunt'
        ]
      sass:
        files: [
          '<%= pathes.sass %>/**/*.scss'
        ],
        tasks: [
          'sass:debug'
        ]
      index:
        files: [
          '<%= pathes.src %>/app/index.html'
        ],
        tasks: [
          'htmlrefs'
          'copy:debugindex'
        ]
      htmltemplates:
        files: [
          '<%= pathes.src %>/app/**/*.tpl.html'
        ],
        tasks: [
          'html2js'
          'copy:debugjs'
        ]
      assets:
        files: [
          '<%= pathes.assets %>/**/*'
        ],
        tasks: [
          'copy:debugassets'
        ]

    # karma
    # ------------------------------------------------------------
    karma:
      unit:
        configFile: 'test/karma.conf.coffee'


  )


  # dependencies
  # ------------------------------------------------------------
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-replacer'
  grunt.loadNpmTasks 'grunt-htmlrefs'
  grunt.loadNpmTasks 'grunt-html2js'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-karma'

  # debug tasks
  # ------------------------------------------------------------
  grunt.registerTask 'debug', [
    'clean'
    'replacer:version'
    'html2js'
    'coffee:app'
    'coffeelint:app'
    'concat:jslib'
    'concat:csslib'
    'sass:debug'
    'copydebug'
    'connect:debug'
    'karma:unit'
    'watch'
  ]

  grunt.registerTask 'copydebug', [
    'copy:debugassets'
    'copy:debugjs'
    'copy:debugcss'
    'copy:debugindex'
    'copy:debugfontawesome'
  ]

  # release tasks
  # ------------------------------------------------------------
  grunt.registerTask 'release', [
    'clean'
    'replacer:version'
    'html2js'
    'coffee:app'
    'coffeelint:app'
    'sass:release'
    'concat:jslib'
    'concat:csslib'
    'cssmin:release'
    'uglify:release'
    'htmlrefs:release'
    'copy:releaseassets'
    'copy:releasefontawesome'
    'connect:release'
  ]

  # phonegap tasks
  # ------------------------------------------------------------
  grunt.registerTask 'phonegap:debug', [
    'clean'
    'replacer:version'
    'html2js'
    'coffee:app'
    'coffeelint:app'
    'concat:jslib'
    'concat:csslib'
    'sass:debug'
    'copydebug'
    'copy:debugpphonegapwww'
    'copy:debugphoneassets'
  ]

  # test tasks
  # ------------------------------------------------------------
  grunt.registerTask 'test:unit', [
    'clean'
    'replacer:version'
    'html2js'
    'coffee:app'
    'coffeelint:app'
    'coffeelint:test'
    'coffee:test'
    'concat:jslib'
    'copy:debugjs'
    'karma:unit'
  ]

  # default tasks
  # ------------------------------------------------------------
  grunt.registerTask 'default', [
   'debug'
  ]