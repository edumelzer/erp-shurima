//= require /angular/angular
//= require_tree /angular/modules
//= require_tree /angular/i18n
//= require directives/module
//= require services/module
//= require ui-bootstrap.min

'use strict';

angular.module('grails', [
    'ngRoute',
    'ngResource',
	'ngAnimate',
    'ui.bootstrap',
    'grails.directives',
    'grails.services',
    'grails.constants'
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
