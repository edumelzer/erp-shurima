//= require_self 
//= require controllers
//= require services 
//= require_tree /erpapp/empresa/templates/

'use strict';

angular.module('erpapp.empresa', [
	'grails', 
	'erpapp.empresa.controllers', 
	'erpapp.empresa.services'
])
.value('defaultCrudResource', 'EmpresaResource')
.config(function($routeProvider) {
	$routeProvider
        .when('/', {
            controller: 'ListCtrl as ctrl',
            templateUrl: 'list.html',
            resolve: {
                empresaList: function($route, EmpresaResource) {
                    var params = $route.current.params;
                    return EmpresaResource.list(params);
                } 
            }
        })
        .when('/create', {
            controller: 'CreateEditCtrl as ctrl',
            templateUrl: 'create-edit.html',
            resolve: {
                empresa: function(EmpresaResource) {
                    return EmpresaResource.create();
                } 
            }
        })
        .when('/edit/:id', {
            controller: 'CreateEditCtrl as ctrl',
            templateUrl: 'create-edit.html',
            resolve: {
                empresa: function($route, EmpresaResource) {
                    var id = $route.current.params.id;
                    return EmpresaResource.get(id);
                } 
            }
        })
        .when('/show/:id', {
            controller: 'ShowCtrl as ctrl',
            templateUrl: 'show.html',
            resolve: {
                empresa: function($route, EmpresaResource) {
                    var id = $route.current.params.id;
                    return EmpresaResource.get(id);
                }
            }
        })
        .otherwise({redirectTo: '/'});
});
