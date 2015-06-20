//= require_self 
//= require controllers
//= require services 
//= require /erpapp/tipo-usuario/services
//= require_tree /erpapp/usuario/templates/

'use strict';

angular.module('erpapp.usuario', [
	'grails', 
	'erpapp.usuario.controllers', 
	'erpapp.tipoUsuario.services',
	'erpapp.usuario.services'
])
.value('defaultCrudResource', 'UsuarioResource')
.config(function($routeProvider) {
	$routeProvider
        .when('/', {
            controller: 'ListCtrl as ctrl',
            templateUrl: 'list.html',
            resolve: {
                usuarioList: function($route, UsuarioResource) {
                    var params = $route.current.params;
                    return UsuarioResource.list(params);
                },
				tipoUsuarioList: function(TipoUsuarioResource) {
					return TipoUsuarioResource.list();
				}	
 
            }
        })
        .when('/create', {
            controller: 'CreateEditCtrl as ctrl',
            templateUrl: 'create-edit.html',
            resolve: {
                usuario: function(UsuarioResource) {
                    return UsuarioResource.create();
                },
				tipoUsuarioList: function(TipoUsuarioResource) {
					return TipoUsuarioResource.list();
				}	
 
            }
        })
        .when('/edit/:id', {
            controller: 'CreateEditCtrl as ctrl',
            templateUrl: 'create-edit.html',
            resolve: {
                usuario: function($route, UsuarioResource) {
                    var id = $route.current.params.id;
                    return UsuarioResource.get(id);
                },
				tipoUsuarioList: function(TipoUsuarioResource) {
					return TipoUsuarioResource.list();
				}	
 
            }
        })
        .when('/show/:id', {
            controller: 'ShowCtrl as ctrl',
            templateUrl: 'show.html',
            resolve: {
                usuario: function($route, UsuarioResource) {
                    var id = $route.current.params.id;
                    return UsuarioResource.get(id);
                }
            }
        })
        .otherwise({redirectTo: '/'});
});
