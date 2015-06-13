'use strict';

function ListCtrl($scope, ClienteResource, clienteList, pageSize) {
    var self = this;
    self.clienteList = clienteList;
	
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

        ClienteResource.list(params).then(function(items) {
            self.clienteList = items;
        });
    };

    self.reload = function() {
        self.page = 1;
        self.load();
    }
}

function ShowCtrl(cliente) {
    var self = this;
    self.cliente = cliente;
};

function CreateEditCtrl(cliente ) {
    var self = this;
	
    self.cliente = cliente;
}

angular.module('erpapp.cliente.controllers', [])
    .controller('ListCtrl', ListCtrl)
    .controller('ShowCtrl', ShowCtrl)
    .controller('CreateEditCtrl', CreateEditCtrl);