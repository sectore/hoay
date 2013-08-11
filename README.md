#Still in progress...

##About
HOAY ("How old are you") is a mobile app to calculate ages in years, month and days build with [AngularJS](http://angularjs.org) and [Phonegap](http://phonegap.com)

## Installation

```bash
git clone https://github.com/sectore/hoay
cd hoay
npm install
bower install
phonegap create phonegap de.websector.hoay HOAY
cd phonegap
phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-inappbrowser.git
phonegap local plugin add https://github.com/sectore/phonegap3-ios-datepicker-plugin
```

Run debug version on iOS
```bash
grunt phonegap:debug
phonegap run ios
```

##License
Copyright (c) 2013 "sectore" Jens Krause // [WEBSECTOR.DE](http://www.websector.de)

HOAY is free software and it may be redistributed under the terms specified in the [MIT-LICENSE file](https://raw.github.com/sectore/hoay/master/LICENSE.txt).