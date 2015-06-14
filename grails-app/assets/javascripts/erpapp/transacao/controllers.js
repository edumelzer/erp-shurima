'use strict';

function ListCtrl($scope, TransacaoResource, transacaoList, empresaList, pageSize) {
    var self = this;
    self.transacaoList = transacaoList;
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

        TransacaoResource.list(params).then(function(items) {
            self.transacaoList = items;
        });
    };

    self.reload = function() {
        self.page = 1;
        self.load();
    }
}

function ShowCtrl(transacao) {
    var self = this;
    self.transacao = transacao;
};

function CreateEditCtrl(transacao, empresaList ) {
    var self = this;
	self.empresaList = empresaList;
    self.transacao = transacao;
}

angular.module('erpapp.transacao.controllers', [])
    .controller('ListCtrl', ListCtrl)
    .controller('ShowCtrl', ShowCtrl)
    .controller('CreateEditCtrl', CreateEditCtrl);