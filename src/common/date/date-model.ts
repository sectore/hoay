module hoay.common.date {
  'use strict';

  export class DateModel {

    private _start:Date;
    private _end:Date;
    private days:number;
    private totalDays:number;
    private months:number;
    private totalMonths:number;
    private years:number;
    private totalYears:number;

    // @ngInject
    constructor(private localStorageService:angular.local.storage.ICookie,
                private DATE_DEFAULT:any) {
      this.init();
    }

    init() {
      var startStored = this.localStorageService.get('startDate');
      var endStored = this.localStorageService.get('endDate');
      this.start = startStored ? new Date(startStored) : this.DATE_DEFAULT.START;
      this.end = endStored ? new Date(endStored) : this.DATE_DEFAULT.END;
      this.updateDifferences();
    }

    set start(date:Date) {
      this._start = date;
      this.localStorageService.set('startDate', this.start.toDateString());
      this.updateDifferences();
    }

    get start(){
      return this._start;
    }

    set end(date:Date) {
      this._end = date;
      this.localStorageService.set('endDate', this.end.toDateString());
      this.updateDifferences();
    }

    get end(){
      return this._end;
    }

    updateDifferences() {
      if (this.start !== undefined && this.end !== undefined) {
        var sum = this.getSumByDates(this.start, this.end);
        this.days = sum.days;
        this.months = sum.months;
        this.years = sum.years;
        this.totalDays = this.getTotalDaysByDates(this.start, this.end);
        this.totalMonths = this.getTotalMonthsByDates(this.start, this.end);
        this.totalYears = this.getTotalYearsByDates(this.start, this.end);
      }
    }

    getTotalDaysByDates(startDate:Date, endDate:Date) {
      var startMoment = moment(startDate);
      var endMoment = moment(endDate);
      return endMoment.diff(startMoment, 'days');
    }

    getTotalMonthsByDates(startDate:Date, endDate:Date) {
      var startMoment = moment(startDate);
      var endMoment = moment(endDate);
      return endMoment.diff(startMoment, 'months');

    }


    getTotalYearsByDates(startDate, endDate) {
      var startMoment = moment(startDate);
      var endMoment = moment(endDate);
      return endMoment.diff(startMoment, 'years');
    }

    //Based on
    //"Counting from a date to today"
    //http://stackoverflow.com/a/11231806
    getSumByDates(startDate:Date, endDate:Date):any {
      var days = endDate.getDate() - startDate.getDate();
      var months = endDate.getMonth() - startDate.getMonth();
      var years = endDate.getFullYear() - startDate.getFullYear();

      if (days < 0) {
        months -= 1;
        var lastMonthNumber = endDate.getMonth() - 1;
        if (lastMonthNumber < 0) {
          lastMonthNumber += 12;
        }
        var daysInLastMonth = new Date(endDate.getFullYear(), lastMonthNumber, 0).getDate();
        days += daysInLastMonth;
      }

      if (months < 0) {
        years -= 1;
        months += 12;
      }


      if (years < 0) {
        years = 0;
      }

      var result = {
        days: days,
        months: months,
        years: years
      };

      return result;

    }

  }

  angular.module('hoay.common.date')

    .constant('DATE_DEFAULT', {
      //Do you know what 1980/05/22 is about?
      //It is the release date of PAC-MAN in Japan :)
      //@see: http://history1900s.about.com/od/1980s/qt/Pac-Man.htm
      START: new Date(1980, 4, 22),
      END: new Date()
    })


    //  DateModel to store date data
    //It is acting as a domain model
    // to share date beetween controllers
    // It provides some helper methods
    .service('dateModel', DateModel);
}
