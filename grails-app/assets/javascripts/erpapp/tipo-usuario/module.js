//= require_self 
//= require controllers
//= require services 
//= require_tree /erpapp/tipo-usuario/templates/

'use strict';

angular.module('erpapp.tipoUsuario', [
	'grails', 
	'erpapp.tipoUsuario.controllers', 
	'erpapp.tipoUsuario.services'
])
.value('defaultCrudResource', 'TipoUsuarioResource')
.config(function($routeProvider) {
	$routeProvider
        .when('/', {
            controller: 'ListCtrl as ctrl',
            templateUrl: 'list.html',
            resolve: {
                tipoUsuarioList: function($route, TipoUsuarioResource) {
                    var params = $route.current.params;
                    return TipoUsuarioResource.list(params);
                } 
            }
        })
        .when('/create', {
            controller: 'CreateEditCtrl as ctrl',
            templateUrl: 'create-edit.html',
            resolve: {
                tipoUsuario: function(TipoUsuarioResource) {
                    return TipoUsuarioResource.create();
                } 
            }
        })
        .when('/edit/:id', {
            controller: 'CreateEditCtrl as ctrl',
            templateUrl: 'create-edit.html',
            resolve: {
                tipoUsuario: function($route, TipoUsuarioResource) {
                    var id = $route.current.params.id;
                    return TipoUsuarioResource.get(id);
                } 
            }
        })
        .when('/show/:id', {
            controller: 'ShowCtrl as ctrl',
            templateUrl: 'show.html',
            resolve: {
                tipoUsuario: function($route, TipoUsuarioResource) {
                    var id = $route.current.params.id;
                    return TipoUsuarioResource.get(id);
                }
            }
        })
        .otherwise({redirectTo: '/'});
});
