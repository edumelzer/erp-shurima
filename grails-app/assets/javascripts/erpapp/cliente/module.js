//= require_self 
//= require controllers
//= require services 
//= require_tree /erpapp/cliente/templates/

'use strict';

angular.module('erpapp.cliente', [
	'grails', 
	'erpapp.cliente.controllers', 
	'erpapp.cliente.services'
])
.value('defaultCrudResource', 'ClienteResource')
.config(function($routeProvider) {
	$routeProvider
        .when('/', {
            controller: 'ListCtrl as ctrl',
            templateUrl: 'list.html',
            resolve: {
                clienteList: function($route, ClienteResource) {
                    var params = $route.current.params;
                    return ClienteResource.list(params);
                } 
            }
        })
        .when('/create', {
            controller: 'CreateEditCtrl as ctrl',
            templateUrl: 'create-edit.html',
            resolve: {
                cliente: function(ClienteResource) {
                    return ClienteResource.create();
                } 
            }
        })
        .when('/edit/:id', {
            controller: 'CreateEditCtrl as ctrl',
            templateUrl: 'create-edit.html',
            resolve: {
                cliente: function($route, ClienteResource) {
                    var id = $route.current.params.id;
                    return ClienteResource.get(id);
                } 
            }
        })
        .when('/show/:id', {
            controller: 'ShowCtrl as ctrl',
            templateUrl: 'show.html',
            resolve: {
                cliente: function($route, ClienteResource) {
                    var id = $route.current.params.id;
                    return ClienteResource.get(id);
                }
            }
        })
        .otherwise({redirectTo: '/'});
});
