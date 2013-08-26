#HOAY

##About
HOAY ("How old are you") is a web application to calculate your ages in years, month and days built with [AngularJS](http://angularjs.org) and [other great stuff](#tools-and-libraries-in-alphabetical-order).
It can be run as a hybrid mobile application on mobile devices using [Phonegap](http://phonegap.com) or as a web application using [a modern browser](http://www.google.com/chrome/).


## Screen shots

[![screen shot](https://raw.github.com/sectore/hoay/master/wiki/screenshot_iphone_0.png)](https://github.com/sectore/hoay)

[![screen shot](https://raw.github.com/sectore/hoay/master/wiki/screenshot_iphone_1.png)](https://github.com/sectore/hoay)

[![screen shot](https://raw.github.com/sectore/hoay/master/wiki/screenshot_iphone_2.png)](https://github.com/sectore/hoay)

## iTunes Store
Coming soon


## Build and run
Make sure that you have [Node](http://nodejs.org/), [Bower](http://bower.io/) and [Phonegap CLI](https://github.com/phonegap/phonegap-cli) installed on your machine.

### Getting all needed sources
```bash
git clone https://github.com/sectore/hoay
cd hoay
npm install
bower install
phonegap create phonegap de.websector.hoay HOAY
cd phonegap
phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-splashscreen.git
phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-inappbrowser.git
phonegap local plugin add https://github.com/sectore/phonegap3-ios-datepicker-plugin
```

### Phonegap version
Make sure you are on the root folder of the project:

```bash
cd your/folder/to/hoay
```

Create a Phonegap project:

```bash
phonegap create phonegap de.websector.hoay HOAY
cd phonegap
phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-splashscreen.git
phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-inappbrowser.git
phonegap local plugin add https://github.com/sectore/phonegap3-ios-datepicker-plugin
```

Debug version on iOS simulator:

```bash
grunt debug:ios
```

Release version on iOS simulator:

```bash
grunt release:ios
```

### Web version

Debug version on [http://localhost:9001](http://localhost:9001):

```bash
grunt debug:web
```

Release version on [http://localhost:9001](http://localhost:9001):

```bash
grunt release:web
```


### Unit tests
```bash
grunt test:unit
```

## Tools and Libraries (in alphabetical order)

* [AngularJS](http://angularjs.org)
* [angular-mobile-nav](https://github.com/ajoslin/angular-mobile-nav)
* [Bourbon](http://bourbon.io/)
* [Bower](http://bower.io/)
* [CoffeeScript](http://coffeescript.org/)
* [DatePicker iOS Plugin](https://github.com/sectore/phonegap3-ios-datepicker-plugin)
* [Font Awesome](http://fortawesome.github.io/Font-Awesome/)
* [Grunt](http://gruntjs.com/)
* [iScroll](https://github.com/cubiq/iscroll)
* [MomentJS](http://momentjs.com/)
* [ng-i18next](https://github.com/archer96/ng-i18next/)
* [ng-iScroll](https://github.com/ibspoof/ng-iScroll)
* [ngStorage](https://github.com/gsklee/ngStorage)
* [Phonegap](http://phonegap.com)
* [Sass](http://sass-lang.com/)
* [Shifty](http://jeremyckahn.github.io/shifty/)
* [Zepto](http://zeptojs.com/)

For testing purposes:
* [Jasmine](http://pivotal.github.io/jasmine/)
* [Karma](http://karma-runner.github.io/)
* [PhantomJS](http://phantomjs.org/)


##License
Copyright (c) 2013 "sectore" Jens Krause // [WEBSECTOR.DE](http://www.websector.de)

HOAY is free software and it may be redistributed under the terms specified in the [MIT-LICENSE file](https://raw.github.com/sectore/hoay/master/LICENSE.txt).