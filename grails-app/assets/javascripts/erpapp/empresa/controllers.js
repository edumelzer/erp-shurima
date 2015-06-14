'use strict';

function ListCtrl($scope, EmpresaResource, empresaList, pageSize) {
    var self = this;
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

        EmpresaResource.list(params).then(function(items) {
            self.empresaList = items;
        });
    };

    self.reload = function() {
        self.page = 1;
        self.load();
    }
}

function ShowCtrl(empresa) {
    var self = this;
    self.empresa = empresa;
};

function CreateEditCtrl(empresa ) {
    var self = this;
	
    self.empresa = empresa;
}

angular.module('erpapp.empresa.controllers', [])
    .controller('ListCtrl', ListCtrl)
    .controller('ShowCtrl', ShowCtrl)
    .controller('CreateEditCtrl', CreateEditCtrl);