//= require_self 
//= require controllers
//= require services 
//= require_tree /erpapp/item/templates/

'use strict';

angular.module('erpapp.item', [
	'grails', 
	'erpapp.item.controllers', 
	'erpapp.item.services'
])
.value('defaultCrudResource', 'ItemResource')
.config(function($routeProvider) {
	$routeProvider
        .when('/', {
            controller: 'ListCtrl as ctrl',
            templateUrl: 'list.html',
            resolve: {
                itemList: function($route, ItemResource) {
                    var params = $route.current.params;
                    return ItemResource.list(params);
                } 
            }
        })
        .when('/create', {
            controller: 'CreateEditCtrl as ctrl',
            templateUrl: 'create-edit.html',
            resolve: {
                item: function(ItemResource) {
                    return ItemResource.create();
                } 
            }
        })
        .when('/edit/:id', {
            controller: 'CreateEditCtrl as ctrl',
            templateUrl: 'create-edit.html',
            resolve: {
                item: function($route, ItemResource) {
                    var id = $route.current.params.id;
                    return ItemResource.get(id);
                } 
            }
        })
        .when('/show/:id', {
            controller: 'ShowCtrl as ctrl',
            templateUrl: 'show.html',
            resolve: {
                item: function($route, ItemResource) {
                    var id = $route.current.params.id;
                    return ItemResource.get(id);
                }
            }
        })
        .otherwise({redirectTo: '/'});
});
