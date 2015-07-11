'use strict';

function ListCtrl($scope, EntradaResource, entradaList, empresaList, pageSize) {
    var self = this;
    self.entradaList = entradaList;
	  self.empresaList = empresaList;
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

        EntradaResource.list(params).then(function(items) {
            self.entradaList = items;
        });
    };

    self.reload = function() {
        self.page = 1;
        self.load();
    }
}

function ShowCtrl(entrada) {
    var self = this;
    self.entrada = entrada;
};

function CreateEditCtrl(entrada, empresaList ) {
    var self = this;
	  self.empresaList = empresaList;
    self.entrada = entrada;
}

angular.module('erpapp.entrada.controllers', [])
    .controller('ListCtrl', ListCtrl)
    .controller('ShowCtrl', ShowCtrl)
    .controller('CreateEditCtrl', CreateEditCtrl);
