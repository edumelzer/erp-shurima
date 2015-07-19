//= require /angular/angular
//= require_tree /angular/modules
//= require_tree /angular/i18n
//= require jquery/jquery.min
//= require bootstrap/js/bootstrap.min
//= require adminlte/js/app.min
//= require directives/module
//= require services/module

'use strict';

angular.module('grails', [
    'ngRoute',
    'ngResource',
	  'ngAnimate',
    'ui.bootstrap',
    'grails.directives',
    'grails.services',
    'grails.constants',
    'ngMask'
])

.config(function (datepickerConfig, datepickerPopupConfig) {
  datepickerConfig.showWeeks = true;
  datepickerPopupConfig.datepickerPopup= "dd/MM/yyyy";
  datepickerPopupConfig.currentText= "Hoje";
  datepickerPopupConfig.clearText= "Limpar";
  datepickerPopupConfig.closeText= "Confirma";
})
;

angular.module('grails.constants', []);
