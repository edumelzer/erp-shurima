//= require_self
//= require controllers
//= require services
//= require /erpapp/empresa/services
//= require_tree /erpapp/entrada/templates/

'use strict';

angular.module('erpapp.entrada', [
	'grails',
	'erpapp.entrada.controllers',
	'erpapp.empresa.services',
	'erpapp.entrada.services'
])
.value('defaultCrudResource', 'EntradaResource')
.config(function($routeProvider) {
	$routeProvider
        .when('/', {
            controller: 'ListCtrl as ctrl',
            templateUrl: 'list.html',
            resolve: {
                entradaList: function($route, EntradaResource) {
                    var params = $route.current.params;
                    return EntradaResource.list(params);
                },
				empresaList: function(EmpresaResource) {
					return EmpresaResource.list();
				}

            }
        })
        .when('/create', {
            controller: 'CreateEditCtrl as ctrl',
            templateUrl: 'create-edit.html',
            resolve: {
                entrada: function(EntradaResource) {
                    return EntradaResource.create();
                },
				empresaList: function(EmpresaResource) {
					return EmpresaResource.list();
				}

            }
        })
        .when('/edit/:id', {
            controller: 'CreateEditCtrl as ctrl',
            templateUrl: 'create-edit.html',
            resolve: {
                entrada: function($route, EntradaResource) {
                    var id = $route.current.params.id;
                    return EntradaResource.get(id);
                },
				empresaList: function(EmpresaResource) {
					return EmpresaResource.list();
				}

            }
        })
        .when('/show/:id', {
            controller: 'ShowCtrl as ctrl',
            templateUrl: 'show.html',
            resolve: {
                entrada: function($route, EntradaResource) {
                    var id = $route.current.params.id;
                    return EntradaResource.get(id);
                }
            }
        })
        .otherwise({redirectTo: '/'});
});
