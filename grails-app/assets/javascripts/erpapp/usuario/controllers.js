'use strict';

function ListCtrl($scope, UsuarioResource, usuarioList, pageSize) {
    var self = this;
    self.usuarioList = usuarioList;

    self.pageSize = pageSize;
    self.page = 1;
    self.filter = {};

    $scope.$watchCollection(function() { return self.filter }, function() {
        self.reload();
    });

    self.load = function() {
        var params = {page: self.page};

        if (self.sort) {
            angular.extend(params, self.sort);
        }
    		if (self.filter) {
    			params.filter = self.filter
    		}

        UsuarioResource.list(params).then(function(items) {
            self.usuarioList = items;
        });
    };

    self.reload = function() {
        self.page = 1;
        self.load();
    }
}

function ShowCtrl(usuario) {
    var self = this;
    self.usuario = usuario;
};

function CreateEditCtrl(usuario ) {
    var self = this;

    self.usuario = usuario;
}

angular.module('erpapp.usuario.controllers', [])
    .controller('ListCtrl', ListCtrl)
    .controller('ShowCtrl', ShowCtrl)
    .controller('CreateEditCtrl', CreateEditCtrl);
