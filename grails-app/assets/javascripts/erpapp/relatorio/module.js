//= require_self
//= require controllers
//= require services
//= require_tree /erpapp/usuario/templates/

'use strict';

angular.module('erpapp.relatorio', [
	'grails',
	'erpapp.relatorio.controllers',
	'erpapp.relatorio.services'
])
//.value('defaultCrudResource', 'UsuarioResource')
.config(function($routeProvider) {
	$routeProvider
        .when('/', {
            controller: 'ListCtrl as ctrl',
            templateUrl: 'list.html',
            resolve: {
                usuarioList: function($route, UsuarioResource) {
                    var params = $route.current.params;
                    return UsuarioResource.list(params);
                }
            }
        })
        .otherwise({redirectTo: '/'});
});
