'use strict';

function ListCtrl($scope, TipoUsuarioResource, tipoUsuarioList, pageSize) {
    var self = this;
    self.tipoUsuarioList = tipoUsuarioList;
	
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

        TipoUsuarioResource.list(params).then(function(items) {
            self.tipoUsuarioList = items;
        });
    };

    self.reload = function() {
        self.page = 1;
        self.load();
    }
}

function ShowCtrl(tipoUsuario) {
    var self = this;
    self.tipoUsuario = tipoUsuario;
};

function CreateEditCtrl(tipoUsuario ) {
    var self = this;
	
    self.tipoUsuario = tipoUsuario;
}

angular.module('erpapp.tipoUsuario.controllers', [])
    .controller('ListCtrl', ListCtrl)
    .controller('ShowCtrl', ShowCtrl)
    .controller('CreateEditCtrl', CreateEditCtrl);