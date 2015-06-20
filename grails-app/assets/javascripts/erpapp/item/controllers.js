'use strict';

function ListCtrl($scope, ItemResource, itemList, pageSize) {
    var self = this;
    self.itemList = itemList;
	
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

        ItemResource.list(params).then(function(items) {
            self.itemList = items;
        });
    };

    self.reload = function() {
        self.page = 1;
        self.load();
    }
}

function ShowCtrl(item) {
    var self = this;
    self.item = item;
};

function CreateEditCtrl(item ) {
    var self = this;
	
    self.item = item;
}

angular.module('erpapp.item.controllers', [])
    .controller('ListCtrl', ListCtrl)
    .controller('ShowCtrl', ShowCtrl)
    .controller('CreateEditCtrl', CreateEditCtrl);