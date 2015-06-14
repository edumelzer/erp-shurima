//= require_self 
//= require controllers
//= require services 
//= require /erpapp/empresa/services
//= require_tree /erpapp/transacao/templates/

'use strict';

angular.module('erpapp.transacao', [
	'grails', 
	'erpapp.transacao.controllers', 
	'erpapp.empresa.services',
	'erpapp.transacao.services'
])
.value('defaultCrudResource', 'TransacaoResource')
.config(function($routeProvider) {
	$routeProvider
        .when('/', {
            controller: 'ListCtrl as ctrl',
            templateUrl: 'list.html',
            resolve: {
                transacaoList: function($route, TransacaoResource) {
                    var params = $route.current.params;
                    return TransacaoResource.list(params);
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
                transacao: function(TransacaoResource) {
                    return TransacaoResource.create();
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
                transacao: function($route, TransacaoResource) {
                    var id = $route.current.params.id;
                    return TransacaoResource.get(id);
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
                transacao: function($route, TransacaoResource) {
                    var id = $route.current.params.id;
                    return TransacaoResource.get(id);
                }
            }
        })
        .otherwise({redirectTo: '/'});
});
